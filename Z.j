//必须在某个初始化函数里面call STEP 否则无法运行

globals  
	hashtable I=InitHashtable()
	hashtable P=InitHashtable()
	hashtable HY=InitHashtable()
endglobals

function FT takes string FTS,real FL,unit U,real FS,integer r,integer g,integer b,integer a returns nothing
	local texttag tt=CreateTextTag()
	call SetTextTagText(tt,FTS,FS)
	call SetTextTagPosUnit(tt,U,64)
	call SetTextTagColor(tt,r,g,b,a)
	call SetTextTagVelocity(tt,0,.0355)
	call SetTextTagFadepoint(tt,2)
	call SetTextTagPermanent(tt,false)
	call SetTextTagLifespan(tt,FL)
	//call SetTextTagVisibility(tt,TYV(U,GetLocalPlayer())or RBX(GetLocalPlayer()))
	set tt=null
endfunction

function Zzzzz takes nothing returns boolean
	return true
endfunction

//给所有玩家注册事件
function BJRT takes trigger t,playerunitevent A0X returns nothing
	local integer i=0
	loop
		call TriggerRegisterPlayerUnitEvent(t,Player(i),A0X,Condition(function Zzzzz))
		set i=i+1
	exitwhen i==16
	endloop
endfunction

function EPIW takes nothing returns boolean
	local unit u = GetTriggerUnit()
	local item i = GetManipulatedItem()
	local integer A = 0
	local integer n = 0
	local sound s = CreateSoundFromLabel("InterfaceError",false,false,false,$A,$A)
	local player p = GetOwningPlayer(u)
	local real x = GetItemX(i)
	local real y = GetItemY(i)
	loop
		if ((GetItemType(UnitItemInSlot(u, A)) == ITEM_TYPE_ARTIFACT) and (GetItemLevel(UnitItemInSlot(u, A)) == 0)) then
			set n = n + 1
		endif
		set A = A + 1
	exitwhen A > 5
	endloop
	if  n > 2 then
		call UnitRemoveItem(u, i)
		call DisplayTimedTextToPlayer(p,.5,-1.,2.,"|cffffcc00不能携带两个武器类物品|r")
		call SetItemPosition( i, x, y )
		if(GetLocalPlayer()==p)then
			call StartSound(s)
		endif
	endif
	call KillSoundWhenDone(s)
	set s = null
	set u = null
	set i = null
	return false
endfunction

function uxn takes nothing returns nothing
	local timer t = GetExpiredTimer()
	local integer h = GetHandleId(t)
	local unit d = LoadUnitHandle(HY,h,0)
	local integer dh = GetHandleId(d)
	call FlushChildHashtable(HY,h)
	call FlushChildHashtable(HY,dh)
	call PauseTimer(t)
	call DestroyTimer(t)
	set t = null
	set d = null
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
	local integer dh
	local timer dt
	local integer dth
	if i >= mc == false then
		if japicd ==0 then
			set japicd = 30
		endif
		set d = CreateUnit(GetOwningPlayer(u),'h00D',GetUnitX(u),GetUnitY(u),GetUnitFacing(u))
		set dh= GetHandleId(d)
		call SaveUnitHandle(HY,dh,0,u)
		set dt = CreateTimer()
		set dth = GetHandleId(dt)
		call SaveUnitHandle(HY,dth,0,d)
		call TimerStart(dt,japicd+60,false,function uxn)
		call UnitApplyTimedLife( d, 'BHwe', japicd + 30 )
		call ShowUnit( d, false )
		call UnitAddAbility(d,id)
		call UnitAddAbility(d,'A004')
		call UnitAddAbility(d,'ALHS')
		call SetUnitAbilityLevel(d,id,GetUnitAbilityLevel(u,id))
		call UnitResetCooldown( d )
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
	set dt = null
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
			call FT("|c00FFFF002x 施法！！|r",5,u,.03,$FF,0,0,$FF)
		elseif mc == 3 then
			call FT("|cffff80003x 施法！！！|r",5,u,.03,$FF,0,0,$FF)
		elseif mc == 4 then
			call FT("4x 施法！！！！",5,u,.03,$FF,0,0,$FF)
		elseif mc == 5 then
			call FT("|c00FFFF005x 施法！！|r",5,u,.03,255,255,255,$FF)
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
			set m4 = 25
		endif
		set Ri = GetRandomInt(0, 100)
		if (Ri < m4) then
			set mc = 4
		else
			set Ri = GetRandomInt(0, 100)
			if (Ri < m3) then
				set mc = 3
			else
				set Ri = GetRandomInt(0, 100)
				if (Ri < m2) then
					set mc = 2
				endif
			endif 
		endif
		if mc >= 2 then
			call OMMC(mc,id,u,du,x,y)
		endif
	endif
	set u = null
	set du = null
	return false
endfunction

function HQT takes nothing returns nothing
	call SaveBoolean(P,'odef',0,true)
	call SaveInteger(P,'odef',0,'AomQ')
	//	call SaveInteger(P,'odef',0,'AomQ')
	//	call SaveInteger(P,'odef',0,'AomQ')
	//	call SaveInteger(P,'odef',1,'AomQ')
	
endfunction

function QTCN takes nothing returns boolean
	local unit du = GetDyingUnit()
	local unit ku = GetKillingUnit()
	local integer WLv = GetUnitAbilityLevel(ku,'A004')
	local integer QLv = GetUnitAbilityLevel(ku,'ALHS')
	local integer kuh
	local unit Zu
	if (IsPlayerEnemy(GetOwningPlayer(du), GetOwningPlayer(ku)) == true) and WLv>0 and QLv>0 and((((IsUnitType(GetDyingUnit(), UNIT_TYPE_GROUND) == true) or (IsUnitType(GetDyingUnit(), UNIT_TYPE_FLYING) == true)))) then
		if GetUnitAbilityLevel(ku,'Aloc')>0 then
			set kuh = GetHandleId(ku)
			set ku = LoadUnitHandle(HY,kuh,0)
			call DisplayTextToPlayer( Player(0), 0, 0, GetUnitName(ku) )
		endif
		call SetItemCharges( GetItemOfTypeFromUnitBJ(ku, 'I018'), OperatorIntegerAdd(GetItemCharges(GetItemOfTypeFromUnitBJ(ku, 'I018')), 1) )
		set Zu = CreateUnit(GetOwningPlayer(du),'O000',GetUnitX(du),GetUnitY(du),360)
		call IssueTargetOrder( Zu,  "attackonce", ku )
	endif
	return false
	set du = null
	set ku = null
	set Zu = null
endfunction


function STEP takes nothing returns nothing
	local trigger t
	set t = CreateTrigger()
	call BJRT(t,EVENT_PLAYER_UNIT_PICKUP_ITEM)
	call TriggerAddCondition(t,Condition(function EPIW))
	set t = CreateTrigger()
	call BJRT(t,EVENT_PLAYER_UNIT_SPELL_EFFECT)
	call TriggerAddCondition(t,Condition(function OMRX))
	set t = CreateTrigger()
	call BJRT(t,EVENT_PLAYER_UNIT_DEATH)
	call TriggerAddCondition(t,Condition(function QTCN))
	set t = null
endfunction
