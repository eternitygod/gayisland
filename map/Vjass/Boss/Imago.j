
scope Imago

    globals
        
	    // 一些命令Id
	    // 复制 / 神圣护甲
	    constant integer ORDER_COPY = OrderId("divineshield")
        // 冲锋 / 变羊术
        constant integer ORDER_CHARGE = OrderId("polymorph")


    endglobals

    // Boss的命令队列
    function SetBossCommandQueue takes unit whichUnit, unit targetUnit, integer whichOrderId, real x, real y returns nothing
        call SaveUnitHandle( HT, Tmp__ArrayInt[1], 100, targetUnit )
        call SaveInteger( HT, Tmp__ArrayInt[1], 100, whichOrderId )
        call SaveReal( HT, Tmp__ArrayInt[1], 100, x )
        call SaveReal( HT, Tmp__ArrayInt[1], 101, y )
    endfunction

    function GetBossCommandQueueOrderId takes nothing returns integer
        return LoadInteger( HT, Tmp__ArrayInt[1], 100 )
    endfunction

    function GetBossCommandQueueOrderTargetUnit takes nothing returns unit
        return LoadUnitHandle( HT, Tmp__ArrayInt[1], 100 )
    endfunction

    function GetBossCommandQueueOrderTargetX takes nothing returns real
        return LoadReal( HT, Tmp__ArrayInt[1], 101 )
    endfunction

    function GetBossCommandQueueOrderTargetY takes nothing returns real
        return LoadReal( HT, Tmp__ArrayInt[1], 102 )
    endfunction

    private function ImagoAI__AddCommandQueue takes unit imago returns nothing
        local group targetGroup = LoginGroup()
        local group enumGroup = LoginGroup()
        local unit firstUnit
        local unit targetUnit
        set Tmp__ArrayReal[0] = GetUnitX(imago)
        set Tmp__ArrayReal[1] = GetUnitY(imago)
        call GroupEnumUnitsInRange(enumGroup, Tmp__ArrayReal[0], Tmp__ArrayReal[1], 1600, null )
        // 筛选
        set P2 = GetOwningPlayer(imago)
        loop
            set firstUnit = FirstOfGroup(enumGroup)
            exitwhen firstUnit == null//检查可见度 防止对隐身单位
            if IsEnemyAlive(firstUnit) and UnitVisibleToPlayer(firstUnit, P2) then
                call GroupAddUnit(targetGroup, firstUnit)
            endif
            call GroupRemoveUnit(enumGroup, firstUnit)
        endloop
        set firstUnit = null
        call LogoutGroup(enumGroup)
        set enumGroup = null
        // 寻敌
        set targetUnit = GetMinPercentLifeUnitByGroup(targetGroup)
        call LogoutGroup(targetGroup)
        if IsUnitInRange( targetUnit, imago, 500 ) then // 如果百分比血量最低的单位在500范围内 那就干他
            call SetBossCommandQueue( imago, targetUnit, ORDER_ATTACK, 0, 0 )
        endif
        set targetUnit = null
    endfunction

    private function ImagoAI__Attack takes unit imago, integer id returns nothing

        // 不是普通命令Id 说明在放技能
        if not IsCommonOrderId(id) then
            debug call Debug( GetUnitName(imago) + "当前在释放技能" + I2S(id) + OrderId2String(id) + "返回" )
            call ImagoAI__AddCommandQueue( imago )
            return
        endif
        
    endfunction

    private function ImagoAI__CallBack takes nothing returns boolean
        local eventid trigEventId = GetTriggerEventId()

        local integer iHandleId = GetHandleId(GetTriggeringTrigger())
        local unit imago = LoadUnitHandle(HT, iHandleId, 0)

        local integer currentOrderId = GetUnitCurrentOrder( imago )




        if trigEventId == EVENT_GAME_TIMER_EXPIRED then

            if currentOrderId == 0 or currentOrderId != ORDER_ATTACK  then
                set Tmp__ArrayInt[1] = iHandleId
                call ImagoAI__Attack( imago, currentOrderId )

            endif


        elseif trigEventId == EVENT_UNIT_SPELL_FINISH then
            // 如果命令队列有动作就执行队列动作
            set Tmp__ArrayInt[1] = iHandleId
            set Tmp__ArrayInt[2] = GetBossCommandQueueOrderId()
            if Tmp__ArrayInt[2] != 0 then
                if GetBossCommandQueueOrderTargetUnit() == null then
                    // 如果释放无目标命令失败 则释放点目标
                    if not IssueImmediateOrderById( imago, Tmp__ArrayInt[2] ) then
                        debug Debug("Boss",GetUnitName(imago)+"释放无目标命令失败 发布指定点目标命令" + OrderId2String(Tmp__ArrayInt[2]) )
                        call IssuePointOrderById( imago, Tmp__ArrayInt[2], GetBossCommandQueueOrderTargetX(), GetBossCommandQueueOrderTargetY() )
                    endif
                else
                    // 有技能目标就对技能目标放
                    debug Debug("Boss",GetUnitName(imago)+"释放指定目标命令" + OrderId2String(Tmp__ArrayInt[2]) )
                    call IssueTargetOrderById( imago, Tmp__ArrayInt[2], GetBossCommandQueueOrderTargetUnit() )
                endif
            endif
        elseif trigEventId == EVENT_UNIT_ACQUIRED_TARGET then
            // 获取攻击目标
            // 没在cd 并且魔法百分比＞20
            if YDWEGetUnitAbilityState(imago, 'A00C', 1) == 0. and GetUnitManaPercent(imago) > 20.  then

                call IssueTargetOrderByIdWait0S( imago, ORDER_CHARGE, GetEventTargetUnit() )

            endif

        elseif trigEventId == EVENT_WIDGET_DEATH then

        else
            set Tmp__ArrayInt[1] = GetIssuedOrderId()
            if Tmp__ArrayInt[1] != 0 and IsCommonOrderId(Tmp__ArrayInt[1]) then
                // 保存命令Id的发布时间
                call SaveInteger( HT, iHandleId, Tmp__ArrayInt[1], R2I(GetGameTime()) )

            endif
        endif

        set imago = null
        set trigEventId = null
        return false
    endfunction

    // 初始化Imago的技能
    function InitImagoSkills takes nothing returns nothing
        
    endfunction

    function InitImagoAI takes unit imago returns nothing
        local trigger trig = CreateTrigger()

        call InitImagoSkills()

        call TriggerRegisterTimerEvent(trig, 0.25, true) // 时间
        call TriggerRegisterDeathEvent(trig, imago) // 死亡

        call TriggerRegisterUnitEvent(trig, imago, EVENT_UNIT_ISSUED_TARGET_ORDER) // 发布目标事件
        call TriggerRegisterUnitEvent(trig, imago, EVENT_UNIT_ISSUED_POINT_ORDER) // 发布指定点
        call TriggerRegisterUnitEvent(trig, imago, EVENT_UNIT_ISSUED_ORDER) // 发布无目标

        call TriggerRegisterUnitEvent(trig, imago, EVENT_UNIT_SPELL_FINISH) // 施法结束
        
        
        call TriggerRegisterUnitEvent(trig, imago, EVENT_UNIT_ACQUIRED_TARGET) // 注意攻击目标
        call TriggerRegisterUnitEvent(trig, imago, EVENT_UNIT_TARGET_IN_RANGE) // 获取攻击目标
        call TriggerRegisterUnitEvent(trig, imago, EVENT_UNIT_ATTACKED) // 被攻击
        call TriggerAddCondition(trig, Condition( function ImagoAI__CallBack ))
        call SaveUnitHandle(HT, GetHandleId(trig), 0, imago)

        set trig = null
    endfunction

endscope
