//
//===========================================================================
//冲击波类
globals
    player DummyPlayer
endglobals

function WaveDamageEnumUnit takes unit whichUnit, unit targetUnit, integer damageType, real damageAmount, string funcName, integer level returns nothing
	call UnitDamageTarget(whichUnit, targetUnit, damageAmount, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_FIRE, WEAPON_TYPE_WHOKNOWS)
	if funcName != null then
		//set Wave_U = whichUnit
		//set Wave_Sou = targetUnit
		//set Wave_LV = level
		call ExecuteFunc(funcName)
	endif
endfunction

function WaveRunningActions takes nothing returns nothing
	local trigger trig = GetTriggeringTrigger()
	local integer iHandleId = GetHandleId(trig)
	local effect missileEffect = LoadEffectHandle(HT, iHandleId, 0)
	local real damage = LoadReal(HT, iHandleId, 0)
	local real angle = LoadReal(HT, iHandleId, 3)* bj_DEGTORAD
	local real speed = LoadReal(HT, iHandleId, 4)
	local real area = LoadReal(HT, iHandleId, 8)
	local unit spellUnit
	local unit firstUnit
	local group injuredUnitGroup
	local group targetUnitGroup
	local boolean b = LoadBoolean(HT, iHandleId, 10)
	local boolean funcEnd = false
	local integer damageType = LoadInteger(HT, iHandleId, 1)
	local string funcstr = LoadStr(HT, iHandleId, 0)
	local integer level = LoadInteger(HT, iHandleId, 5)
	local boolean isTimeEvent = GetTriggerEventId()== EVENT_GAME_TIMER_EXPIRED
	local real effectX
	local real effectY
	local real radius
	local real UnitAngleBetween
	if isTimeEvent then
        set effectX = CoordinateX(BlzGetLocalSpecialEffectX(missileEffect)+ speed * Cos(angle))
        set effectY = CoordinateY(BlzGetLocalSpecialEffectY(missileEffect)+ speed * Sin(angle))
        call MoveLocation(DummyLocation, effectX, effectY)
		call BlzSetSpecialEffectPosition(missileEffect, effectX, effectY, GetLocationZ(DummyLocation)+20)
		call SaveInteger(HT, iHandleId, 12, LoadInteger(HT, iHandleId, 12)+ 1)
		if LoadInteger(HT, iHandleId, 12)> LoadInteger(HT, iHandleId, 13) then
			set funcEnd = true
			call BlzSetSpecialEffectPosition(missileEffect,LoadReal(HT, iHandleId, 5), LoadReal(HT, iHandleId, 6),GetLocationZ(DummyLocation)+20)
		endif
		//else
		//	set firstUnit = GetTriggerUnit()
	endif
	if b then
		set injuredUnitGroup = LoadGroupHandle(HT, iHandleId, 2)
		set targetUnitGroup = CreateGroup()
		set effectX = BlzGetLocalSpecialEffectX(missileEffect)
		set effectY = BlzGetLocalSpecialEffectY(missileEffect)
		set radius = area + LoadReal(HT, iHandleId, 9) *(GetTriggerEvalCount(trig)- 1) + 100
		set spellUnit = LoadUnitHandle(HT, iHandleId, 5)
		call GroupEnumUnitsInRange(targetUnitGroup, effectX, effectY, radius, null)
		call GroupRemoveGroup(injuredUnitGroup, targetUnitGroup)
		set radius = radius - 100
        set DummyPlayer = GetOwningPlayer(spellUnit)
		loop
			set firstUnit = FirstOfGroup(targetUnitGroup)
			exitwhen firstUnit == null
			call GroupRemoveUnit(targetUnitGroup, firstUnit)
            if IsUnitEnemy(firstUnit, DummyPlayer)and UnitAlive(firstUnit)and not IsUnitType(firstUnit, UNIT_TYPE_STRUCTURE)and not IsUnitType(firstUnit, UNIT_TYPE_MAGIC_IMMUNE) then
                if IsUnitInRangeXY(firstUnit, effectX, effectY, radius) then
                    if GetTriggerEvalCount(trig) < 3 then
                        set angle = LoadReal(HT, iHandleId, 3)
                        set UnitAngleBetween = AngleBetweenXY(effectX, effectY, GetUnitX(firstUnit), GetUnitY(firstUnit))
                        if(angle - UnitAngleBetween <- 180.00) then
                            set angle =(angle - UnitAngleBetween + 360)
                        else
                            if(angle - UnitAngleBetween > 180.00) then
                                set angle = angle - UnitAngleBetween - 360
                            else
                                set angle = angle - UnitAngleBetween
                            endif
                        endif
                        set angle = RAbsBJ(angle)
                        if angle <= 120 then
                            call GroupAddUnit(injuredUnitGroup, firstUnit)
                            call WaveDamageEnumUnit(spellUnit, firstUnit, damageType, damage, funcstr, level)
                        endif
                    else
                        call GroupAddUnit(injuredUnitGroup, firstUnit)
                        call WaveDamageEnumUnit(spellUnit, firstUnit, damageType, damage, funcstr, level)
                    endif
                endif
            endif
		endloop
		call DestroyGroup(targetUnitGroup)
		if funcEnd then
			call DestroyGroup(injuredUnitGroup)
		endif
	elseif not isTimeEvent then
		call WaveDamageEnumUnit(LoadUnitHandle(HT, iHandleId, 5), firstUnit, damageType, damage, funcstr, level)
	endif
	if funcEnd then
		//call DestroyBoolExpr(LoadBooleanExprHandle(HT, iHandleId, 15))
		call FlushChildHashtable(HT, iHandleId)
		call DestroyTrigger(trig)
		call DestroyEffect(missileEffect)
	endif
	set firstUnit = null
	set missileEffect = null
	set trig = null
	set injuredUnitGroup = null
	set targetUnitGroup = null
	set spellUnit = null
endfunction

//如果参数area和range的值一样，为矩形冲击波，每次选取的范围一样.range＞area则像食腐蜂群。
//单位释放冲击波 - 使用特效来作为投射物 (不建议过远)
//func可以填null,则没有特殊效果,filter如果null则是无差别伤害.
function WaveByEffect takes unit whichUnit, effect missileEffect, real damage, real maxDistance, real area, real range, real startX, real startY, real targetX, real targetY, real missileSpeed returns nothing
	local trigger trig = CreateTrigger()
	local integer iHandleId = GetHandleId(trig)
	local real angle = AngleBetweenXY(startX, startY, targetX, targetY)
	local real interval = 0.02
	local real speed = missileSpeed * interval
	local integer maxEvalCount = R2I(maxDistance / speed)+ 1
    call BlzSetSpecialEffectScale(missileEffect ,1.5)
    call BlzSetSpecialEffectColor(missileEffect, 255, 0, 0)
	call BlzSetSpecialEffectRoll(missileEffect, angle)
	call SaveEffectHandle(HT, iHandleId, 0, missileEffect)
	call SaveReal(HT, iHandleId, 0, damage)
	call SaveUnitHandle(HT, iHandleId, 5, whichUnit)
	call SaveReal(HT, iHandleId, 1, maxDistance)
	call SaveReal(HT, iHandleId, 2, range)
	call SaveReal(HT, iHandleId, 3, angle)
	call SaveReal(HT, iHandleId, 4, speed)
	call SaveInteger(HT, iHandleId, 13, maxEvalCount)
	call TriggerRegisterTimerEvent(trig, interval, true)
	call TriggerRegisterTimerEvent(trig, 0, false)
	call TriggerAddCondition(trig, Condition(function WaveRunningActions))
	call SaveReal(HT, iHandleId, 8, area)
	call SaveReal(HT, iHandleId, 9,(range - area)/ I2R(maxEvalCount))
	call SaveGroupHandle(HT, iHandleId, 2, CreateGroup())
	call SaveBoolean(HT, iHandleId, 10, true)
	call BlzSetSpecialEffectPosition(missileEffect, CoordinateX(startX + area / 2. * Cos(angle * bj_DEGTORAD)), CoordinateY(startY + area / 2. * Sin(angle * bj_DEGTORAD)), 0)
	call SaveReal(HT, iHandleId, 5, CoordinateX(BlzGetLocalSpecialEffectX(missileEffect)+ maxDistance * Cos(angle * bj_DEGTORAD)))
	call SaveReal(HT, iHandleId, 6, CoordinateY(BlzGetLocalSpecialEffectY(missileEffect)+ maxDistance * Sin(angle * bj_DEGTORAD)))
	//call SaveInteger(HT, iHandleId, 1, damageType)
	//call SaveBoolean(HT, iHandleId, 0, b)
	//if func != null then
	//	call SaveStr(HT, iHandleId, 0, func)
	//	call SaveInteger(HT, iHandleId, 5, level)
	//endif
	set trig = null
endfunction

