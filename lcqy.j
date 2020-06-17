function LCLTN takes nothing returns boolean //and (GetUnitTypeId(GetFilterUnit()) == 'hlc1')
	return ((IsUnitAlly(GetFilterUnit(), Player(0)) == true) and (GetUnitTypeId(GetFilterUnit()) == 'hlc2') and (IsUnitPaused(GetFilterUnit()) == false) and (IsUnitIllusion(GetEnumUnit()) == false) and (GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0.00) == true)
endfunction

function LC201G takes nothing returns boolean //and (GetUnitTypeId(GetFilterUnit()) == 'hlc1')
	return ((IsUnitAlly(GetFilterUnit(), Player(0)) == true) and (IsUnitType(GetFilterUnit(), UNIT_TYPE_MECHANICAL) == false) and (GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0.00) == true) and (IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false)
endfunction


function LCB takes unit u ,boolean b returns nothing
	local integer uh = GetHandleId(u)
	if b then
		//call SaveInteger(HY,uh,0,0)
		call FlushChildHashtable(HY,uh)
		call YDWESetUnitAbilityDataString( u, 'Alc0', 1, 204, "ReplaceableTextures\\PassiveButtons\\PASBTNMagicalSentry.blp" )
	else
		call SaveInteger(HY,uh,0,1)
		call FT("|c0009d396 0x 施法！！|r",5,u,.03,255,255,255,$FF,64)
		call YDWESetUnitAbilityDataString( u, 'Alc0', 1, 204, "ReplaceableTextures\\CommandButtons\\BTNMagicalSentry.blp" )
	endif
endfunction


function LC10t takes nothing returns nothing
	local timer t = GetExpiredTimer()
	local integer h = GetHandleId(t)
	local group g = LoadGroupHandle(HY,h,0)
	local unit u = LoadUnitHandle(HY,h,1)
	local unit ft
	loop
	exitwhen FirstOfGroup(g) == null
		set ft = FirstOfGroup(g)
		call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\NightElf\\Blink\\BlinkTarget.mdl", GetUnitX(ft),GetUnitY(ft)) )
		call SetUnitPosition(ft,GetUnitX(u),GetUnitY(u))
		//call SetUnitPathing(ft,true)
		call GroupRemoveUnit(g,ft)
		set ft = null
	endloop
	call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\NightElf\\Blink\\BlinkTarget.mdl", GetUnitX(u),GetUnitY(u)) )
	call FlushChildHashtable(HY,h)
	call DestroyGroup(g)
	call DestroyTimer(t)
	set t = null
	set g = null
	set u = null
	set ft = null
endfunction

function LC10 takes nothing returns nothing
	local unit u = GetTriggerUnit()
	local unit ft
	local integer i
	local integer Lv = GetUnitAbilityLevel(u,'Alc1')
	local real x1 = GetSpellTargetX()
	local real y1 = GetSpellTargetY()
	local real x2
	local real y2
	local real a = 0
	local real ua
	local integer uh = GetHandleId(u)
	local integer b = LoadInteger(HY,uh,0)
	local integer Ri
	local boolean rb = true
	local integer uid = 'hlc1'
	local group g
	local timer t
	local integer th
	local integer bid = 'Bft1'
	local integer Lvr = GetUnitAbilityLevel(u,'Alc4')
	local integer dt = Lv * 5 + 20
	if b == 1 then
		set uid = 'hlc2'
		set bid = 'Bft2'
	else
		set Ri = GetRandomInt(0, 100)
		set rb = Ri > 20
	endif
	if rb then
		set i = 0
		set g = CreateGroup()
		loop
			set a = 90.00 * i *bj_DEGTORAD
			set x2 = IMX(x1+80*Cos(a))
			set y2 = IMY(y1+80*Sin(a))
			set ua = AngleBetweenXY(x2,y2,x1,y1)
			set ft = CreateUnit(GetOwningPlayer(u),uid,x2,y2,ua)
			call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Human\\MassTeleport\\MassTeleportTo.mdl", x2, y2) )
			call UnitApplyTimedLife( ft, bid, dt )
			call GroupAddUnit(g,ft)
			//call SetUnitPathing(ft,false)
			set ft = null
			set i = i + 1
		exitwhen i >= 4
		endloop
		set t = CreateTimer()
		set th = GetHandleId(t)
		call SaveGroupHandle(HY,th,0,g)
		call SaveUnitHandle(HY,th,1,u)
		call LCB(u,true)
		call TimerStart(t,dt,false,function LC10t)
	else
		call LCB(u,false)
	endif
	set u = null
	set ft = null
	set t = null
	set g = null
endfunction

function LC12 takes nothing returns nothing
	local real x = GetSpellTargetX()
	local real y = GetSpellTargetY()
	local sound s = ifes
	local player p = GetOwningPlayer(GetTriggerUnit())
	if (IsVisibleToPlayer(x, y, p) == false) then
		call IssueImmediateOrderById( GetTriggerUnit(), 851972 )
		call DisplayTimedTextToPlayer(p,.5,-1.,2.,"|cffffcc00技能释放点不可见|r")
		if(GetLocalPlayer()==p)then
			call StopSound(s, false, false)
			call StartSound(s)
		endif
	endif
	set p = null
	set s = null
endfunction

function LC20 takes nothing returns nothing
	local unit u = GetTriggerUnit()
	local unit dum
	local integer uh = GetHandleId(u)
	local integer b = LoadInteger(HY,uh,0)
	local integer Ri
	local boolean rb = true
	local integer th
	local boolean ub
	local player p = GetOwningPlayer(u)
	local integer Lv = GetUnitAbilityLevel(u,'Alc2')
	local group g
	local boolexpr ble
	if b == 1 then
		set ub = true
	else
		set Ri = GetRandomInt(0, 100)
		set rb = Ri > 20
	endif
	if rb then
		set dum = CreateUnit(p,'ndum',GetUnitX(u),GetUnitY(u),GetUnitFacing(u))
		call UnitAddAbility(dum,'AlcP')
		call SetUnitAbilityLevel(dum,'AlcP',Lv)
		call IssueNeutralImmediateOrderById( p, dum, 852269 )
		call UnitApplyTimedLife( dum, 'BHwe', 0.1 )
		call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Items\\AIda\\AIdaCaster.mdl", GetUnitX(u), GetUnitY(u)) )
		if ub then
			set ble = Condition (function LC201G)
			set g = CreateGroup()
			call GroupEnumUnitsInRange(g,GetUnitX(u),GetUnitY(u),400.00 + Lv * 50 ,ble)
			call DestroyBoolExpr(ble)
			loop
				call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Human\\DispelMagic\\DispelMagicTarget.mdl", GetUnitX(u), GetUnitY(u)) )
				call UnitRemoveBuffs( FirstOfGroup(g), false, true )
				call GroupRemoveUnit(g,FirstOfGroup(g))
			exitwhen FirstOfGroup(g) == null
			endloop
			call LCB(u,true)
			call DestroyGroup(g)
		endif
	elseif b!= 1 then
		call LCB(u,false)
	endif
	set ble = null
	set dum = null
	set u = null
	set g = null
	set p = null
endfunction

function LC21 takes nothing returns nothing
	local integer Lv = GetLearnedSkillLevel()
	call AddPlayerTechResearched( GetOwningPlayer(GetTriggerUnit()), 'Rlc1', 1 )
	call AddPlayerTechResearched( GetOwningPlayer(GetTriggerUnit()), 'Rlc2', 1 )
endfunction

function LC40T takes nothing returns nothing
	local timer t = GetExpiredTimer()
	local integer h = GetHandleId(t)
	local group g = LoadGroupHandle(HY,h,0)
	local integer Lv = LoadInteger(HY,h,1)
	local unit ft = FirstOfGroup(g)
	//call BJDebugMsg("踩")
	set ft = FirstOfGroup(g)
	call UnitAddAbility(ft,'AlcM')
	call SetUnitAbilityLevel(ft,'AlcM',Lv)
	call IssueImmediateOrder(ft, "stomp" )
	call UnitRemoveAbility(ft,'AlcM')
	call GroupRemoveUnit(g,ft)
	set ft = FirstOfGroup(g)
	if ft == null then
		call DestroyGroup(g)
		call FlushChildHashtable(HY,h)
		call DestroyTimer(t)
		//call BJDebugMsg("清空")
	endif
	set t = null
	set g = null
	set ft = null
endfunction

function LC40 takes nothing returns nothing
	local unit u = GetTriggerUnit()
	local unit ft
	local group g
	local integer Lv = GetUnitAbilityLevel(u,'Alc4')
	local player p = GetOwningPlayer(u)
	local timer t
	local integer Ri
	local integer uh = GetHandleId(u)
	local integer b = LoadInteger(HY,uh,0)
	local boolean rb = true
	local integer th
	local boolean ub
	local boolexpr ble
	if b == 1 then
		set ub = true
	else
		set Ri = GetRandomInt(0, 100)
		set rb = Ri > 20
	endif
	if rb then
		set ft = CreateUnit(p,'ndum',GetUnitX(u),GetUnitY(u),GetUnitFacing(u))
		call UnitAddAbility(ft,'AlcM')
		call SetUnitAbilityLevel(ft,'AlcM',Lv)
		call IssueImmediateOrder(ft, "stomp" )
		call UnitApplyTimedLife( ft, 'BHwe', 0.2 )
		call DestroyEffect( AddSpecialEffect("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl", GetUnitX(u), GetUnitY(u)) )
		call ShowUnit( ft, false )
		if ub then
			set ble = Condition (function LCLTN)
			set g = CreateGroup()
			call GroupEnumUnitsInRange(g,GetUnitX(u),GetUnitY(u),1200.00,ble)
			call DestroyBoolExpr(ble)
			if FirstOfGroup(g) != null then
				set t = CreateTimer()
				set th = GetHandleId(t)
				call SaveGroupHandle(HY,th,0,g)
				call SaveInteger(HY,th,1,Lv)
				call TimerStart(t,0.40,true,function LC40T)
			else
				call DestroyGroup(g)
			endif
			call LCB(u,true)
		endif
	elseif b!= 1 then
		call LCB(u,false)
	endif
	set u = null
	set ft = null
	set g = null
	set t = null
	set ble = null
	set p = null
endfunction

function LCD takes nothing returns nothing
	local unit u = GetTriggerUnit()
	local unit du = GetEventDamageSource() //GetEventDamage()
	local integer BLv
	local integer CA
	local integer Ri
	local integer pb
	local real Rd
	local integer hd
	local integer Bisi
	local integer isid
	local integer Ilv
	local real mu
	local player p = GetOwningPlayer(u)
	if (YDWEIsEventPhysicalDamage() == true) then 
		if IPA(p) then
			set BLv = GetUnitAbilityLevel( du , 'Blc3' )
			set Ri = GetRandomInt( 0, 100 )
			set pb = 15
			if BLv > 0 and Ri <= pb then
				set Rd = GetEventDamage()
				set CA = GetUnitAbilityLevel(LC,'Alc3')
				set mu = 1.10 + 0.10 * CA
				set hd = R2I(Rd * mu)
				call R8D(du,u,5,hd)
				call FT(I2S(hd)+"!",5,du,.025,$FF,0,0,$FF,64)
			endif
			set Bisi = GetUnitAbilityLevel(du,'Bisi')
			if Bisi > 0 then
				set Ilv = GetUnitAbilityLevel(LC,'Alc2')
				set isid = 2 + Ilv * 6
				call R8D(du,u,1,isid)
				call FT("+"+I2S(isid),1,du,.022,100,$C8,$FF,$FF,-42)
			endif
		endif
	endif
	set u = null
	set p = null
	set du = null
endfunction

function LcltAG takes nothing returns nothing
	local timer t = GetExpiredTimer()
	call ExecuteFunc("Lclt")
	call DestroyTrigger( AudtLC )
	call DestroyTimer( t )
	set t = null
endfunction

function Lclt takes nothing returns nothing
	local timer tt = CreateTimer()
	set AudtLC = null
	set AudtLC = CreateTrigger()
	call YDWESyStemAnyUnitDamagedRegistTrigger( AudtLC )
	call TriggerAddAction(AudtLC, function LCD)
	call TimerStart(tt,600.00,false,function LcltAG)
	set tt = null
endfunction