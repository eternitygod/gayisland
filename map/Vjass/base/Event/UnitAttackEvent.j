
library UnitAttackEvent initializer Init requires base

    globals
        constant key UNIT_ATTACK_EVENT_ATTACK_TARGET //攻击目标 用于判断与攻击事件
        //constant integer AttackReadyTrg = - 101 //捕捉远程攻击弹道出手的触发器
        //constant integer AttackReadyTimer = - 102 //捕捉远程攻击弹道出手的计时器
        constant key UNIT_ATTACK_EVENT_CRITICAL_STRIKE_VALUE //暴击伤害的Key
    endglobals
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
                if GetPrdRandom(attacker, 'Alc3', 15) then //概率
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

    // 模拟一次攻击
    private function UnitAttack takes unit whichUnit, unit target, boolean isAttack returns nothing
        local real amount = GetUnitState(whichUnit, UNIT_STATE_ATTACK1_DAMAGE_BASE) + GetUnitState(whichUnit, UNIT_STATE_ATTACK1_DAMAGE_DICE) * GetRandomInt(1, R2I(GetUnitState(whichUnit, UNIT_STATE_ATTACK1_DAMAGE_SIDE)) )
        local integer weapon_type = R2I(GetUnitState(whichUnit, UNIT_STATE_ATTACK1_ATTACK_TYPE)) //获取攻击类型
        call UnitDamageTarget(whichUnit, target, amount, isAttack, false, ConvertAttackType(weapon_type), DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
    endfunction

    function SetUnitAttackTarget takes integer iHandleId, unit targetUnit returns nothing
        call SaveUnitHandle(DynamicData, iHandleId, UNIT_ATTACK_EVENT_ATTACK_TARGET, targetUnit)
    endfunction

    function GetUnitAttackTarget takes integer iHandleId returns unit
        return LoadUnitHandle(DynamicData, iHandleId, UNIT_ATTACK_EVENT_ATTACK_TARGET)
    endfunction

    function SetUnitCriticalStrike takes integer iHandleId, real value returns nothing
        call SaveReal(DynamicData, iHandleId, UNIT_ATTACK_EVENT_CRITICAL_STRIKE_VALUE, value)
    endfunction

    function GetUnitCriticalStrike takes integer iHandleId returns real
        return LoadReal(DynamicData, iHandleId, UNIT_ATTACK_EVENT_CRITICAL_STRIKE_VALUE)
    endfunction

    //任意单位被攻击
    private function UnitAttackedActions takes nothing returns boolean
        local unit targetUnit = GetTriggerUnit() //被攻击单位 目标单位
        local unit attackerUnit = GetAttacker() //攻击单位
        local integer h = GetHandleId(attackerUnit)
        call SetUnitAttackTarget( h, targetUnit )
        if EffectIsEnabled[0] then //暴击运算
            if CommonAttackEffectFilter(attackerUnit, targetUnit) then
                call SetUnitCriticalStrike( h, GetCriticalStrikeDamage( attackerUnit ) )
            endif
        endif
        //捕捉弹道出手
        if IsUnitIdType(GetUnitTypeId(attackerUnit), UNIT_TYPE_RANGED_ATTACKER) then
            // call AttackReadyToGoInit(attackerUnit, targetUnit, h)
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

endlibrary

