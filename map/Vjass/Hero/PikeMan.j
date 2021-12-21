


scope PickMan

    // 战斗螺旋  反击螺旋缝合战斗饥渴
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
            if GetPrdRandom(whichUnit, 'Apm2', 15) then

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

    // 口嗨
    function CallSbNames takes nothing returns nothing
        local unit whichUnit = M_GetSpellAbilityUnit()
        local group enumUnits = LoginGroup()
        local unit firstUnit
        local real radius = 525

        local real armoarValue = 5

        call GroupEnumUnitsInRange( enumUnits, GetUnitX(whichUnit), GetUnitY(whichUnit), radius, null )
        call GroupRemoveUnit( enumUnits, whichUnit )

        set P2 = GetOwningPlayer(whichUnit)
        loop

            set firstUnit = FirstOfGroup( enumUnits )
        exitwhen firstUnit == null
            call GroupRemoveUnit( enumUnits, firstUnit )
            // 友军 存活 非建筑 英雄
            if AllyAliveNoStructureIsHero( firstUnit ) then
                // 把友军的护甲给吃瓜
                call UnitReduceArmorBonus( firstUnit, armoarValue )
                call UnitAddArmorBonus( whichUnit, armoarValue )
            endif

        endloop
        set firstUnit = null
        call LogoutGroup( enumUnits )
        set enumUnits = null

        set whichUnit = null
    endfunction

    // 战斗咆哮 狂战士的怒吼+淘汰之刃
    function BattleRoar takes nothing returns nothing
        local unit whichUnit = M_GetSpellAbilityUnit()

        local group enumUnits = LoginGroup()
        local unit firstUnit
        local real radius = 525
        local string effectPath = ""

        local real criticalValue = 300
        local integer killCount = 0

        call GroupEnumUnitsInRange( enumUnits, GetUnitX(whichUnit), GetUnitY(whichUnit), radius, null )

        set P2 = GetOwningPlayer(whichUnit)
        loop
            set firstUnit = FirstOfGroup( enumUnits )
        exitwhen firstUnit == null
            call GroupRemoveUnit( enumUnits, firstUnit )
            // 敌对 存活 非建筑
            if Enemy_Alive_NoStructure( firstUnit ) then
                // 超过生命临界点就斩杀
                if GetWidgetLife( firstUnit ) < criticalValue then
                    if UnitKillTarget( whichUnit, firstUnit ) then
                        // 斩杀成功后的动作
                        call DestroyEffect(AddSpecialEffectTarget(effectPath, firstUnit, "origin"))
                        set killCount = killCount + 1
                    endif
                endif
            endif
        endloop

        //再根据斩杀计数来做动作

        set firstUnit = null
        call LogoutGroup( enumUnits )
        set enumUnits = null

        set whichUnit = null
    endfunction

    /*
    function BattleImago takes nothing returns nothing
        local unit whichUnit = M_GetSpellAbilityUnit()
        local string sSpecialArt = "Abilities\\Spells\\Orc\\MirrorImage\\MirrorImageCaster.mdl"
        local string sMissileArt = "Abilities\\Spells\\Orc\\MirrorImage\\MirrorImageMissile.mdl"
        call UnitSpellImage(whichUnit, 3, 1, 1, 2.2, 60, sSpecialArt, sMissileArt, 250, 300, 1500)
        debug call BJDebugMsg("运行")

        set whichUnit = null
    endfunction
    */
endscope

