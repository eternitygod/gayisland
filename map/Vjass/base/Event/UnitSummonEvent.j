
scope UnitSummonEvent initializer Init

    globals
        key IllusionUnitDataB
        key IllusionUnitDataC
    endglobals
    
    function SummonIllusionUnit takes unit hIllusionUnit, unit hMasterUnit returns nothing
        local integer iHandleId
        // 判断单位是否在施法镜像 如果是 则设置镜像的属性和位置
        if LoadBoolean(DynamicData, GetHandleId(hMasterUnit), IMAGO_UNIT_IS_SUMMONING_ILLUSIONS) then
            set iHandleId = GetHandleId(hIllusionUnit)
            call SaveReal(DynamicData, iHandleId, IllusionUnitDataB, Tmp__ArrayReal['B'])
            call SaveReal(DynamicData, iHandleId, IllusionUnitDataC, Tmp__ArrayReal['C'])
            call SetUnitX(hIllusionUnit, Tmp__ArrayReal['X'])
            call SetUnitY(hIllusionUnit, Tmp__ArrayReal['Y'])
        endif
        call SyncIllusionUnitState(hIllusionUnit, hMasterUnit)
    endfunction

    function UnitSummonEventActions takes nothing returns boolean
        local unit hSummonedUnit = GetSummonedUnit()
        local unit hSnmmoingUnit = GetSummoningUnit()
        // 如果是马甲在召唤 则设置召唤者为真正的召唤者
        if GetUnitAbilityLevel(hSnmmoingUnit, 'Aloc') > 0 then
            set hSnmmoingUnit = GetMasterUnit(hSnmmoingUnit)
        endif
        if IsUnitIllusion(hSummonedUnit) then
            call SummonIllusionUnit(hSummonedUnit, hSnmmoingUnit)
        endif
        set hSummonedUnit = null
        set hSnmmoingUnit = null
        return false
    endfunction

    // 任意单位被召唤事件
    private function Init takes nothing returns nothing
        local trigger trig = CreateTrigger() 
        call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_SUMMON)
        call TriggerAddCondition(trig, Condition(function UnitSummonEventActions))
        set trig = null 
    endfunction

endscope
