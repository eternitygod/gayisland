
globals
	player P2 = null
endglobals


// 获取是否拥有法术护盾
function HaveSpellShield takes unit u returns boolean
	return false
endfunction

//filter 条件

// 敌对 非建筑
// 大部分物理攻击特效的筛选
function CommonAttackEffectFilter takes unit whichUnit, unit targetUnit returns boolean
	return IsUnitEnemy(whichUnit, GetOwningPlayer(targetUnit)) and not IsUnitType(targetUnit, UNIT_TYPE_STRUCTURE)
endfunction

// 联盟 存活 非建筑
function Ally_Alive_NoStructure takes unit u returns boolean
	return IsUnitAlly(u, P2) and UnitAlive(u) and not IsUnitType(u, UNIT_TYPE_STRUCTURE)
endfunction

// 联盟 存活 非建筑
function Ally_Alive_NoStructure_IsHero takes unit u returns boolean
	return IsUnitAlly(u, P2) and UnitAlive(u) and not IsUnitType(u, UNIT_TYPE_STRUCTURE) and IsUnitType(u, UNIT_TYPE_HERO)
endfunction

// 联盟 存活
function Ally_Alive takes unit u returns boolean
	return IsUnitAlly(u, P2) and UnitAlive(u)
endfunction
	
// 敌对 存活
function Enemy_Alive takes unit u returns boolean
	return IsUnitEnemy(u, P2) and UnitAlive(u)
endfunction

// 敌对 存活 地面
function Enemy_Alive_NotFly takes unit u returns boolean
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
	return not IsUnitType(u, UNIT_TYPE_MECHANICAL) and Ally_Alive_NoStructure(u)
endfunction
