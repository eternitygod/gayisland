
//黑羽
//戒色
//施法时每秒恢复5%
function AbstinenceIsGoodMedicine takes nothing returns nothing
	local trigger trig = CreateTrigger()
	local integer iHandleId = GetHandleId(trig)
	local unit spellUnit = M_GetSpellAbilityUnit()

	call TriggerRegisterTimerEvent(trig, 1.0, true)
	call TriggerRegisterUnitEvent(trig, spellUnit, EVENT_UNIT_SPELL_ENDCAST)
	call TriggerAddCondition(trig, Condition( function AbstinenceIsGoodMedicineEffect))
	call UnitRemoveAbility(spellUnit, 'Ab08')
	call UnitRemoveAbility(spellUnit, 'B008')
	call UnitAddPermanentAbility(spellUnit, 'Ab09')
	call SaveUnitHandle(HT, iHandleId, 0, spellUnit)
	call SaveInteger(HT, iHandleId, 0, GetSpellAbilityId())

	set spellUnit = null
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

function DragonSlave takes nothing returns nothing
	local unit spellUnit = M_GetSpellAbilityUnit()
	local unit targetUnit = M_GetSpellAbilityUnit()
	local real startX = GetUnitX(spellUnit)
	local real startY = GetUnitY(spellUnit)
	local real targetX
	local real targetY
	local string effectPath = "units\\human\\phoenix\\phoenix.mdl"
	local effect missileEffect
	local integer level = M_GetSpellAbilityLevel()
	local real damage = 80 + level * 70
	if targetUnit == null then
		set targetX = M_GetSpellTargetX()
		set targetY = M_GetSpellTargetY()
	else
		set targetX = GetUnitX(targetUnit)
		set targetY = GetUnitY(targetUnit)
	endif
	set missileEffect = AddSpecialEffect(effectPath, targetX, targetY)
	call UnitSpellWaveByEffect(spellUnit, missileEffect, damage, 800, 275, 200, startX, startY, targetX, targetY, 1200, 1, null, level, function DragonSlave_Filter)
	set spellUnit = null
	set targetUnit = null
	set missileEffect = null
endfunction

function LightStrikeArrayWait05 takes nothing returns boolean
	local trigger trig = GetTriggeringTrigger()
	local integer iHanleId = GetHandleId(trig)
	local unit spellUnit = LoadUnitHandle(HT, iHanleId, 9)
	local real damage = LoadReal(HT, iHanleId, 5)
	local real targetX = LoadReal(HT, iHanleId, 6)
	local real targetY = LoadReal(HT, iHanleId, 7)
	call UnitSpellLightStrikeArray(spellUnit, damage, 1, targetX, targetY, 225, 1.6, 1.6, false)
	call KillDestructablesInCircle(targetX, targetY, 225)
	call FlushChildHashtable(HT, iHanleId)
	call ClearTrigger(trig)
	set trig = null
	set spellUnit = null
	return false
endfunction

function LightStrikeArray takes nothing returns nothing
	local unit spellUnit = M_GetSpellAbilityUnit()
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
	call SaveUnitHandle(HT, iHandleId, 9, spellUnit)

	set spellUnit = null
	set trig = null
endfunction

function FierySoulRemove takes nothing returns boolean
	local trigger trig = GetTriggeringTrigger()
	local integer iHandleId = GetHandleId(trig)
	local unit whichUnit
	local integer fierySoulCount
	if TimerGetElapsed(GameTimer)> LoadReal(HT, iHandleId, 0) then
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
	call SaveReal(HT, iHandleId, 0, TimerGetElapsed(GameTimer)+ 9)
	set fierySoulCount = LoadInteger(HT, iHandleId, 0)
	if fierySoulCount < 3 then
		call SaveInteger(HT, iHandleId, 0, fierySoulCount + 1)
		call UnitAddAttackSpeedBonus(whichUnit, bonusAttackSpeed)
		call UnitAddMoveSpeedBonus(whichUnit, bonusMoveSpeed)
		call SaveReal(HT, iHandleId, 1, LoadReal(HT, iHandleId, 1) + bonusAttackSpeed)
		call SaveReal(HT, iHandleId, 2, LoadReal(HT, iHandleId, 2) + bonusMoveSpeed)
		call SaveEffectHandle(HT, iHandleId, 10 + fierySoulCount + 1, AddSpecialEffectTarget("Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile_mini.mdl", whichUnit, "head"))
		call SaveEffectHandle(HT, iHandleId, 20 + fierySoulCount + 1, AddSpecialEffectTarget("Abilities\\Weapons\\PhoenixMissile\\Phoenix_Missile_mini.mdl", whichUnit, "chest"))
	endif
	set trig = null
endfunction

function FierySoulFilter takes nothing returns boolean
	local integer abilityId = GetSpellAbilityId()
	call FierySoulEffect(GetSpellAbilityUnit())
	return false
endfunction

function FierySoul takes nothing returns nothing
	local unit learnUnit = GetLearningUnit()
	local trigger trig = CreateTrigger()
	call TriggerRegisterUnitEvent(trig, learnUnit, EVENT_UNIT_SPELL_EFFECT)
	call TriggerAddCondition(trig, Condition( function FierySoulFilter))
	set trig = null
	set learnUnit = null
endfunction

function LagunaBladeWait025 takes nothing returns boolean
	local trigger trig = GetTriggeringTrigger()
	local integer iHandleId = GetHandleId(trig)
	local unit spellUnit = LoadUnitHandle(HT, iHandleId, 0)
	local unit targetUnit = LoadUnitHandle(HT, iHandleId, 1)
	local real damage = LoadReal(HT, iHandleId, 1)

	call DamageUnit(spellUnit, targetUnit, 1, damage)
	
	call FlushChildHashtable(HT, iHandleId)
	call ClearTrigger(trig)
	set trig = null
	set spellUnit = null
	set targetUnit = null
	return false
endfunction

//神灭斩
function LagunaBlade takes nothing returns nothing
	local unit spellUnit = M_GetSpellAbilityUnit()
	local unit targetUnit = M_GetSpellAbilityUnit()
	local integer abilityLevel = M_GetSpellAbilityLevel()
	local trigger trig = CreateTrigger()
	local integer iHandleId = GetHandleId(trig)
	local real spellUnitX = GetUnitX(spellUnit)
	local real spellUnitY = GetUnitY(spellUnit)
	local real targetUnitX = GetUnitX(targetUnit)
	local real targetUnitY = GetUnitY(targetUnit)
	local real damage = 250 + abilityLevel * 200

	local unit dummyUnit = CreateUnit(GetOwningPlayer(spellUnit), 'ndum', spellUnitX, spellUnitY, 0)
	call UnitAddAbility(dummyUnit, 'Ahy5')
	call IssueTargetOrderById(dummyUnit, Order_Chainlightning, targetUnit)
	call TriggerRegisterTimerEvent(trig, 0.25, true)
	call TriggerAddCondition(trig, Condition(function LagunaBladeWait025))
	call SaveUnitHandle(HT, iHandleId, 0, spellUnit)
	call SaveUnitHandle(HT, iHandleId, 1, targetUnit)
	call SaveReal(HT, iHandleId, 1, damage)
	set trig = null
	set spellUnit = null
	set targetUnit = null
	set dummyUnit = null
endfunction

