

scope ItemSystem initializer InitItemSystem

    globals
        //===========================================
        //物品系统
        integer ItemStack_Number = 0
        integer array ItemStack_PowerUp
        integer array ItemStack_Real
        integer array ItemStack_SellUnit
        integer array ItemStack_Disabled
        
        integer S_ItemStack_Number = 0
        
        integer array Item1
        integer array Item2
        integer array Item3
        integer array Item4
        integer array Item5
        integer array Item6

        //物品属性
        trigger ItemAttrTrig = null
    endglobals

    function GetPowerUpItemNumber takes item it returns integer
        local integer id
        local integer i = 1
        if it == null then
            return - 2
        endif
        set id = GetItemTypeId(it)
        loop
            if ItemStack_PowerUp[i]== id then
                return i
            endif
            set i = i + 1
            exitwhen i > ItemStack_Number
        endloop
        return - 1
    endfunction

    function GetPowerUpItemNumberById takes integer whichType returns integer
        local integer id
        local integer i = 1
        loop
            if ItemStack_PowerUp[i]== whichType then
                return i
            endif
            set i = i + 1
            exitwhen i > ItemStack_Number
        endloop
        return - 1
    endfunction

    function GetRealItemNumberById takes integer whichType returns integer
        local integer id
        local integer i = 1
        loop
            if ItemStack_Real[i]== whichType then
                return i
            endif
            set i = i + 1
            exitwhen i > ItemStack_Number
        endloop
        return - 1
    endfunction

    
    function AddUntiItemState takes unit whichUnit, integer itemId returns nothing
        local real data = 0
        call UnitAddAttribute(whichUnit, itemId)
        if HaveSavedReal(ObjectData, itemId, BONUS_DAMAGE) then
            set data = LoadReal(ObjectData, itemId, BONUS_DAMAGE)
            call UnitAddDamageBonus(whichUnit, data)
        endif
        if HaveSavedReal(ObjectData, itemId, BONUS_ARMOR) then
            set data = LoadReal(ObjectData, itemId, BONUS_ARMOR)
            call UnitAddArmorBonus(whichUnit, data)
        endif
        if HaveSavedReal(ObjectData, itemId, BONUS_ATTACK) then
            set data = LoadReal(ObjectData, itemId, BONUS_ATTACK)
            call UnitAddAttackSpeedBonus(whichUnit, data)
        endif
        if HaveSavedReal(ObjectData, itemId, BONUS_LIFE) then
            set data = LoadReal(ObjectData, itemId, BONUS_LIFE)
            call UnitAddMaxLife(whichUnit, data)
        endif
        if HaveSavedReal(ObjectData, itemId, BONUS_MANA) then
            set data = LoadReal(ObjectData, itemId, BONUS_MANA)
            call UnitAddMaxMana(whichUnit, data)
        endif
        if HaveSavedReal(ObjectData, itemId, BONUS_MOVESPEED) then
            set data = LoadReal(ObjectData, itemId, BONUS_MOVESPEED)
            call UnitAddMoveSpeedBonus(whichUnit, data)
        endif
    endfunction
    function ReduceUnitItemState takes unit whichUnit, integer itemId returns nothing
        local real data = 0
        call UnitReduceAttribute(whichUnit, itemId)
        if HaveSavedReal(ObjectData, itemId, BONUS_DAMAGE) then
            set data = LoadReal(ObjectData, itemId, BONUS_DAMAGE)
            call UnitReduceDamageBonus(whichUnit, data)
        endif
        if HaveSavedReal(ObjectData, itemId, BONUS_ARMOR) then
            set data = LoadReal(ObjectData, itemId, BONUS_ARMOR)
            call UnitReduceArmorBonus(whichUnit, data)
        endif
        if HaveSavedReal(ObjectData, itemId, BONUS_ATTACK) then
            set data = LoadReal(ObjectData, itemId, BONUS_ATTACK)
            call UnitReduceAttackSpeedBonus(whichUnit, data)
        endif
        if HaveSavedReal(ObjectData, itemId, BONUS_LIFE) then
            set data = LoadReal(ObjectData, itemId, BONUS_LIFE)
            call UnitReduceMaxLife(whichUnit, data)
        endif
        if HaveSavedReal(ObjectData, itemId, BONUS_MANA) then
            set data = LoadReal(ObjectData, itemId, BONUS_MANA)
            call UnitReduceMaxMana(whichUnit, data)
        endif
        if HaveSavedReal(ObjectData, itemId, BONUS_MOVESPEED) then
            set data = LoadReal(ObjectData, itemId, BONUS_MOVESPEED)
            call UnitReduceMoveSpeedBonus(whichUnit, data)
        endif
    endfunction

    private function create_powerupitem_actions takes nothing returns boolean
        local trigger t = GetTriggeringTrigger()
        local integer h = GetHandleId(t)
        call EXCreateItem(LoadInteger(HT, h , 100), LoadReal(HT, h, 101), LoadReal(HT, h, 102))
        call FlushChildHashtable(HT, h)
        call ClearTrigger(t)
        set t = null
        return false
    endfunction
    
    private function UnitPickPowerUpItem takes unit u, item it, integer itemId returns nothing
        local integer realId = GetPowerUpItemNumberById(itemId)
        local integer h
        local item newItem = null
        local real x
        local real y
        if realId == - 1 then
            call Debug("log",GetObjectName(itemId) + " 没有Real物品")
            return
        endif
        set x = GetWidgetX(it)
        set y = GetWidgetY(it)
        set newItem = EXCreateItem(ItemStack_Real[realId], x, y)
        call DisableTrigger(ItemAttrTrig)
        call RemoveItem(it)
        call EnableTrigger(ItemAttrTrig)
        if not UnitAddItem(u, newItem) then	//如果给不了则创建PowerUp回去
            call RemoveItem(newItem) //0.秒计时后创建物品,否则会被挤开
            set h = CreateTimerEventTrigger(0., false, function create_powerupitem_actions)
            call SaveInteger(HT, h, 100, itemId)
            call SaveReal(HT, h, 101, x)
            call SaveReal(HT, h, 102, y)
        endif
        set newItem = null
    endfunction
    
    private function unitdropitem_actions takes nothing returns boolean
        local trigger t = GetTriggeringTrigger()
        local integer h = GetHandleId(t)
        local item it = LoadItemHandle(HT, h, 100)
        local integer powerupId = ItemStack_PowerUp[LoadInteger(HT, h, 100)] 
        call FlushChildHashtable(HT, h)
        call ClearTrigger(t)
        //又是0.计时,为了物品位置正确
        if not IsItemOwned(it) then //判断一下是给人了还是丢地上了
            //call Debug("log", "X/Y: "+ R2S(x) + "/" + R2S(y))
            set h = CreateTimerEventTrigger(0., false, function create_powerupitem_actions)
            call SaveInteger(HT, h, 100, powerupId)
            call SaveReal(HT, h, 101, GetWidgetX(it))
            call SaveReal(HT, h, 102, GetWidgetY(it))
            //
            call RemoveItem(it)
        endif
        set t = null
        set it = null
        return false
    endfunction
    
    private function UnitDropRealItem takes unit u, item it, integer itemId returns nothing
        local trigger t = null
        local integer h
        local integer powerupId = GetRealItemNumberById(itemId)
        if powerupId == - 1 then
            call Debug("log",GetObjectName(itemId) + " 没有PowerUp物品")
            return
        endif
        set t = CreateTrigger() //0.秒计时之后才能正确得到物品位置
        set h = GetHandleId(t)
        call SaveInteger(HT, h, 100, powerupId)
        call SaveItemHandle(HT, h, 100, it)
        call TriggerAddCondition(t, Condition(function unitdropitem_actions))
        call TriggerRegisterTimerEvent(t, 0., false)
        set t = null
    endfunction
    
    private function itemtrigger_actions takes nothing returns boolean
        local unit u = GetTriggerUnit()
        local item it = GetManipulatedItem()
        local integer itemId = GetItemTypeId(it)
        local real mana
        local eventid hTriggerEventId = GetTriggerEventId()
        //拾取能量提升物品时会同时相应丢弃事件,过滤一下
        if IsItemPowerup(it) then
            if hTriggerEventId == EVENT_PLAYER_UNIT_PICKUP_ITEM then
                call UnitPickPowerUpItem(u, it, itemId)
            endif
        else
            set mana = GetUnitState(u, UNIT_STATE_MAX_MANA)
            if IsUnitType(u, UNIT_TYPE_HERO) then
                if hTriggerEventId == EVENT_PLAYER_UNIT_PICKUP_ITEM then	//获得物品
                    call AddUntiItemState(u, itemId)
                elseif hTriggerEventId == EVENT_PLAYER_UNIT_DROP_ITEM then	//丢弃物品
                    call ReduceUnitItemState(u, itemId)
                    call UnitDropRealItem(u, it, itemId) //需要在这之前判断是给别人了还是丢地上了
                elseif hTriggerEventId == EVENT_PLAYER_UNIT_PAWN_ITEM then	//抵押物品
                    //	call Debug("log","抵押物品:" + GetObjectName(itemId))
                endif
            endif
            call RefreshUnitState(u)
            if mana != GetUnitState(u, UNIT_STATE_MAX_MANA) then
                call Debug("log","最大魔法值变化")
                call RefreshAbilityCost(u)
            endif
        endif
        set u = null
        set it = null
        set hTriggerEventId = null
        return false
    endfunction

    
    function SetItemHeroAttribute takes integer whichType, integer str, integer agi, integer int returns nothing
        if str != 0 then
            call SaveInteger(ObjectData, whichType, BONUS_STR, str)
        endif
        if agi != 0 then
            call SaveInteger(ObjectData, whichType, BONUS_AGI, agi)
        endif
        if int != 0 then
            call SaveInteger(ObjectData, whichType, BONUS_INT, int)
        endif
    endfunction

    function SetItemAttribute takes integer whichType, integer damage, integer life, integer mana, real armor, real attack, integer speed returns nothing
        if damage != 0 then
            call SaveReal(ObjectData, whichType, BONUS_DAMAGE, damage)
        endif
        if life != 0 then
            call SaveReal(ObjectData, whichType, BONUS_LIFE, life)
        endif
        if mana != 0 then
            call SaveReal(ObjectData, whichType, BONUS_MANA, mana)
        endif
        if armor != 0 then
            call SaveReal(ObjectData, whichType, BONUS_ARMOR, armor)
        endif
        if attack != 0 then
            call SaveReal(ObjectData, whichType, BONUS_ATTACK, attack)
        endif
        if speed != 0 then
            call SaveReal(ObjectData, whichType, BONUS_MOVESPEED, speed)
        endif
    endfunction

    function ItemAddStateBonus takes integer whichType, integer bonusType, real value returns nothing
        if value != 0 then
            call SaveReal(ObjectData, whichType, bonusType, value)
        endif
    endfunction

    function registeritem takes integer powerup, integer i_real, integer i_disabled returns integer
        set ItemStack_Number = ItemStack_Number + 1
        set ItemStack_PowerUp[ItemStack_Number]= powerup
        set ItemStack_Real[ItemStack_Number]= i_real
        set ItemStack_Disabled[ItemStack_Number] = i_disabled
        return ItemStack_Number
    endfunction

    globals
        //物品索引
        //秘法鞋
        integer ITEM_ArcaneBoots 
        //速度之鞋
        integer ITEM_SpeedBoots 
        //强袭装甲
        integer ITEM_AssaultCuirass 
        integer ITEM_Satanic
        integer ITEM_MoonShard
    endglobals

    //注册物品
    function InitRegisterItem takes nothing returns nothing
        set ITEM_ArcaneBoots = registeritem('IP01','IR01', 'ID01')
        set ITEM_SpeedBoots = registeritem('IP02','IR02', 'ID02')
        set ITEM_AssaultCuirass = registeritem('IP03','IR03', 'ID03')
        set ITEM_Satanic = registeritem('IP04','IR04', 'ID04')
        set ITEM_MoonShard = registeritem('IP05','IR05', 'ID05')
    endfunction

    //初始化物品属性 - 英雄三围
    function InitItemHeroAttribute takes nothing returns nothing
        call SetItemHeroAttribute('cnob', 5, 5, 5)  //贵族圆环
        //call SetItemHeroAttribute('Idms', 0, 0, 0) //幻影斧
    endfunction
    //初始化物品属性 - 攻击防御生命魔法攻速
    function InitItemAttribute takes nothing returns nothing
        //call SetItemAttribute('cnob', 10, 200, 100 , 0 , 0.0)  //贵族圆环
        call ItemAddStateBonus('IR01', BONUS_MANA, 250)
        call ItemAddStateBonus('IR01', BONUS_MOVESPEED, 50)
        call ItemAddStateBonus('IR02', BONUS_MOVESPEED, 50)
    endfunction

    //初始化物品
    function InitItemSystem takes nothing returns nothing
        set ItemAttrTrig = CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ(ItemAttrTrig, EVENT_PLAYER_UNIT_PICKUP_ITEM)	//获得物品
        call TriggerRegisterAnyUnitEventBJ(ItemAttrTrig, EVENT_PLAYER_UNIT_DROP_ITEM)	//丢弃物品
        call TriggerRegisterAnyUnitEventBJ(ItemAttrTrig, EVENT_PLAYER_UNIT_PAWN_ITEM)	//抵押物品
        call TriggerAddCondition(ItemAttrTrig, Condition(function itemtrigger_actions)) 
	
        call InitRegisterItem() //注册物品
        call InitItemHeroAttribute() //初始化物品英雄三围属性
        call InitItemAttribute()    //初始化物品属性
    endfunction

endscope 



