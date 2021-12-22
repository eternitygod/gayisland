
// 漂浮文字
#include "TextTag.j"

// 物体数据 从Slk库获取
#include "ObjectData.j"

library Common requires base, DamageSystem

    globals
        //是否要DeBug
        trigger bj_lastCreatedTrigger = null
        boolean IsMirage = false 
    endglobals

    function Debug takes string debugtype, string msg returns nothing
        if IsMirage then
            call DisplayTimedTextToPlayer(LocalPlayer,0,0,60,msg)
        endif
    endfunction

    function GetPlayerSelectedUnit takes nothing returns unit
        return GetDetectedUnit()
    endfunction

    // 添加技能并且设置永久性
    function UnitAddPermanentAbility takes unit u, integer id returns boolean
        return UnitAddAbility(u, id) and UnitMakeAbilityPermanent(u, true, id)
    endfunction

    // 添加技能并且设置永久性和技能等级
    function UnitAddPermanentAbilitySetlevel takes unit u, integer id, integer lv returns nothing
        if GetUnitAbilityLevel(u, id) == 0 then
            call UnitAddPermanentAbility(u, id)
        endif
        call SetUnitAbilityLevel(u, id, lv)
    endfunction

    // 给所有玩家共享此单位的视野
    function UnitShareVisionToAllPlayer takes unit whichUnit, boolean share returns nothing
        local integer i = 0
        loop
            call UnitShareVision(whichUnit, Player(i), share)
            set i = i + 1
            exitwhen i == bj_MAX_PLAYER_SLOTS
        endloop
    endfunction


    

    
    //移除单位枷锁
    function UnitRemoveLeash takes unit u, integer abid, integer buffId returns nothing
	
    endfunction

    //GetTriggerEventId() == EVENT_UNIT_SPELL_ENDCAST and GetSpellAbilityId() == LoadInteger(HT, h, 50)//
    //似乎不需要记录技能Id
    function UnitSetLeash_Actions takes nothing returns boolean
        local trigger t = GetTriggeringTrigger()
        local integer h = GetHandleId(t)
        local unit u = LoadUnitHandle(HT, h, 1)
        local unit target = LoadUnitHandle(HT, h, 0)
        local integer c = GetTriggerEvalCount(t)
        local real damage
        local eventid trigEventId = GetTriggerEventId()
        //时间到期 或 Buff等级为0 或 单位死亡
        if c == LoadInteger(HT, h, 30) or GetUnitAbilityLevel(target, LoadInteger(HT, h, 2)) == 0 or trigEventId == EVENT_WIDGET_DEATH or ( trigEventId == EVENT_UNIT_SPELL_ENDCAST and GetSpellAbilityId() == LoadInteger(HT, h, 55) ) then
            call DestroyLightning(LoadLightningHandle(HT, h, 10))
            call EXPauseUnit(target, false)
            call UnitRemoveAbility(target, LoadInteger(HT, h, 1) )
            call UnitRemoveAbility(target, LoadInteger(HT, h, 2) )
            call FlushChildHashtable(HT, h)
            call ClearTrigger(t)
        else
            if HaveSavedHandle(HT, h, 10) then
                call MoveLightning(LoadLightningHandle(HT, h, 10), true, GetUnitX(u), GetUnitY(u), GetUnitX(target), GetUnitY(target))
                if ModuloInteger(c, 20) == 1 then //伤害单位
                    set damage = LoadReal(HT, h, 30)
                    if damage != 0 then
                        call DamageUnit(u, target, 1, damage) //枷锁只会造成法术攻击 魔法伤害
                    endif
                endif
            else
                set damage = LoadReal(HT, h, 30)
                if damage != 0 then
                    call DamageUnit(u, target, 1, damage) //如果没存闪电效果则每次回调造成一次伤害
                endif
            endif
        endif
        set trigEventId = null
        set t = null
        set target = null
        set u = null
        return false
    endfunction

    //关于单位枷锁，Buff的叠加类型为 同类型Buff重复释放刷新持续时间。
    //codeName填 "_" 则不会有闪电效果 如果需要单位持续施法，使用UnitSetLeashByAbility。
    function UnitSetLeash takes unit spellUnit, unit targetUnit, string codeName, integer spellAbility,integer abilityId, integer buffId, real dur, real herodur, real damage, boolean ignoreMagicImmunes returns boolean
        local integer h
        local trigger t
        local real time = 0.
        if IsUnitType(targetUnit, UNIT_TYPE_MAGIC_IMMUNE) and not ignoreMagicImmunes then
            return false
        endif
        set h = GetHandleId(targetUnit)
        if GetUnitAbilityLevel(targetUnit, 'AHer') == 1 then
            set dur = herodur
        endif
        if GetUnitAbilityLevel(targetUnit, buffId) == 1 then
            set t = LoadTriggerHandle(UnitKeyBuff, h, Leash + buffId)//防止buff的key冲突所以加一下
        else
            call EXPauseUnit(targetUnit, true)
            call SaveInteger(UnitKeyBuff, h, UNITBUFF_STUN, LoadInteger(UnitKeyBuff, h, UNITBUFF_STUN ) + 1)
            set t = CreateTrigger()
            call TriggerAddCondition(t, Condition( function UnitSetLeash_Actions))
            call SaveTriggerHandle(UnitKeyBuff, h, Leash + buffId, t)
            set h = GetHandleId(t)
            if spellAbility != 0 then
                call SaveInteger(HT, h, 55, spellAbility)
                call TriggerRegisterUnitEvent(t, spellUnit, EVENT_UNIT_SPELL_ENDCAST)
            endif
            call UnitAddAbility(targetUnit, abilityId)
            call UnitMakeAbilityPermanent(targetUnit, true, abilityId)
            call SaveUnitHandle(HT, h, 0, targetUnit)
            call SaveUnitHandle(HT, h, 1, spellUnit)
            if codeName != "_" then
                call SaveLightningHandle(HT, h, 10, AddLightning(codeName, true, GetUnitX(spellUnit), GetUnitY(spellUnit), GetUnitX(targetUnit), GetUnitY(targetUnit)))
                call TriggerRegisterTimerEvent(t, LeashFrame, true) //
            else
                call TriggerRegisterTimerEvent(t, 1, true) //如果没有闪电特效，则一秒回调一次。
            endif
            if damage != 0 then //直接存入伤害值
                call SaveReal(HT, h, 30, damage)
            endif
            call SaveInteger(HT, h, 1, abilityId)
            call SaveInteger(HT, h, 2, buffId)
            call SaveInteger(HT, h, 30, R2I( dur / LeashFrame ) ) //此项为最大赋值次数(持续时间)  dur / (LeashFrame)
        endif
        if time < dur then
            set time = dur
        endif
        if time != 0 then
            call TriggerRegisterDeathEvent(t, spellUnit)
            call TriggerRegisterDeathEvent(t, targetUnit)
        endif
        set t = null
        return true
    endfunction


    function UnitRemoveInvulnerable takes unit whichUnit returns nothing
        call SetUnitInvulnerable(whichUnit, true)
    endfunction

    //设置单位无敌 封装了一层 不会因为独立更改而导致无敌失效
    function UnitAddInvulnerable takes unit whichUnit returns nothing
        call SetUnitInvulnerable(whichUnit, true)
    endfunction

    function UnitSetMagicImmunityRemove takes nothing returns boolean
        local trigger trig = GetTriggeringTrigger()
        local integer iHandleId = GetHandleId(trig)
        local unit whichUnit = LoadUnitHandle(HT, iHandleId, 0)

        call UnitRemoveAbility(whichUnit, 'Amai')

        set trig = null
        return false
    endfunction

    function UnitSetMagicImmunity takes unit whichUnit, real time returns nothing
        local integer iHandleId = GetHandleId(whichUnit)
        local trigger trig = LoadTriggerHandle(UnitKeyBuff, iHandleId, MagicImmunity)
        local real elapsed
        if trig == null then
            set trig = CreateTrigger()
            set iHandleId = GetHandleId(trig)
            call UnitAddPermanentAbility(whichUnit, 'Amai')
            call UnitMakeAbilityPermanent(whichUnit, true, 'Amim')
            call TriggerRegisterTimerEvent(trig, time, false)
            call TriggerAddCondition(trig, Condition( function UnitSetMagicImmunityRemove))
            call SaveUnitHandle(HT, iHandleId, 0, whichUnit)
            call SaveReal(HT, iHandleId, 0, time + GetGameTime())
        else
            set iHandleId = GetHandleId(trig)
            set elapsed = GetGameTime() - LoadReal(HT, iHandleId, 0)
            if elapsed < time then
                call FlushChildHashtable(HT, iHandleId)
                call ClearTrigger(trig)
                call RemoveSavedHandle(UnitKeyBuff, GetHandleId(whichUnit), MagicImmunity)
                call UnitSetMagicImmunity(whichUnit, time)
            endif
        endif
        set trig = null
    endfunction


    //注意filterId的值不宜过高,Jass的数值最大值为8191
    //每个filterId可以注册200个事件,通常不会用那么多
    //给触发器注册任意单位受伤事件
    //通常一个攻击特效filterId用1, (敌对,非建筑)CommonAttackEffectFilter
    function TriggerRegisterAnyUnitDamagedEvent takes trigger trig, integer filterId returns nothing
        local integer id = filterId * 200
        if trig == null then
            return
        endif
        set DamageEventQueue[id + DamageEventNumber[filterId]] = trig
        set DamageEventNumber[filterId] = id + DamageEventNumber[filterId] + 1
        //call Debug("log","register" + I2S(GetHandleId(DamageEventQueue[200])))
    endfunction

    //此函数会将触发器推入队列顶端,每次loop时优先触发,适用于会更改伤害值的事件/*暂时不需要此函数 因为暴击的计算独立了
    //function ExTriggerRegisterAnyUnitDamagedEvent takes trigger trig returns nothing
    //	local integer i = DamageEventNumber + 1
    //	if trig == null then
    //		return
    //	endif
    //	if DamageEventNumber == 0 then
    //		call TriggerRegisterAnyUnitDamagedEvent(trig)
    //	endif
    //	loop
    //		set DamageEventQueue[i - 1] = DamageEventQueue[i]
    //		set i = i - 1
    //		exitwhen i == 0
    //	endloop
    //	set DamageEventQueue[0] = trig
    //	set DamageEventNumber = DamageEventNumber + 1
    //endfunction

    //计时器回调到期则设置变量为false
    function DisableAttackEffect takes nothing returns nothing
        set EffectIsEnabled[LoadInteger(HT, GetHandleId(GetExpiredTimer()), 0)]= false
    endfunction
    //在一定时间内激活暴击 key的值不能为0  time为0则是永久激活
    function EnabledAttackEffect takes integer key, real time returns nothing
        if not EffectIsEnabled[0] then
            set EffectIsEnabled[0] = true
        endif
        set EffectIsEnabled[key] = true
        if time == 0 then
            return
        elseif EffectEnabledTimer[key] == null then
            set EffectEnabledTimer[key] = CreateTimer()
            call SaveInteger(HT, GetHandleId(EffectEnabledTimer[key]), 0, key)
        endif
        if TimerGetRemaining(EffectEnabledTimer[key])< time then
            call TimerStart(EffectEnabledTimer[key], time, false, function DisableAttackEffect)
        endif
    endfunction

    function KillDestructablesInCircle_Actions takes nothing returns nothing
        if GetDestructableLife(GetEnumDestructable()) > 0.00 then
            call KillDestructable(GetEnumDestructable())
        endif
    endfunction
    //用一个中心区域来当马甲
    //摧毁范围内的可破坏物
    function KillDestructablesInCircle takes real x, real y, real d returns nothing
        call SetRect(RectDummy, x - d, y - d, x + d, y + d)
        call EnumDestructablesInRect(RectDummy, null, function KillDestructablesInCircle_Actions)
    endfunction

    function GetDestructablesAmountInCircle_Actions takes nothing returns nothing
        if GetDestructableLife(GetEnumDestructable()) > 0.00 then
            set Tmp_DummyAmount = Tmp_DummyAmount + 1
        endif
    endfunction

    function GetDestructablesAmountInCircle takes real x, real y, real d returns integer
        call SetRect(RectDummy, x - d, y - d, x + d, y + d)
        set Tmp_DummyAmount = 0
        call EnumDestructablesInRect(RectDummy, null, function GetDestructablesAmountInCircle_Actions)
        return Tmp_DummyAmount
    endfunction

    function FindNearestDestructable takes nothing returns nothing
        local destructable enumDestructable = GetEnumDestructable()
        local real x = GetWidgetX(enumDestructable)
        local real y = GetWidgetY(enumDestructable)
        local real dis = GetDistanceBetween(Tmp_GetNearestDestructableUnitX, Tmp_GetNearestDestructableUnitY, x, y)
	
        if dis > Tmp_NearestDestructableDistance then
            set Tmp_NearestDestructableDistance = dis
            set Tmp_Destructable = enumDestructable
        endif

        set Tmp_Destructable = enumDestructable
        set enumDestructable = null
    endfunction

    // 获取单位范围内的最近可破坏物
    function GetNearestDestructable takes unit whichUnit, real radius returns destructable
        local real x = GetUnitX(whichUnit)
        local real y = GetUnitY(whichUnit)
        set Tmp_GetNearestDestructableUnitX = x
        set Tmp_GetNearestDestructableUnitY = y
        call SetRect(RectDummy, x - radius, y - radius, x + radius, y + radius)
        set Tmp_Destructable = null
        set Tmp_NearestDestructableDistance = 0.
        call EnumDestructablesInRect(RectDummy, null, function FindNearestDestructable)
        return Tmp_Destructable
    endfunction

    //逆变身 使用后需要刷新一下单位的基础攻击力
    function YDWEUnitTransform takes unit u, integer targetid returns nothing
        local integer i = GetUnitTypeId(u)
        local real value
        if i != targetid and i != 0 then
            // 刷新基础攻击力
            set value = GetHeroPrimaryValue(u) + LoadInteger(UnitData, GetHandleId(u), UNIT_BASE_DAMAGE)
            call UnitAddAbility(u, 'Abrf')
            call EXSetAbilityDataInteger(EXGetUnitAbility(u, 'Abrf'), 1, ABILITY_DATA_UNITID, i)
            call EXSetAbilityAEmeDataA(EXGetUnitAbility(u, 'Abrf'), i)
            call UnitRemoveAbility(u, 'Abrf')
            call UnitAddAbility(u, 'Abrf')
            call EXSetAbilityAEmeDataA(EXGetUnitAbility(u, 'Abrf'), targetid)
            call UnitRemoveAbility(u, 'Abrf')
            call SetUnitState(u, UNIT_STATE_ATTACK1_DAMAGE_BASE, value)
        endif
    endfunction

    // 使用无目标技能(ID)
    function IssueImmediateAbilityById takes unit whichUnit, integer abilityId returns nothing
        if HaveSavedString(ObjectData, SPELL_EFFECT, abilityId) then
            set Tmp_SpellAbilityUnit = whichUnit
            call DzExecuteFunc(LoadStr(ObjectData, SPELL_EFFECT, abilityId))
        endif
    endfunction

    function IssueTargetOrderByIdWait0S_CallBack takes nothing returns boolean
        local trigger trig = CreateTrigger()
        local integer iHandleId = GetHandleId(trig)
        local integer order = LoadInteger(HT, iHandleId, 0)
        local unit whichUnit = LoadUnitHandle(HT, iHandleId, 0)
        local widget targetWidget = LoadWidgetHandle(HT, iHandleId, 1)

        call IssueTargetOrderById(whichUnit, order, targetWidget)
        call FlushChildHashtable(HT, iHandleId)
        call ClearTrigger(trig)

        set trig = null
        set whichUnit = null
        set targetWidget = null
        return false
    endfunction
    //延迟0秒后再发布技能,单位事件中直接发动可能会卡住
    function IssueTargetOrderByIdWait0S takes unit whichUnit, integer order, widget targetWidget returns nothing
        local trigger trig = CreateTrigger()
        local integer iHandleId = GetHandleId(trig)

        call TriggerRegisterTimerEvent(trig, 0., false)
        call TriggerAddCondition( trig, Condition( function IssueTargetOrderByIdWait0S_CallBack))
        call SaveInteger(HT, iHandleId, 0, order)
        call SaveUnitHandle(HT, iHandleId, 0, whichUnit)
        call SaveWidgetHandle(HT, iHandleId, 1, targetWidget)

        set trig = null
    endfunction


    function IssuePointOrderByIdWait0S_CallBack takes nothing returns boolean
        local trigger trig = CreateTrigger()
        local integer iHandleId = GetHandleId(trig)
        local integer order = LoadInteger(HT, iHandleId, 0)
        local unit whichUnit = LoadUnitHandle(HT, iHandleId, 0)
        local real targetX = LoadReal(HT, iHandleId, 1)
        local real targetY = LoadReal(HT, iHandleId, 2)

        call IssuePointOrderById(whichUnit, order, targetX, targetY)
        call FlushChildHashtable(HT, iHandleId)
        call ClearTrigger(trig)

        set trig = null
        set whichUnit = null
        return false
    endfunction

    // 点目标技能 
    function IssuePointOrderByIdWait0S takes unit whichUnit, integer order, real x, real y returns nothing
        local integer iHandleId = CreateTimerEventTrigger( 0., false, function IssuePointOrderByIdWait0S_CallBack )

        call SaveInteger(HT, iHandleId, 0, order)
        call SaveUnitHandle(HT, iHandleId, 0, whichUnit)
        call SaveReal(HT, iHandleId, 1, x)
        call SaveReal(HT, iHandleId, 2, y)

    endfunction
    
    //不推荐使用
    //本质上只是使用两次逆变身来刷新，whichType则是刷新后的状态
    function RefreshUnitModelById takes unit whichUnit , integer whichType returns nothing
        call YDWEUnitTransform(whichUnit, 'Uwar')
        call YDWEUnitTransform(whichUnit, whichType)
    endfunction
    //与上面不同的是，此函数不会改变单位类别，始终会变回原来的类别
    function RefreshUnitModel takes unit whichUnit returns nothing
        local integer unitType = GetUnitTypeId(whichUnit)
        call YDWEUnitTransform(whichUnit, 'Uwar')
        call YDWEUnitTransform(whichUnit, unitType)
    endfunction
    //设置单位阴影，参数可填 Shadow 或 _ ,会进行一次逆变身
    function SetUnitShadow takes unit whichUnit, string modelName returns nothing
        call EXSetUnitString(GetUnitTypeId(whichUnit), 0x13, modelName)
        call RefreshUnitModel(whichUnit)
    endfunction

    // 会被函数内联优化掉 所以封装一层使得可读性更强
    function M_GetSpellAbilityUnit takes nothing returns unit
        return Tmp_SpellAbilityUnit
    endfunction

    function M_GetSpellTargetUnit takes nothing returns unit
        return Tmp_SpellTargetUnit
    endfunction

    function M_GetSpellAbilityLevel takes nothing returns integer
        return Tmp_SpellAbilityLevel
    endfunction

    function M_GetSpellTargetX takes nothing returns real
        return Tmp_SpellTargetX
    endfunction

    function M_GetSpellTargetY takes nothing returns real
        return Tmp_SpellTargetY
    endfunction

    globals
        unit LastGetMasterUnit = null
        unit LastSummonedUnit = null
        key KEY_MASTERUNIT
    endglobals

    function SummonUnit takes unit whichUnit, integer iUnitTypeId, real x, real y, real face, integer iBuffId, real dur returns unit
        local unit hSummonedUnit = CreateUnit(GetOwningPlayer(whichUnit), iUnitTypeId, x, y, face)
        call UnitAddType(hSummonedUnit, UNIT_TYPE_SUMMONED)
        call SaveUnitHandle(HT, GetHandleId(hSummonedUnit), KEY_MASTERUNIT, whichUnit)
        if dur > 0 then
            if iBuffId == 0 then
                call Debug("Error", "错误的BuffId，召唤单位" + GetObjectName(iUnitTypeId)+ "时没有正确的生命周期BuffId。")
            else
                call UnitApplyTimedLife(hSummonedUnit, iBuffId, dur)
            endif
        endif
        set LastSummonedUnit = hSummonedUnit
        set hSummonedUnit = null
        return LastSummonedUnit
    endfunction

    // 一般对蝗虫马甲单位或召唤单位使用 获取召唤他的单位之类
    function GetMasterUnit takes unit whichUnit returns unit
        set LastGetMasterUnit = LoadUnitHandle(HT, GetHandleId(whichUnit), KEY_MASTERUNIT)
        if LastGetMasterUnit == null then
            return null
        endif
        return LastGetMasterUnit
    endfunction

    globals
        key UnitDelayedStandingKey
    endglobals

    // 
    function UnitDelayStandActions takes nothing returns nothing
        local timer hTimer = GetExpiredTimer()
        local integer iHandleId = GetHandleId(hTimer)
        local unit whichUnit = LoadUnitHandle(HT, iHandleId, 0)

        if UnitAlive(whichUnit) then
            call SetUnitAnimation(whichUnit, "Stand")
        endif
        call RemoveSavedHandle(UnitKeyBuff, GetHandleId(whichUnit), UnitDelayedStandingKey)

        call FlushChildHashtable( HT, iHandleId )
        call DestroyTimer(hTimer)
        set hTimer = null
        set whichUnit = null
    endfunction

    // 让单位在等待一段时间后播放Stand动作 重复使用会覆盖
    function UnitDelayedStanding takes unit whichUnit, real dur returns nothing
        local integer iHandleId = GetHandleId(whichUnit)
        local timer hTimer = LoadTimerHandle(UnitKeyBuff, iHandleId, UnitDelayedStandingKey)
        if hTimer == null then
            set hTimer = CreateTimer()
            call SaveUnitHandle(HT, GetHandleId(hTimer), 0, whichUnit)
            call SaveTimerHandle(UnitKeyBuff, iHandleId, UnitDelayedStandingKey, hTimer)
        endif
        call TimerStart(hTimer, dur, false, function UnitDelayStandActions)

        set hTimer = null
    endfunction

    globals
        hashtable UnitAbilityTrigger = InitHashtable()
    endglobals

    // 创建一个绑定单位技能的触发器(使用重修之书后将删除此触发器) 多用于某些给单一单位注册的触发器
    function CreateUnitAbilityTrigger takes unit whichUnit, integer iAbilityId returns trigger
        local integer iHandleId = GetHandleId(whichUnit)
        set bj_lastCreatedTrigger = CreateTrigger()
        call SaveTriggerHandle(UnitAbilityTrigger, iHandleId, iAbilityId, bj_lastCreatedTrigger)
        return bj_lastCreatedTrigger
    endfunction



    //***************************************************************************
    //*
    //*  Text Tag Utility Functions
    //*
    //***************************************************************************




endlibrary



