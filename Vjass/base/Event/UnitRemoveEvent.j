

scope UnitRemoveEvent initializer Init
    
    globals
        private constant key HasAbilityAdef
        private constant key UseAbilityAdef
        private constant integer CANCEL_DEFENSE = 852056
        private constant integer DEFENSE_ABILITYID = 'Adef'
    endglobals

    //清空以单位handleId为父key的大部分数据
    private function FlushUnitData takes unit whichUnit returns nothing
        local integer iHandleId = GetHandleId(whichUnit)
        local integer loop_index = 0
        //如果单位会恢复生命值或魔法值,那么将其移除恢复队列
        if HaveSavedInteger(DynamicData, iHandleId, UNIT_LIFERESTORE) then
            call QueuedUnitLifeRestoreRemove(whichUnit)
        endif
        if HaveSavedInteger(DynamicData, iHandleId, UNIT_MANARESTORE) then
            call QueuedUnitManaRestoreRemove(whichUnit)
        endif

        call FlushChildHashtable(HT, iHandleId)
        call FlushChildHashtable(DynamicData, iHandleId)

        call Debug("log", GetUnitName(whichUnit)+ " 数据已清空")	
    endfunction

    private function IssuedOrder takes nothing returns boolean
        local integer order = GetIssuedOrderId()
        local unit trigUnit = GetOrderedUnit()
        // 存活时发布命令就不管了
        if order != CANCEL_DEFENSE or UnitAlive( trigUnit ) or IsUnitType( trigUnit, UNIT_TYPE_HERO ) then
            set trigUnit = null
            return false
        endif
        if LoadBoolean( DynamicData, GetHandleId( trigUnit ), UseAbilityAdef ) then
            call RemoveSavedBoolean( DynamicData, GetHandleId( trigUnit ), UseAbilityAdef )
            call FlushUnitData( trigUnit )
        else // 第一次顶盾是单位死亡 第二次顶盾才是单位彻底死亡
            call SaveBoolean( DynamicData, GetHandleId( trigUnit ), UseAbilityAdef, true )
        endif
        set trigUnit = null
        return false
    endfunction

    private function UnitDeathEvent takes nothing returns boolean
        local unit trigUnit = GetDyingUnit()
        if IsUnitType( trigUnit, UNIT_TYPE_HERO ) then
            set trigUnit = null
            return false
        endif
        if LoadBoolean( DynamicData, GetHandleId( trigUnit ), UseAbilityAdef ) then
            call SaveBoolean( DynamicData, GetHandleId( trigUnit ), HasAbilityAdef, true )
        elseif GetUnitAbilityLevel( trigUnit, DEFENSE_ABILITYID ) <= 0 then
            call UnitAddAbility( trigUnit, DEFENSE_ABILITYID )
        endif
        set trigUnit = null
        return false
    endfunction

    private function UnitSummon takes nothing returns boolean
        local unit trigUnit = GetSummonedUnit()
        local integer iHandleId = GetHandleId( trigUnit )
        if LoadBoolean( DynamicData, iHandleId, UseAbilityAdef ) then
            if LoadBoolean( DynamicData, iHandleId, HasAbilityAdef ) then
                call RemoveSavedBoolean( DynamicData, iHandleId, HasAbilityAdef )
            else
                call UnitRemoveAbility( trigUnit, DEFENSE_ABILITYID )
            endif
            call RemoveSavedBoolean( DynamicData, iHandleId, UseAbilityAdef )
        endif
        set trigUnit = null
        return false
    endfunction

    private function Init takes nothing returns nothing
        local trigger trig = CreateTrigger()

        set trig = CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_DEATH )
        call TriggerAddCondition( trig, function UnitDeathEvent )

        set trig = CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_ISSUED_ORDER )
        call TriggerAddCondition( trig, function IssuedOrder )

        set trig = CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_SUMMON )
        call TriggerAddCondition( trig, function UnitSummon )

        set trig = null
    endfunction

endlibrary


    