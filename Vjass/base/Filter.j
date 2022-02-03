
library Filter requires base

	globals
		player P2 = null
		//中转用的变量
		private unit TmpUnit2 = null
	
		private integer Tmp_DummyAmount = 0
	endglobals

	// 获取是否拥有法术护盾
	function HaveSpellShield takes unit u returns boolean
		return false
	endfunction

	// filter 条件
	// 检查玩家对单位的可见性
	function UnitVisibleToPlayer takes unit whichUnit, player whichPlayer returns boolean //GetUnitAbilityLevel(u,'A1HX')== 0
		return IsUnitVisible(whichUnit, whichPlayer) or ( IsUnitAlly(whichUnit, whichPlayer) )
	endfunction

	// 敌对 非建筑
	// 大部分物理攻击特效的筛选
	function CommonAttackEffectFilter takes unit whichUnit, unit targetUnit returns boolean
		return IsUnitEnemy(whichUnit, GetOwningPlayer(targetUnit)) and not IsUnitType(targetUnit, UNIT_TYPE_STRUCTURE)
	endfunction

	// 联盟 存活 非建筑
	function IsAllyAliveNoStructure takes unit u returns boolean
		return IsUnitAlly(u, P2) and UnitAlive(u) and not IsUnitType(u, UNIT_TYPE_STRUCTURE)
	endfunction

	// 联盟 存活 非建筑
	function IsAllyAliveNoStructureIsHero takes unit u returns boolean
		return IsUnitAlly(u, P2) and UnitAlive(u) and not IsUnitType(u, UNIT_TYPE_STRUCTURE) and IsUnitType(u, UNIT_TYPE_HERO)
	endfunction

	// 联盟 存活
	function IsAllyAlive takes unit u returns boolean
		return IsUnitAlly(u, P2) and UnitAlive(u)
	endfunction
	
	// 敌对 存活
	function IsEnemyAlive takes unit u returns boolean
		return IsUnitEnemy(u, P2) and UnitAlive(u)
	endfunction

	// 敌对 存活 地面
	function IsEnemyAliveNotFly takes unit u returns boolean
		return IsUnitEnemy(u, P2) and UnitAlive(u) and not IsUnitType(u, UNIT_TYPE_FLYING)
	endfunction


	// 敌对 存活 非建筑
	function IsEnemyAliveNoStructure takes unit u returns boolean
		return IsUnitEnemy(u, P2) and UnitAlive(u) and not IsUnitType(u, UNIT_TYPE_STRUCTURE)
	endfunction
	
	// 敌对 存活 非建筑 非魔免
	function IsEnemyAliveNoStructureNoImmune takes unit u returns boolean
		return IsUnitEnemy(u, P2) and UnitAlive(u) and not IsUnitType(u, UNIT_TYPE_STRUCTURE) and not IsUnitType(u, UNIT_TYPE_MAGIC_IMMUNE)
	endfunction

	// 存活 非建筑
	function Alive_NoStructure takes unit u returns boolean
		return UnitAlive(u) and not IsUnitType(u, UNIT_TYPE_STRUCTURE)
	endfunction

	// 非空军 非机械 存活 非建筑 敌军
	function IsGroundNotMechanicalEnemyAliveNoStructure takes unit u returns boolean
		return not IsUnitType(u, UNIT_TYPE_FLYING) and not IsUnitType(u, UNIT_TYPE_MECHANICAL) and IsUnitEnemy(u, P2) and UnitAlive(u) and not IsUnitType(u, UNIT_TYPE_STRUCTURE)
	endfunction

	// 非机械 存活 非建筑 友军
	function IsMechanicalAllyAliveNoStructure takes unit u returns boolean
		return not IsUnitType(u, UNIT_TYPE_MECHANICAL) and IsUnitAlly(u, P2) and UnitAlive(u) and not IsUnitType(u, UNIT_TYPE_STRUCTURE)
	endfunction

	//========================================================
	// 从单位组以某个条件获取单位
	//========================================================

	globals
		//Dummy 马甲
		rect RectDummy = Rect(0, 0, 0, 0)
		//获取最近的可破坏物
		destructable Tmp_Destructable = null
		real Tmp_NearestDestructableDistance = 0.
		real Tmp_GetNearestDestructableUnitX = 0.
		real Tmp_GetNearestDestructableUnitY = 0.
	endglobals

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


	
	function KillDestructablesInCircle_Actions takes nothing returns nothing
		if GetDestructableLife(GetEnumDestructable()) > 0.00 then
			call KillDestructable(GetEnumDestructable())
		endif
	endfunction
	//用一个中心区域来当马甲
	//摧毁范围内的可破坏物
	function KillDestructablesInCircle takes real x, real y, real d returns nothing
		call SetRect(RectDummy, x - d, y - d, x + d, y + d)
		call EnumDestructablesInRect(RectDummy, null, function KillDestructablesInCircle_Actions)
	endfunction

	function GetDestructablesAmountInCircle_Actions takes nothing returns nothing
		if GetDestructableLife(GetEnumDestructable()) > 0.00 then
			set Tmp_DummyAmount = Tmp_DummyAmount + 1
		endif
	endfunction

	function GetDestructablesAmountInCircle takes real x, real y, real d returns integer
		call SetRect(RectDummy, x - d, y - d, x + d, y + d)
		set Tmp_DummyAmount = 0
		call EnumDestructablesInRect(RectDummy, null, function GetDestructablesAmountInCircle_Actions)
		return Tmp_DummyAmount
	endfunction

	function FindNearestDestructable takes nothing returns nothing
		local destructable enumDestructable = GetEnumDestructable()
		local real x = GetWidgetX(enumDestructable)
		local real y = GetWidgetY(enumDestructable)
		local real dis = GetDistanceBetween(Tmp_GetNearestDestructableUnitX, Tmp_GetNearestDestructableUnitY, x, y)
	
		if dis > Tmp_NearestDestructableDistance then
			set Tmp_NearestDestructableDistance = dis
			set Tmp_Destructable = enumDestructable
		endif

		set Tmp_Destructable = enumDestructable
		set enumDestructable = null
	endfunction

	// 获取单位范围内的最近可破坏物
	function GetNearestDestructable takes unit whichUnit, real radius returns destructable
		local real x = GetUnitX(whichUnit)
		local real y = GetUnitY(whichUnit)
		set Tmp_GetNearestDestructableUnitX = x
		set Tmp_GetNearestDestructableUnitY = y
		call SetRect(RectDummy, x - radius, y - radius, x + radius, y + radius)
		set Tmp_Destructable = null
		set Tmp_NearestDestructableDistance = 0.
		call EnumDestructablesInRect(RectDummy, null, function FindNearestDestructable)
		return Tmp_Destructable
	endfunction

endlibrary

