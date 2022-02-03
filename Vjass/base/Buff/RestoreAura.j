
scope RestoreAura
    // 光环类型
    // 独立,暂时不考虑叠加,仅用作生命之泉的百分比回血
    private function Actions takes nothing returns boolean
        local trigger t = GetTriggeringTrigger()
        local integer h = GetHandleId(t)
        local integer firstUnitH
        local unit sourceUnit = LoadUnitHandle(HT, h, 200)
        local real value = LoadReal(HT, h, 200)
        local real oldRestoreLife
        local real restoreLife
        local unit firstUnit = null
        local group g1 = null
        local group g2 = null
        local group g3 = LoadGroupHandle(HT, h, 201)
        local integer buffId = LoadInteger(HT, h, 202)
        if not UnitAlive(sourceUnit) then
            call Debug("log", "ClearTrigger")
            call FlushChildHashtable(HT, h)
            call ClearTrigger(t)
            call UnitRemoveAbility(sourceUnit, LoadInteger(HT, h, 203))
            loop
                set firstUnit = FirstOfGroup(g3)
                exitwhen firstUnit == null
                call GroupRemoveUnit(g3, firstUnit)
                call UnitRemoveAbility(firstUnit, buffId)
                call UnitReduceLifeRestore(firstUnit, value)
            endloop
            call LogoutGroup(g3)
        else
            set g1 = LoginGroup()
            set P2 = GetOwningPlayer(sourceUnit) //Real 201为光环范围
            call GroupEnumUnitsInRange(g1, GetUnitX(sourceUnit), GetUnitY(sourceUnit), LoadReal(HT, h, 201), LoadBooleanExprHandle(HT, h, 205))
            set g2 = LoginGroup()
            call GroupAddGroup(g3, g2)
            loop
                set firstUnit = FirstOfGroup(g2)
                exitwhen firstUnit == null
                if not IsUnitInGroup(firstUnit, g1) then
                    set firstUnitH = GetHandleId(firstUnit)
                    set oldRestoreLife = LoadReal(HT, h, firstUnitH)
                    call UnitReduceLifeRestore(firstUnit, oldRestoreLife)
                    call RemoveSavedReal(HT, h, firstUnitH)
                    call UnitRemoveAbility(firstUnit, buffId)
                    call GroupRemoveUnit(g3, firstUnit)
                    //call Debug("log", "4减少" + R2S(oldRestoreLife))
                endif
                call GroupRemoveUnit(g2, firstUnit)
            endloop
            call LogoutGroup(g2)
            loop
                set firstUnit = FirstOfGroup(g1)
                exitwhen firstUnit == null
                set firstUnitH = GetHandleId(firstUnit)
                set restoreLife = GetUnitState(firstUnit, UNIT_STATE_MAX_LIFE) * value
                if IsUnitInGroup(firstUnit, g3) then
                    set oldRestoreLife = LoadReal(HT, h, firstUnitH)
	
                    if restoreLife > oldRestoreLife then
                        call SaveReal(HT, h, firstUnitH, restoreLife)
                        //call Debug("log", "2添加" + R2S(restoreLife - oldRestoreLife))
                        set restoreLife = restoreLife - oldRestoreLife
                        call UnitAddLifeRestore(firstUnit, restoreLife)
                    elseif oldRestoreLife > restoreLife then
                        call SaveReal(HT, h, firstUnitH, restoreLife)
                        //call Debug("log", "3减少" + R2S(oldRestoreLife - restoreLife))
                        set restoreLife = oldRestoreLife - restoreLife
                        call UnitReduceLifeRestore(firstUnit, restoreLife)
                    endif
                else
                    call UnitAddLifeRestore(firstUnit, restoreLife)
                    call SaveReal(HT, h, firstUnitH, restoreLife)
                    //call Debug("log", "1添加" + R2S(restoreLife))
                endif
                call GroupRemoveUnit(g1, firstUnit)
                call GroupAddUnit(g3, firstUnit)
            endloop
            call LogoutGroup(g1)
        endif
        set t = null
        set sourceUnit = null
        set firstUnit = null
        set g1 = null
        set g2 = null
        set g3 = null
        return false
    endfunction

    // 百分比 回复光环
    function PercentRestoreAura takes unit whichUnit, real value, real range, integer abilityId, integer buffId, code filter returns nothing
        local integer h = CreateTimerEventTrigger(AuraFrame, true, function Actions)
        call SaveBooleanExprHandle(HT, h, 205, Condition(filter))
        call SaveReal(HT, h, 200, value)
        call SaveReal(HT, h, 201, range)
        call SaveInteger(HT, h, 202, buffId)
        call SaveInteger(HT, h, 203, abilityId)
        call SaveUnitHandle(HT, h, 200, whichUnit)
        call SaveGroupHandle(HT, h, 201, LoginGroup() )
    endfunction
    
endscope
