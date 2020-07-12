globals
	trigger SplashDamageTrigger = CreateTrigger()
	integer DamageTarget = 2
	integer SmallRange = 125
	integer MediumRange = 195
	integer FullRange = 325
	real SmallDamage = 0.75
	real MediumDamage = 0.5
	real FullDamage = 0.25
endglobals

//伤害
function DamageTarget8 takes unit du,unit u,integer DT,real D returns nothing
	if DT==0 or D<0 then
		return
	endif
	if DT==1 then   //法术,火焰伤害
		call UnitDamageTarget(du,u,D,true,true,ATTACK_TYPE_NORMAL,DAMAGE_TYPE_FIRE,WEAPON_TYPE_WHOKNOWS)
	elseif DT==2 then //英雄,普通伤害
		call UnitDamageTarget(du,u,D,true,true,ATTACK_TYPE_HERO,DAMAGE_TYPE_NORMAL,WEAPON_TYPE_WHOKNOWS)
	elseif DT==3 then //英雄,魔法伤害
		call UnitDamageTarget(du,u,D,true,true,ATTACK_TYPE_HERO,DAMAGE_TYPE_MAGIC,WEAPON_TYPE_WHOKNOWS)
	elseif DT==4 then //穿刺，普通伤害
		call UnitDamageTarget(du,u,D,true,true,ATTACK_TYPE_PIERCE,DAMAGE_TYPE_NORMAL,WEAPON_TYPE_WHOKNOWS)
	elseif DT==5 then //法术，普通伤害
		call UnitDamageTarget(du,u,D,true,true,ATTACK_TYPE_NORMAL,DAMAGE_TYPE_NORMAL,WEAPON_TYPE_WHOKNOWS)
	elseif DT==6 then //英雄，通用伤害
		call UnitDamageTarget(du,u,D,true,true,ATTACK_TYPE_HERO,DAMAGE_TYPE_UNIVERSAL,WEAPON_TYPE_WHOKNOWS)
	elseif DT==7 then //英雄，加强伤害
		call UnitDamageTarget(du,u,D,true,true,ATTACK_TYPE_HERO,DAMAGE_TYPE_ENHANCED,WEAPON_TYPE_WHOKNOWS)
	elseif DT==8 then //法术，通用伤害
		call UnitDamageTarget(du,u,D,true,true,ATTACK_TYPE_NORMAL,DAMAGE_TYPE_UNIVERSAL,WEAPON_TYPE_WHOKNOWS)
	endif
endfunction

function SplashDamageGroup takes nothing returns boolean
	return ((GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0.00) == true) and (IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(GetTriggerUnit())) != true)
endfunction

function SmallRangeSplashDamage takes nothing returns nothing
	
	call DamageTarget8( GetEventDamageSource(), GetEnumUnit(), DamageTarget, GetEventDamage()* SmallDamage)
	
endfunction

function MediumRangeSplashDamage takes nothing returns nothing
	
	call DamageTarget8( GetEventDamageSource(), GetEnumUnit(), DamageTarget, GetEventDamage()* MediumDamage)
	
endfunction

function FullRangeSplashDamage takes nothing returns nothing
	
	call DamageTarget8( GetEventDamageSource(), GetEnumUnit(), DamageTarget, GetEventDamage()* FullDamage)
	
endfunction

function SplashDamage takes nothing returns nothing
	local integer h
	local unit u = GetTriggerUnit()
	local unit du = GetEventDamageSource()
	local player p = GetOwningPlayer(u)
	local real Damage = GetEventDamage()
	local group g1
	local group g2
	local group g3
	
	local boolexpr b
	if Damage > 1 then
		if GetUnitAbilityLevel(u,'Bpoi') > 0 then 
			if 
			call UnitRemoveAbility(u,'Bpoi')
			//call BJDebugMsg("伤害")
			//call BJDebugMsg(R2S(GetEventDamage()* SmallDamage))
			//call BJDebugMsg(R2S(GetEventDamage()* MediumDamage))
			//call BJDebugMsg(R2S(GetEventDamage()* FullDamage))

			//if GetUnitAbilityLevel( du, 'AHbh') > 0 then
			set g1 = CreateGroup()
			set g2 = CreateGroup()
			set g3 = CreateGroup()
			set b = Condition(function SplashDamageGroup)
			
			call GroupEnumUnitsInRange( g1,GetUnitX( u ) ,GetUnitY( u ),SmallRange,b)
			call GroupEnumUnitsInRange( g2,GetUnitX( u ) ,GetUnitY( u ),MediumRange,b)
			call GroupEnumUnitsInRange( g3,GetUnitX( u ) ,GetUnitY( u ),FullRange,b)
			call GroupRemoveGroup(g1,g3)
			call GroupRemoveGroup(g1,g2)
			call GroupRemoveGroup(g2,g3)
			call GroupRemoveUnit(g1,u)
			call ForGroup(g1,function SmallRangeSplashDamage)
			call ForGroup(g2,function MediumRangeSplashDamage)
			call ForGroup(g3,function FullRangeSplashDamage)
			
			call DestroyGroup(g1)
			call DestroyGroup(g2)
			call DestroyGroup(g3)
			//endif
		endif 
	endif
	set u = null
	set du = null
	set p = null
	set g1 = null
	set g2 = null
	set g3 = null
	set b = null
endfunction

function SplashDamageStart takes nothing returns nothing
	//call YDWESyStemAnyUnitDamagedRegistTrigger(SplashDamageTrigger)
	call TriggerRegisterAnyUnitEventBJ( SplashDamageTrigger, EVENT_PLAYER_UNIT_DAMAGED)
	//call TriggerAddCondition(SplashDamageTrigger, Condition(function Trig_DeConditions))
	call TriggerAddAction(SplashDamageTrigger, function SplashDamage)
endfunction