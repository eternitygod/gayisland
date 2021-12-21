



function Lcqy_ZeroCast takes unit u, boolean b returns nothing
	local integer uh = GetHandleId(u)
	if b then
		call CommonTextTag("|c0009d396 0x 施法！！|r", 5, u, .03, 255, 255, 255, 255, 64)
		call YDWESetUnitAbilityDataString( u, 'Alc0', 1, 204, "ReplaceableTextures\\CommandButtons\\BTNMagicalSentry.blp" )
	else
		call YDWESetUnitAbilityDataString( u, 'Alc0', 1, 204, "ReplaceableTextures\\PassiveButtons\\PASBTNMagicalSentry.blp" )
	endif
	call SaveBoolean(UnitKeyBuff, GetHandleId(M_GetSpellAbilityUnit()), ZeroCast,  b)
endfunction

function crosskill_actions takes integer unitId, integer buffId returns nothing
	local real x1
	local real y1
	local real x2
	local real y2
	local real a = 0
	local integer i = 0
	local unit ft = null
	local player p = GetOwningPlayer(M_GetSpellAbilityUnit())
	local unit target = M_GetSpellTargetUnit()
	local boolean isAlly = IsUnitAlly(target, p)
	if target == null then
		set x1 = M_GetSpellTargetX()
		set y1 = M_GetSpellTargetY()
	else
		set x1 = GetUnitX(target)
		set y1 = GetUnitY(target)
	endif
	loop //
		set a = 90.00 * i * bj_DEGTORAD
		set x2 = CoordinateX(x1 + 90 * Cos(a))
		set y2 = CoordinateY(y1 + 90 * Sin(a))
		set ft = CreateUnit(p, unitId, x2, y2, AngleBetweenXY(x2, y2, x1, y1))
		call UnitApplyTimedLife(ft, buffId, 30.)
		if not isAlly then
			call IssueTargetOrderById(ft, ORDER_ATTACK, target)
		endif
		call SetUnitX(ft, x2)
		call SetUnitY(ft, y2)
		call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\MassTeleport\\MassTeleportCaster.mdl", x2, y2) )
		exitwhen i == 3
		set i = i + 1
	endloop
	set target = null
	set ft = null
endfunction
//十字围杀
function Crosskill takes nothing returns nothing
	local boolean b = LoadBoolean(UnitKeyBuff, GetHandleId(M_GetSpellAbilityUnit()) ,ZeroCast)
	if b then //成立则代表当前拥有零重施法状态
		call crosskill_actions('hlc2', 'Bft2')
		call Lcqy_ZeroCast(M_GetSpellAbilityUnit(), false) //移除零重施法状态
	else
		if GetPrdRandom(M_GetSpellAbilityUnit(), 'Alc0', 20) then
			call Lcqy_ZeroCast(M_GetSpellAbilityUnit(), true) //添加零重施法状态
			return
		endif
		call crosskill_actions('hlc1', 'Bft1')
	endif
endfunction

function enchant_equipment_actions takes nothing returns nothing
	local unit spellUnit = M_GetSpellAbilityUnit()
	local integer level = M_GetSpellAbilityLevel()
	local group buffGroup = LoginGroup()
	local unit firstUnit
	local real dur = 20 + level * 10
	call GroupEnumUnitsInRange(buffGroup, GetUnitX(spellUnit),GetUnitY(spellUnit), 625, null)
	set P2 = GetOwningPlayer(spellUnit)
	loop
		set firstUnit = FirstOfGroup(buffGroup)
		exitwhen firstUnit == null
		if IsMechanical_Ally_Alive_NoStructure(firstUnit) then
			call UnitAddAbilityTimed(firstUnit, 'Alc5' , level, dur,'Blc2' , 1)
		endif
		call GroupRemoveUnit(buffGroup, firstUnit)
	endloop

	call LogoutGroup(buffGroup)
	set buffGroup = null
	set spellUnit = null
	set firstUnit = null
endfunction

function EnchantEquipment takes nothing returns nothing
	local boolean b = LoadBoolean(UnitKeyBuff, GetHandleId(M_GetSpellAbilityUnit()), ZeroCast)
	if b then
		call enchant_equipment_actions()
		call Lcqy_ZeroCast(M_GetSpellAbilityUnit(), false) //移除零重施法状态
	else
		if GetPrdRandom(M_GetSpellAbilityUnit(), 'Alc0', 20) then
			call Lcqy_ZeroCast(M_GetSpellAbilityUnit(), true) //添加零重施法状态
			return
		endif
		call enchant_equipment_actions()
	endif
endfunction

function LcqyStompSpell takes boolean haveZeroCast returns nothing
	local unit spellUnit = M_GetSpellAbilityUnit()
	local integer abilityLevel = M_GetSpellAbilityLevel()
	local real damage = 75
	local real dur = 3
	local real herodur = 2
	local real area = 325
	local group soldiersGroup
	local unit firstUnit
	local integer typeId
	call UnitSpellStmop(spellUnit, damage, 1, dur, herodur, area, true, "Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl")
	if haveZeroCast then
		set soldiersGroup = LoginGroup()
		call GroupEnumUnitsInRange(soldiersGroup, GetUnitX(spellUnit), GetUnitY(spellUnit), 1000, null)
		set P2 = GetOwningPlayer(spellUnit)
		loop
			set firstUnit = FirstOfGroup(soldiersGroup)
			exitwhen firstUnit == null
			set typeId = GetUnitTypeId( firstUnit ) 
			if typeId == 'hlc1' or typeId == 'hlc2' then
				if AllyAlive(firstUnit) then
					call UnitSpellStmop(firstUnit, damage, 1, dur, herodur, area, true, "Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl")
				endif
			endif
			call GroupRemoveUnit(soldiersGroup, firstUnit)
		endloop
		set firstUnit = null
		call LogoutGroup(soldiersGroup)
		set soldiersGroup = null
	endif
	set spellUnit = null
endfunction

function Stomp takes nothing returns nothing
	local boolean isZeroCast = LoadBoolean(UnitKeyBuff, GetHandleId(M_GetSpellAbilityUnit()), ZeroCast)
	if isZeroCast then
		call Lcqy_ZeroCast(M_GetSpellAbilityUnit(), false) //移除零重施法状态
		call LcqyStompSpell(true)
	else
		if GetPrdRandom(M_GetSpellAbilityUnit(), 'Alc0', 20) then
			call Lcqy_ZeroCast(M_GetSpellAbilityUnit(), true) //添加零重施法状态
			return
		endif
		call LcqyStompSpell(false)
	endif
endfunction



function AbstinenceIsGoodMedicineEffect takes nothing returns boolean
	local trigger trig = GetTriggeringTrigger()
	local integer iHandleId = GetHandleId(trig)
	local unit whichUnit = LoadUnitHandle(HT, iHandleId, 0)
	local real data = 0.04
	local real addValue
	if GetTriggerEventId() == EVENT_GAME_TIMER_EXPIRED then
		set addValue = GetUnitState(whichUnit, UNIT_STATE_MAX_LIFE) * data
		call UnitRestoreLife(whichUnit, addValue)
		set addValue = GetUnitState(whichUnit, UNIT_STATE_MAX_MANA) * data
		call UnitRestoreMana(whichUnit, addValue)
	elseif GetSpellAbilityId() == LoadInteger(HT, iHandleId, 0) then
		call UnitRemoveAbility(whichUnit, 'Ab09')
		call UnitRemoveAbility(whichUnit, 'B009')
		call UnitAddPermanentAbility(whichUnit, 'Ab08')
		call FlushChildHashtable(HT, iHandleId)
		call ClearTrigger(trig)
	endif
	set whichUnit = null
	set trig = null
	return false
endfunction

