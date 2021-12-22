


scope CopperAlchemist

	//黑羽
	//戒色
	//施法时每秒恢复5%
	function AbstinenceIsGoodMedicine takes nothing returns nothing
		local trigger trig = CreateTrigger()
		local integer iHandleId = GetHandleId(trig)
		local unit hSpellUnit = M_GetSpellAbilityUnit()

		call TriggerRegisterTimerEvent(trig, 1.0, true)
		call TriggerRegisterUnitEvent(trig, hSpellUnit, EVENT_UNIT_SPELL_ENDCAST)
		call TriggerAddCondition(trig, Condition( function AbstinenceIsGoodMedicineEffect))
		call UnitRemoveAbility(hSpellUnit, 'Ab08')
		call UnitRemoveAbility(hSpellUnit, 'B008')
		call UnitAddPermanentAbility(hSpellUnit, 'Ab09')
		call SaveUnitHandle(HT, iHandleId, 0, hSpellUnit)
		call SaveInteger(HT, iHandleId, 0, GetSpellAbilityId())

		set hSpellUnit = null
		set trig = null
	endfunction

	function LolitaComplexEffect takes nothing returns boolean
		local trigger trig = GetTriggeringTrigger()
		local integer iHandleId = GetHandleId(trig)
		local unit whichUnit = LoadUnitHandle(HT, iHandleId, 0)
		local real value
		local real reduceState
		if UnitAlive(whichUnit) and GetUnitAbilityLevel(whichUnit, 'Ab09') == 0 then
			set value = GetWidgetLife(whichUnit)
			set reduceState = value - GetUnitState(whichUnit, UNIT_STATE_MAX_LIFE) * 0.01
			call SetWidgetLife(whichUnit, RMaxBJ(reduceState, 1))
			set value = GetUnitState(whichUnit, UNIT_STATE_MANA)
			set reduceState = value - GetUnitState(whichUnit, UNIT_STATE_MAX_MANA) * 0.01
			call SetUnitState(whichUnit, UNIT_STATE_MANA, RMaxBJ(reduceState, 1))
		endif
		set whichUnit = null
		set trig = null
		return false
	endfunction

	function LolitaComplex takes unit whichUnit returns nothing
		local trigger trig = CreateTrigger()
		local integer iHandleId = GetHandleId(trig)

		call TriggerRegisterTimerEvent(trig, 1.0, true)
		call TriggerAddCondition(trig, Condition( function LolitaComplexEffect))
		call SaveUnitHandle(HT, iHandleId, 0, whichUnit)

		set trig = null
	endfunction

	function DragonSlave_Filter takes nothing returns boolean
		return IsEnemyAliveNoStructureNoImmune(GetFilterUnit())
	endfunction

	// 龙破斩
	function DragonSlave takes nothing returns nothing
		local unit hSpellUnit = M_GetSpellAbilityUnit()
		local unit hTargetUnitt = M_GetSpellTargetUnit()
		local real startX = GetUnitX(hSpellUnit)
		local real startY = GetUnitY(hSpellUnit)
		local real targetX
		local real targetY
		local string effectPath = "Abilities\\Spells\\Human\\DragonSlave\\DragonSlave.mdx"
		local real damage = 80 + M_GetSpellAbilityLevel() * 70
		local integer level = M_GetSpellAbilityLevel()
		local effect missileEffect

		if hTargetUnitt == null then
			set targetX = M_GetSpellTargetX()
			set targetY = M_GetSpellTargetY()
		else
			set targetX = GetUnitX(hTargetUnitt)
			set targetY = GetUnitY(hTargetUnitt)
		endif
		set missileEffect = AddSpecialEffect(effectPath, targetX, targetY)
		call UnitSpellWaveByEffect(hSpellUnit, missileEffect, damage, 800, 275, 200, startX, startY, targetX, targetY, 1200, 1, null, level, function DragonSlave_Filter)
		set hSpellUnit = null
		set hTargetUnitt = null
		set missileEffect = null
	endfunction

	// 光击阵等待
	function LightStrikeArrayWait05 takes nothing returns boolean
		local trigger trig = GetTriggeringTrigger()
		local integer iHanleId = GetHandleId(trig)
		local unit hSpellUnit = LoadUnitHandle(HT, iHanleId, 9)
		local real damage = LoadReal(HT, iHanleId, 5)
		local real targetX = LoadReal(HT, iHanleId, 6)
		local real targetY = LoadReal(HT, iHanleId, 7)
		call UnitSpellLightStrikeArray(hSpellUnit, damage, 1, targetX, targetY, 225, 1.6, 1.6, false)
		call KillDestructablesInCircle(targetX, targetY, 225)
		call FlushChildHashtable(HT, iHanleId)
		call ClearTrigger(trig)
		set trig = null
		set hSpellUnit = null
		return false
	endfunction

	// 光击阵
	function LightStrikeArray takes nothing returns nothing
		local unit hSpellUnit = M_GetSpellAbilityUnit()
		local real targetX = M_GetSpellTargetX()
		local real targetY = M_GetSpellTargetY()
		local trigger trig = CreateTrigger()
		local integer iHandleId = GetHandleId(trig)
		local integer level = M_GetSpellAbilityLevel()
		local real damage = 40 + level * 40

		call TriggerRegisterTimerEvent(trig, 0.5, false)
		call TriggerAddCondition(trig, Condition( function LightStrikeArrayWait05))
		call SaveReal(HT, iHandleId, 5, damage)
		call SaveReal(HT, iHandleId, 6, targetX)
		call SaveReal(HT, iHandleId, 7, targetY)
		call SaveUnitHandle(HT, iHandleId, 9, hSpellUnit)

		set hSpellUnit = null
		set trig = null
	endfunction

	// 炽魂 移除
	function FierySoulRemove takes nothing returns boolean
		local trigger trig = GetTriggeringTrigger()
		local integer iHandleId = GetHandleId(trig)
		local unit whichUnit
		local integer fierySoulCount
		if GetGameTime()> LoadReal(HT, iHandleId, 0) then
			call RemoveSavedHandle(HT, GetHandleId( LoadTriggerHandle(HT, iHandleId, 1) ) , 0)
			set whichUnit = LoadUnitHandle(HT, iHandleId, 0)
			call UnitReduceAttackSpeedBonus(whichUnit, LoadReal(HT, iHandleId, 1))
			call UnitReduceMoveSpeedBonus(whichUnit, LoadReal(HT, iHandleId, 2))
			set fierySoulCount = LoadInteger(HT, iHandleId, 0)
			call DestroyEffect(LoadEffectHandle(HT, iHandleId, 10 + 1))
			call DestroyEffect(LoadEffectHandle(HT, iHandleId, 20 + 1))
			if fierySoulCount >= 2 then
				call DestroyEffect(LoadEffectHandle(HT, iHandleId, 10 + 2))
				call DestroyEffect(LoadEffectHandle(HT, iHandleId, 20 + 2))
			endif
			if fierySoulCount >= 3 then
				call DestroyEffect(LoadEffectHandle(HT, iHandleId, 10 + 3))
				call DestroyEffect(LoadEffectHandle(HT, iHandleId, 20 + 3))
			endif
			call UnitRemoveAbility(whichUnit, 'Ab07')
			call UnitRemoveAbility(whichUnit, 'B007')
			call FlushChildHashtable(HT, iHandleId)
			call ClearTrigger(trig)
			set whichUnit = null
		endif
		set trig = null
		return false
	endfunction

	// 炽魂
	function FierySoulEffect takes unit whichUnit returns nothing
		local trigger trig = GetTriggeringTrigger()
		local integer iHandleId = GetHandleId(trig)
		local trigger newTrig
		local integer fierySoulCount
		local integer abilityLevel = GetUnitAbilityLevel(whichUnit, 'Ahy3')
		local real bonusAttackSpeed = (20 + 10 * abilityLevel) * 0.01
		local real bonusMoveSpeed = 4 + 1 * abilityLevel
		set newTrig = LoadTriggerHandle(HT, iHandleId, 0)
		if newTrig == null then
			set newTrig = CreateTrigger()
			call SaveTriggerHandle(HT, iHandleId, 0, newTrig)
			set iHandleId = GetHandleId(newTrig)
			call TriggerRegisterTimerEvent(newTrig, .5, true)
			call TriggerAddCondition(newTrig, Condition(function FierySoulRemove))
			call SaveUnitHandle(HT, iHandleId, 0, whichUnit)
			call SaveTriggerHandle(HT, iHandleId, 1, trig)
			call UnitAddPermanentAbility(whichUnit, 'Ab07')
		else
			set iHandleId = GetHandleId(newTrig)
		endif
		call SaveReal(HT, iHandleId, 0, GetGameTime()+ 9)
		set fierySoulCount = LoadInteger(HT, iHandleId, 0)
		if fierySoulCount < 3 then
			call SaveInteger(HT, iHandleId, 0, fierySoulCount + 1)
			call UnitAddAttackSpeedBonus(whichUnit, bonusAttackSpeed)
			call UnitAddMoveSpeedBonus(whichUnit, bonusMoveSpeed)
			call SaveReal(HT, iHandleId, 1, LoadReal(HT, iHandleId, 1) + bonusAttackSpeed)
			call SaveReal(HT, iHandleId, 2, LoadReal(HT, iHandleId, 2) + bonusMoveSpeed)
			call SaveEffectHandle(HT, iHandleId, 10 + fierySoulCount + 1, AddSpecialEffectTarget("Abilities\\Spells\\Human\\DarkSoul\\DarkSoul.mdx", whichUnit, "head"))
			call SaveEffectHandle(HT, iHandleId, 20 + fierySoulCount + 1, AddSpecialEffectTarget("Abilities\\Spells\\Human\\DarkSoul\\DarkSoul.mdx", whichUnit, "chest"))
		endif
		set trig = null
	endfunction

	private function FierySoulFilter takes nothing returns boolean
		local integer abilityId = GetSpellAbilityId()
		call FierySoulEffect(GetSpellAbilityUnit())
		return false
	endfunction

	function Register_FierySoul takes nothing returns nothing
		local unit learnUnit = GetLearningUnit()
		local trigger trig = CreateUnitAbilityTrigger( learnUnit, GetLearnedSkill() )
		
		call TriggerRegisterUnitEvent(trig, learnUnit, EVENT_UNIT_SPELL_EFFECT)
		call TriggerAddCondition(trig, Condition( function FierySoulFilter))
		set trig = null
		set learnUnit = null
	endfunction

	/*private function LagunaBladeWait025 takes nothing returns boolean
		local trigger trig = GetTriggeringTrigger()
		local integer iHandleId = GetHandleId(trig)
		local unit hSpellUnit = LoadUnitHandle(HT, iHandleId, 0)
		local unit hTargetUnitt = LoadUnitHandle(HT, iHandleId, 1)
		local real damage = LoadReal(HT, iHandleId, 1)

		call DamageUnit(hSpellUnit, hTargetUnitt, 1, damage)
	
		call FlushChildHashtable(HT, iHandleId)
		call ClearTrigger(trig)
		set trig = null
		set hSpellUnit = null
		set hTargetUnitt = null
		return false
	endfunction*/

	// 偷懒直接在筛选里面加特效
	private function DragonSlave_Filter takes nothing returns boolean
		local unit hFilterUnit = GetFilterUnit()
		if IsEnemyAliveNoStructure(hFilterUnit) then
			call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\LagunaBlade\\LagunaBlade_hit.mdx", hFilterUnit, "origin"))
			return true
		endif
		set hFilterUnit = null
		return false
	endfunction

	//神灭斩
	private function LagunaBlade takes nothing returns nothing
		local unit hSpellUnit = M_GetSpellAbilityUnit()
		local unit hTargetUnitt = M_GetSpellTargetUnit()
		local integer level = M_GetSpellAbilityLevel()
		local real startX = GetUnitX(hSpellUnit)
		local real startY = GetUnitY(hSpellUnit)
		local real targetX
		local real targetY
		local real damage = 250 + level * 200
		local string effectPath = "Abilities\\Spells\\Human\\LagunaBlade\\LagunaBlade.mdx"
		local effect missileEffect
		if hTargetUnitt == null then
			set targetX = M_GetSpellTargetX()
			set targetY = M_GetSpellTargetY()
		else
			set targetX = GetUnitX(hTargetUnitt)
			set targetY = GetUnitY(hTargetUnitt)
		endif
		set missileEffect = AddSpecialEffect(effectPath, targetX, targetY)
		call UnitSpellWaveByEffect(hSpellUnit, missileEffect, damage, 800, 275, 200, startX, startY, targetX, targetY, 1200, 1, null, level, function DragonSlave_Filter)
		set missileEffect = null
		set hSpellUnit = null
		set hTargetUnitt = null
	endfunction


endscope

