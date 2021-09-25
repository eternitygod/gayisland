

scope Pudge

    private function MeatHook_Filter takes nothing returns boolean
        return Alive_NoStructure(GetFilterUnit())
    endfunction
    
    private function MeatHook_Return takes nothing returns boolean
        local trigger t = GetTriggeringTrigger()
        local integer h = GetHandleId(t)
        local unit target = LoadUnitHandle(HT, h, 5)
        local integer count = LoadInteger(HT, h, 21)
        local effect hook = LoadEffectHandle(HT, h, 2100 + count)
        local real x
        local real y
        if LoadBoolean(HT, h, 10) then
            set x = EXGetEffectX(hook)
            set y = EXGetEffectY(hook)
            call SetUnitX(target, x)
            call SetUnitY(target, y)
            if ModuloInteger(GetTriggerEvalCount(t), 3) == 0 and LoadBoolean(HT, h, 11) then
                call M_UnitSetStun(target, 0.1, 0.1, true)
            endif
        endif
        call EXSetEffectZ(hook, - 999)
        call DestroyEffect(hook)
        set count = count - 1
        call SaveInteger(HT, h, 21, count)
        if count == 0 then
            call SetUnitPathing(target, true)
            call FlushChildHashtable(HT, h)
            call ClearTrigger(t)
        endif
        set t = null
        set hook = null
        return false
    endfunction
    
    private function Pudge_MeatHook_Move takes nothing returns boolean
        local trigger t = GetTriggeringTrigger()
        local integer h = GetHandleId(t)
        local unit u = LoadUnitHandle(HT, h, 10)
        local integer lv = LoadInteger(HT, h, 20)
        local real a
        local real x
        local real y
    
        local integer count = LoadInteger(HT, h, 21)
        local real maxcount = 30 + 5 * lv
        local real range = 75
    
        local unit target
        local group g
        local effect hook
        local trigger rt = LoadTriggerHandle(HT, h, 30)
        local integer rh = GetHandleId(rt)
        if count < maxcount then
            set count = count + 1
            call SaveInteger(HT, h, 21, count)
            set a = LoadReal(HT, h, 11)
            set x = GetUnitX(u) + count * 40 * Cos(a * bj_DEGTORAD)
            set y = GetUnitY(u) + count * 40 * Sin(a * bj_DEGTORAD)
            set hook = AddSpecialEffect("Abilities\\Weapons\\WardenMissile\\WardenMissile.mdl", x, y)
            call EXSetEffectSize(hook, 2.)
            call EXEffectMatRotateZ(hook, a)
            call EXSetEffectZ(hook, EXGetEffectZ(hook) + 25)
            call SaveEffectHandle(HT, rh, 2100 + count, hook)
            set hook = null
            set g = LoginGroup()
            call GroupEnumUnitsInRange(g, x, y, range, Condition(function MeatHook_Filter))
            call GroupRemoveUnit(g, u)
            set target = FirstOfGroup(g)
            if target == null then
                set target = GroupPickRandomUnit(g)
            endif
            call LogoutGroup(g)
            set g = null
            if target != null then
                call FlushChildHashtable(HT, h)
                call ClearTrigger(t)
                call TriggerRegisterTimerEvent(rt, .025, true)
                call TriggerRegisterDeathEvent(rt, target)
                call TriggerAddCondition(rt, Condition(function MeatHook_Return))
                call SetUnitPathing(target, false)
                call SaveInteger(HT, rh, 21, count)
                call SaveBoolean(HT, rh, 10, true)
                //call SaveBoolean(HT, rh, 11, IsUnitEnemy(u, GetOwningPlayer(target)))
                call SaveUnitHandle(HT, rh, 5, target)
                if IsUnitEnemy(target, GetOwningPlayer(u)) then
                    call DestroyEffect(AddSpecialEffectTarget("Objects\\Spawnmodels\\Human\\HumanBlood\\BloodElfSpellThiefBlood.mdl", target, "origin"))
                    call DamageUnit(u, target, 3, 50)
                endif
            endif
        else
            call FlushChildHashtable(HT, h)
            call ClearTrigger(t)
            call TriggerRegisterTimerEvent(rt, .025, true)
            call TriggerAddCondition(rt, Condition(function MeatHook_Return))
            call SaveInteger(HT, rh, 21, count)
        endif
    
        set t = null
        set u = null
        set target = null
        return false
    endfunction
    
    //技能函数不能为私有函数(因为函数名记录在哈希表内)
    function Pudge_MeatHook takes nothing returns nothing
        local integer h = CreateTimerEventTrigger(.025, true, function Pudge_MeatHook_Move)
        //前进方向
        local real a = AngleBetweenXY(GetUnitX(M_GetSpellAbilityUnit()), GetUnitY(M_GetSpellAbilityUnit()), M_GetSpellTargetX(), M_GetSpellTargetY())
        
        call SaveUnitHandle(HT, h, 10, M_GetSpellAbilityUnit())
        call SaveReal(HT, h, 11, a)
        call SaveInteger(HT, h, 20, M_GetSpellAbilityLevel())
        call SaveInteger(HT, h, 21, 0)
        call SaveTriggerHandle(HT, h, 30, CreateTrigger())
    
    endfunction
    
    private function Pudge_Rot_Action takes nothing returns boolean
        local trigger t = GetTriggeringTrigger()
        local integer h = GetHandleId(t)
        local unit u = LoadUnitHandle(HT, h, 10)
        local unit target
        local group g
        local real damage = 5
        local integer iTrigCount = GetTriggerEvalCount(t)
        local effect effSlow = LoadEffectHandle(HT, h, 0)
        if GetUnitAbilityLevel(u, 'Bpg2') == 1 then
            set g = LoginGroup()
            call GroupEnumUnitsInRange(g, GetUnitX(u), GetUnitY(u), 275, null) //250 + 25
            set P2 = GetOwningPlayer(u)
            loop
                set target = FirstOfGroup(g)
                exitwhen target == null
                if Enemy_Alive_NoStructure_NoImmune(target) then
                    call DamageUnit(u, target, 2, damage)
                endif
                call GroupRemoveUnit(g, target)
            endloop
            if ModuloInteger(iTrigCount, 2) == 0 then
                call DestroyEffect(effSlow)
                call SaveEffectHandle(HT, h, 0, AddSpecialEffectTarget("Abilities\\Spells\\Human\\slow\\slowtarget.mdl", u, "head"))
            endif
            call DamageUnit(u, u, 2, damage)
            call LogoutGroup(g)
            set g = null
            set target = null
        else
            call DestroyEffect(effSlow)
            call RemoveSavedHandle(UnitKeyBuff, GetHandleId(u), 'Bpg2')
            call FlushChildHashtable(HT, h)
            call ClearTrigger(t)
        endif
        set effSlow = null
        set u = null
        set t = null
        return false
    endfunction
    
    function Pudge_Rot takes nothing returns nothing
        local unit whichUnit = M_GetSpellAbilityUnit()
        local integer h = GetHandleId(whichUnit)
        local trigger trig
        if HaveSavedHandle(UnitKeyBuff, h, 'Bpg2') then
            set trig = LoadTriggerHandle(UnitKeyBuff, h, 'Bpg2')
            call UnitRemoveAbility(whichUnit, 'Ab05')
            call UnitRemoveAbility(whichUnit, 'Bpg2') //删除技能并立即运行一次触发 即可结束此触发
            call TriggerEvaluate(trig)
        else
            set trig = CreateTrigger()
            set h = GetHandleId(trig)
            call TriggerRegisterTimerEvent(trig, 0.1, true)
            call TriggerAddCondition(trig, Condition( function Pudge_Rot_Action))
            call SaveTriggerHandle(UnitKeyBuff, GetHandleId(whichUnit), 'Bpg2', trig)
            call SaveUnitHandle(HT, h, 10, whichUnit)
            call UnitAddPermanentAbility(whichUnit, 'Ab05')
            call SaveEffectHandle(HT, h, 0, AddSpecialEffectTarget("Abilities\\Spells\\Human\\slow\\slowtarget.mdl", whichUnit, "head"))
            //call TriggerEvaluate(trig)
        endif
        set trig = null
        set whichUnit = null
    endfunction
    
    // 肢解
    function Pudge_Dismember takes nothing returns nothing
        local unit whichUnit = M_GetSpellAbilityUnit()
        local unit targetUnit = M_GetSpellAbilityUnit()
        //指向性技能判断一下法术护盾
        if not HaveSpellShield(M_GetSpellAbilityUnit()) then
            call UnitSetLeash(whichUnit, targetUnit, null, 'A006', 'Ab06', 'B006', 3, 3, 50, true)
        endif
        set whichUnit = null
        set targetUnit = null
    endfunction

    //===========================================================================
    // Boss的AI要在技能后面
    //===========================================================================
    // Boos AI
    //===========================================================================
    // Pudge
    //===========================================================================
    function PudgeAIRot takes unit pudge returns nothing
        local group g
        local unit dummyUnit = null
        local integer iMeetCondition = 0
        local boolean isRot = GetUnitAbilityLevel(pudge, 'Bpg2') != 0
        local boolean isDismember
        local real pudgeLife = GetWidgetLife(pudge)
        if pudgeLife < 400 then//如果血量太低就不烧了
            if isRot then
                call IssueImmediateAbilityById(pudge, 'A005')
            endif
            return
        endif
        set g = LoginGroup()
        call GroupEnumUnitsInRange(g, GetUnitX(pudge), GetUnitY(pudge), 325, null)
        set P2 = GetOwningPlayer(pudge)
        loop
            set dummyUnit = FirstOfGroup(g)
            exitwhen dummyUnit == null//检查可见度 防止烧隐身单位
            if Enemy_Alive_NoStructure_NoImmune(dummyUnit) and UnitVisibleToPlayer(dummyUnit, P2) then
                set iMeetCondition = iMeetCondition + 1
            endif
            call GroupRemoveUnit(g, dummyUnit)
        endloop
        set dummyUnit = null
        set isDismember = GetUnitCurrentOrder(pudge) == Order_MagicLeash and YDWEGetUnitAbilityState(pudge, 'A006', 1) != 0.  
        if ( ( iMeetCondition > 1 or isDismember ) and not isRot  ) or ( iMeetCondition < 2 and isRot and not isDismember ) then
            call IssueImmediateAbilityById(pudge, 'A005')
        endif
        call LogoutGroup(g)

        set g = null
    endfunction

    //单位移动一定距离后的位置(未计入寻路算法, time的数值应尽量小)
    function GetUnitPositionAfterMovement takes unit whichUnit, real time returns location
        local real unitX = GetUnitX(whichUnit)
        local real unitY = GetUnitY(whichUnit)
        local real unitSpeed = GetUnitMoveSpeed(whichUnit) * time
        local real unitAngle = GetUnitFacing(whichUnit)
        local real targetX = unitX + unitSpeed * Cos(unitAngle * bj_DEGTORAD)
        local real targetY = unitY + unitSpeed * Sin(unitAngle * bj_DEGTORAD)
        local integer dstructableAmount
        set dstructableAmount = GetDestructablesAmountInCircle(targetX, targetY, 120)
        if dstructableAmount == 0 then
            return Location(targetX, targetY)
        else
            return null
        endif
    endfunction

    function PudgeAICastMeatHook takes unit pudge, unit target returns boolean
        local real pudgeX = GetUnitX(pudge)
        local real pudgeY = GetUnitY(pudge)
        local real targetX = GetUnitX(target)
        local real targetY = GetUnitY(target)
        local real rDistance = GetDistanceBetween(pudgeX, pudgeY, targetX, targetY)
        local integer targetOrder = GetUnitCurrentOrder(target)
        local real targetSpeed
        local real maxRangeMeatHook
        local real rMeatHookTime
        local location targetPosition = null
        local boolean targetNoSmartUnit
        if targetOrder == 0 or ( targetOrder != Order_Move ) then
            call Debug("log", "targetName=  " + GetUnitName(target))
            call IssuePointOrderById(pudge, Order_Flare, targetX, targetY)
        else
            set targetSpeed = GetUnitMoveSpeed(target)
            set targetNoSmartUnit = LoadBoolean(HT, GetHandleId(GetTriggeringTrigger()), GetHandleId(target))
            if targetOrder == Order_Move or (targetOrder == Order_Smart and targetNoSmartUnit)  then
                set maxRangeMeatHook = ( 30 + 5 * GetUnitAbilityLevel(pudge, 'Apg1') ) * 40
                set rMeatHookTime = maxRangeMeatHook / 1600
                set targetPosition = GetUnitPositionAfterMovement(target, rMeatHookTime + 0.3)
                if targetPosition != null then
                    set targetX = GetLocationX(targetPosition)
                    set targetY = GetLocationY(targetPosition)
                    call Debug("log", "targetX=  " + R2S(targetX))
                    call RemoveLocation(targetPosition)
                    set targetPosition = null
                    set rDistance = GetDistanceBetween(pudgeX, pudgeY, targetX, targetY)
                    if rDistance > maxRangeMeatHook then
                        return false
                    endif
                endif
                call IssuePointOrderById(pudge, Order_Flare, targetX, targetY)
            endif
        endif
        return true
    endfunction

    function PudgeAIMeatHook takes unit pudge returns nothing
        local real pudgeX
        local real pudgeY
        local group dummyGroup
        local group targetGroup
        local unit firstUnit
        local integer pudgeOrder = GetUnitCurrentOrder(pudge)
        local unit targetUnit
        local real maxRangeMeatHook
        if YDWEGetUnitAbilityState(pudge, 'Apg1', 1) != 0. then //钩子cd没好则返回
            //call Debug("log","CoolDown !=0.")
            return
        endif
        //如果屠夫在放技能直接返回
        if pudgeOrder == Order_MagicLeash or pudgeOrder == Order_Flare then
            call Debug("log","return - Order = MagicLeash")
            return
        endif
        //call Debug("log","CastMeatHook")
        set pudgeX = GetUnitX(pudge)
        set pudgeY = GetUnitY(pudge)
        set targetGroup = LoginGroup()
        set dummyGroup = LoginGroup()
        set maxRangeMeatHook = ( 30 + 5 * GetUnitAbilityLevel(pudge, 'Apg1') ) * 40

        call GroupEnumUnitsInRange(dummyGroup, pudgeX, pudgeY, maxRangeMeatHook, null )
        set P2 = GetOwningPlayer(pudge)
        loop
            set firstUnit = FirstOfGroup(dummyGroup)
            exitwhen firstUnit == null
            if UnitVisibleToPlayer(firstUnit, P2) and Alive_NoStructure(firstUnit) then
                call GroupAddUnit(targetGroup, firstUnit)
            endif
            call GroupRemoveUnit(dummyGroup, firstUnit)
        endloop
        set firstUnit = null
        call LogoutGroup(dummyGroup)
        set dummyGroup = null
        set targetUnit = GetFarthestUnitByGroup(targetGroup, pudgeX, pudgeY)
        if targetUnit == null then
            call LogoutGroup(targetGroup)
            set targetUnit = null
            set targetGroup = null
            return
        endif
        if not PudgeAICastMeatHook(pudge, targetUnit) then
            //call Debug("log","选取最近")
            set targetUnit = GetNearestUnitByGroup(targetGroup, pudgeX, pudgeY)
            call PudgeAICastMeatHook(pudge, targetUnit)
        endif
        call LogoutGroup(targetGroup)
        set targetUnit = null
        set targetGroup = null
    endfunction

    function PudgeAIDismember takes unit pudge returns nothing
        local real pudgeX
        local real pudgeY
        local group enumGroup
        local group targetGroup
        local unit dummyUnit = null
        local integer pudgeOrder = GetUnitCurrentOrder(pudge)
        local unit targetUnit
        //肢解cd没好则返回
        if YDWEGetUnitAbilityState(pudge, 'A006', 1) != 0. then
            return
        endif
        if pudgeOrder == Order_MagicLeash or pudgeOrder == Order_Flare then//如果屠夫在钩就返回
            call Debug("log"," return - Order = Spell")
            return
        endif
        set pudgeX = GetUnitX(pudge)
        set pudgeY = GetUnitY(pudge)
        set enumGroup = LoginGroup()
        set targetGroup = LoginGroup()
        call GroupEnumUnitsInRange(enumGroup, pudgeX, pudgeY, 700, null )
        call GroupRemoveUnit(enumGroup, pudge)
        set P2 = GetOwningPlayer(pudge)
        loop
            set dummyUnit = FirstOfGroup(enumGroup)
            exitwhen dummyUnit == null//检查可见度 防止对隐身单位
            if Enemy_Alive_NoStructure(dummyUnit) and UnitVisibleToPlayer(dummyUnit, P2) then
                call GroupAddUnit(targetGroup, dummyUnit)
            endif
            call GroupRemoveUnit(enumGroup, dummyUnit)
        endloop
        call LogoutGroup(enumGroup)
        set enumGroup = null
        set targetUnit = GetNearestUnitByGroup(targetGroup, pudgeX, pudgeY)
        call IssueTargetOrderByIdWait0S(pudge, Order_MagicLeash, targetUnit)
        call Debug("log", "Dismember TargetName = " + GetUnitName(targetUnit))
        call LogoutGroup(targetGroup)
        set targetUnit = null
        set targetGroup = null
    endfunction
    
    function PudgeAIAttack takes unit pudge returns nothing
        local real pudgeX
        local real pudgeY
        local real targetUnitX
        local real targetUnitY
        local group enumGroup
        local group targetGroup
        local unit firstUnit = null
        local integer pudgeOrder = GetUnitCurrentOrder(pudge)
        local unit targetUnit
        local real rDistance = 0
        if pudgeOrder == Order_MagicLeash or pudgeOrder == Order_Flare then//如果屠夫在放技能就返回
            call Debug("log"," return - Order = Spell")
            return
        endif
        set pudgeX = GetUnitX(pudge)
        set pudgeY = GetUnitY(pudge)
        set enumGroup = LoginGroup()
        set targetGroup = LoginGroup()
        call GroupEnumUnitsInRange(enumGroup, pudgeX, pudgeY, 1600, null )
        call GroupRemoveUnit(enumGroup, pudge)
        set P2 = GetOwningPlayer(pudge)
        loop
            set firstUnit = FirstOfGroup(enumGroup)
            exitwhen firstUnit == null//检查可见度 防止对隐身单位
            if Enemy_Alive(firstUnit) and UnitVisibleToPlayer(firstUnit, P2) then
                call GroupAddUnit(targetGroup, firstUnit)
            endif
            call GroupRemoveUnit(enumGroup, firstUnit)
        endloop
        set firstUnit = null
        call LogoutGroup(enumGroup)
        set enumGroup = null
        set targetUnit = GetMinPercentLifeUnitByGroup(targetGroup)
        if targetUnit == null then
            call LogoutGroup(targetGroup)
            set targetUnit = null
            set targetGroup = null
            return
        endif
        call Debug("log", "MinLife TargetName = " + GetUnitName(targetUnit))
        if pudgeOrder != Order_Move then
            if pudgeOrder == Order_Attack then
                set targetUnitX = GetUnitX(targetUnit)
                set targetUnitY = GetUnitY(targetUnit)
                set rDistance = GetDistanceBetween(pudgeX, pudgeY, targetUnitX, targetUnitY)
            endif
            if rDistance < 700 then
                if YDWEGetUnitAbilityState(pudge, 'Apg1', 1) == 0. then 
                    call IssuePointOrderById(pudge, Order_Flare, targetUnitX, targetUnitY)
                    call Debug("log", "Hook TargetName = " + GetUnitName(targetUnit))
                elseif YDWEGetUnitAbilityState(pudge, 'A006', 1) == 0. then
                    call IssueTargetOrderById(pudge, Order_MagicLeash, targetUnit)
                    call Debug("log", "Dismember TargetName = " + GetUnitName(targetUnit))
                else
                    call IssueTargetOrderById(pudge, Order_Attack, targetUnit)
                    call Debug("log", "Attack TargetName = " + GetUnitName(targetUnit))
                endif
            endif
        endif
    
        call LogoutGroup(targetGroup)
        set targetUnit = null
        set targetGroup = null
    endfunction
    
    function PudgeAI_CallBack takes nothing returns boolean
        local trigger trig = GetTriggeringTrigger()
        local integer iHandleId = GetHandleId(trig)
        local unit pudge = LoadUnitHandle(HT, iHandleId, 0)
        local eventid trigEventId = GetTriggerEventId()
        local unit orderUnit = GetOrderedUnit()
        local integer trigCount = GetTriggerEvalCount(trig)
        local integer orderId
        if trigEventId == EVENT_GAME_TIMER_EXPIRED then
            call PudgeAIRot(pudge)
            call PudgeAIMeatHook(pudge)
            if ModuloInteger(trigCount, 30) == 1 then
                call PudgeAIAttack(pudge)
            endif
        elseif trigEventId == EVENT_UNIT_TARGET_IN_RANGE or trigEventId == EVENT_UNIT_ATTACKED then
            //call Debug("log", "DAMAGED")
            call PudgeAIDismember(pudge)
        elseif orderUnit != null then
            set orderId = GetIssuedOrderId()
            if orderId == Order_Smart then
                call SaveBoolean(HT, iHandleId, GetHandleId(orderUnit), GetOrderTargetUnit() == null)
            endif
        elseif trigEventId == EVENT_WIDGET_DEATH then
            call FlushChildHashtable(HT, iHandleId)
            call ClearTrigger(trig)
        endif
    
        set orderUnit = null
        set trigEventId = null
        set pudge = null
        set trig = null
        return false
    endfunction
    
    function InitPudgeAI takes unit pudge returns nothing
        local trigger trig = CreateTrigger()
        local integer iHandleId = GetHandleId(trig)
    
        call TriggerRegisterTimerEvent(trig, 0.25, true)
        call TriggerRegisterDeathEvent(trig, pudge)
        call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER)
        call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER)
        call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_ISSUED_ORDER)
        call TriggerRegisterUnitEvent(trig, pudge, EVENT_UNIT_TARGET_IN_RANGE)
        call TriggerRegisterUnitEvent(trig, pudge, EVENT_UNIT_ATTACKED)
        call TriggerAddCondition(trig, Condition( function PudgeAI_CallBack ))
        call SaveUnitHandle(HT, iHandleId, 0, pudge)
    
    
    
        set trig = null
    endfunction
    
    
    function StartBossAI takes unit whichUnit returns nothing
        local integer bossType = GetUnitTypeId(whichUnit)
        if bossType == 'U001' then
            call InitPudgeAI(whichUnit)
        endif
    
    endfunction
    
    function StartPedugAI takes nothing returns boolean
        local trigger trig = GetTriggeringTrigger()
        local integer iHandleId = GetHandleId(trig)
        call StartBossAI(LoadUnitHandle(HT, iHandleId, 0))
        call FlushChildHashtable(HT, iHandleId)
        call ClearTrigger(trig)
        return false
    endfunction


endscope


