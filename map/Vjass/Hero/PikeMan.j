




function BattleSpiralActions takes nothing returns boolean
    local unit whichUnit = GetTriggerUnit()
    local unit hAttacker = GetAttacker()
    local integer iAbilityLevle = GetUnitAbilityLevel(whichUnit, 'Apm2')
    local string effectPath = null
    if IsUnitEnemy(whichUnit, GetOwningPlayer(hAttacker)) then
        if PrdRandom(whichUnit, 'Apm2', 15) then
            set effectPath = "Abilities\\Spells\\Human\\BattleSpiral\\SpinFX3.mdx"
            call SetUnitAnimation(whichUnit, "spin")
            call DestroyEffect(AddSpecialEffectTarget(effectPath, whichUnit, "origin"))
            call UnitDelayedStanding(whichUnit, 0.6)
        endif
    endif

    set whichUnit = null
    set hAttacker = null
    return false
endfunction

// 学习战斗螺旋
function BattleSpiralLearn1 takes nothing returns nothing
    local unit whichUnit = GetLearningUnit()
    local integer iAbilityId = GetLearnedSkill()
    local trigger trig = CreateUnitAbilityTrigger(whichUnit, iAbilityId)

    call TriggerRegisterUnitEvent(trig, whichUnit, EVENT_UNIT_ATTACKED)
    call TriggerAddCondition(trig, Condition( function BattleSpiralActions))

    set whichUnit = null
    set trig = null
endfunction
