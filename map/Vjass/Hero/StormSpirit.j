
scope StormSpirit

    globals
        private key HaveOverload
        private key OverloadEffectRight
        private key OverloadEffectLeft
    endglobals

    private function BallLightningMove takes nothing returns nothing
        local trigger t = GetTriggeringTrigger()
        local integer h = GetHandleId(t)
        local real distance = LoadReal(HT, h, 0) //为前进距离
        local unit u = LoadUnitHandle(HT, h, 10) //技能释放者
        local unit d1 = LoadUnitHandle(HT, h, 11) //风暴之灵滚动马甲
        local unit d2 = LoadUnitHandle(HT, h, 12)
        local lightning light = LoadLightningHandle(HT, h, 21) //球状闪电
        local real x1 = GetUnitX(u)
        local real y1 = GetUnitY(u)
        //前进方向 需要动态计算 因为可能会因为多次释放导致过头
        local real a = Atan2(LoadReal(HT, h, 9) - y1, LoadReal(HT, h, 8) - x1)
        local real x2 = x1 +(distance)* Cos(a)
        local real y2 = y1 +(distance)* Sin(a)
        local real mana = GetUnitState(u, UNIT_STATE_MANA)
        local real cost = (distance)*(12 + .007 * GetUnitState(u, UNIT_STATE_MAX_MANA)) * 0.01
        local integer count = LoadInteger(HT, h, 30)

        set count = count - 1
        if count == 0 or GetUnitState(u, UNIT_STATE_MANA) < 1 or not UnitAlive(u) then
            call SetUnitFlyHeight(u, 0, 0)
            call SetUnitPathing(u, true)
            //call SetUnitPosition(u, x2, y2)
            call DestroyLightning(light)
            call DestroyEffect(LoadEffectHandle(HT, h, 32))
            call RemoveUnit(d1)
            call RemoveUnit(d2)
            call FlushChildHashtable(HT, h)
            call ClearTrigger(t)
            //逆变身 暂时不用 会导致单位特效丢失
            //set h = GetHandleId(u)
            //set count = LoadInteger(UnitKeyBuff, BallLightningCount, h) - 1
            //call SaveInteger(UnitKeyBuff, BallLightningCount, h, count)
            //if count == 0 then //计数为0则逆变身回正常状态
            //	call YDWEUnitTransform(u, 'HI02')
            //endif
        else //开始移动	
            call SetUnitX(u, x2)
            call SetUnitY(u, y2)
            call SetUnitX(d1, x2)
            call SetUnitY(d1, y2)
            call SetUnitX(d2, x2)
            call SetUnitY(d2, y2)
            if GetTriggerEvalCount(t)> 25 then //移动闪电
                set x1 = LoadReal(HT, h, 6) + distance * Cos(a)
                set y1 = LoadReal(HT, h, 7) + distance * Sin(a)
                call SaveReal(HT, h, 6, x1 * 1.)
                call SaveReal(HT, h, 7, y1 * 1.)
            else
                set x1 = LoadReal(HT, h, 6)
                set y1 = LoadReal(HT, h, 7)
            endif

            call MoveLightning(light, true, x1, y1, x2, y2)
            call SetUnitState(u, UNIT_STATE_MANA, RMaxBJ(mana - cost, 0))
            call SaveInteger(HT, h, 30, count)
        endif
        call KillDestructablesInCircle(x2, y2, 75) //会破坏75码范围内的可破坏物
        set light = null
        set u = null
        set d1 = null
        set d2 = null
        set t = null
    endfunction



    function BallLightning takes nothing returns nothing
        local real x1 = GetUnitX(M_GetSpellAbilityUnit())
        local real y1 = GetUnitY(M_GetSpellAbilityUnit())
        local real x2
        local real y2
        local lightning light
        local real distance
        local unit d1
        local unit d2
        local trigger t
        local integer h
        local integer lv = M_GetSpellAbilityLevel()
        local player p = GetOwningPlayer(M_GetSpellAbilityUnit())
        //local real mana = GetUnitState(u, UNIT_STATE_MANA)
        //local real cost = 30 + .06 * GetUnitState(u, UNIT_STATE_MAX_MANA)
        //call SetUnitState(u, UNIT_STATE_MANA, RMaxBJ(mana -cost, 0))
        set t = CreateTrigger()
        //set h = GetHandleId(M_GetSpellAbilityUnit()) //计数 + 1
        //call SaveInteger(UnitKeyBuff, BallLightningCount, h, LoadInteger(UnitKeyBuff, BallLightningCount, h) + 1 )
        //call YDWEUnitTransform(M_GetSpellAbilityUnit(), 'HIM2')
        set h = GetHandleId(t)
        set d1 = CreateUnit(p,'nsbl', x1, y1, 0) //滚动风暴之灵
        set d2 = CreateUnit(p,'npn5', x1, y1, 0) //似乎是用来发出声音的

        call SetUnitVertexColor(d2, 255, 255, 255, 0)
        set p = null
        //set MNR = CreateUnit(GetOwningPlayer(u),'npn5', ux, uy, 0)
        set light = AddLightning("FORK", true, x1, y1, x1, y1)
        if M_GetSpellAbilityUnit() == null then
            set x2 = M_GetSpellTargetX()
            set y2 = M_GetSpellTargetY()
        else
            set x2 = GetUnitX(M_GetSpellAbilityUnit())
            set y2 = GetUnitY(M_GetSpellAbilityUnit())
        endif
        //
        call UnitAddAbility(M_GetSpellAbilityUnit(), 'Amrf')
        call UnitRemoveAbility(M_GetSpellAbilityUnit(), 'Amrf')
        call SetUnitFlyHeight(M_GetSpellAbilityUnit(), 9999, 0)
        //
        call SetUnitPathing(M_GetSpellAbilityUnit(), false)
        call SetUnitPathing(d1, false)
        set distance = GetDistanceBetween(x2, y2, x1, y1)
        if distance < ( 25 + 25 * lv ) then
            call SaveReal(HT, h, 0, distance)
        else
            call SaveReal(HT, h, 0, 25 + 25 * lv)
        endif
        //call SaveReal(HT, h, 5, Atan2(y2 -y1, x2 -x1))
        call SaveReal(HT, h, 6, x1 * 1.)
        call SaveReal(HT, h, 7, y1 * 1.)
        call SaveReal(HT, h, 8, x2 * 1.) //似乎没有必要储存技能释放点 但需要动态计算朝向
        call SaveReal(HT, h, 9, y2 * 1.) //已经预存了前进次数和前进方向
        call SaveUnitHandle(HT, h, 10, M_GetSpellAbilityUnit())
        call SaveUnitHandle(HT, h, 11, d1)
        call SaveUnitHandle(HT, h, 12, d2)
        call SaveLightningHandle(HT, h, 21, light)
        //call SaveInteger(HT, h, 40, lv) //不需要存技能等级
        call SaveInteger(HT, h, 30, (IMaxBJ(R2I( SquareRoot((x2 - x1)*(x2 - x1)+(y2 - y1)*(y2 - y1))/(25 + 25 * lv)), 1)) )
        call SaveEffectHandle(HT, h, 32,(AddSpecialEffectTarget("effects\\Lightning_Ball_Tail_FX.mdx", d2, "origin")))
        call TriggerRegisterTimerEvent(t, .04, true)
        call TriggerAddCondition(t, Condition(function BallLightningMove))
        set light = null
        set t = null
        set d1 = null
        set d2 = null
    endfunction

    private function ElectricVortexTow takes nothing returns boolean
        local trigger t = GetTriggeringTrigger()
        local integer h = GetHandleId(t)
        local unit target = LoadUnitHandle(HT, h, 17)
        local real a = LoadReal(HT, h, 11)
        local real tx = GetUnitX(target)- 5 * Cos(a)
        local real ty = GetUnitY(target)- 5 * Sin(a)
        local real x = LoadReal(HT, h, 6)
        local real y = LoadReal(HT, h, 7)
        if (x - tx)*(x - tx)+(y - ty)*(y - ty) < 100 then
            set tx = x
            set ty = y
        endif
        call SetUnitX(target, tx)
        call SetUnitY(target, ty)
        if GetTriggerEvalCount(t)== (LoadInteger(HT, h, 5)) or GetTriggerEventId()== EVENT_WIDGET_DEATH then
            call FlushChildHashtable(HT, h)
            call ClearTrigger(t)
        endif
        set t = null
        set target = null
        return false
    endfunction

    private function ElectricVortex_Fx takes unit u, unit target, integer lv returns nothing
        local trigger t = CreateTrigger()
        local integer h = GetHandleId(t)
        local real x = GetUnitX(u)
        local real y = GetUnitY(u)
        local real tx = GetUnitX(target)
        local real ty = GetUnitY(target)
        local unit du = CreateUnit(GetOwningPlayer(u),'nstd', x, y, GetUnitFacing(u))

        call TriggerRegisterTimerEvent(t, .05, true)
        call TriggerRegisterDeathEvent(t, target)
        call TriggerAddCondition(t, Condition(function ElectricVortexTow))

        call SaveUnitHandle(HT, h, 17, target)
        call SaveInteger(HT, h, 5, 10 + 10 * lv)
        call SaveReal(HT, h, 6, x)
        call SaveReal(HT, h, 7, y)
        call SaveReal(HT, h, 11, Atan2(ty - y, tx - x))
        call UnitSetLeash(du, target, "CLPB", 0, 'Ab03', 'Bmlt', 3, 2, 0, false)
        //call DamageUnit(u, target, 1 , 20)
        call UnitApplyTimedLife(du, 'BTLF', 1 + .5 * lv)
        set du = null
        set t = null
    endfunction

    //电子涡流
    function ElectricVortex takes nothing returns nothing
        if not HaveSpellShield(M_GetSpellAbilityUnit()) then
            call ElectricVortex_Fx(M_GetSpellAbilityUnit(), M_GetSpellAbilityUnit(), M_GetSpellAbilityLevel())
        endif
    endfunction


    //残影动作 造成伤害或持续时间到期
    private function StaticRremnantActions takes nothing returns boolean
        local trigger t = GetTriggeringTrigger()
        local integer h = GetHandleId(t)
        local trigger effT = LoadTriggerHandle(HT, h, 9) //特效触发器用于给残影添加特效
        local integer effH = GetHandleId(effT)
        local unit shadow = LoadUnitHandle(HT, h, 30)
        local group g = null
        local unit u = null
        local real x
        local real y
        local integer damage
        if GetTriggerEventId()== EVENT_UNIT_DEATH then
            call ShowUnit(shadow, false)
            call KillUnit(shadow)
            call FlushChildHashtable(HT, h)
            call ClearTrigger(t)
            call FlushChildHashtable(HT, effH)
            call ClearTrigger(effT)
        else
            set P2 = GetOwningPlayer(shadow)
            if Enemy_Alive_NoStructure_NoImmune(GetTriggerUnit()) then
                set x = GetUnitX(shadow)
                set y = GetUnitY(shadow)
                set u = LoadUnitHandle(HT, effH, 10)
                set damage = 100 + 40 * LoadInteger(HT, effH, 50) // 残影爆炸伤害
                //在单位死亡前从哈希表从获取数据 单位死亡哈希表就清空了
                call ShowUnit(shadow, false)
                call KillUnit(shadow)
                call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\Bolt\\BoltImpact.mdl", x, y))
                call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\Bolt\\BoltImpact.mdl", x, y))
                set shadow = u
                set g = LoginGroup()
                call GroupEnumUnitsInRange(g, x, y, 285, null)
                loop
                    set u = FirstOfGroup(g)
                    exitwhen u == null
                    if Enemy_Alive_NoStructure_NoImmune(u) then
                        call DamageUnit(shadow, u, 1, damage)
                        call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\ChimaeraLightningMissile\\ChimaeraLightningMissile.mdl", GetUnitX(u), GetUnitY(u)))
                    endif
                    call GroupRemoveUnit(g, u)
                endloop
                call LogoutGroup(g)
                call FlushChildHashtable(HT, h)
                call ClearTrigger(t)
                call FlushChildHashtable(HT, effH)
                call ClearTrigger(effT)
                set g = null
                set u = null
            endif
        endif
        set t = null
        set effT = null
        set shadow = null
        return false
    endfunction

    //创建残影 有0.5s的延迟出现 1.0s延迟生效
    private function CreateStaticRremnant takes nothing returns boolean
        local trigger t = GetTriggeringTrigger()
        local integer h = GetHandleId(t)
        local trigger newT
        local integer newH
        local integer c = GetTriggerEvalCount(t)
        local unit shadow
        if c == 1 then
            call DestroyEffect(LoadEffectHandle(HT, h, 20))
        elseif c == 2 then
            call DestroyEffect(LoadEffectHandle(HT, h, 21))
            set newT = CreateTrigger()
            set newH = GetHandleId(newT)
            //创建残影
            set shadow = CreateUnit(GetOwningPlayer(LoadUnitHandle(HT, h, 10)),'npn2', LoadReal(HT, h, 1), LoadReal(HT, h, 2), LoadReal(HT, h, 3))
            call SetUnitVertexColor(shadow, 255, 255, 255, 100)
            call UnitApplyTimedLife(shadow, 'BHwe', 12)
            call SaveUnitHandle(HT, h, 30, shadow)
            call SaveUnitHandle(HT, newH, 30, shadow)
            call SaveTriggerHandle(HT, newH, 9 , t)
            call TriggerRegisterUnitInRange(newT, shadow, 235, null) //残影触发范围
            call TriggerRegisterUnitEvent(newT, shadow, EVENT_UNIT_DEATH)
            call TriggerAddCondition(newT, Condition(function StaticRremnantActions))
            //else c > 2 then
        else
            call DestroyEffect(AddSpecialEffectTarget("effects\\ManaFlareBoltImpact_NoSound.mdx", LoadUnitHandle(HT, h, 30), "origin"))
        endif
        set t = null
        set newT = null
        set shadow = null
        return false
    endfunction

    //风暴之灵 - 残影
    function StaticRremnant takes nothing returns nothing

        local integer h = CreateTimerEventTrigger(0.5, true, function CreateStaticRremnant)
        local real x = GetUnitX(M_GetSpellAbilityUnit())
        local real y = GetUnitY(M_GetSpellAbilityUnit())
        call SaveInteger(HT, h, 50, M_GetSpellAbilityLevel())
        call SaveReal(HT, h, 1, (x)* 1.)
        call SaveReal(HT, h, 2, (y)* 1.)
        call SaveReal(HT, h, 3, GetUnitFacing(M_GetSpellAbilityUnit())* 1.)
        call SaveUnitHandle(HT, h, 10, M_GetSpellAbilityUnit() )
        call SaveEffectHandle(HT, h, 20,(AddSpecialEffect("Abilities\\Spells\\Orc\\LightningShield\\LightningShieldTarget.mdl", x, y)))
        call SaveEffectHandle(HT, h, 21,(AddSpecialEffect("effects\\Static_Remnant_FX.mdx", x, y)))

    endfunction

    
    //超负荷
    function OverLoadActions takes nothing returns nothing
        local integer h = GetHandleId(Tmp_DamageSource)
        local group g = LoginGroup()
        local unit u = Tmp_DamageInjured
        local real damage = GetUnitAbilityLevel(Tmp_DamageSource, 'Ast3') * 20 + 10
        call SaveInteger(UnitKeyBuff,  h, HaveOverload, 0)
        call DestroyEffect(LoadEffectHandle(UnitKeyBuff, h, OverloadEffectLeft))
        call DestroyEffect(LoadEffectHandle(UnitKeyBuff, h, OverloadEffectRight))
        call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl", GetUnitX(u), GetUnitY(u)))
	
        set P2 = GetOwningPlayer(Tmp_DamageSource)
        call GroupEnumUnitsInRange(g, GetUnitX(u) , GetUnitY(u), 300, null)
        loop
            set u = FirstOfGroup(g)
            exitwhen u == null //造成法术攻击 魔法伤害
            if Enemy_Alive_NoStructure(u) then
                call DamageUnit(Tmp_DamageSource, u, 1, damage)
                call UnitAddAbilityTimed(u, 'ANol', 1, 0.6, 'BSts', 2)
                call GroupRemoveUnit(g, u)
            endif
        endloop
        call LogoutGroup(g)
        set g = null
        set u = null
    endfunction

    function OverLoad_Filter takes nothing returns boolean
        if LoadInteger(UnitKeyBuff, GetHandleId(Tmp_DamageSource), HaveOverload) == 1 then
            call OverLoadActions()
        endif
        return false
    endfunction

    function AddOverLoad takes nothing returns boolean//添加超负荷
        local unit u = GetTriggerUnit()
        local integer h = GetHandleId(u)
        if LoadInteger(UnitKeyBuff, h, HaveOverload) == 0 then
            call SaveInteger(UnitKeyBuff, h, HaveOverload, 1)
            call SaveEffectHandle(UnitKeyBuff, h, OverloadEffectRight,(AddSpecialEffectTarget("Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl", u, "right hand")))
            call SaveEffectHandle(UnitKeyBuff, h, OverloadEffectLeft, (AddSpecialEffectTarget("Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl", u, "left hand")))
        endif
        set u = null
        return false
    endfunction

    //注册超负荷攻击以及施法事件
    function OverloadLearn1 takes nothing returns nothing
        local trigger t = CreateTrigger()
        local unit u = GetTriggerUnit()
        call TriggerRegisterUnitEvent(t, u, EVENT_UNIT_SPELL_EFFECT)
        call TriggerAddCondition(t, Condition( function AddOverLoad))

        set t = CreateTrigger()
        call TriggerAddCondition(t, Condition( function OverLoad_Filter))
        call TriggerRegisterAnyUnitDamagedEvent(t, 1)
        set u = null
        set t = null
    endfunction


endscope


