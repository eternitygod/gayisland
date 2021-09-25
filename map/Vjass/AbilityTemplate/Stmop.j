
//战争践踏
//让单位释放一个践踏
//目标允许强制为 地面,非机械,非建筑,存活
function UnitSpellStmop takes unit whichUnit, real damage, integer damageType, real dur, real herodur, real area, boolean ignoreMagicImmunes, string effectPath returns nothing
	local group targetGroup = LoginGroup()
	local real unitX = GetUnitX(whichUnit)
	local real unitY = GetUnitY(whichUnit)
	local unit firstUnit
	call GroupEnumUnitsInRange(targetGroup, unitX, unitY, area, null)
	set P2 = GetOwningPlayer(whichUnit)
	loop
		set firstUnit = FirstOfGroup(targetGroup)
		exitwhen firstUnit == null
		if IsGround_NotMechanical_Enemy_Alive_NoStructure(firstUnit) then
			call M_UnitSetStun(firstUnit, dur, herodur, ignoreMagicImmunes)
			call DamageUnit(whichUnit, firstUnit, damageType, damage)
		endif
		call GroupRemoveUnit(targetGroup, firstUnit)
	endloop
	call DestroyEffect(AddSpecialEffect(effectPath, unitX, unitY))
	//地形就不变化了,因为这可能会很卡
	set firstUnit = null
	call LogoutGroup(targetGroup)
	set targetGroup = null
endfunction
