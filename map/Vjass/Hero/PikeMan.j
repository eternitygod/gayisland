




function BattleSpiralActions takes nothing returns boolean
    local unit whichUnit = GetTriggerUnit()
    local unit hAttacker = GetAttacker()
    local string spinEffectPath = null
    local string targetEffectPath = null
    local group enumDamageTarget
    local unit firstUnit

    local integer iAbilityLevle
    local real rDamageAmount
    local real radius
    local integer iDamageType

    if IsUnitEnemy(whichUnit, GetOwningPlayer(hAttacker)) then
        if PrdRandom(whichUnit, 'Apm2', 15) then

            // 物理伤害 对敌对单位 非建筑 无视魔免

            set iAbilityLevle = GetUnitAbilityLevel(whichUnit, 'Apm2')
            set radius = 325
            set iDamageType = DAMAGE_TYPE_PHYSICAL
            set rDamageAmount = 50 + iAbilityLevle * 20
            set spinEffectPath = "Abilities\\Spells\\Human\\BattleSpiral\\SpinFX3.mdx"
            set targetEffectPath = "Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl"

            call SetUnitAnimation(whichUnit, "spin")
            call DestroyEffect(AddSpecialEffectTarget(spinEffectPath, whichUnit, "origin"))
            call UnitDelayedStanding(whichUnit, 0.6)


            set enumDamageTarget = LoginGroup()
            call GroupEnumUnitsInRange(enumDamageTarget, GetUnitX(whichUnit), GetUnitY(whichUnit), radius, null)
            call GroupRemoveUnit(enumDamageTarget, whichUnit)
            set P2 = GetOwningPlayer(whichUnit)

            loop
                set firstUnit = FirstOfGroup(enumDamageTarget)
                exitwhen firstUnit == null

                if Enemy_Alive_NoStructure(firstUnit) then

                    call DestroyEffect(AddSpecialEffectTarget(targetEffectPath, firstUnit, "origin"))
                    call DamageUnit(whichUnit, firstUnit, iDamageType, rDamageAmount)

                endif
                
                call GroupRemoveUnit(enumDamageTarget, firstUnit)
            endloop
            set firstUnit = null
            call LogoutGroup(enumDamageTarget)
            set enumDamageTarget = null

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
