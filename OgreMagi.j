//
function OMIsuit takes nothing returns nothing
	if(GetUnitTypeId(GetManipulatingUnit()) == 'Oomg') then
		//call DzSetUnitID( GetManipulatingUnit(), 'OEle' )
		if GetUnitAbilityLevel(GetManipulatingUnit(),'Acap') > 0 then
			call YDWEUnitTransform( GetManipulatingUnit(), 'AEme', 'OEle' )
			call UnitAddAbility(OM,'Acap')
		else
			call YDWEUnitTransform( GetManipulatingUnit(), 'AEme', 'OEle' )
		endif
		call SetCinematicScene(GetUnitTypeId(OM), ConvertPlayerColor($C), GetUnitName(OM), "我感受到了熟悉的魔法气息。", 5.00, 0.00)
		call RemoveItem(GetManipulatedItem())
		//call StartSound( gg_snd_JuHuaXiao )
	elseif OM != null then
		if GetUnitTypeId(OM) != 'OEle' then
			call SetCinematicScene(GetUnitTypeId(OM), ConvertPlayerColor($C), GetUnitName(OM), "惹，这是我的工具箱，快把他给我！", 5.00, 0.00)
		endif
	endif
endfunction

function OMIcap takes nothing returns nothing
	if(GetUnitTypeId(GetManipulatingUnit()) == 'Oomg') or (GetUnitTypeId(GetManipulatingUnit()) == 'OEle') then
		//call DzSetUnitID( GetManipulatingUnit(), 'OEle' )
		call SetCinematicScene(GetUnitTypeId(OM), ConvertPlayerColor($C), GetUnitName(OM), "爷的披风，哈哈哈。", 5.00, 0.00)
		call RemoveItem(GetManipulatedItem())
		call UnitAddAbility(OM,'Acap')
		call StartSound( gg_snd_JuHuaXiao )
	elseif OM != null then
		if GetUnitTypeId(GetManipulatingUnit()) != 'OEle' then
			call SetCinematicScene(GetUnitTypeId(OM), ConvertPlayerColor($C), GetUnitName(OM), "惹狗，我的工作披风，怎么会在这里，他是我的！", 5.00, 0.00)
		endif
	endif
endfunction

function OMQ takes nothing returns nothing
	local unit u = GetTriggerUnit()
	local unit du = GetSpellTargetUnit()
	local integer Lvq = GetUnitAbilityLevel(u,'AomQ') //火焰爆轰
	local integer Lvr = GetUnitAbilityLevel(u,'AomR')
	local integer CI = GetUnitAbilityLevel(du,'BStf')
	local real r
	local integer i
	local integer Lvw = GetUnitAbilityLevel(OM,'AomW') //嗜血等级
	local integer LvB = GetUnitAbilityLevel(u,'BomW') //嗜血buff
	local integer D
	if GetUnitAbilityLevel(u,'Aloc') > 0 then
		set LvB = 1
		set u = OM
	endif
	set r = 50 + 40 * Lvq
	if Lvw > 0 and LvB == 1 then
		set D = 10 + 5 * Lvw
		set r = r + D
	endif
	if CI > 0 and Lvq > 0 then
		set i = R2I(r)
		//call FT(I2S(i)+"!",5,u,.025,$FF,0,0,$FF)
		set r = r * 1.50
		call R8D(u,du,1,r)
		if LvB > 0 then
			call FT("+"+I2S(D*2),5,du,.022,255,97,0,$FF,11)
		endif
	else
		set i = R2I(r)
		call R8D(u,du,1,i)
		if LvB > 0 then
			call FT("+"+I2S(D),5,du,.022,255,97,0,$FF,11)
		endif
	endif
	call GDS(R2S(r))
	set u = null
	set du = null
endfunction

function OMReT takes nothing returns nothing
	local timer t  = GetExpiredTimer()
	local integer h = GetHandleId(t)
	local unit u = LoadUnitHandle(HY,h,0)
	local integer CLv = GetUnitAbilityLevel(u,'AomC') //得到暴击等级
	local integer ELv = GetUnitAbilityLevel(u,'AomR') //多重施法等级
	if CLv == 0 then
		call UnitAddAbility(u,'AomC')
		call SetUnitAbilityLevel(u,'AomC',ELv) //设置暴击等级与多重施法等级挂钩
	endif
	set t = null
	set u = null
endfunction

function OMMCT takes nothing returns nothing
	local timer t = GetExpiredTimer()
	local integer h = GetHandleId(t)
	local unit du = LoadUnitHandle(HY,h,1)
	local unit u = LoadUnitHandle(HY,h,2)
	local unit d 
	local integer uid = LoadInteger(HY,h,21)
	local integer id = LoadInteger(HY,h,22)
	local integer mc = LoadInteger(HY,h,30)
	local integer i = LoadInteger(HY,h,50)
	local real x = LoadReal(HY,h,60)
	local real y = LoadReal(HY,h,61)
	local real japicd = YDWEGetUnitAbilityDataReal(u, id, 1, 101)
	local group g
	local boolexpr b
	if i >= mc == false then
		if japicd ==0 then
			set japicd = 30
		endif
		set d = CreateUnit(GetOwningPlayer(u),'ndum',GetUnitX(u),GetUnitY(u),GetUnitFacing(u))
		call UnitApplyTimedLife( d, 'BHwe', 0.2 ) //japicd + 30
		call ShowUnit( d, false )
		call UnitAddAbility(d,id)
		call SetUnitAbilityLevel(d,id,GetUnitAbilityLevel(u,id))
		call UnitResetCooldown( d )
		if id == 'AomW' then
			if GetUnitAbilityLevel(du,'BomW') > 0 then
				set g = CreateGroup()
				set b = Condition(function BoosG1)
				call GroupEnumUnitsInRange( g ,GetUnitX( du) ,GetUnitY( du ),425,b)
				loop
				exitwhen FirstOfGroup(g) == null
					if GetUnitAbilityLevel(FirstOfGroup(g),'BomW') > 0 then
					call GroupRemoveUnit(g,FirstOfGroup(g))
					else
						set du = FirstOfGroup(g)
						call SaveUnitHandle(HY,h,1,du)
						exitwhen true
					endif
				endloop
				call DestroyBoolExpr(b)
				call DestroyGroup(g)
			endif
			call IssueImmediateOrder( d, OrderId2StringBJ(uid) )
			if GetUnitCurrentOrder(d) != uid then
				call IssueTargetOrder( d,  OrderId2StringBJ(uid), du )
				call IssuePointOrder( d,  OrderId2StringBJ(uid), x, y )
			endif
		endif
	elseif i >= mc then
		call FlushChildHashtable(HY,h)
		call PauseTimer(t)
		call DestroyTimer(t)
	endif
	set i = i + 1
	call SaveInteger(HY,h,50,i)
	set t = null
	set du = null
	set d = null
	set u = null
	set g = null
	set b = null
endfunction

function OMMC takes integer mc , integer id , unit u , unit du ,real x ,real y returns nothing
	local integer uid = GetUnitCurrentOrder(u)
	local timer t = CreateTimer()
	local integer h = GetHandleId(t)
	local integer i = 1
	call SaveUnitHandle(HY,h,1,du)
	call SaveUnitHandle(HY,h,2,u)
	call SaveInteger(HY,h,21,uid)
	call SaveInteger(HY,h,22,id)
	call SaveInteger(HY,h,30,mc)
	call SaveInteger(HY,h,50,i)
	call SaveReal(HY,h,60,x)
	call SaveReal(HY,h,61,y)
	call TimerStart(t,.2,true,function OMMCT)
	if mc > 0 then
		if mc == 2 then
			call FT("|c00FFFF002x 多重施法！！|r",5,u,.03,$FF,0,0,$FF,64)
		elseif mc == 3 then
			call FT("|cffff80003x 多重施法！！！|r",5,u,.03,$FF,0,0,$FF,64)
		elseif mc == 4 then
			call FT("4x 多重施法！！！！",5,u,.03,$FF,0,0,$FF,64)
		elseif mc == 5 then
			call FT("|c00FFFF005x 多重施法！！|r",5,u,.03,255,255,255,$FF,64)
		endif
	endif
	set t = null
endfunction

function OMRX takes nothing returns boolean
	local unit u = GetTriggerUnit()
	local unit du = GetSpellTargetUnit()
	local real x = GetSpellTargetX()
	local real y = GetSpellTargetY()
	local integer id = GetSpellAbilityId()
	local integer Lvr = GetUnitAbilityLevel(u,'AomR')
	local integer m2 = 0
	local integer m3 = 0
	local integer m4 = 0
	local integer Ri = 0
	local integer mc = 0
	if id != 'AomE' then
		if Lvr > 0 then
			if Lvr == 1 then
				set m2 = 50
			endif
			if Lvr == 2 then
				set m2 = 65
				set m3 = 35
			endif
			if Lvr == 3 then
				set m2 = 75
				set m3 = 50
				set m4 = 17
			endif
			set Ri = GetRandomInt(0, 100)
			if(Ri < m4) then
				set mc = 4
			else
				set Ri = GetRandomInt(0, 100)
				if(Ri < m3) then
					set mc = 3
				else
					set Ri = GetRandomInt(0, 100)
					if(Ri < m2) then
						set mc = 2
					endif
				endif 
			endif
			if mc >= 2 then
				call OMMC(mc,id,u,du,x,y)
			endif
		endif
	endif
	set u = null
	set du = null
	return false
endfunction

function OMR takes nothing returns nothing
	local integer Lvr = GetLearnedSkillLevel()
	local trigger t
	local timer OET = CreateTimer()
	local integer Lv = GetLearnedSkillLevel() //得到多重等级
	local integer eTh = GetHandleId(OET)
	if Lvr == 1 then
		set t = CreateTrigger()
		call BJRT(t,EVENT_PLAYER_UNIT_SPELL_EFFECT)
		call TriggerAddCondition(t,Condition(function OMRX))
	endif
	if Lv == 1 then
		call SaveUnitHandle(HY,eTh,0,OM)
		call TimerStart(OET,5.00,true,function OMReT)
	endif
	set OET = null
	set t = null
endfunction

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
		call SetUnitUserData(u,100)
		//call DisplayTextToPlayer( Player(0), 0, 0, I2S(GetUnitUserData(u)) )
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
	local unit du = GetEventDamageSource()
	local player p = GetOwningPlayer(u)
	local integer Lv
	local integer D
	if(YDWEIsEventPhysicalDamage() == true) then 
		if IPA(p) then //是否敌军
			if(GetUnitAbilityLevel(GetEventDamageSource(), 'AomC') > 0) then//神拳伤害
				set t = CreateTrigger()
				set h = GetHandleId(t)
				//set u = GetTriggerUnit()
				call UnitRemoveAbility(du,'AomC')
				call SetUnitUserData(u,101)
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
			if GetUnitAbilityLevel(du,'BomW') > 0 and GetUnitAbilityLevel(OM,'AomW') > 0 then //嗜血附加伤害
				set Lv = GetUnitAbilityLevel(OM,'AomW')
				set D = 10 + 5 * Lv
				call R8D(du,u,2,D)
				call FT("+"+I2S(D),5,du,.022,255,97,0,$FF,11)
			endif 
		endif
	endif
	set t = null
	set u = null
	set du = null
endfunction

function OgreMagiAG takes nothing returns nothing
	local timer t = GetExpiredTimer()
	call ExecuteFunc("OgreMagi")
	call DestroyTrigger(AudtOM)
	call DestroyTimer(t)
	set t = null
endfunction

function OgreMagi takes nothing returns nothing
	local timer tt = CreateTimer()
	set AudtOM = null
	set AudtOM = CreateTrigger()
	call YDWESyStemAnyUnitDamagedRegistTrigger(AudtOM)
	call TriggerAddAction(AudtOM, function OME)
	call TimerStart(tt,600.00,false,function OgreMagiAG)
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
