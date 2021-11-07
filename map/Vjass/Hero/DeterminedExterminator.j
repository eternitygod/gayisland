
function DeterminedExterminatorEffectWait10 takes nothing returns boolean
	local trigger trig = GetTriggeringTrigger()
	local integer iHandleId = GetHandleId(trig)
	local integer heroStr = LoadInteger(HT, iHandleId, 0)
	local unit whichUnit = LoadUnitHandle(HT, iHandleId, 0)

	call UnitReduceStrBonus(whichUnit, heroStr)

	call FlushChildHashtable(HT, iHandleId)
	call ClearTrigger(trig)
	set whichUnit = null
	set trig = null
	return false
endfunction

function DeterminedExterminatorEffect takes unit whichUnit, boolean isHero returns nothing

	local integer addHeroStr = R2I(GetHeroStr(whichUnit, false) * 0.1)
	local integer iHandleId = CreateTimerEventTrigger(10., false, function DeterminedExterminatorEffectWait10)
	if isHero then
		set addHeroStr = addHeroStr * 2
	endif

	call SaveUnitHandle(HT, iHandleId, 0, whichUnit)
	call SaveInteger(HT, iHandleId, 0, addHeroStr)	

	call UnitAddStrBonus(whichUnit, addHeroStr)

endfunction

function DeterminedExterminatorFilter takes nothing returns nothing
	local trigger trig = GetTriggeringTrigger()
	local integer iHandleId = GetHandleId(trig)
	local unit whichUnit = LoadUnitHandle(HT, iHandleId, 0)
	local unit dyingUnit = GetDyingUnit()
	local real distance = GetDistanceBetweenUnits(whichUnit, dyingUnit)
	if distance < 500 then
		call DeterminedExterminatorEffect(whichUnit, IsUnitType(dyingUnit, UNIT_TYPE_HERO))
	endif
	set whichUnit = null
	set dyingUnit = null
	set trig = null
endfunction

//仓鼠天赋
function DeterminedExterminator takes unit whichUnit returns nothing
	local trigger trig = CreateTrigger()
	local integer iHandleId = GetHandleId(trig)
	call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_DEATH)
	call TriggerAddCondition(trig, Condition(function DeterminedExterminatorFilter))
	call SaveUnitHandle(HT, iHandleId, 0, whichUnit)

	set trig = null
endfunction

//暗杀
function Assassination takes nothing returns nothing
	local unit spellUnit = M_GetSpellAbilityUnit()
	local unit targetUnit = M_GetSpellAbilityUnit()
	local unit firstUnit
	local group targetGroup = LoginGroup()
	local integer abilityLevel = M_GetSpellAbilityLevel()
	local real damage = 60 + abilityLevel * 20
	local integer heroStr = GetHeroStr(spellUnit, true)
	set damage = damage + ( damage * heroStr * 0.01 )
	call GroupEnumUnitsInRange(targetGroup, GetUnitX(targetUnit), GetUnitY(targetUnit), 325, null)
	set P2 = GetOwningPlayer(spellUnit)
	loop
		set firstUnit = FirstOfGroup(targetGroup)
		exitwhen firstUnit == null
		if IsGround_NotMechanical_Enemy_Alive_NoStructure(firstUnit) then
			call DamageUnit(spellUnit, firstUnit, 2, damage)
			call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl", firstUnit, "origin"))
		endif
		call GroupRemoveUnit(targetGroup, firstUnit)
	endloop
	call LogoutGroup(targetGroup)
	set targetUnit = null
	set firstUnit = null
	set targetGroup = null
	set spellUnit = null
endfunction

function BlightPower takes nothing returns nothing
	local unit spellUnit = M_GetSpellAbilityUnit()

	local integer abilityLevel = M_GetSpellAbilityLevel()
	local real dur = 3 + abilityLevel * 1
	call UnitSetMagicImmunity(spellUnit , dur)
	call UnitAddAbilityTimed(spellUnit, 'Ab10', 1, dur, 'B010', 1)
	call SetBlight(GetOwningPlayer(spellUnit), GetUnitX(spellUnit), GetUnitY(spellUnit), 225, true)
	
	set spellUnit = null
endfunction

function BlackEpidermis takes nothing returns nothing
	call EnabledAttackEffect(3, 0.)
endfunction

function JumpShipRun takes nothing returns nothing
	local trigger trig = GetTriggeringTrigger()
	local integer iHandleId = GetHandleId(trig)
	local unit smallBear = LoadUnitHandle(HT, iHandleId, 0)
	local unit shipUnit = LoadUnitHandle(HT, iHandleId, 1)
	//local unit targetUnit = LoadUnitHandle(HT, iHandleId, 2)
	local real angle = LoadReal(HT, iHandleId, 0)
	local integer evalCount = GetTriggerEvalCount(trig)
	local real flyHeight
	local real targetX
	local real targetY
	local boolean close = LoadBoolean(HT, iHandleId, 180)
	//if evalCount> 80 then
	//	call Debug("log", "	Bigbug")
	//endif
	if not UnitAlive(shipUnit) and evalCount < 30 then
		call SaveBoolean(HT, iHandleId, 180, true)
	endif
	if ( UnitAlive(shipUnit) or GetUnitFlyHeight(smallBear) != 312.5 ) and not close then

		if evalCount < 30 then
			call SetUnitX(smallBear, GetUnitX(shipUnit) + 130 * Cos(angle) )
			call SetUnitY(smallBear, GetUnitY(shipUnit) + 130 * Cos(angle) )
		elseif evalCount < 80 then
			set evalCount = evalCount - 30
			set flyHeight = 0.5 * (evalCount - 25)*(evalCount - 25)
			call SetUnitFlyHeight(smallBear, 312.5 - flyHeight, 0)
			set targetX = CoordinateX(GetUnitX(smallBear) + 10.33 * Cos(angle))
			set targetY = CoordinateY(GetUnitY(smallBear) + 10.33 * Sin(angle))
			call SetUnitX(smallBear, targetX)
			call SetUnitY(smallBear, targetY)
		else
			set close = true
			call SaveBoolean(HT, iHandleId, 180, true)
		endif

	else
		call SetUnitFlyHeight(smallBear, GetUnitDefaultFlyHeight(smallBear), 0)
		call PauseUnit(smallBear, false)
		//call Debug("log", "	call SetUnitFlyHeight(smallBear, 0, 0)")
		call SetUnitTimeScale(smallBear, 1.0)
		call UnitRemoveAbility(smallBear, 'Abun')
		call SetUnitPathing(smallBear, true)
		//call Debug("log", "	SetUnitPathing(smallBear, true)")
		call SetUnitAnimation(smallBear, "stand")
		if not UnitAlive(shipUnit) and evalCount < 30 then
			call KillUnit(smallBear)
		else
			call RemoveUnit(smallBear)
			set smallBear = SummonUnit(LoadUnitHandle(HT, iHandleId, 3), 'nfrl', GetUnitX(smallBear), GetUnitY(smallBear), angle, 'BTLF', 20.)
			call SetUnitVertexColor(smallBear, 255, 255, 255, 100)
		endif
		call FlushChildHashtable(HT, iHandleId)
		call ClearTrigger(trig)
	endif
	set trig = null
	set smallBear = null
	set shipUnit = null
	//set targetUnit = null
endfunction

function JumpShip takes unit targetUnit, unit shipUnit, unit spellUnit returns nothing
	local real shipX = GetUnitX(shipUnit)
	local real shipY = GetUnitY(shipUnit)
	local real targetX = GetUnitX(targetUnit)
	local real targetY = GetUnitY(targetUnit)
	local real face = AngleBetweenXY(shipX, shipY, targetX, targetY)
	local real startX = CoordinateX(shipX + 130 * Cos(face))
	local real startY = CoordinateY(shipY + 130 * Sin(face))
	local unit smallBear = CreateUnit(GetOwningPlayer(shipUnit), 'nfrl', startX, startY, face)
	local integer iHandleId = CreateTimerEventTrigger(0.2, true, function JumpShipRun)

	call PauseUnit(smallBear, true)
	call UnitAddAbility(smallBear, 'Arav')
	call UnitRemoveAbility(smallBear, 'Arav')
	call UnitAddAbility(smallBear, 'Aloc')
	call SetUnitPathing(smallBear, false)
	call SetUnitFlyHeight(smallBear, 312.5, 0)
	//
	call SetUnitVertexColor(smallBear, 255, 255, 255, 100)
	call SetUnitAnimation(smallBear, "Attack spell")
	call QueueUnitAnimation(smallBear, "StandHit")
	call SetUnitTimeScale(smallBear, 3)

	
	call SaveUnitHandle(HT, iHandleId, 0, smallBear)
	call SaveUnitHandle(HT, iHandleId, 1, shipUnit)
	call SaveUnitHandle(HT, iHandleId, 2, targetUnit)
	call SaveUnitHandle(HT, iHandleId, 3, spellUnit)
	call SaveReal(HT, iHandleId, 0, face)

	set smallBear = null
endfunction

function ShipSail takes nothing returns boolean
	local trigger trig = GetTriggeringTrigger()
	local integer iHandleId = GetHandleId(trig)
	local unit dummyShip = LoadUnitHandle(HT, iHandleId, 170)
	local unit firstUnit
	local unit spellUnit
	local group targetGroup
	local group injuredGroup
	local integer evalCount = GetTriggerEvalCount(trig)
	local real amount
	local real startX = LoadReal(HT, iHandleId, 150)
	local real startY = LoadReal(HT, iHandleId, 151)
	local real angle = LoadReal(HT, iHandleId, 152)
	local real shipX = CoordinateX(startX + 13.33 * evalCount * Cos(angle))
	local real shipY = CoordinateY(startY + 13.33 * evalCount * Sin(angle))
	if evalCount < 19 then
		call SetUnitVertexColor(dummyShip, 255, 255, 255, 5 + evalCount * 10)
	elseif evalCount < 125 then
		call SetUnitVertexColor(dummyShip, 255, 255, 255, 190)
	endif
	if evalCount >= 110 then
		set injuredGroup = LoadGroupHandle(HT, iHandleId, 187)
		set targetGroup = LoginGroup()
		set spellUnit = LoadUnitHandle(HT, iHandleId, 171)
		call GroupEnumUnitsInRange(targetGroup, shipX, shipY, 550, null)
		set P2 = GetOwningPlayer(dummyShip)
		loop
			set firstUnit = FirstOfGroup(targetGroup)
			exitwhen firstUnit == null
			//非空军 非机械 存活 非建筑 敌军 可见
			if UnitVisibleToPlayer(firstUnit, P2) and IsGround_NotMechanical_Enemy_Alive_NoStructure(firstUnit) and not IsUnitInGroup(firstUnit, injuredGroup) then
				call JumpShip(firstUnit, dummyShip, spellUnit)
				call GroupAddUnit(injuredGroup, firstUnit)
			endif
			call GroupRemoveUnit(targetGroup, firstUnit)
		endloop
		call LogoutGroup(targetGroup)
		set targetGroup = null
		set injuredGroup = null
		set spellUnit = null
	endif
	call SetUnitX(dummyShip, shipX)
	call SetUnitY(dummyShip, shipY)
	if ModuloInteger(evalCount, 25) == 0 then
		call KillDestructablesInCircle(shipX, shipY, 325)
	endif
	if evalCount == LoadInteger(HT, iHandleId, 161) then
		call KillDestructablesInCircle(shipX, shipY, 325)
		set targetGroup = LoginGroup()
		set spellUnit = LoadUnitHandle(HT, iHandleId, 171)
		set amount = LoadReal(HT, iHandleId, 153)
		call GroupEnumUnitsInRange(targetGroup, shipX, shipY, 425, null)
		set P2 = GetOwningPlayer(spellUnit)
		loop
			set firstUnit = FirstOfGroup(targetGroup)
			exitwhen firstUnit == null
			if Enemy_Alive_NoStructure(firstUnit) then
				call M_UnitSetStun(firstUnit, 2, 1.4, false)
				call DamageUnit(spellUnit, firstUnit, 1, amount)
			endif
			call GroupRemoveUnit(targetGroup, firstUnit)
		endloop
		set firstUnit = null
		set spellUnit = null
		call LogoutGroup(targetGroup)
		set targetGroup = null
		call LogoutGroup(LoadGroupHandle(HT, iHandleId, 187))
		call KillUnit(dummyShip)
		call FlushChildHashtable(HT, iHandleId)
		call ClearTrigger(trig)
	endif

	set dummyShip = null
	set trig = null
	return false
endfunction

function SmallBearAttackEffect takes nothing returns nothing
	local unit soureUnit
	if GetUnitTypeId(Tmp_DamageSource) == 'nfrl' then
		set soureUnit = GetMasterUnit(Tmp_DamageSource)
		call UnitRestoreMana( soureUnit, 10)
		call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Undead\\ReplenishMana\\SpiritTouchTarget.mdl", soureUnit, "origin"))
		set soureUnit = null
	endif
endfunction

//学习幽灵船
function LearnGhostShip takes nothing returns nothing
	local trigger trig = CreateTrigger()
	call TriggerAddCondition(trig, Condition( function SmallBearAttackEffect))
	call TriggerRegisterAnyUnitDamagedEvent(trig, 1)
	set trig = null
endfunction

function GhostShip takes nothing returns nothing
	local unit spellUnit = M_GetSpellAbilityUnit()
	local unit dummyShip
	local real spellX = M_GetSpellTargetX()
	local real spellY = M_GetSpellTargetY()
	local real unitX = GetUnitX(spellUnit)
	local real unitY = GetUnitY(spellUnit)
	local real startX
	local real startY
	local real targetX
	local real targetY

	local real angle
	local integer level = M_GetSpellAbilityLevel()
	local real damage = 100 + level * 50
	local integer maxCount = 150
	local integer iHandleId = CreateTimerEventTrigger(.02, true, function ShipSail)
	
	set startX = unitX
	set startY = unitY
	if spellX == startX and spellY == startY then
		set angle = GetUnitFacing(spellUnit)
		set spellX = spellX + 50 * Cos(angle * bj_DEGTORAD)
		set spellY = spellY + 50 * Sin(angle * bj_DEGTORAD)
	endif

	set angle = Atan2(spellY - startY, spellX - startX)
	set startX = unitX - 1000 * Cos(angle)
	set startY = unitY - 1000 * Sin(angle)
	set targetX = unitX + 1000 * Cos(angle)
	set targetY = unitY + 1000 * Sin(angle)
	call SaveReal(HT, iHandleId, 152, angle)
	set angle = AngleBetweenXY(startX, startY, spellX, spellY)

	call DestroyEffect(AddSpecialEffect("war3mapImported\\Whirlpool.mdx", targetX, targetY))

	set dummyShip = CreateUnit(GetOwningPlayer(spellUnit), 'ndsp', startX, startY, angle)
	call SetUnitVertexColor(dummyShip, 255, 255, 255, 0)
	call SetUnitPathing(dummyShip, false)

	call SaveInteger(HT, iHandleId, 160, level)
	call SaveInteger(HT, iHandleId, 161, maxCount)
	call SaveReal(HT, iHandleId, 150, startX)
	call SaveReal(HT, iHandleId, 151, startY)
	call SaveReal(HT, iHandleId, 153, damage)
	call SaveGroupHandle(HT, iHandleId, 187, LoginGroup() )
	call SaveUnitHandle(HT, iHandleId, 170, dummyShip)
	//存入施法者,伤害理应由施法者打出
	call SaveUnitHandle(HT, iHandleId, 171, spellUnit)
	
	set dummyShip = null
	set spellUnit = null
endfunction
