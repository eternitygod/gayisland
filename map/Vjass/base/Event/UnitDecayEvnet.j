
scope UnitDecayEvnet initializer Init
    
    // 任意单位腐烂
    function UnitDecayEvnetActions takes nothing returns boolean
        local unit decayUnit = GetDecayingUnit()
        set decayUnit = null
        return false
    endfunction
    
    private function Init takes nothing returns nothing
        local trigger trig = CreateTrigger() 
        call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_DECAY)
        call TriggerAddCondition(trig, Condition(function UnitDecayEvnetActions))
        set trig = null
    endfunction

endscope
