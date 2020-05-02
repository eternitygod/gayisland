function IX takes real x returns real
	local real dx=GetRectMinX(bj_mapInitialPlayableArea)+75
	if(x<dx)then
		return dx
	endif
	set dx=GetRectMaxX(bj_mapInitialPlayableArea)-75
	if(x>dx)then
		return dx
	endif
	return x
endfunction
function IY takes real y returns real
	local real dy=GetRectMinY(bj_mapInitialPlayableArea)+50
	if(y<dy)then
		return dy
	endif
	set dy=GetRectMaxY(bj_mapInitialPlayableArea)-50
	if(y>dy)then
		return dy
	endif
	return y
endfunction

function WQI takes nothing returns nothing
	local unit u =GetEnumUnit()
	local real x1=(LoadReal(HY,123,1))
	local real y1=(LoadReal(HY,123,2))
    call SetUnitPosition(u,x1,y1)
    call UnitDamageTarget(udg_Boos[1], GetEnumUnit(), 1.00, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
    set u=null
endfunction

function CHTC takes nothing returns boolean
	return (((GetUnitState((GetFilterUnit()), UNIT_STATE_LIFE) > 0 ) and (IsUnitType(GetFilterUnit(), UNIT_TYPE_MAGIC_IMMUNE) == false)))
endfunction

function CHT takes nothing returns boolean
	local trigger t=GetTriggeringTrigger()
	local integer h=GetHandleId(t)
	local unit WUE=(LoadUnitHandle(HY,h,2))
	local real W_E=(LoadReal(HY,h,47))
	local real W0E=(LoadReal(HY,h,48))
	local real a=(LoadReal(HY,h,$D))
	local real GRR=(LoadReal(HY,h,6))
	local real GIR=(LoadReal(HY,h,7))
	local real X=IX(GRR+3*Cos(a))
	local real Y=IY(GIR+3*Sin(a))
	local group g
	local group gg=LoadGroupHandle(HY,h,0)
	local integer WUI=(LoadInteger(HY,h,$C))
	local location l
	if ((IsTerrainPathable(X, Y, PATHING_TYPE_WALKABILITY) == false)) then
		call SetUnitPosition(WUE,X,Y)
        if IsUnitInRegion(udg_SlkR, udg_Boos[1]) == true then
			set X=IX(GRR-3*Cos(a))
			set Y=IY(GIR-3*Sin(a))
		endif
		call SetUnitFacing(WUE,a*bj_RADTODEG)
		call SaveReal(HY,h,6,((X)*1.))
		call SaveReal(HY,h,7,((Y)*1.))
		if ModuloInteger(GetTriggerEvalCount(t),4)==0 then
			call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl",X,Y))
		endif
		if GetTriggerEvalCount(t)==2 then
			call SetUnitAnimationByIndex(WUE,3) 
		endif
		set g=CreateGroup()
		call GroupEnumUnitsInRange(g,X,Y,225,Condition(function CHTC))
		if FirstOfGroup(g)!=null then
			call GroupAddGroup(g,gg)
		endif
		call GroupRemoveUnit(g, udg_Boos[1])
		call SaveReal(HY,123,1,((X)*1.))
		call SaveReal(HY,123,2,((Y)*1.))
		call ForGroup(g,function WQI)
		if GetTriggerEventId()==EVENT_WIDGET_DEATH or GetTriggerEvalCount(t)>WUI then
			call DestroyEffect((LoadEffectHandle(HY,$AF,5)))
			call SetUnitAnimationByIndex(WUE,0)
			call SetUnitTimeScale(WUE,1.)
			call SetUnitPathing(WUE,true)
            call FlushChildHashtable(HY,h)
			call FlushChildHashtable(HY,123)
			call PauseUnit(udg_Boos[1], false)
			call EAX(t)
		endif
		call V7X(g)
		call FlushChildHashtable(HY,123)
		
	else
		call DestroyEffect((LoadEffectHandle(HY,$AF,5)))
		call SetUnitAnimationByIndex(WUE,0)
		call SetUnitTimeScale(WUE,1.)
		call SetUnitPathing(WUE,true)
		call FlushChildHashtable(HY,h)
		call FlushChildHashtable(HY,123)
		call PauseUnit(udg_Boos[1], false)
        call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl",X,Y))
        call UnitDamageTarget(udg_Boos[1], udg_Boos[1], 150, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
		call EAX(t)
	endif
	set t=null
	set WUE=null
	call V7X(gg)
	set g=null
	set gg=null
    set l = null
	return false
endfunction

function charge takes nothing returns nothing
    local unit u = GetTriggerUnit()
    local real x = GetSpellTargetX()
    local real y = GetSpellTargetY()
	local real a = AXY(GetUnitX(u),GetUnitY(u),x,y)
	local trigger t=CreateTrigger()
	local integer h=GetHandleId(t)
	local integer hp=GetHandleId(GetOwningPlayer(u))
	local real SX=IX(GetSpellTargetX())
	local real SY=IY(GetSpellTargetY())
	local real UX=GetUnitX(u)
	local real UY=GetUnitY(u)
	call SetUnitPathing(u,false)
	call SetUnitAnimationByIndex(u,3)
	call SetUnitTimeScale(u,1.5)
	call TriggerRegisterTimerEvent(t,.02,true)
	call TriggerRegisterDeathEvent(t,u)
	call TriggerAddCondition(t,Condition(function CHT))
	call SaveReal(HY,h,47,((SX)*1.))
	call SaveReal(HY,h,48,((SY)*1.))
	call SaveReal(HY,h,6,((UX)*1.))
	call SaveReal(HY,h,7,((UY)*1.))
	call SaveReal(HY,h,$D,((a)*1.))
	call SaveReal(HY,h,$D,((Atan2(SY-UY,SX-UX))*1.))
	call SaveUnitHandle(HY,h,2,(u))
	call SaveGroupHandle(HY,h,0,CreateGroup())
	call SaveInteger(HY,h,376,0)
	call SaveInteger(HY,h,$C,(R2I(ZAE(UX,UY,SX,SY)/ 3.)))
	call TriggerRegisterTimerEvent(t,.03,true)
	call TriggerAddCondition(t,Condition(function CHT))
	call SaveEffectHandle(HY,$AF,5,(AddSpecialEffectTarget("war3mapImported\\SkewerTuskGlow_1.mdx",u,"head")))
endfunction