


library CustomAnyEvent initializer Init requires base

    globals
        // 类型转换需要用到的哈希表,可以在同继承关系下转换
        hashtable TypeConversion = InitHashtable()

        //捕获物品死亡
        trigger ItemDeathEventTrigger = CreateTrigger()


        
        //YDWE的伤害事件 1.33带排泄事件
        trigger DamageEventTrigger = null
        conditionfunc DamageEventCondition = null
        constant integer DAMAGE_EVENT_SWAP_TIMEOUT = 600  // 每隔这个时间(秒), DAMAGE_EVENT_SWAP_ENABLE 会被移入销毁队列
        constant boolean DAMAGE_EVENT_SWAP_ENABLE = true  // 若为 false 则不启用销毁机制
    endglobals

    //将物件转成物品
    function Widget2Item takes widget whichWidget returns item
        call SaveFogStateHandle(TypeConversion, 0, 0, ConvertFogState(GetHandleId(whichWidget)))
        return LoadItemHandle(TypeConversion, 0, 0)
    endfunction
    
    function ItemDelayRemove takes nothing returns boolean
        local trigger trig = GetTriggeringTrigger()
        local integer iHandleId = GetHandleId(trig)
        local item deathItem = LoadItemHandle(HT, iHandleId, 0)
    
        if GetHandleId(deathItem) > 0 then
            call SetWidgetLife(deathItem, 1)
            call RemoveItem(deathItem)
        endif
    
        call FlushChildHashtable(HT, iHandleId)
        call ClearTrigger(trig)
    
        set trig = null
        set deathItem = null
        return false
    endfunction
    
    function ItemDeathEvent_CallBack takes nothing returns boolean
        local item deathItem = Widget2Item(GetTriggerWidget())
        local integer iHandleId
        // 等待,让物品播放完死亡动画,3.633秒是大部分书的死亡时间,似乎物品模型里死亡动画没有比这个更高的.
        // 注意 普通物品死亡时间为0.5,书虽然3.633,但后面很大一部分时间都是播放最小化的书
        set iHandleId = CreateTimerEventTrigger(1., false, function ItemDelayRemove)
        call SaveItemHandle(HT, iHandleId, 0, deathItem)
        set deathItem = null
        return false
    endfunction
    
    // 封装的创建物品,因为物品被a掉后会永久存在于地图之中,所以要特殊操作一下.
    function EXCreateItem takes integer itemid, real x, real y returns item
        set bj_lastCreatedItem = CreateItem(itemid, x, y)
        call TriggerRegisterDeathEvent(ItemDeathEventTrigger, bj_lastCreatedItem)
        return bj_lastCreatedItem
    endfunction
    
    function YDWEAnyUnitDamagedFilter takes nothing returns boolean     
        if GetUnitAbilityLevel(GetFilterUnit(), 'Aloc') <= 0 then 
            call TriggerRegisterUnitEvent(DamageEventTrigger, GetFilterUnit(), EVENT_UNIT_DAMAGED)
        endif
        return false
    endfunction
    
    function AnyItemDeathFilter takes nothing returns boolean
        local item it = GetFilterItem()
        if GetWidgetLife(it) > 0 then 
            call TriggerRegisterDeathEvent(ItemDeathEventTrigger, it)
        endif
        set it = null
        return false
    endfunction
    
    function YDWEAnyUnitDamagedEnumUnit takes nothing returns nothing
        local group g = CreateGroup()
        local integer i = 0
        loop
            call GroupEnumUnitsOfPlayer(g, Player(i), Condition(function YDWEAnyUnitDamagedFilter))
            set i = i + 1
            exitwhen i == bj_MAX_PLAYER_SLOTS
        endloop
        call DestroyGroup(g)
        set g = null
    endfunction
    
    // 重建物品死亡事件
    function AnyItemDeathEventEnumItem takes nothing returns nothing
        local rect world = GetWorldBounds()
        call EnumItemsInRect(world, Condition(function AnyItemDeathFilter), null)
        call RemoveRect(world)
        set world = null
    endfunction
    // 将 DamageEventTrigger 移入销毁队列, 从而排泄触发器事件
    function YDWESyStemAnyUnitDamagedSwap takes nothing returns nothing
        local boolean isEnabled = IsTriggerEnabled(DamageEventTrigger)
    
        call ClearTrigger(DamageEventTrigger)
        set DamageEventTrigger = CreateTrigger()
        if not isEnabled then
            call DisableTrigger(DamageEventTrigger)
        endif
    
        set isEnabled = IsTriggerEnabled(ItemDeathEventTrigger)
        call ClearTrigger(ItemDeathEventTrigger)
        set ItemDeathEventTrigger = CreateTrigger()
        if not isEnabled then
            call DisableTrigger(ItemDeathEventTrigger)
        endif
    
        call TriggerAddCondition(DamageEventTrigger, DamageEventCondition) 
        call TriggerAddCondition(ItemDeathEventTrigger, Condition( function ItemDeathEvent_CallBack)) 
        call YDWEAnyUnitDamagedEnumUnit()
        call AnyItemDeathEventEnumItem()
    endfunction
    //改装了一下YDWE的任意单位受伤。
    function YDWESyStemAnyUnitDamagedRegistTrigger takes nothing returns nothing
    
        set DamageEventTrigger = CreateTrigger()
        call TriggerAddCondition(DamageEventTrigger, DamageEventCondition) 
    
        if DAMAGE_EVENT_SWAP_ENABLE then
            // 每隔 DAMAGE_EVENT_SWAP_TIMEOUT 秒, 将正在使用的 DamageEventTrigger 和 ItemDeathEventTrigger 移入销毁队列
            call TimerStart(CreateTimer(), DAMAGE_EVENT_SWAP_TIMEOUT, true, function YDWESyStemAnyUnitDamagedSwap)
        endif
    
    endfunction
        
    private function Init takes nothing returns nothing
        call YDWESyStemAnyUnitDamagedRegistTrigger()
        call AnyItemDeathEventEnumItem()
    endfunction
    
endlibrary


