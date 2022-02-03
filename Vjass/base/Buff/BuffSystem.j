

#include "Stun.j" // 晕眩
#include "Leash.j" // 枷锁
#include "MagicImmunity.j" // 魔免

library BuffSystem initializer InitBuff requires base, Common
    
    globals
        
        hashtable UnitBuffData = InitHashtable()

        constant key BUFF_TYPE_POSITIVE // 正面
        constant key BUFF_TYPE_NEGATIVE // 负面

        constant key BUFF_TYPE_MAGIC // 魔法
        constant key BUFF_TYPE_PHYSICAL // 物理
        constant key BUFF_TYPE_AUTODISPEL // 不可驱散Buff

        // 
        constant key BUFF_TYPE_BUFFID // BuffId 龙卷风光环的BuffId

        constant key BUFF_TYPE_IS_BUFF // 表示是一个Buff 死亡时会驱散此类

        private hashtable Buff = InitHashtable()
    endglobals
    
    private function SetBuffType takes integer whichAbilityId, integer whichBuffId, integer whichPolarity, integer whichType, boolean autodispel returns nothing
        call SaveBoolean( Buff, whichType, whichAbilityId, true )
        call SaveInteger( Buff, whichAbilityId, BUFF_TYPE_BUFFID, whichBuffId )
        if whichPolarity != 0 then
            call SaveBoolean( Buff, whichPolarity, whichAbilityId, true )
        endif
        call SaveBoolean( Buff, BUFF_TYPE_IS_BUFF, whichAbilityId, true )
        if autodispel then
            call SaveBoolean( Buff, BUFF_TYPE_AUTODISPEL, whichAbilityId, true )
        endif
    endfunction

    // 初始化Buff表
    // 技能Id BuffId 极性 类型 是不可驱散
    private function InitBuff takes nothing returns nothing
        // 晕眩 负面 物理 可驱散
        call SetBuffType( 'Aasl', 'BPSE', BUFF_TYPE_NEGATIVE, BUFF_TYPE_PHYSICAL, false )

    endfunction

    // 获取Buff的类型
    private function IsBuffType takes integer whichAbilityId, integer whichType returns boolean
        return LoadBoolean( Buff, whichType, whichAbilityId )
    endfunction

    private function GetAbilityBuff takes integer whichAbilityId returns integer
        return LoadInteger( Buff, whichAbilityId, BUFF_TYPE_BUFFID )
    endfunction

    // 移除单位身上指定类型的Buff
    function EXUnitRemoveBuffs takes unit whichUnit, integer whichType returns nothing
        local integer id = 0
        local integer i = 0
        local trigger trig
        local integer h = GetHandleId( whichUnit )
        // 遍历单位的所有技能来移除Buff
        loop
            set id = EXGetAbilityId( EXGetUnitAbilityByIndex( whichUnit, i ) )
            exitwhen id == 0
            // 技能是否是buff? 可以被驱散?
            if IsBuffType( id, whichType ) and not IsBuffType( id, BUFF_TYPE_AUTODISPEL ) then
                call UnitRemoveAbility( whichUnit, id )
                set id = GetAbilityBuff( id )
                if id != 0 then // 找到Buff相关的触发器 先删除Buff 再运行一次
                    set trig = LoadTriggerHandle( UnitBuffData, h, id )
                    call UnitRemoveAbility( whichUnit, id )
                    if trig != null then
                        call TriggerEvaluate( trig )
                    endif
                endif
                debug call Debug( "log", GetUnitName(whichUnit) + " 删除Buff " + GetObjectName(id) + " Id:" + YDWEId2S(id) )
            endif
            set i = i + 1
        endloop
        set trig = null
    endfunction
    
    // 创建一个绑定单位Buff的触发器
    function CreateUnitBuffTrigger takes unit whichUnit, integer whichBuffId returns trigger
        local integer iHandleId = GetHandleId(whichUnit)
        set bj_lastCreatedTrigger = CreateTrigger()
        call SaveTriggerHandle( UnitBuffData, iHandleId, whichBuffId, bj_lastCreatedTrigger )
        return bj_lastCreatedTrigger
    endfunction

    private function RemoveAbility takes nothing returns boolean
        local trigger trig = GetTriggeringTrigger()
        local integer iHandleId = GetHandleId(trig)
        local unit whichUnit = LoadUnitHandle(HT, iHandleId, 17)
        local integer abilityId = LoadInteger(HT, iHandleId, 59)
        local integer buffId = LoadInteger(HT, iHandleId, 60)
        local timer durTimer = LoadTimerHandle(HT, iHandleId, 10)
        call SaveBoolean(HT, iHandleId, 0, true)
        call UnitRemoveAbility(whichUnit, abilityId)
        call UnitRemoveAbility(whichUnit, buffId)
        if GetUnitAbilityLevel(whichUnit, abilityId) == 0 then
            call FlushChildHashtable(HT, iHandleId)
            call ClearTrigger(trig)
            call DestroyTimer(durTimer)
            call RemoveSavedHandle(HT, GetHandleId(whichUnit), 0 - abilityId)
        else
            call TimerStart(durTimer, 1, true, null)
        endif
        set whichUnit = null
        set trig = null
        set durTimer = null
        return false
    endfunction

    // 在一段时间内添加技能 一般用于添加Buff
    // 技能id必填 level可以1 dur不能 <= 0 buffId可以没有
    function UnitAddAbilityTimed takes unit whichUnit, integer abilityId, integer level, real duration, integer buffId returns nothing
        local trigger trig
        local integer iHandleId
        local real remaining
        local timer durTimer
        if not UnitAlive(whichUnit) then
            return
        endif
        if HaveSavedHandle(HT, GetHandleId(whichUnit), 0 - abilityId) then
            set trig = LoadTriggerHandle(HT, GetHandleId(whichUnit), 0 - abilityId)
            set iHandleId = GetHandleId(trig)
            set durTimer = LoadTimerHandle(HT, iHandleId, 10)
        else
            set trig = CreateTrigger()
            set iHandleId = GetHandleId(trig)
            set durTimer = CreateTimer()
            call FlushChildHashtable(HT, iHandleId)
            call SaveUnitHandle(HT, iHandleId, 17, whichUnit)
            call SaveInteger(HT, iHandleId, 59, abilityId)
            call SaveInteger(HT, iHandleId, 60, buffId)
            call SaveReal(HT, iHandleId, 0, 0)
            call TriggerRegisterDeathEvent(trig, whichUnit)
            call SaveTimerHandle(HT, iHandleId, 10, durTimer)
            call TriggerRegisterTimerExpireEvent(trig, durTimer)
            call TriggerAddCondition(trig, Condition(function RemoveAbility))
            call SaveTriggerHandle(HT, GetHandleId(whichUnit), 0 - abilityId, trig)
        endif
        call RemoveSavedBoolean(HT, iHandleId, 0)
        set remaining = TimerGetRemaining(durTimer)
        if remaining < duration then
            call TimerStart(durTimer, duration, false, null)
        endif
        call UnitAddPermanentAbilitySetlevel(whichUnit, abilityId, level)
        set trig = null
        set durTimer = null
    endfunction

endlibrary

