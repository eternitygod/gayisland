
scope UnitAbilityEvent initializer Init

    globals
        //技能
        trigger AbilityEventTrigger = null
        trigger UnitSpellEffectTrigger = null
        // temps
        unit Tmp_SpellAbilityUnit = null
        unit Tmp_SpellTargetUnit = null
        integer Tmp_SpellAbilityLevel
        real Tmp_SpellTargetX
        real Tmp_SpellTargetY
    endglobals

    private function SetSkillEvent takes integer eventType, integer skillId, string evnetfunc returns nothing
        call SaveStr(ObjectData, eventType, skillId, evnetfunc)
    endfunction

    globals
        // 技能事件的哈希表key
        // 准备释放技能
        constant key SPELL_CHANNEL
        // 发动技能效果
        constant key SPELL_EFFECT
        // 学习技能
        constant key LEARN_SKILL
        // 学习技能1级
        constant key LEARN_FIRST_LEVEL_SKILL
    endglobals

    private function InitAbilityFunctions takes nothing returns nothing
 
        //中尉 Lieutenant
        call SetSkillEvent(SPELL_EFFECT, 'Alc1', "Crosskill")
        call SetSkillEvent(SPELL_EFFECT, 'Alc2', "EnchantEquipment")
        call SetSkillEvent(LEARN_FIRST_LEVEL_SKILL, 'Alc2', "EnchantEquipment_Learn1")
        call SetSkillEvent(LEARN_FIRST_LEVEL_SKILL, 'Alc3', "CriticalStrikeAura_Learn1")
        call SetSkillEvent(SPELL_EFFECT, 'Alc4', "Stomp")

        //火魔法师 FireMage
        call SetSkillEvent(SPELL_EFFECT, 'Ahy0', "AbstinenceIsGoodMedicine")
        call SetSkillEvent(SPELL_EFFECT, 'Ahy1', "DragonSlave")
        call SetSkillEvent(SPELL_EFFECT, 'Ahy2', "LightStrikeArray")
        call SetSkillEvent(LEARN_FIRST_LEVEL_SKILL, 'Ahy3', "Register_FierySoul")
        call SetSkillEvent(SPELL_EFFECT, 'Ahy4', "LagunaBlade")

        //铁心灭绝者 DeterminedExterminator
        call SetSkillEvent(SPELL_EFFECT, 'Acs1', "Assassination")
        call SetSkillEvent(SPELL_EFFECT, 'Acs2', "BlightPower")
        call SetSkillEvent(LEARN_FIRST_LEVEL_SKILL, 'Acs3', "BlackEpidermis")
        call SetSkillEvent(LEARN_FIRST_LEVEL_SKILL, 'Acs4', "LearnGhostShip")
        call SetSkillEvent(SPELL_EFFECT, 'Acs4', "GhostShip")

        //模范公民 ModelCitizen / TaxStealer
        call SetSkillEvent(SPELL_EFFECT, 'Ats0', "Shinyboy")
        call SetSkillEvent(SPELL_EFFECT, 'Ats1', "Transmute")
        call SetSkillEvent(SPELL_EFFECT, 'Ats2', "WeMedia")
        call SetSkillEvent(SPELL_EFFECT, 'Ats4', "GrandNarrative")

        //风暴之灵 StormSpirit
        call SetSkillEvent(SPELL_EFFECT, 'Ast1', "StaticRremnant")
        call SetSkillEvent(SPELL_EFFECT, 'Ast2', "ElectricVortex")
        call SetSkillEvent(SPELL_EFFECT, 'Ast0', "BallLightning")
        call SetSkillEvent(LEARN_FIRST_LEVEL_SKILL, 'Ast3', "OverloadLearn1")

        //枪兵 PikeMan
        call SetSkillEvent(SPELL_EFFECT, 'Apm1', "BattleImago")
        call SetSkillEvent(LEARN_FIRST_LEVEL_SKILL, 'Apm2', "BattleSpiralLearn1")

        //屠夫 Pudge
        call SetSkillEvent(SPELL_EFFECT, 'Apg1', "Pudge_MeatHook")
        call SetSkillEvent(SPELL_EFFECT, 'A005', "Pudge_Rot")
        call SetSkillEvent(SPELL_EFFECT, 'A006', "Pudge_Dismember")
    endfunction



    //发动技能效果 
    //单独触发器 运行的效率快一些 因为发动技能效果比较常见 后续可能合并
    function UnitSpellEffectActions takes nothing returns boolean
        local integer abId = GetSpellAbilityId() //
        if HaveSavedString(ObjectData, SPELL_EFFECT, abId) then
            set Tmp_SpellAbilityUnit = GetSpellAbilityUnit()
            set Tmp_SpellTargetUnit = GetSpellTargetUnit()
            set Tmp_SpellAbilityLevel = GetUnitAbilityLevel(Tmp_SpellAbilityUnit, abId)
            if Tmp_SpellTargetUnit == null then
                set Tmp_SpellTargetX = GetSpellTargetX()
                set Tmp_SpellTargetY = GetSpellTargetY()
            endif
            call DzExecuteFunc(LoadStr(ObjectData, SPELL_EFFECT, abId))
        endif
        return false
    endfunction

    //技能事件
    function AbilityEventActions takes nothing returns boolean
        local integer abId = GetSpellAbilityId()//包含大部分动作 但发动技能效果是单独一个触发
        local eventid id = GetTriggerEventId()
        if id == EVENT_UNIT_SPELL_CHANNEL then
            if HaveSavedString(ObjectData, SPELL_CHANNEL, abId) then
                call ExecuteFunc(LoadStr(ObjectData, SPELL_CHANNEL, abId))
            endif
        endif
        if id == EVENT_UNIT_HERO_SKILL then
            set abId = GetLearnedSkill()
            if GetLearnedSkillLevel() == 1 then
                if HaveSavedString(ObjectData, LEARN_FIRST_LEVEL_SKILL, abId) then
                    call ExecuteFunc(LoadStr(ObjectData, LEARN_FIRST_LEVEL_SKILL, abId))
                endif
            endif
            if HaveSavedString(ObjectData, LEARN_SKILL, abId) then
                call ExecuteFunc(LoadStr(ObjectData, LEARN_SKILL, abId))
            endif
        endif
        set id = null
        return false
    endfunction

    //本来是想用触发器条件成立来运行技能发动效果事件对应的函数 但后来还是改用DzExecuteFunc
    //注册单位发动技能效果事件
    //function RegisterSpellEffectEvent takes integer id, code c returns nothing
    //	local trigger t //可以给单位添加技能然后获取技能等级来知道Id是否有效
    //	set t = CreateTrigger()
    //	set Spell_Effect_Number = Spell_Effect_Number + 1
    //	set Spell_Effect[Spell_Effect_Number] = t
    //	call SaveInteger(ObjectData, SPELL_EFFECT, id, Spell_Effect_Number)
    //	call TriggerAddCondition(t, Condition(c))
    //	set t = null
    //endfunction

    //英文名部分为机翻 因为英语实在渣
    //初始化技能事件

    private function Init takes nothing returns nothing
        set AbilityEventTrigger = CreateTrigger()
        set UnitSpellEffectTrigger = CreateTrigger()
        call TriggerAddCondition(UnitSpellEffectTrigger, Condition(function UnitSpellEffectActions)) 
        call TriggerAddCondition(AbilityEventTrigger, Condition(function AbilityEventActions)) 
	
        call InitAbilityFunctions()
    endfunction

endscope
