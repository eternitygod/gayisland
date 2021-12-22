
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

    function UnitRemoveInvulnerable takes unit whichUnit returns nothing
        call SetUnitInvulnerable(whichUnit, true)
    endfunction

    //设置单位无敌 封装了一层 不会因为独立更改而导致无敌失效
    function UnitAddInvulnerable takes unit whichUnit returns nothing
        call SetUnitInvulnerable(whichUnit, true)
    endfunction

    // 逆变身 使用后需要刷新一下单位的基础攻击力
    function YDWEUnitTransform takes unit u, integer targetid returns nothing
        local integer i = GetUnitTypeId(u)
        local real value
        if i != targetid and i != 0 then
            // 刷新基础攻击力
            set value = OBJ_GetHeroPrimaryValue(u) + LoadInteger(DynamicData, GetHandleId(u), UNIT_BASE_DAMAGE)
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

    // 点目标技能 等待0秒
    function IssuePointOrderByIdWait0S takes unit whichUnit, integer order, real x, real y returns nothing
        local integer iHandleId = CreateTimerEventTrigger( 0., false, function IssuePointOrderByIdWait0S_CallBack )

        call SaveInteger(HT, iHandleId, 0, order)
        call SaveUnitHandle(HT, iHandleId, 0, whichUnit)
        call SaveReal(HT, iHandleId, 1, x)
        call SaveReal(HT, iHandleId, 2, y)

    endfunction
    
    // 不推荐使用
    // 本质上只是使用两次逆变身来刷新，whichType则是刷新后的状态
    function RefreshUnitModelById takes unit whichUnit , integer whichType returns nothing
        call YDWEUnitTransform(whichUnit, 'Uwar')
        call YDWEUnitTransform(whichUnit, whichType)
    endfunction
    // 与上面不同的是，此函数不会改变单位类别，始终会变回原来的类别
    function RefreshUnitModel takes unit whichUnit returns nothing
        local integer unitType = GetUnitTypeId(whichUnit)
        call YDWEUnitTransform(whichUnit, 'Uwar')
        call YDWEUnitTransform(whichUnit, unitType)
    endfunction
    // 设置单位阴影，参数可填 Shadow 或 _ ,会进行一次逆变身
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
        constant key KEY_MASTERUNIT
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
        constant key UNIT_DELAYED_STANDING
    endglobals
    
    function UnitDelayStandActions takes nothing returns nothing
        local timer hTimer = GetExpiredTimer()
        local integer iHandleId = GetHandleId(hTimer)
        local unit whichUnit = LoadUnitHandle(HT, iHandleId, 0)

        if UnitAlive(whichUnit) then
            call SetUnitAnimation(whichUnit, "Stand")
        endif
        call RemoveSavedHandle(DynamicData, GetHandleId(whichUnit), UNIT_DELAYED_STANDING)

        call FlushChildHashtable( HT, iHandleId )
        call DestroyTimer(hTimer)
        set hTimer = null
        set whichUnit = null
    endfunction

    // 让单位在等待一段时间后播放Stand动作 重复使用会覆盖
    function UnitDelayedStanding takes unit whichUnit, real dur returns nothing
        local integer iHandleId = GetHandleId(whichUnit)
        local timer hTimer = LoadTimerHandle(DynamicData, iHandleId, UNIT_DELAYED_STANDING)
        if hTimer == null then
            set hTimer = CreateTimer()
            call SaveUnitHandle(HT, GetHandleId(hTimer), 0, whichUnit)
            call SaveTimerHandle(DynamicData, iHandleId, UNIT_DELAYED_STANDING, hTimer)
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

endlibrary



