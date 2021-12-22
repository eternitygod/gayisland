
scope MagicImmunity

    private function Remove takes nothing returns boolean
        local trigger trig = GetTriggeringTrigger()
        local integer iHandleId = GetHandleId(trig)
        local unit whichUnit = LoadUnitHandle(HT, iHandleId, 0)

        call UnitRemoveAbility(whichUnit, 'Amai')

        set trig = null
        return false
    endfunction

    globals
        private constant key MAGICIMMUNITY
    endglobals

    function UnitSetMagicImmunity takes unit whichUnit, real time returns nothing
        local integer iHandleId = GetHandleId(whichUnit)
        local trigger trig = LoadTriggerHandle(UnitBuffData, iHandleId, MAGICIMMUNITY)
        local real elapsed
        if trig == null then
            set trig = CreateTrigger()
            set iHandleId = GetHandleId(trig)
            call UnitAddPermanentAbility(whichUnit, 'Amai')
            call UnitMakeAbilityPermanent(whichUnit, true, 'Amim')
            call TriggerRegisterTimerEvent(trig, time, false)
            call TriggerAddCondition(trig, Condition( function Remove))
            call SaveUnitHandle(HT, iHandleId, 0, whichUnit)
            call SaveReal(HT, iHandleId, 0, time + GetGameTime())
        else
            set iHandleId = GetHandleId(trig)
            set elapsed = GetGameTime() - LoadReal(HT, iHandleId, 0)
            if elapsed < time then
                call FlushChildHashtable(HT, iHandleId)
                call ClearTrigger(trig)
                call RemoveSavedHandle(UnitBuffData, GetHandleId(whichUnit), MAGICIMMUNITY)
                call UnitSetMagicImmunity(whichUnit, time)
            endif
        endif
        set trig = null
    endfunction

endscope
