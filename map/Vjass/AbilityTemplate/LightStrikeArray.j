
//光击阵
function UnitSpellLightStrikeArray takes unit whichUnit, real damage, integer damageType, real targetX, real targetY, real radius, real dur, real herodur, boolean ignoreMagicImmunes returns nothing
	local group targetUnitGroup = LoginGroup()
	local unit firstUnit
	call GroupEnumUnitsInRange(targetUnitGroup, targetX, targetY, radius, null)
	set P2 = GetOwningPlayer(whichUnit)
	loop
		set firstUnit = FirstOfGroup(targetUnitGroup)
		exitwhen firstUnit == null
		if IsGroundNotMechanicalEnemyAliveNoStructure(firstUnit) then
			call M_UnitSetStun(firstUnit, dur, herodur, ignoreMagicImmunes)
			call DamageUnit(whichUnit, firstUnit, damageType, damage)
		endif
		call GroupRemoveUnit(targetUnitGroup, firstUnit)
	endloop

	call LogoutGroup(targetUnitGroup)
	set targetUnitGroup = null
	set firstUnit = null
endfunction
