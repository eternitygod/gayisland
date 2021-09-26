
scope HeroLevelUp initializer Init

    globals
        trigger HeroLevelUpTrigger = CreateTrigger()
    endglobals

    function HeroLevelUpActions takes nothing returns boolean //英雄升级事件
        local unit u = GetTriggerUnit()
        call RefreshUnitState(u) //刷新单位状态
        call RefreshAbilityCost(u) //刷新某些单位技能的魔法消耗
        set u = null
        return false
    endfunction
    
    private function Init takes nothing returns nothing
        call TriggerAddCondition(HeroLevelUpTrigger, Condition( function HeroLevelUpActions ))
    endfunction

endscope
