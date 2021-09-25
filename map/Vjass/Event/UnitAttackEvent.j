
scope UnitAttackEvent initializer Init

    //获取暴击光环等级 因为获取不了Buff等级 只能通过不同的魔法效果来判断等级
    function GetCriticalStrikeAuraLevel takes unit u returns integer
        if GetUnitAbilityLevel(u,'Blc6') == 1 then
            return 4
        elseif GetUnitAbilityLevel(u,'Blc5') == 1 then
            return 3
        elseif GetUnitAbilityLevel(u,'Blc4') == 1 then
            return 2
        elseif GetUnitAbilityLevel(u,'Blc3') == 1 then
            return 1
        endif
        return 0
    endfunction

    //得到单位的暴击伤害值(倍率) 无则为0.
    function GetCriticalStrikeDamage takes unit attacker returns real
        local real damage = 0.
        local integer lv
        if EffectIsEnabled[1] then
            set lv = GetCriticalStrikeAuraLevel(attacker)
            if lv > 0 then
                if PrdRandom(attacker, 'Alc3', 15) then //概率
                    set damage = damage + (lv * 0.1 + 0.1) //括号里的值为此暴击的倍率
                endif
            endif
        endif
        if damage != 0. then
            call SetUnitAnimation(attacker, "Attack slam") //播放暴击动画
            call QueueUnitAnimation(attacker, "Stand Ready") //不把Stand Ready加入队列的话 动作会很僵硬
        endif
        return damage
    endfunction

    //模拟
    private function UnitAttack takes unit whichUnit, unit target, boolean isAttack returns nothing
        local real amount = GetUnitState(whichUnit, UNIT_STATE_ATTACK1_DAMAGE_BASE) + GetUnitState(whichUnit, UNIT_STATE_ATTACK1_DAMAGE_DICE) * GetRandomInt(1, R2I(GetUnitState(whichUnit, UNIT_STATE_ATTACK1_DAMAGE_SIDE)) )
        local integer weapon_type = R2I(GetUnitState(whichUnit, UNIT_STATE_ATTACK1_ATTACK_TYPE)) //获取攻击类型
        call UnitDamageTarget(whichUnit, target, amount, isAttack, false, ConvertAttackType(weapon_type), DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
    endfunction

    function GeminateAttackMissileForward takes nothing returns boolean
        local trigger t = GetTriggeringTrigger()
        local integer h = GetHandleId(t)
        local effect missile = LoadEffectHandle(HT, h, 13)
        local unit whichUnit = LoadUnitHandle(HT, h, 11)
        local unit target = LoadUnitHandle(HT, h, 12)
        local real speed = LoadReal(HT, h, 24)

        local real x1 = EXGetEffectX(missile)
        local real y1 = EXGetEffectY(missile)
        local real x2 = GetUnitX(target)
        local real y2 = GetUnitY(target)
        local real angle //角度动态计算
        local real distance
        local real z = EXGetEffectZ(missile)
        local integer count = GetTriggerEvalCount(t)
        local boolean b = LoadBoolean(HT, h, 20)
        local real centre
        if b then
            set angle = AngleBetweenXY(x1, y1, x2, y2)
        else 
            if x2 != LoadReal(HT, h, 20) or y2 != LoadReal(HT, h, 21) then
                call SaveBoolean(HT, h, 20, true)
                call EXSetEffectZ(missile, LoadReal(HT, h, 22))
            endif
            set angle = LoadReal(HT, h, 50)
            set centre = LoadReal(HT, h , 53)
            set z = LoadReal(HT, h, 54) - (count - centre)*(count - centre)
            call EXSetEffectZ(missile, z)
            call EXEffectMatReset(missile)
            call EXEffectMatRotateY(missile, Atan2(z, angle))
        endif

        set x1 = x1 + speed * Cos(angle * bj_DEGTORAD)
        set y1 = y1 + speed * Sin(angle * bj_DEGTORAD)
        set distance = GetDistanceBetween(x1, y1, x2, y2)
        call EXSetEffectXY(missile, x1, y1)


        if distance <= speed then
            call DestroyEffect(missile)
            call UnitAttack(whichUnit, target, LoadBoolean(HT, h, 10))
            call FlushChildHashtable(HT, h)
            call ClearTrigger(t)
        endif
        set t = null
        set missile = null
        set whichUnit = null
        set target = null
        return false
    endfunction

    function GeminateAttackLaunch takes nothing returns boolean
        local trigger t = GetTriggeringTrigger()
        local integer h = GetHandleId(t)
        local unit whichUnit = LoadUnitHandle(HT, h, 11) //
        local unit target = LoadUnitHandle(HT, h, 12) //攻击目标
        local real x1 = GetUnitX(whichUnit)
        local real y1 = GetUnitY(whichUnit)
        local real x2 = GetUnitX(target)
        local real y2 = GetUnitY(target)
        local integer unitId = GetUnitTypeId(whichUnit)
        local boolean isAttack = LoadBoolean(HT, h, 10) //是否属于物理攻击 是则会遍历攻击特效
        local string missileArt = GetUnitSlkData(unitId, "Missileart") //弹道模型
        local effect missile = AddSpecialEffect(missileArt, x1, y1) //特效模拟弹道
        local real z = EXGetEffectZ(missile) + 70 // 10为默认值 似乎每个模型的攻击出手点Z轴高度并不一致
        local real missilespeed = S2R(GetUnitSlkData(unitId, "Missilespeed"))
        local real scale = S2R(GetUnitSlkData(unitId, "modelScale")) //弹道缩放和模型缩放一致
        local real arc = GetUnitState(whichUnit, UNIT_STATE_ATTACK1_BACK_SWING) + 1 //弧度
        local real angle = AngleBetweenXY(x1, y1, x2, y2) //角度
        local real distance = GetDistanceBetween(x1, y1, x2, y2)  //距离
        local real maxheight = z * arc //* ( distance * 0.5 )  //最大高度
        local real maxcount = R2I( (distance / (missilespeed * 0.04) ))  //最大赋值次数
        local real upheight = maxheight / maxcount //每次上升高度
        call FlushChildHashtable(HT, h)
        call ClearTrigger(t)

        set t = CreateTrigger()
        set h = GetHandleId(t)
        call TriggerRegisterTimerEvent(t, 0.04, true)
        call TriggerAddCondition(t, Condition(function GeminateAttackMissileForward) )


        call EXSetEffectZ(missile, z) 
        call EXSetEffectSize(missile, scale)
        call SaveBoolean(HT, h, 10, isAttack)
        call SaveUnitHandle(HT, h, 11, whichUnit)
        call SaveUnitHandle(HT, h, 12, target)
        call SaveEffectHandle(HT, h, 13, missile)
        call SaveReal(HT, h, 20, x2)
        call SaveReal(HT, h, 21, y2)
        call SaveReal(HT, h, 22, z)
        call SaveReal(HT, h, 23, arc)
        call SaveReal(HT, h, 24, missilespeed * 0.04 ) //每次前进的距离
        call SaveReal(HT, h, 30, 0)
        call SaveReal(HT, h, 50, angle)
        call SaveReal(HT, h, 51, maxcount)
        call SaveReal(HT, h, 52, upheight)
        call SaveReal(HT, h, 53, maxcount * 0.5)
        call SaveReal(HT, h, 54, maxheight)


        call TriggerEvaluate(t)
	
        set t = null
        set whichUnit = null
        set target = null
        set missile = null
        return false
    endfunction

    // 模拟连击
    function GeminateAttack takes unit whichUnit, unit target, real time, boolean isAttack returns nothing
        local trigger t
        local integer h
        if time > 0 then
            set t = CreateTrigger()
            set h = GetHandleId(t)
            call TriggerAddCondition(t, Condition(function GeminateAttackLaunch))
            call TriggerRegisterTimerEvent(t, time, false)
            call SaveUnitHandle(HT, h, 11, whichUnit)
            call SaveUnitHandle(HT, h, 12, target)
            call SaveBoolean(HT, h, 10, isAttack)
            set t = null
        else
            call UnitAttack(whichUnit, target, isAttack)
        endif

    endfunction

    function AttackReadyToGoInitActions takes nothing returns boolean
        local trigger trig = GetTriggeringTrigger()
        local integer th = GetHandleId(trig)
        local timer t = LoadTimerHandle(HT, th, 10)
        local unit whichUnit = LoadUnitHandle(HT, th, 17)
        local unit target = LoadUnitHandle(HT, th, 18)
        if GetTriggerEventId() == EVENT_GAME_TIMER_EXPIRED then
            //call GeminateAttack(whichUnit, target, 1, true)
        endif
        //call FlushChildHashtable(HT, th)
        //call RemoveSavedHandle(UnitKeyBuff, GetHandleId(u), AttackReadyTrg)
        //--call ClearTrigger(trig)
        call PauseTimer(t)
        set trig = null
        set whichUnit = null
        set target = null
        set t = null
        return false
    endfunction

    private function AttackReadyToGoInit takes unit u, unit target, integer h returns nothing
        local trigger trig
        local timer t
        local integer th
        if HaveSavedHandle(UnitKeyBuff, h, AttackReadyTrg) then
            set trig = LoadTriggerHandle(UnitKeyBuff, h, AttackReadyTrg)
            set th = GetHandleId(trig)
            set t = LoadTimerHandle(HT, th, 10)
        else
            set trig = CreateTrigger()
            set th = GetHandleId(trig)
            set t = CreateTimer()
            call FlushChildHashtable(HT, th)
            call SaveUnitHandle(HT, th, 17, u)
            call SaveTimerHandle(HT, th, 10, t)
            call TriggerRegisterDeathEvent(trig, u)
            call TriggerRegisterUnitEvent(trig, u, EVENT_UNIT_ISSUED_ORDER)
            call TriggerRegisterUnitEvent(trig, u, EVENT_UNIT_ISSUED_TARGET_ORDER)
            call TriggerRegisterUnitEvent(trig, u, EVENT_UNIT_ISSUED_POINT_ORDER)
            call TriggerRegisterTimerExpireEvent(trig, t)
            call TriggerAddCondition(trig, Condition(function AttackReadyToGoInitActions))
            call SaveTriggerHandle(UnitKeyBuff, h, AttackReadyTrg, trig)
        endif
        call SaveUnitHandle(HT, th, 18, target)
        call TimerStart(t, S2R(GetUnitSlkData(GetUnitTypeId(u), "dmgpt1")) / RMinBJ(GetUnitState(u, UNIT_STATE_RATE_OF_FIRE), 5. ), false, null)
        set trig = null
        set t = null
    endfunction

    //任意单位被攻击
    private function UnitAttackedActions takes nothing returns boolean
        local unit targetUnit = GetTriggerUnit() //被攻击单位 目标单位
        local unit attackerUnit = GetAttacker() //攻击单位
        local integer h = GetHandleId(attackerUnit)
        call SaveUnitHandle(UnitKeyBuff, h, AttackTarget, targetUnit)
        if EffectIsEnabled[0] then //暴击运算
            if CommonAttackEffectFilter(attackerUnit, targetUnit) then
                call SaveReal(UnitKeyBuff, h, CriticalStrikeDamage, GetCriticalStrikeDamage(attackerUnit))
            endif
        endif
        //捕捉弹道出手
        if IsUnitIdType(GetUnitTypeId(attackerUnit), UNIT_TYPE_RANGED_ATTACKER) then
            call AttackReadyToGoInit(attackerUnit, targetUnit, h)
        endif
        set attackerUnit = null
        set targetUnit = null
        return false
    endfunction

    private function Init takes nothing returns nothing
        local trigger trig = CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_ATTACKED)
        call TriggerAddCondition(trig, Condition(function UnitAttackedActions))
        set trig = null
    endfunction

endscope

