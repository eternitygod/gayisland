

function StormSpiritRemnantShadowDamage takes nothing returns nothing
	local integer Lv = GetUnitAbilityLevel(Storm,'ASt1')
	local integer Damage = 100 + 40 *Lv
	call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\ChimaeraLightningMissile\\ChimaeraLightningMissile.mdl",GetUnitX(GetEnumUnit()),GetUnitY(GetEnumUnit())))
	call R8D ( Storm ,GetEnumUnit(), 1 , Damage)
endfunction


function StormSpiritRemnantShadowTrigger takes nothing returns boolean
	local trigger t2 = GetTriggeringTrigger()
	local integer t2h = GetHandleId(t2)
	local trigger t1 = LoadTriggerHandle(HY, t2h,9)
	local integer t1h = GetHandleId(t1)
	local unit Rs = LoadUnitHandle(HY,t2h ,'StRs')
	local group g
	//local integer Lv = LoadInteger(HY, t2h , 'AbLv')
	local boolexpr b 
	if GetTriggerEventId()==EVENT_UNIT_DEATH then
		call ShowUnit(Rs,false)
		call KillUnit(Rs)
		call FlushChildHashtable(HY, t1h)
		call DisableTrigger(t1)
		call FlushChildHashtable(HY, t2h)
		call DisableTrigger(t2)
	elseif IsUnitEnemy(GetTriggerUnit(),GetOwningPlayer(Rs))and IsUnitType(GetTriggerUnit(),UNIT_TYPE_STRUCTURE)==false then
		set g = CreateGroup()
		//call BJDebugMsg("创建单位组")
		set b = Condition(function GeneralUnitselection)
		call GroupEnumUnitsInRange(g,GetUnitX(Rs),GetUnitY(Rs),285, b )
		call DestroyBoolExpr(b)
		call ForGroup(g ,function StormSpiritRemnantShadowDamage)
		call DestroyGroup( g )
		call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\Bolt\\BoltImpact.mdl",GetUnitX(Rs),GetUnitY(Rs)))
		call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\Bolt\\BoltImpact.mdl",GetUnitX(Rs),GetUnitY(Rs)))
		call ShowUnit( Rs,false)
		call KillUnit( Rs)
		call FlushChildHashtable(HY, t1h)
		call EAX(t1)
		call FlushChildHashtable(HY, t2h)
		call EAX(t2)
	endif
	set t1 = null
	set t2 = null
	set Rs = null
	set g = null
	set b = null
	return false
endfunction

function CreateStormSpiritRemnantShadow takes nothing returns boolean
	local trigger t1 = GetTriggeringTrigger()
	local trigger t2
	local integer t1h = GetHandleId(t1)
	local integer t2h
	//local integer LV
	local integer TEC = GetTriggerEvalCount(t1)
	local real x = LoadReal(HY, t1h ,'St1X')
	local real y = LoadReal(HY, t1h ,'St1Y')
	local real fac
	local unit Rs
	if TEC == 1 then
		call DestroyEffect(LoadEffectHandle(HY, t1h, 3))
	elseif TEC == 2  then
		call DestroyEffect(LoadEffectHandle(HY, t1h, 4))
		set t2 = CreateTrigger()
		set t2h =GetHandleId(t2)
		//set LV = LoadInteger(HY, t1h , 'AbLv')
		set fac = LoadReal(HY, t1h , 'ufac')
		set Rs = CreateUnit(GetOwningPlayer(Storm),'npn2',x,y, fac)
		call SetUnitVertexColor( Rs,$FF,$FF,$FF,100)
		call UnitApplyTimedLife( Rs,'BTLF',$C)
		call SaveUnitHandle(HY, t1h , 'StRs', Rs)
		call SaveUnitHandle(HY, t2h , 'StRs', Rs)
		call SaveTriggerHandle(HY, t2h , 9 , t1)
		//call SaveInteger(HY, t2h , 'AbLv', Lv)
		call TriggerRegisterUnitInRange(t2, Rs,$EB,Condition(function Zzzzz))
		call TriggerRegisterUnitEvent(t2, Rs,EVENT_UNIT_DEATH)
		//call BJDebugMsg("注册触发")
		call TriggerAddCondition(t2,Condition(function StormSpiritRemnantShadowTrigger))
		call DestroyEffect(AddSpecialEffectTarget("effects\\ManaFlareBoltImpact_NoSound.mdx",Rs,"origin"))
	elseif TEC>2 then
		set Rs = (LoadUnitHandle(HY, t1h, 'StRs'))
		call DestroyEffect(AddSpecialEffectTarget("effects\\ManaFlareBoltImpact_NoSound.mdx",Rs,"origin"))
	endif
	set t1 = null
	set t2 = null
	set Rs = null
	return false
endfunction


function StormSpiritRemnantShadow takes nothing returns nothing
	local unit u = GetTriggerUnit()
	local trigger t = CreateTrigger()
	local integer h = GetHandleId( t )
	local real x = GetUnitX( u )
	local real y = GetUnitY( u )
	call TriggerRegisterTimerEvent( t ,.5,true)
	call TriggerAddCondition( t ,Condition(function CreateStormSpiritRemnantShadow))
	call SaveReal( HY, h, 'St1X', ( x )*1.)
	call SaveReal( HY, h, 'St1Y', ( y )*1.)
	call SaveReal( HY, h, 'ufac', GetUnitFacing( u )*1.)
	//call SaveInteger( HY, h, 'AbLv', GetUnitAbilityLevel( u ,'ASt1'))
	//call SaveUnitHandle(HY, h, 'Stor', u )
	call SaveEffectHandle( HY, h, 3,( AddSpecialEffect("Abilities\\Spells\\Orc\\LightningShield\\LightningShieldTarget.mdl",x,y)))
	call SaveEffectHandle( HY, h, 4,( AddSpecialEffect("effects\\Static_Remnant_FX.mdx",x,y)))
	set u = null
	set t = null
endfunction


function StormSpiritElectricVortexMove takes nothing returns boolean
	local trigger t = GetTriggeringTrigger()
	local integer h = GetHandleId(t)
	local unit WWE = LoadUnitHandle(HY,h,17)
	local real a = LoadReal(HY,h,$D)
	local real x = GetUnitX(WWE)-5*Cos(a)
	local real y = GetUnitY(WWE)-5*Sin(a)
	local integer ODX = LoadInteger(HY,h,5)
	local real x0 = LoadReal(HY,h,6)
	local real y0 = LoadReal(HY,h,7)
	if((x0-x)*(x0-x))+((y0-y)*(y0-y))<'d' then
		set x=x0
		set y=y0
	endif
	call SetUnitX(WWE,x)
	call SetUnitY(WWE,y)
	if GetTriggerEvalCount(t)==($A+$A*ODX)or GetTriggerEventId()==EVENT_WIDGET_DEATH then
		call FlushChildHashtable(HY,h)
		call EAX(t)
	endif
	set t=null
	set WWE=null
	return false
endfunction

function StormSpiritElectricVortex takes nothing returns nothing
	local unit u = GetTriggerUnit()
	local integer Lv = GetUnitAbilityLevel(u,'ASt2')
	local unit su = GetSpellTargetUnit()
	local unit du = CreateUnit(GetOwningPlayer(u),'nStd',GetUnitX(u),GetUnitY(u),GetUnitFacing(u))
	local trigger t = CreateTrigger()
	local integer h = GetHandleId(t)
	call TriggerRegisterTimerEvent(t,.05,true)
	call TriggerRegisterDeathEvent(t,su)
	call TriggerAddCondition(t,Condition(function StormSpiritElectricVortexMove))
	call SaveUnitHandle(HY,h,17,(su))
	call SaveReal(HY,h,$D,((Atan2(GetUnitY(su)-GetUnitY(u),GetUnitX(su)-GetUnitX(u)))*1.))
	call SaveInteger(HY,h,5,(Lv))
	call SaveReal(HY,h,6,((GetUnitX(u))*1.))
	call SaveReal(HY,h,7,((GetUnitY(u))*1.))
	call UnitAddAbility(du,'ASev')
	call SetUnitAbilityLevel(du,'ASev',Lv)
	call IssueTargetOrderById(du,$D0200,su)
	call UnitApplyTimedLife(du,'BTLF',1+.5*Lv)
	set su = null
	set du = null
	set t = null
endfunction


function StormSpiritBallLightningMove takes nothing returns boolean
	local trigger t = GetTriggeringTrigger()
	local integer h = GetHandleId(t)
	local integer ODX = LoadInteger(HY,h,5)
	local unit KBX = LoadUnitHandle(HY,h,19)
	local unit WUE = LoadUnitHandle(HY,h,2)
	local unit MNR = LoadUnitHandle(HY,h,$C3)
	local integer Y2X = LoadInteger(HY,h,$C2)
	local real W_E = LoadReal(HY,h,6)
	local real W0E = LoadReal(HY,h,7)
	local real GRR = GetUnitX(WUE)
	local real GIR = GetUnitY(WUE)
	local real a = Atan2(W0E-GIR,W_E-GRR)
	local real LMR = LoadReal(HY,h,0)
	local real NBX = GRR+(LMR)*Cos(a)
	local real NCX = GIR+(LMR)*Sin(a)
	local lightning APX = LoadLightningHandle(HY,h,$C4)
	local real lx = LoadReal(HY,h,$C5)
	local real ly = LoadReal(HY,h,$C6)
	local real DDO = GetUnitState(WUE,UNIT_STATE_MANA)
	local real MBR
	//local group g = CreateGroup()
	local real MCR = LoadReal(HY,h,$C7)
	//local boolean MDR = LoadBoolean(HY,h,0)
	//local boolexpr b
	local boolean NoAcess = false
	local player p = GetOwningPlayer(WUE)
	//local sound s = 
	if IsTerrainPathable(NBX, NCX, PATHING_TYPE_WALKABILITY) == true then
		set NoAcess = true
		call DisplayTimedTextToPlayer(p,.5,-1.,2.,"|cffffcc00无法通行|r")
		if(GetLocalPlayer()== p )then
			call StopSound(ifes, false, false)
			call StartSound(ifes)
		endif
	endif
	//if MDR then
	//set MBR=(LMR)*($A+.006*GetUnitState(WUE,UNIT_STATE_MAX_MANA))/ 'd'
	//else
	set MBR=(LMR)*($C+.007*GetUnitState(WUE,UNIT_STATE_MAX_MANA))/ 'd'
	//endif
	set MCR=MCR+LMR
	call SaveReal(HY,h,$C7,((MCR)*1.))
	if GetTriggerEvalCount(t)>25 then
		set lx=lx+(LMR)*Cos(a)
		set ly=ly+(LMR)*Sin(a)
		call SaveReal(HY,h,$C5, lx*1.)
		call SaveReal(HY,h,$C6, ly*1.)
	endif
	call SetUnitState(WUE,UNIT_STATE_MANA,RMaxBJ(DDO-MBR,0))
	call MoveLightning(APX,true,lx,ly,NBX,NCX)
	//if IsUnitType(WUE,UNIT_TYPE_HERO)then
	//call SaveBoolean(K,GetHandleId(WUE),99,true)
	//endif
	if not NoAcess then
		call SetUnitX(WUE,NBX)
		call SetUnitY(WUE,NCX)
		call SetUnitPosition(KBX,NBX,NCX)
		call SetUnitPosition(MNR,NBX,NCX)
	endif
	//set U2=WUE
	//set HZV=WUE
	//set HWV=h
	//set HYV=ODX
	//set H_V=MCR
	//set b = Condition(function GeneralUnitselection)
	//call GroupEnumUnitsInRange(g,NBX,NCX,75+75*ODX,b)
	//call DestroyBoolExpr(b)
	//call ForGroup(g,function MIR)
	//call V7X(g)
	if NoAcess then
		set Y2X = 0
	else
		set Y2X = Y2X-1
	endif
	call SaveInteger(HY,h,$C2,(Y2X))
	call ChangeRGBA(WUE,-1,-1,-1,0)
	if Y2X == 0 or GetUnitState(WUE,UNIT_STATE_MANA) < 1 then
		call DestroyLightning(APX)
		//call A3X(NBX,NCX,75)
		call DestroyEffect((LoadEffectHandle(HY,h,32)))
		call RemoveUnit(KBX)
		call RemoveUnit(MNR)
		call ChangeRGBA(WUE,-1,-1,-1,$FF)
		call SetUnitPathing(WUE,true)
		call SetUnitInvulnerable(WUE,false)
		call FlushChildHashtable(HY,h)
		call DestroyTrigger(t)
	else
		//call A3X(NBX,NCX,75)
	endif
	set t = null
	//set b = null
	set KBX = null
	set WUE = null
	set APX = null
	//set g = null
	set MNR = null
	set p = null
	return false
endfunction

function StormSpiritBallLightning takes nothing returns nothing
	local unit u =GetTriggerUnit()
	local real ux =GetUnitX(u)
	local real uy= GetUnitY(u)
	local unit KBX
	local unit MNR
	local real x
	local real y
	local trigger t
	local integer h
	local lightning light
	local integer Lv = GetUnitAbilityLevel(u,'ASt4')
	local real Mana = GetUnitState(u,UNIT_STATE_MANA)
	local real Cost = 30+.06*GetUnitState(u,UNIT_STATE_MAX_MANA)
	//local boolean MDR=false
	local real Distance
	//if GetUnitAbilityLevel(WUE,'A3FJ')>0 then
	//set MBR=$F+.05*GetUnitState(WUE,UNIT_STATE_MAX_MANA)
	//set MDR=true
	//endif)
	call SetUnitState(u,UNIT_STATE_MANA,RMaxBJ(Mana-Cost,0))
	if GetUnitState(u,UNIT_STATE_MANA)>$A then
		set t = CreateTrigger()
		set h = GetHandleId(t)
		set KBX = CreateUnit(GetOwningPlayer(u),'nsbl',ux,uy,0)
		set MNR = CreateUnit(GetOwningPlayer(u),'npn5',ux,uy,0)
		set light = AddLightning("FORK",true,ux,uy,ux,uy)
		if GetSpellTargetUnit()==null then
			set x=GetSpellTargetX()
			set y=GetSpellTargetY()
		else
			set x=GetUnitX(GetSpellTargetUnit())
			set y=GetUnitY(GetSpellTargetUnit())
		endif
		set Distance = XYDistance(x,y,ux,uy)
		if Distance <25+25*Lv then
			call SaveReal(HY,h,0, Distance)
		else
			call SaveReal(HY,h,0,25+25*Lv)
		endif
		call ChangeRGBA(u,-1,-1,-1,0)
		call SetUnitVertexColor(MNR,$FF,$FF,$FF,0)
		call SetUnitPathing(u,false)
		call SetUnitPathing(KBX,false)
		call SetUnitInvulnerable(u,true)
		call SaveUnitHandle(HY,h,19, KBX)
		call SaveUnitHandle(HY,h,2, u)
		call SaveUnitHandle(HY,h,$C3,(MNR))
		call SaveLightningHandle(HY,h,$C4, light)
		call SaveInteger(HY,h,5,Lv)
		call SaveReal(HY,h,6,((x)*1.))
		call SaveReal(HY,h,7,((y)*1.))
		call SaveReal(HY,h,$C5, ux*1.)
		call SaveReal(HY,h,$C6, uy*1.)
		call SaveReal(HY,h,$C7,(0*1.))
		call SaveInteger(HY,h,$C2,(ContrastSize(R2I(SquareRoot((x-ux)*(x-ux)+(y-uy)*(y-uy))/(25+25*Lv)),1)))
		call SaveEffectHandle(HY,h,32,(AddSpecialEffectTarget("effects\\Lightning_Ball_Tail_FX.mdx",MNR,"origin")))
		call TriggerRegisterTimerEvent(t,.04,true)
		call TriggerAddCondition(t,Condition(function StormSpiritBallLightningMove))
		call ShowUnit(u,false)
		call ShowUnit(u,true)
		call SelectUnitAddForPlayer(u,GetOwningPlayer(u))
		//call SaveBoolean(HY,h,0,MDR)
	endif
	set u = null
	set KBX = null
	set MNR = null
	set t = null
	set light = null
endfunction

function StormSpiritBallLightningCast takes nothing returns nothing
	local unit u = GetTriggerUnit()
	local real Cost = 30+.06*GetUnitState(u,UNIT_STATE_MAX_MANA)
	local real Mana = GetUnitState(u,UNIT_STATE_MANA)
	local player p = GetOwningPlayer(u)
	if Mana < Cost then
	 call IssueImmediateOrder( u, "stop" )
	 call DisplayTimedTextToPlayer(p,.5,-1.,2.,"|cffffcc00魔法不足|r")
	 if(GetLocalPlayer()== p )then
		 call StopSound(ifes, false, false)
		 call StartSound(ifes)
	 endif
	endif
	set u = null
	set p = null
endfunction

function StormSpiritOverload takes nothing returns nothing
	//local trigger t = CreateTrigger()
	local unit u = GetTriggerUnit()
	local integer h = GetHandleId(u)
	//local string fx=""
	//if IsUnitAlly(WUE,GetLocalPlayer())or RBX(GetLocalPlayer())then
	//set fx=
	//endif
	call SaveEffectHandle(HY,h,$C8,(AddSpecialEffectTarget("Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl",u,"right hand")))
	call SaveEffectHandle(HY,h,$C9,(AddSpecialEffectTarget("Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl",u,"left hand")))
	//call A_X(t,EVENT_PLAYER_UNIT_ATTACKED)
	//call TriggerAddCondition(t,Condition(function MVR))
	//call SaveUnitHandle(HY,(GetHandleId(t)),2,(WUE))
	//set t=null
	set u = null
endfunction

function StormSpiritOverloadReady takes nothing returns boolean
	local integer AbId=GetSpellAbilityId()
	if AbId == 'ASt1' or AbId == 'ASt2' or AbId == 'ASt4' and LoadInteger(HY,GetHandleId(GetTriggerUnit()),'ASt3') != 1  then
		call SaveInteger(HY,GetHandleId(GetTriggerUnit()),'ASt3',1)
		call StormSpiritOverload()
		//call BJDebugMsg("Set = 1")
	endif
	return false
endfunction

function SkillStormSpiritOverload takes nothing returns nothing
	local unit u = GetTriggerUnit()
	local trigger t = CreateTrigger()
	call TriggerRegisterUnitEvent( t , u ,EVENT_UNIT_SPELL_EFFECT)
	call TriggerAddCondition( t ,Condition(function StormSpiritOverloadReady))
	set u = null
	set t = null
endfunction

function StormSpiritOverloadGroupDamage takes nothing returns nothing
	local unit u = CreateUnit(GetOwningPlayer(Storm),'ndum',GetUnitX(GetEnumUnit()),GetUnitY(GetEnumUnit()),GetUnitFacing(GetEnumUnit()))
	call UnitAddAbility(u,'ACsw')
	call IssueTargetOrder( u, "slow", GetEnumUnit() )
	call R8D(Storm,GetEnumUnit(),1,GetUnitAbilityLevel(Storm,'ASt3')*20+$A)
	//call CCX(GetEnumUnit(),'A335',1,.6,'B08B')
	//call RemoveUnit(u)
	set u = null
endfunction

function StormSpiritDamage takes nothing returns nothing
	local unit u = GetTriggerUnit()
	local unit du = GetEventDamageSource()
	local integer h = GetHandleId(du)
	local player p = GetOwningPlayer(u)
	local group g
	local boolexpr b
	if(YDWEIsEventPhysicalDamage() == true) then 
		if IPA(p) then
			//call BJDebugMsg("攻击单位")
			if LoadInteger(HY,GetHandleId(du),'ASt3') == 1  then
				//call BJDebugMsg("范围伤害")
				set g = CreateGroup()
				call DestroyEffect(LoadEffectHandle(HY,h,$C8))
				call DestroyEffect(LoadEffectHandle(HY,h,$C9))
				call SaveInteger(HY,GetHandleId(du),'ASt3',2)
				//set U2=WUE
				//set HTV=WUE
				//set HUV=GetUnitAbilityLevel(WUE,'ASt3')*20+$A
				set b = Condition(function GeneralUnitselection)
				call GroupEnumUnitsInRange( g ,GetUnitX( u) ,GetUnitY( u ),300,b)
				call ForGroup(g,function StormSpiritOverloadGroupDamage)
				call V7X(g)
				call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl",GetUnitX(u),GetUnitY(u)))
			endif
		endif
	endif
	set u = null
	set du = null
	set g = null
	set p = null
	set b = null
	
endfunction

function StormSpiritDamageTriggerAG takes nothing returns nothing
	local timer t = GetExpiredTimer()
	call ExecuteFunc( "CreateStormSpiritDamageTrigger" )
	call DestroyTrigger( StormSpiritDamageTrigger )
	call DestroyTimer( t )
	set t = null
endfunction

function CreateStormSpiritDamageTrigger takes nothing returns nothing
	local timer tt = CreateTimer()
	set StormSpiritDamageTrigger = null
	set StormSpiritDamageTrigger = CreateTrigger()
	call YDWESyStemAnyUnitDamagedRegistTrigger( StormSpiritDamageTrigger )
	call TriggerAddAction(StormSpiritDamageTrigger, function StormSpiritDamage)
	call TimerStart(tt,600.00,false,function StormSpiritDamageTriggerAG)
	set tt = null
endfunction