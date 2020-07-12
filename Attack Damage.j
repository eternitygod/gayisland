globals
	
	trigger AttackDamageTrigger
	
endglobals



function inspire takes unit u, unit du, real Damage returns nothing
	local integer isid
	local integer Ilv
	set Ilv = GetUnitAbilityLevel(LC,'Alc2')
	set isid = 2 + Ilv * 6
	call R8D(du,u,1,isid)
	call FT("+"+I2S(isid),1,du,.022,100,$C8,$FF,$FF,-42)
endfunction

function CriticalStrikeAura takes unit u, unit du, real Damage returns nothing
	local integer AbLv
	local integer RandomInt
	local integer Probability
	local integer FinalDamage
	local real times
	local integer DT = 5
	set RandomInt = GetRandomInt( 0, 100 )
	set Probability = 15
	if RandomInt <= Probability then
		set AbLv = GetUnitAbilityLevel( LC, 'Alc3')
		set times = 1.10 + 0.10 * AbLv
		set FinalDamage = R2I( Damage * times)
		call R8D( du, u, 5, FinalDamage)
		call FT( I2S( FinalDamage)+"!",DT, du, .025, $FF, 0, 0, $FF, 64)
		if test then
			call TestTipsDamage(du,u,'Alc3',FinalDamage*1.0,DT)
		endif
	endif
endfunction

function OgreMagiPunch takes unit u, unit du, real Damage returns nothing
	local trigger t
	local integer h
	local integer Lv = GetUnitAbilityLevel(du, 'AHbh')
	local real times = 2.00 + 0.50 * Lv
	local integer DT = 2
	set t = CreateTrigger()
	set h = GetHandleId(t)
	call FT(I2S(R2I(Damage * times)) +"!",3,du,.025,$FF, 0, 0, $FF, 26)
	//call SetUnitAnimation( du, "Attack Slam" )
	//set u = GetTriggerUnit()
	call R8D( du, u, DT,  Damage * times )
	if test then
		call TestTipsDamage(du,u,'AomE',Damage * times,DT)
	endif
	call UnitRemoveAbility(du,'AHbh')
	//call SetUnitUserData(u,101)
	call UnitAddAbility(u,'Amrf')
	call UnitRemoveAbility(u,'Amrf')
	call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\FrostBolt\\FrostBoltMissile.mdl",u,"overhead"))
	call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\FrostBolt\\FrostBoltMissile.mdl",u,"head"))
	call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\FrostBolt\\FrostBoltMissile.mdl",u,"left,hand"))
	call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\FrostBolt\\FrostBoltMissile.mdl",u,"right,hand"))
	call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\FrostBolt\\FrostBoltMissile.mdl",u,"chest"))
	call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\FrostBolt\\FrostBoltMissile.mdl",u,"origin"))
	call TriggerRegisterTimerEvent(t,0.01,true)
	call TriggerAddCondition(t,Condition(function PunchFly))
	call SaveUnitHandle(HY,h,0,u)
	call SaveEffectHandle(HY,h,2,AddSpecialEffectTarget("war3mapImported\\WalrusPunchWeaponFX.mdx",du,"weapon"))
	set t = null
	
endfunction

function StormSpiritOverloadGroupDamage takes nothing returns nothing
	local integer DT = 1
	local integer D = GetUnitAbilityLevel(Storm,'ASt3')*20+$A
	local unit u = CreateUnit(GetOwningPlayer(Storm),'ndum',GetUnitX(GetEnumUnit()),GetUnitY(GetEnumUnit()),GetUnitFacing(GetEnumUnit()))
	call UnitAddAbility(u,'ACsw')
	call IssueTargetOrder( u, "slow", GetEnumUnit() )
	call R8D(Storm,GetEnumUnit(),DT,D)
	if test then
		call TestTipsDamage(Storm,GetEnumUnit(),'ASt3',D,DT)
		call TestTipsBuff(Storm,GetEnumUnit(),'ASt3')
	endif
	//call CCX(GetEnumUnit(),'A335',1,.6,'B08B')
	//call RemoveUnit(u)
	set u = null
endfunction

function StormSpiritOverloadDamage takes unit u, unit du returns nothing
	local integer h = GetHandleId(du)
	local group g
	local boolexpr b
	set g = CreateGroup()
	call DestroyEffect(LoadEffectHandle(HY,h,$C8))
	call DestroyEffect(LoadEffectHandle(HY,h,$C9))
	call SaveInteger(HY,GetHandleId(du),'ASt3',2)
	//set U2=WUE
	//set HTV=WUE
	//set HUV=GetUnitAbilityLevel(WUE,'ASt3')*20+$A
	set b = Condition(function GeneralUnitselection)
	call GroupEnumUnitsInRange( g,GetUnitX( u) ,GetUnitY( u ),300,b)
	call ForGroup(g,function StormSpiritOverloadGroupDamage)
	call DestroyGroup(g)
	call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl",GetUnitX(u),GetUnitY(u)))
	set g = null
	set b = null
endfunction

function AttackDamageTriggerActions takes nothing returns nothing
	//	local trigger t
	local integer h
	local unit u = GetTriggerUnit()
	local unit du = GetEventDamageSource()
	local player p = GetOwningPlayer(u)
	local real Damage = GetEventDamage()
	local integer Lv
	if Damage > 1 then
		if GetUnitAbilityLevel(u,'Bpoi') > 0 then 
			if test then
				call TestTipsDamage(du,u,'Aven',Damage,2)
			endif
			call UnitRemoveAbility(u,'Bpoi')
			if IPA(p) then //是否敌军
				if(GetUnitAbilityLevel( du, 'AHbh') > 0) then // 菊花神拳
					call OgreMagiPunch( u, du, Damage)
				endif
				if(GetUnitAbilityLevel( du, 'Blc3') > 0) then // 暴击光环
					call CriticalStrikeAura( u, du, Damage)
				endif
				if(GetUnitAbilityLevel( du, 'Bisi') > 0) then // 鼓舞
					call inspire( u, du, Damage)
				endif
				if LoadInteger(HY,GetHandleId( du),'ASt3') == 1  then //超负荷
					call StormSpiritOverloadDamage( u, du)
				endif
			endif
		endif 
	endif
	//set t = null
	set u = null
	set du = null
	set p = null
	
endfunction




function AttackDamageTriggerrestart takes nothing returns nothing
	local timer t = GetExpiredTimer()
	call ExecuteFunc("CteateAttackDamageTrigger")
	call DestroyTrigger( AttackDamageTrigger)
	call DestroyTimer( t)
	call BJDebugMsg("伤害事件重置")
	set t = null
endfunction

function CteateAttackDamageTrigger takes nothing returns nothing
	local timer tt = CreateTimer()
	set AttackDamageTrigger = null
	set AttackDamageTrigger = CreateTrigger()
	call YDWESyStemAnyUnitDamagedRegistTrigger(AttackDamageTrigger)
	call TriggerAddAction(AttackDamageTrigger, function AttackDamageTriggerActions)
	call TimerStart(tt,600.00,false,function AttackDamageTriggerrestart)
	set tt = null
endfunction

