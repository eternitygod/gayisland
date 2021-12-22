

library DamageSystem requires base, TextTag

    //==============================================================================
    // DamagedEvent
    //==============================================================================
    globals
        // 伤害事件
        constant integer EVENT_DAMAGE_DATA_VAILD = 0
        // 物理伤害
        constant integer EVENT_DAMAGE_DATA_IS_PHYSICAL = 1
        // 攻击伤害
        constant integer EVENT_DAMAGE_DATA_IS_ATTACK = 2
        // 远程伤害
        constant integer EVENT_DAMAGE_DATA_IS_RANGED = 3
        // 伤害类型
        constant integer EVENT_DAMAGE_DATA_DAMAGE_TYPE = 4
        // 武器类型
        constant integer EVENT_DAMAGE_DATA_WEAPON_TYPE = 5
        // 攻击类型
        constant integer EVENT_DAMAGE_DATA_ATTACK_TYPE = 6
    endglobals
    
	native EXGetEventDamageData takes integer edd_type returns integer
    native EXSetEventDamage takes real amount returns boolean
        
    function YDWEIsEventPhysicalDamage takes nothing returns boolean
        return 0 != EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_PHYSICAL)
    endfunction
    
    function YDWEIsEventAttackDamage takes nothing returns boolean
        return 0 != EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_ATTACK)
    endfunction
        
    function YDWEIsEventRangedDamage takes nothing returns boolean
        return 0 != EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_RANGED)
    endfunction
        
    function YDWEIsEventDamageType takes damagetype damageType returns boolean
        return damageType == ConvertDamageType(EXGetEventDamageData(EVENT_DAMAGE_DATA_DAMAGE_TYPE))
    endfunction
    
    function YDWEIsEventWeaponType takes weapontype weaponType returns boolean
        return weaponType == ConvertWeaponType(EXGetEventDamageData(EVENT_DAMAGE_DATA_WEAPON_TYPE))
    endfunction
        
    function YDWEIsEventAttackType takes attacktype attackType returns boolean
        return attackType == ConvertAttackType(EXGetEventDamageData(EVENT_DAMAGE_DATA_ATTACK_TYPE))
    endfunction
    
    function YDWESetEventDamage takes real amount returns boolean
        return EXSetEventDamage(amount)
    endfunction

    globals
        
        // 魔法
        constant integer DAMAGE_TYPE_MAGICAL = 1
        // 物理
        constant integer DAMAGE_TYPE_PHYSICAL = 2
        // 纯粹
        constant integer DAMAGE_TYPE_PURE = 3
        
    endglobals

    //造成伤害 脚本中除了普攻以外的伤害都由此造成
    function DamageUnit takes unit whichUnit, unit target, integer Type, real amount returns nothing
        if Type == 0 or amount < 0 then
            return
        endif
        if Type == DAMAGE_TYPE_MAGICAL then //法术,火焰伤害(魔法伤害)
            call UnitDamageTarget(whichUnit, target, amount, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_FIRE, WEAPON_TYPE_WHOKNOWS)
        elseif Type == DAMAGE_TYPE_PHYSICAL then //英雄,普通伤害(物理伤害)
            call UnitDamageTarget(whichUnit, target, amount, false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
        elseif Type == DAMAGE_TYPE_PURE then //英雄,魔法伤害(纯粹伤害)
            call UnitDamageTarget(whichUnit, target, amount, false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
        elseif Type == 4 then //穿刺，普通伤害(?)
            call UnitDamageTarget(whichUnit, target, amount, false, false, ATTACK_TYPE_PIERCE, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
        elseif Type == 5 then //法术，普通伤害(?)
            call UnitDamageTarget(whichUnit, target, amount, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
        elseif Type == 6 then //英雄，通用伤害(神圣伤害)
            call UnitDamageTarget(whichUnit, target, amount, false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS)
        elseif Type == 7 then //英雄，加强伤害(?)
            call UnitDamageTarget(whichUnit, target, amount, false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_ENHANCED, WEAPON_TYPE_WHOKNOWS)
        elseif Type == 8 then //法术，通用伤害(?)
            call UnitDamageTarget(whichUnit, target, amount, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS)
        elseif Type == 9 then //生命移除
        endif
    endfunction

    // 斩杀单位
    function UnitKillTarget takes unit whichUnit, unit target returns boolean
        call UnitRemoveBuffs(target, true, true)
        return UnitDamageTarget(whichUnit, target, 10000000, false, false, ATTACK_TYPE_PIERCE, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
    endfunction

    //吸血
    function GetUnitLifestealValue takes unit stealUnit returns real
        if EffectIsEnabled[2] then
            if GetUnitAbilityLevel(stealUnit, 'Acs0') == 1 then
                return 0.10
            endif
        endif
        return 0.
    endfunction

    function SetUnitLifesteal takes nothing returns nothing
        local real value // 单位物理攻击吸血
        set value = GetUnitLifestealValue(Tmp_DamageSource)
        if value == 0. then
            return
        endif
        if not IsUnitIllusion(Tmp_DamageSource) and not IsUnitIllusion(Tmp_DamageInjured) then
            call UnitRestoreLife(Tmp_DamageSource, Tmp_DamageValue * value)
        endif
        call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Undead\\VampiricAura\\VampiricAuraTarget.mdl", Tmp_DamageSource, "origin"))
    endfunction

    //使得单位本次攻击 暴击
    function SetUnitCriticalStrike takes real c, boolean isAttackTarget returns nothing
        set Tmp_DamageValue = Tmp_DamageValue + Tmp_DamageValue * c //设置这个全局值为暴击后的伤害
        call EXSetEventDamage(Tmp_DamageValue) //设置伤害值
        if isAttackTarget then
            call CriticalStrikeTextTag(Tmp_DamageSource , Tmp_DamageValue)
        endif
    endfunction

    function TraversalDamagedEvent takes integer id returns nothing
        local integer i = id * 200
        loop //遍历其他攻击特效
            exitwhen i >= DamageEventNumber[id]
            if DamageEventQueue[i] != null and IsTriggerEnabled(DamageEventQueue[i]) then
                call TriggerEvaluate(DamageEventQueue[i])
            endif
            set i = i + 1  
        endloop
    endfunction

    // 减伤
    function DamageReduction takes nothing returns nothing
        local integer level
        if EffectIsEnabled[3] then
            set level = GetUnitAbilityLevel(Tmp_DamageInjured, 'Acs3')
            if level > 0 then
                if IsPointBlighted(GetUnitX(Tmp_DamageInjured), GetUnitY(Tmp_DamageInjured)) then
                    //call Debug("log", "减少"+R2S( Tmp_DamageValue * 0.05 * level))
                    set Tmp_DamageValue = Tmp_DamageValue - Tmp_DamageValue * 0.05 * level
                    call EXSetEventDamage(Tmp_DamageValue) //设置伤害值
                endif
            endif
        endif
    endfunction

    // 任意单位受伤事件
    function YDWEAnyUnitDamagedTriggerAction takes nothing returns boolean
        local integer i
        local real c
        local boolean isAttackTarget
        set Tmp_DamageValue = GetEventDamage()	//伤害值
        if Tmp_DamageValue > 0 then
            set Tmp_DamageSource = GetEventDamageSource()	//伤害来源
            set Tmp_DamageInjured = GetTriggerUnit()	//受伤单位
            set i = GetHandleId(Tmp_DamageSource)
            //伤害减免
            call DamageReduction()
            if EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_ATTACK) != 0 then //如果是物理伤害则运行此部分
                //伤害减免后运行暴击
                set isAttackTarget = LoadUnitHandle(UnitKeyBuff, i, AttackTarget) == Tmp_DamageInjured
                set c = LoadReal(UnitKeyBuff, i, CriticalStrikeDamage)
                if c != .0 then
                    call SetUnitCriticalStrike(c, isAttackTarget)//先一步把暴击运行了 因为这会改变伤害值
                endif
                // 这里是判断一下该单位是否是普通攻击的目标(排除溅射伤害)
                if isAttackTarget then
                    if CommonAttackEffectFilter(Tmp_DamageSource, Tmp_DamageInjured) then
                        call TraversalDamagedEvent(1)
                        call SetUnitLifesteal()
                    endif
                endif
            endif
        endif
        return false
    endfunction

endlibrary
