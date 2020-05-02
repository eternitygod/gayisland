function OMET takes nothing returns boolean
	local trigger t = GetTriggeringTrigger()
	local unit u
	local integer h = GetHandleId(t)
	local integer TEC = GetTriggerEvalCount(t)
	set u = LoadUnitHandle(HY,h,0)
	if TEC<50 then
		call SetUnitFlyHeight(u,700*TEC/ 50 , 0)
	elseif TEC<100 then
		call SetUnitFlyHeight(u,700-700*(TEC-50)/ 50 , 0)
	else
		//call GDS("结束神拳")
		call DestroyEffect(LoadEffectHandle(HY,h,2))
		call FlushChildHashtable(HY,h)
		call DisableTrigger(t)
		call DestroyTrigger(t)
	endif
	set t = null
	set u = null
	return false
endfunction

function EEEE takes nothing returns nothing
	call DoNothing()
endfunction

function OME takes nothing returns nothing
	local trigger t
	local integer h
	local unit u = GetTriggerUnit()
	local unit du
	local player p = GetOwningPlayer(u)
	if (((YDWEIsEventAttackDamage() == true) and (GetUnitAbilityLevel(GetEventDamageSource(), 'AomC') > 0))) and IPA(p) then
		set t = CreateTrigger()
		set h = GetHandleId(t)
		//set u = GetTriggerUnit()
		set du = GetEventDamageSource()
		call UnitRemoveAbility(du,'AomC')
		call UnitAddAbility(u,'Amrf')
		call UnitRemoveAbility(u,'Amrf')
		call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\FrostBolt\\FrostBoltMissile.mdl",u,"overhead"))
		call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\FrostBolt\\FrostBoltMissile.mdl",u,"head"))
		call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\FrostBolt\\FrostBoltMissile.mdl",u,"left,hand"))
		call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\FrostBolt\\FrostBoltMissile.mdl",u,"right,hand"))
		call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\FrostBolt\\FrostBoltMissile.mdl",u,"chest"))
		call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\FrostBolt\\FrostBoltMissile.mdl",u,"origin"))
		call TriggerRegisterTimerEvent(t,0.01,true)
		call TriggerAddCondition(t,Condition(function OMET))
		call SaveUnitHandle(HY,h,0,u)
		call SaveEffectHandle(HY,h,2,AddSpecialEffectTarget("war3mapImported\\WalrusPunchWeaponFX.mdx",du,"weapon"))
	endif
	set t = null
	set u = null
	set du = null
endfunction

function OgreMagiAG takes nothing returns nothing
	local timer t = GetExpiredTimer()
	//local integer h = GetHandleId(t)
	//local trigger tt = LoadTriggerHandle(HY,h,1)
	call GDS("清除事件")
	call ExecuteFunc("OgreMagi")
	//call FlushChildHashtable(HY,h)
	call DisableTrigger(AudtOM)
	call DestroyTrigger(AudtOM)
	call DestroyTimer(t)
	set t = null
	//set tt = null
	
endfunction

function OgreMagi takes nothing returns nothing
	//local trigger t = CreateTrigger()
	local timer tt = CreateTimer()
	//local integer th = GetHandleId(t)
    //local integer tth = GetHandleId(tt)
    set AudtOM = null
	set AudtOM = CreateTrigger()
	call YDWESyStemAnyUnitDamagedRegistTrigger(AudtOM)
	call TriggerAddAction(AudtOM, function OME)
	//call SaveTriggerHandle(HY,tth,1,t)
	call TimerStart(tt,600.00,false,function OgreMagiAG)
	call GDS("注册事件")
	//set t = null
	set tt = null
endfunction

function SEOME takes nothing returns nothing
	local unit u = GetTriggerUnit()
	local integer Lv = GetUnitAbilityLevel(u,'AomE')
	if GetUnitAbilityLevel(u,'AomC') == 0 then
		 call UnitAddAbility(u,'AomC')
		 call SetUnitAbilityLevel(u,'AomC',Lv)
	endif
	set u = null
endfunction
