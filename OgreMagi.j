//
globals  //call CreateQuestBJ
	unit OM = null
	unit Sven = null
	unit Doom = null
	unit ChaosKnight = null
endglobals

function StormBoltGroup takes player p,unit u, integer Lv returns nothing
	local boolexpr b = Condition( function GeneralUnitselection )
	local group g = CreateGroup()
	local unit du
	call GroupEnumUnitsInRange(g,GetUnitX(u),GetUnitY(u),255, b)
	call DestroyBoolExpr(b)
	loop
	exitwhen FirstOfGroup(g) == null
		set du = CreateUnit(p,'ndum',GetUnitX(u),GetUnitY(u),0)
		call UnitAddAbility(du,'AHtb')
		call SetUnitAbilityLevel(du,'AHtb',Lv)
		call UnitApplyTimedLife(du, 'BHwe', 0.10)
		call IssueTargetOrderById(du, 852095, FirstOfGroup(g))
		//call R8D()
		call GroupRemoveUnit(g,FirstOfGroup(g))
	endloop
	call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\StormBolt\\StormBoltMissile.mdl",u,"origin"))
	call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\StormBolt\\StormBoltMissile.mdl",u,"origin"))
	set b = null
	set du = null
	set g = null
endfunction

function StormBoltTimer takes nothing returns boolean
	local trigger t = GetTriggeringTrigger()
	local integer h = GetHandleId(t)
	local unit u = LoadUnitHandle(HY,h,0)
	local unit stu = LoadUnitHandle(HY,h,1)
	local unit StormBoltdummy = LoadUnitHandle(HY,h,2)
	local integer Lv = LoadInteger(HY,h,4)
	local player p = LoadPlayerHandle(HY,h,10)
	local real Speed = 35.00
	local real stux = GetUnitX(stu)
	local real stuy = GetUnitY(stu)
	local real x = GetUnitX(StormBoltdummy)
	local real y = GetUnitY(StormBoltdummy)
	local real a = AXY(x,y,stux,stuy)
	local real x2 = x+Speed*Cos(a*bj_DEGTORAD)
	local real y2 = y+Speed*Sin(a*bj_DEGTORAD)
	call SetUnitX(StormBoltdummy,x2)
	call SetUnitY(StormBoltdummy,y2)
	call SetUnitFacing(StormBoltdummy,a)
	if XYDistance(stux,stuy,x2,y2) <= Speed then
		call StormBoltGroup(p,stu,Lv)
		call KillUnit(StormBoltdummy)
		call FlushChildHashtable(HY,h)
		call DestroyTrigger(t)
	endif
	set t = null
	set u = null
	set stu = null
	set StormBoltdummy = null
	set p = null
	return false
endfunction

function StormBolt takes nothing returns nothing
	local unit u = GetTriggerUnit()
	local unit stu = GetSpellTargetUnit()
	local player p = GetOwningPlayer(u)
	local integer Lv = GetUnitAbilityLevel( u,'Svet')
	local trigger t = CreateTrigger()
	local integer h = GetHandleId(t)
	local unit StormBoltdummy = CreateUnit(p,'stob',GetUnitX(u),GetUnitY(u),AXY(GetUnitX(u),GetUnitY(u),GetUnitX(stu),GetUnitY(stu)))
	call SaveUnitHandle(HY,h,0,u)
	call SaveUnitHandle(HY,h,1,stu)
	call SaveUnitHandle(HY,h,2,StormBoltdummy)
	call SaveInteger(HY,h,4,Lv)
	call SavePlayerHandle(HY,h,10,p)
	call TriggerRegisterTimerEvent(t,.035,true)
	call TriggerAddCondition(t,Condition(function StormBoltTimer))
	//call TriggerRegisterUnitEvent(t,WWE,EVENT_UNIT_SPELL_EFFECT)
	set u = null
	set stu = null
	set p = null
	set t = null
endfunction

function StormBoltEffect takes nothing returns nothing
	call DestroyEffect(AddSpecialEffectTarget("Abilities\\Weapons\\Bolt\\BoltImpact.mdl",GetTriggerUnit(),"weapon"))
endfunction

function Warcrytimer takes nothing returns nothing 
	local timer t = GetExpiredTimer()
	local integer h = GetHandleId(t)
	local group g = LoadGroupHandle(HY,h,0)
	local integer Lv = LoadInteger(HY,h,1)
	local integer defense = Lv*5
	loop
	exitwhen FirstOfGroup(g) == null
		call YDWEGeneralBounsSystemUnitSetBonus( FirstOfGroup(g), 2, 1, defense )
		call UnitRemoveAbility(FirstOfGroup(g),'Ways')
		call GroupRemoveUnit(g,FirstOfGroup(g))
	endloop
	call DestroyTimer(t)
	call DestroyGroup(g)
	call FlushChildHashtable(HY,h)
	set t = null
	set g = null
endfunction

function Warcrygroup takes nothing returns nothing
	local integer Lv = LoadInteger(HeroAbility,'Warc','Leve')
	local integer defense = Lv*5
	call YDWEGeneralBounsSystemUnitSetBonus( GetEnumUnit(), 2, 0, defense )
	call UnitAddAbility(GetEnumUnit(),'Ways')
	call SetUnitAbilityLevel(GetEnumUnit(),'Ways',Lv)
endfunction

function Warcry takes nothing returns nothing
	local timer t = CreateTimer()
	local integer h = GetHandleId(t)
	local unit u = GetTriggerUnit()
	local group g = CreateGroup()
	local boolexpr b = Condition(function GBV1 )
	local integer Lv = GetUnitAbilityLevel(GetTriggerUnit(), 'Warc')
	call SaveInteger(HeroAbility,'Warc','Leve',Lv)
	call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\NightElf\\BattleRoar\\RoarCaster.mdl",u,"overhead"))
	call GroupEnumUnitsInRange(g,GetWidgetX(u),GetWidgetY(u),925, b)
	call ForGroup(g,function Warcrygroup)
	call DestroyBoolExpr(b)
	call SaveGroupHandle(HY,h,0,g)
	call SaveInteger(HY,h,1,Lv)
	call TimerStart(t,7.00,false, function Warcrytimer)
	call FlushChildHashtable(HeroAbility,'Warc')
	set t = null
	set u = null
	set g = null
	set b = null
endfunction

function SvenGodisStrength takes nothing returns nothing
	local unit u = GetTriggerUnit()
	local integer Lv = GetUnitAbilityLevel(u,GetSpellAbilityId())
	if GetUnitTypeId(u) == 'NSve' then
		if Lv == 1 then
			call UnitAddAbility(u,'Ags1')
		elseif Lv == 2 then
			call UnitAddAbility(u,'Ags2')
		elseif Lv == 3 then
			call UnitAddAbility(u,'Ags3')
		endif
	endif
	set u = null
endfunction

function ElevatorRepairReadtimer2 takes nothing returns nothing
	call QuestMessageBJ(GetPlayersAll(), bj_QUESTMESSAGE_HINT, "|c006699CC提示|r - 菊花完成了任务，现在你可以输入 -Elevator 来查找神秘通道的位置（小地图信号只会对自己显示）")
	call DestroyTimer(GetExpiredTimer())
endfunction

function ElevatorRepairReadtimer takes nothing returns nothing
	//call QuestMessageBJ(GetPlayersAll(), bj_QUESTMESSAGE_ALWAYSHINT, "|cff32CD32提示|r - 现在菊花可以修理通道了，菊花可以前往信号点修理通道。")
	call DisplayTimedTextToPlayer(GetOwningPlayer(OM), 0, 0, bj_TEXT_DELAY_ALWAYSHINT, " ")
	call DisplayTimedTextToPlayer(GetOwningPlayer(OM), 0, 0, bj_TEXT_DELAY_ALWAYSHINT, "|cff32CD32提示|r - 现在菊花可以修理神秘通道了，控制菊花前往信号点以修理通道。")
	if GetLocalPlayer() == GetOwningPlayer(OM) then
		call StartSound(bj_questHintSound)
	endif
	call TimerStart(CreateTimer(),3.00,false,function ElevatorRepairReadtimer2)
	call DestroyTimer(GetExpiredTimer())
endfunction

function ElevatorRepairReady takes nothing returns nothing
	call TimerStart(CreateTimer(),3.00,false,function ElevatorRepairReadtimer)
endfunction


function OMWrench takes nothing returns nothing
	local integer h
	local boolean b1
	local boolean b2
	local boolean b3
	if GetUnitTypeId(GetManipulatingUnit()) == 'Oomg' or GetUnitTypeId(GetManipulatingUnit()) == 'OEle' then
		set h = GetHandleId(MainQuest[2])
		set b1 = LoadBoolean(HY,h,'Wren')
		set b2 = LoadBoolean(HY,h,'Icap')
		set b3 = LoadBoolean(HY,h,'Isui')
		if b2 and not b3 then
			call QuestMessageBJ(GetPlayersAll(), bj_QUESTMESSAGE_UPDATED, "|cffffcc00可选任务更新|r
			通道修理者
			- |cff808080找到披风 (已完成)|r
			- |cff808080找到扳手 (已完成)|r
			- 找到工具箱")
		elseif b3 and not b2 then
			call QuestMessageBJ(GetPlayersAll(), bj_QUESTMESSAGE_UPDATED, "|cffffcc00可选任务更新|r
			通道修理者
			- |cff808080找到工具箱 (已完成)|r
			- |cff808080找到扳手 (已完成)|r
			- 找到披风")
		elseif b2 and b3 then
			call QuestMessageBJ(GetPlayersAll(), bj_QUESTMESSAGE_COMPLETED, "|cffffcc00可选任务完成|r
			通道修理者
			- |cff808080找到扳手 (已完成)|r
			- |cff808080找到披风 (已完成)|r
			- |cff808080找到工具箱 (已完成)|r")
			call FlushChildHashtable(HY,h)
			call FlashQuestDialogButton()
			call ElevatorRepairReady()
		elseif not b1 and not b2 and not b3 then
			call QuestMessageBJ(GetPlayersAll(), bj_QUESTMESSAGE_UPDATED, "|cffffcc00可选任务更新|r
			通道修理者
			- |cff808080找到扳手 (已完成)|r
			- 找到披风
			- 找到工具箱")
		endif
		call SaveBoolean(HY,h,'Wren',true)
		call UnitAddAbility(OM,'AomN')
		call UnitRemoveAbility(OM,'AomN')
		call UnitAddAbility(OM,'Acap')
		call UnitRemoveAbility(OM,'Aspb')
		call UnitAddAbility(OM,'Aspb')
		if GetLocalPlayer() == GetOwningPlayer(OM) then
			call SetCinematicScene(GetUnitTypeId(OM), ConvertPlayerColor($C), GetUnitName(OM), "哈哈哈，这下可没人敢惹我了。", 5.00, 0.00)
		endif
		call RemoveItem(GetManipulatedItem())
		//call StartSound( gg_snd_JuHuaXiao )
	elseif OM != null then
		call SetCinematicScene(GetUnitTypeId(OM), ConvertPlayerColor($C), GetUnitName(OM), "惹你个四叠哟！这可是我的扳手，给我！", 5.00, 0.00)
	endif
endfunction

function OMIsuit takes nothing returns nothing
	local integer h
	local boolean b1
	local boolean b2
	local boolean b3
	if GetUnitTypeId(GetManipulatingUnit()) == 'Oomg' or GetUnitTypeId(GetManipulatingUnit()) == 'OEle' then
		set h = GetHandleId(MainQuest[2])
		set b1 = LoadBoolean(HY,h,'Wren')
		set b2 = LoadBoolean(HY,h,'Icap')
		set b3 = LoadBoolean(HY,h,'Isui')
		if b1 and not b2 then
			call QuestMessageBJ(GetPlayersAll(), bj_QUESTMESSAGE_UPDATED, "|cffffcc00可选任务更新|r
			通道修理者
			- |cff808080找到工具箱 (已完成)|r
			- |cff808080找到扳手 (已完成)|r
			- 找到披风")
		elseif b2 and not b1 then
			call QuestMessageBJ(GetPlayersAll(), bj_QUESTMESSAGE_UPDATED, "|cffffcc00可选任务更新|r
			通道修理者
			- |cff808080找到工具箱 (已完成)|r
			- |cff808080找到披风 (已完成)|r
			- 找到扳手")
		elseif b2 and b1 then
			call QuestMessageBJ(GetPlayersAll(), bj_QUESTMESSAGE_COMPLETED, "|cffffcc00可选任务完成|r
			通道修理者
			- |cff808080找到扳手 (已完成)|r
			- |cff808080找到披风 (已完成)|r
			- |cff808080找到工具箱 (已完成)|r")
			call FlushChildHashtable(HY,h)
			call FlashQuestDialogButton()
			call ElevatorRepairReady()
		elseif not b1 and not b2 and not b3 then
			call QuestMessageBJ(GetPlayersAll(), bj_QUESTMESSAGE_UPDATED, "|cffffcc00可选任务更新|r
			通道修理者
			- |cff808080找到工具箱 (已完成)|r
			- 找到扳手
			- 找到披风")
		endif
		call SaveBoolean(HY,h,'Isui',true)
		if GetLocalPlayer() == GetOwningPlayer(OM) then
			call SetCinematicScene(GetUnitTypeId(OM), ConvertPlayerColor($C), GetUnitName(OM), "可惜我没能感应到我的西装。", 5.00, 0.00)
		endif
		call RemoveItem(GetManipulatedItem())
	elseif OM != null then
		if GetUnitTypeId(OM) != 'OEle' then
			call SetCinematicScene(GetUnitTypeId(OM), ConvertPlayerColor($C), GetUnitName(OM), "惹，这是我的工具箱，快把他给我！", 5.00, 0.00)
		endif
	endif
endfunction

function OMIcap takes nothing returns nothing
	local integer h
	local boolean b1
	local boolean b2
	local boolean b3
	if(GetUnitTypeId(GetManipulatingUnit()) == 'Oomg' or GetUnitTypeId(GetManipulatingUnit()) == 'OEle') then
		set h = GetHandleId(MainQuest[2])
		set b1 = LoadBoolean(HY,h,'Wren')
		set b2 = LoadBoolean(HY,h,'Icap')
		set b3 = LoadBoolean(HY,h,'Isui')
		if b1 and not b3 then
			call QuestMessageBJ(GetPlayersAll(), bj_QUESTMESSAGE_UPDATED, "|cffffcc00可选任务更新|r
			通道修理者
			- |cff808080找到披风 (已完成)|r
			- |cff808080找到扳手 (已完成)|r
			- 找到工具箱")
		elseif b3 and not b1 then
			call QuestMessageBJ(GetPlayersAll(), bj_QUESTMESSAGE_UPDATED, "|cffffcc00可选任务更新|r
			通道修理者
			- |cff808080找到披风 (已完成)|r
			- |cff808080找到工具箱 (已完成)|r
			- 找到扳手")
		elseif b3 and b1 then
			call QuestMessageBJ(GetPlayersAll(), bj_QUESTMESSAGE_COMPLETED, "|cffffcc00可选任务完成|r
			通道修理者
			- |cff808080找到扳手 (已完成)|r
			- |cff808080找到披风 (已完成)|r
			- |cff808080找到工具箱 (已完成)|r")
			call FlushChildHashtable(HY,h)
			call FlashQuestDialogButton()
			call ElevatorRepairReady()
		elseif not b1 and not b2 and not b3 then
			call QuestMessageBJ(GetPlayersAll(), bj_QUESTMESSAGE_UPDATED, "|cffffcc00可选任务更新|r
			通道修理者
			- |cff808080找到披风 (已完成)|r
			- 找到扳手
			- 找到工具箱")
		endif
		call SaveBoolean(HY,h,'Icap',true)
		if GetLocalPlayer() == GetOwningPlayer(OM) then
			call SetCinematicScene(GetUnitTypeId(OM), ConvertPlayerColor($C), GetUnitName(OM), "爷的披风，哈哈哈。", 5.00, 0.00)
		endif
		call RemoveItem(GetManipulatedItem())
		call UnitAddAbility(OM,'Acap')
		//call StartSound( gg_snd_JuHuaXiao )
		call PlaySoundOnUnitBJ(gg_snd_JuHuaXiao, 100, OM)
	elseif OM != null then
		if GetUnitTypeId(GetManipulatingUnit()) != 'OEle' then
			call SetCinematicScene(GetUnitTypeId(OM), ConvertPlayerColor($C), GetUnitName(OM), "惹狗，我的工作披风，怎么会在这里，他是我的！", 5.00, 0.00)
		endif
	endif
endfunction

function OgreMagiRect takes nothing returns boolean
	local integer h = GetHandleId(OM)
	local unit Box = LoadUnitHandle(HY,h,'nmgv')
	local item i 
	if GetUnitTypeId(GetTriggerUnit()) == 'Oomg' then
		call KillUnit(Box)
		set i = CreateItem('mlst',GetUnitX(Box),GetUnitY(Box))

		set i = CreateItem('Isui',GetUnitX(Box),GetUnitY(Box))
		set i = CreateItem('Icap',GetUnitX(Box),GetUnitY(Box))

		call SetItemInvulnerable(i, true)
		if GetTriggerUnit() == OM then
			if GetLocalPlayer() == GetOwningPlayer(OM) then
				call SetCinematicScene(GetUnitTypeId(OM), ConvertPlayerColor($C), GetUnitName(OM), "这是我的扳手，我感受到了熟悉的魔法气息,这附近一定还有我的披风和工具箱。", 5.00, 0.00)
			endif
			call MainQuestItemSet(2,0)
			call DestroyTrigger(GetTriggeringTrigger())
		endif
	endif
	set Box = null
	set i = null
	return false
endfunction

function OgreMagiTrigger takes nothing returns nothing
	local trigger t = CreateTrigger()
	local integer h = GetHandleId(OM)
	local rect rec =  Rect(-21024.00,-21312.00,-20288.00,-21216.00)
	local unit Box = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE),'nmgv',-20640.00,-20960.00,0)
	call SaveUnitHandle(HY,h,'nmgv',Box)
	call TriggerRegisterEnterRectSimple(t, rec)
	call TriggerAddCondition(t,Condition(function OgreMagiRect))
	call RemoveRect(rec)
	set rec = null
	set t = null
endfunction

function OMQ takes nothing returns nothing
	local unit u = GetTriggerUnit()
	local unit stu = GetSpellTargetUnit()
	local integer Lvq = GetUnitAbilityLevel(u,'AomQ') //火焰爆轰
	local integer Lvr = GetUnitAbilityLevel(u,'AomR')
	local integer CI = GetUnitAbilityLevel(stu,'BStf')
	local real r
	local integer i
	local integer Lvw = GetUnitAbilityLevel(OM,'AomW') //嗜血等级
	local integer LvB = GetUnitAbilityLevel(u,'BomW') //嗜血buff
	local integer D
	local integer DT = 1
	if GetUnitAbilityLevel(u,'Aloc') > 0 then
		
		set u = OM
		if GetUnitAbilityLevel(u,'BomW') > 0 then
			set LvB = 1
		endif
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
		call R8D(u,stu,DT,r)
		if test then
			call TestTipsDamage(u,stu,'AomQ',r,DT)
		endif
		if LvB > 0 then
			call FT("+"+I2S(D*2),5,stu,.022,255,97,0,$FF,11)
		endif
	else
		call R8D(u,stu,DT,r)
		if test then
			call TestTipsDamage(u,stu,'AomQ',r,DT)
		endif
		if LvB > 0 then
			call FT("+"+I2S(D),5,stu,.022,255,97,0,$FF,11)
		endif
	endif
	set u = null
	set stu = null
endfunction

function OMReT takes nothing returns nothing
	local timer t  = GetExpiredTimer()
	local integer h = GetHandleId(t)
	local unit u = LoadUnitHandle(HY,h,0)
	local integer CLv = GetUnitAbilityLevel(u,'AHbh') //得到暴击等级
	local integer ELv = GetUnitAbilityLevel(u,'AomR') //多重施法等级
	if CLv == 0 then
		call UnitAddAbility(u,'AHbh')
		call SetUnitAbilityLevel(u,'AHbh',ELv) //设置暴击等级与多重施法等级挂钩
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
	//local real japicd = 30
	local group g
	local boolexpr b
	if i >= mc == false then
		//if japicd ==0 then
		//set japicd = 30
		//endif
		set d = CreateUnit(GetOwningPlayer(u),'ndum',GetUnitX(u),GetUnitY(u),GetUnitFacing(u))
		call UnitApplyTimedLife( d, 'BHwe', 0.3 ) //japicd + 30
		call ShowUnit( d, false )
		call UnitAddAbility(d,id)
		call SetUnitAbilityLevel(d,id,GetUnitAbilityLevel(u,id))
		call UnitResetCooldown( d )
		if id == 'AomW' then
			if GetUnitAbilityLevel(du,'BomW') > 0 then
				set g = CreateGroup()
				set b = Condition(function BoosG1)
				call GroupEnumUnitsInRange( g,GetUnitX( du) ,GetUnitY( du ),425,b)
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
				call IssueTargetOrder( d,  OrderId2StringBJ(uid), du ) //发送单位对单位指令 -嗜血术
				call DestroyBoolExpr(b)
				call DestroyGroup(g)
			endif
		endif
		call IssueImmediateOrder( d, OrderId2StringBJ(uid) )
		if GetUnitCurrentOrder(d) != uid then
			call IssueTargetOrder( d,  OrderId2StringBJ(uid), du )
			call IssuePointOrder( d,  OrderId2StringBJ(uid), x, y )
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

function OMMC takes integer mc, integer id, unit u, unit du,real x,real y returns nothing
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
		call TimerStart(OET,20.00,true,function OMReT)
	endif
	set OET = null
	set t = null
endfunction

function PunchFly takes nothing returns boolean
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

function SEOME takes nothing returns nothing
	local unit u = GetTriggerUnit()
	local integer Lv = GetUnitAbilityLevel(u,'AomE')
	if GetUnitAbilityLevel(u,'AHbh') == 0 then
		call UnitAddAbility(u,'AHbh')
		call SetUnitAbilityLevel(u,'AHbh',Lv)
	endif
	set u = null
endfunction

//if GetUnitAbilityLevel(du,'BomW') > 0 and GetUnitAbilityLevel(OM,'AomW') > 0 then //嗜血附加伤害
//	set Lv = GetUnitAbilityLevel(OM,'AomW')
//	set D = 10 + 5 * Lv
//	call R8D(du,u,2,D)
//	call FT("+"+I2S(D),5,du,.022,255,97,0,$FF,11)
//endif 
