
library Filter requires base

	globals
		player P2 = null
	endglobals

	// 获取是否拥有法术护盾
	function HaveSpellShield takes unit u returns boolean
		return false
	endfunction

	//filter 条件
	//检查玩家对单位的可见性
	function UnitVisibleToPlayer takes unit whichUnit, player whichPlayer returns boolean //GetUnitAbilityLevel(u,'A1HX')== 0
		return IsUnitVisible(whichUnit, whichPlayer) or ( IsUnitAlly(whichUnit, whichPlayer) )
	endfunction

	// 敌对 非建筑
	// 大部分物理攻击特效的筛选
	function CommonAttackEffectFilter takes unit whichUnit, unit targetUnit returns boolean
		return IsUnitEnemy(whichUnit, GetOwningPlayer(targetUnit)) and not IsUnitType(targetUnit, UNIT_TYPE_STRUCTURE)
	endfunction

	// 联盟 存活 非建筑
	function AllyAliveNoStructure takes unit u returns boolean
		return IsUnitAlly(u, P2) and UnitAlive(u) and not IsUnitType(u, UNIT_TYPE_STRUCTURE)
	endfunction

	// 联盟 存活 非建筑
	function AllyAliveNoStructureIsHero takes unit u returns boolean
		return IsUnitAlly(u, P2) and UnitAlive(u) and not IsUnitType(u, UNIT_TYPE_STRUCTURE) and IsUnitType(u, UNIT_TYPE_HERO)
	endfunction

	// 联盟 存活
	function AllyAlive takes unit u returns boolean
		return IsUnitAlly(u, P2) and UnitAlive(u)
	endfunction
	
	// 敌对 存活
	function EnemyAlive takes unit u returns boolean
		return IsUnitEnemy(u, P2) and UnitAlive(u)
	endfunction

	// 敌对 存活 地面
	function EnemyAliveNotFly takes unit u returns boolean
		return IsUnitEnemy(u, P2) and UnitAlive(u) and not IsUnitType(u, UNIT_TYPE_FLYING)
	endfunction


	// 敌对 存活 非建筑
	function Enemy_Alive_NoStructure takes unit u returns boolean
		return IsUnitEnemy(u, P2) and UnitAlive(u) and not IsUnitType(u, UNIT_TYPE_STRUCTURE)
	endfunction
	
	// 敌对 存活 非建筑 非魔免
	function Enemy_Alive_NoStructure_NoImmune takes unit u returns boolean
		return Enemy_Alive_NoStructure(u) and not IsUnitType(u, UNIT_TYPE_MAGIC_IMMUNE)
	endfunction

	// 存活 非建筑
	function Alive_NoStructure takes unit u returns boolean
		return UnitAlive(u) and not IsUnitType(u, UNIT_TYPE_STRUCTURE)
	endfunction

	// 非空军 非机械 存活 非建筑 敌军
	function IsGround_NotMechanical_Enemy_Alive_NoStructure takes unit u returns boolean
		return not IsUnitType(u, UNIT_TYPE_FLYING) and not IsUnitType(u, UNIT_TYPE_MECHANICAL) and Enemy_Alive_NoStructure(u)
	endfunction

	// 非机械 存活 非建筑 友军
	function IsMechanical_Ally_Alive_NoStructure takes unit u returns boolean
		return not IsUnitType(u, UNIT_TYPE_MECHANICAL) and AllyAliveNoStructure(u)
	endfunction

	//========================================================
	// 从单位组以某个条件获取单位
	//========================================================

	// Nearest Farthest
	// 得到单位组距离xy最远的单位
	function GetFarthestUnitByGroup takes group whichGroup, real x, real y returns unit
		local group dummyGroup = LoginGroup()
		local real rFarthestDistance = 0
		local unit dummyUnit
		local unit farthestUnit = null
		local real rDistance = .0
		call GroupAddGroup(whichGroup, dummyGroup)
		loop
			set dummyUnit = FirstOfGroup(dummyGroup)
			exitwhen dummyUnit == null
			set rDistance = GetDistanceBetween(GetUnitX(dummyUnit), GetUnitY(dummyUnit), x, y)
			if rDistance > rFarthestDistance then
				set farthestUnit = dummyUnit
				set rFarthestDistance = rDistance
			endif
			call GroupRemoveUnit(dummyGroup, dummyUnit)
		endloop
		set TmpUnit2 = farthestUnit
		call LogoutGroup(dummyGroup)
		set dummyUnit = null
		set farthestUnit = null
		set dummyGroup = null
		return TmpUnit2
	endfunction

	// 得到单位组距离xy最近的单位
	function GetNearestUnitByGroup takes group whichGroup, real x, real y returns unit
		local group dummyGroup = LoginGroup()
		local real rNearestDistance = 99999
		local unit dummyUnit
		local unit neareststUnit = null
		local real rDistance = 0.
		call GroupAddGroup(whichGroup, dummyGroup)
		loop
			set dummyUnit = FirstOfGroup(dummyGroup)
			exitwhen dummyUnit == null
			set rDistance = GetDistanceBetween(GetUnitX(dummyUnit), GetUnitY(dummyUnit), x, y)
			if rDistance < rNearestDistance then
				set neareststUnit = dummyUnit
				set rNearestDistance = rDistance
			endif
			call GroupRemoveUnit(dummyGroup, dummyUnit)
		endloop
		set TmpUnit2 = neareststUnit
		call LogoutGroup(dummyGroup)
		set dummyUnit = null
		set neareststUnit = null
		set dummyGroup = null
		return TmpUnit2
	endfunction

	// 得到单位组中生命值百分比最小的单位
	function GetMinPercentLifeUnitByGroup takes group whichGroup returns unit
		local group dummyGroup = LoginGroup()
		local real rMinPercentLife = 101
		local unit dummyUnit
		local unit minPercentLifeUnit = null
		local real rPercentLife = 0.
		call GroupAddGroup(whichGroup, dummyGroup)
		loop
			set dummyUnit = FirstOfGroup(dummyGroup)
			exitwhen dummyUnit == null
			set rPercentLife = GetUnitStatePercent(dummyUnit, UNIT_STATE_LIFE, UNIT_STATE_MAX_LIFE)
			if rPercentLife < rMinPercentLife then
				set minPercentLifeUnit = dummyUnit
				set rMinPercentLife = rPercentLife
			endif
			call GroupRemoveUnit(dummyGroup, dummyUnit)
		endloop
		call LogoutGroup(dummyGroup)
		set dummyGroup = null
		set dummyUnit = null
		set TmpUnit2 = minPercentLifeUnit
		set minPercentLifeUnit = null
		return TmpUnit2
	endfunction

	// 得到单位组中生命值最小的单位
	function GetMinLifeUnitByGroup takes group whichGroup returns unit
		local group dummyGroup = LoginGroup()
		local real rMinLife = 999999
		local unit dummyUnit
		local unit minLifeUnit = null
		local real rLife = 0.
		call GroupAddGroup(whichGroup, dummyGroup)
		loop
			set dummyUnit = FirstOfGroup(dummyGroup)
			exitwhen dummyUnit == null
			set rLife = GetWidgetLife(dummyUnit)
			if rLife < rMinLife then
				set minLifeUnit = dummyUnit
				set rMinLife = rLife
			endif
			call GroupRemoveUnit(dummyGroup, dummyUnit)
		endloop
		call LogoutGroup(dummyGroup)
		set dummyGroup = null
		set dummyUnit = null
		set TmpUnit2 = minLifeUnit
		set minLifeUnit = null
		return TmpUnit2
	endfunction

endlibrary