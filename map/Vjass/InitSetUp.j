
library InitSetUp initializer Init

    globals
        //-----------------------------------------------------------------------
        // Constants
        //
        //新的变量
        player LocalPlayer = null
        real CorrectionMinX
        real CorrectionMaxX
        real CorrectionMinY
        real CorrectionMaxY
        //prd算法的哈希表
        hashtable Prd = InitHashtable()

        //常用哈希表
        hashtable HT = InitHashtable()


  



    endglobals

    


    native EXGetUnitAbility takes unit u, integer abilcode returns ability
    native EXGetUnitAbilityByIndex takes unit u, integer index returns ability
    native EXGetAbilityId takes ability abil returns integer
    native EXGetAbilityState takes ability abil, integer state_type returns real
    native EXSetAbilityState takes ability abil, integer state_type, real value returns boolean
    native EXGetAbilityDataReal takes ability abil, integer level, integer data_type returns real
    native EXSetAbilityDataReal takes ability abil, integer level, integer data_type, real value returns boolean
    native EXGetAbilityDataInteger takes ability abil, integer level, integer data_type returns integer
    native EXSetAbilityDataInteger takes ability abil, integer level, integer data_type, integer value returns boolean
    native EXGetAbilityDataString takes ability abil, integer level, integer data_type returns string
    native EXSetAbilityDataString takes ability abil, integer level, integer data_type, string value returns boolean
    native EXGetEventDamageData takes integer edd_type returns integer
    native EXSetEventDamage takes real amount returns boolean
    native EXPauseUnit takes unit u, boolean flag returns nothing
    native EXExecuteScript takes string script returns string
    native EXSetAbilityAEmeDataA takes ability abil, integer unitid returns boolean
    native EXGetUnitString takes integer unitcode, integer Type returns string
    native EXSetUnitString takes integer unitcode,integer Type,string value returns boolean
   


    //创建一个计时器事件触发器，返回值是触发器的整数地址，需要手动销毁。注意func为触发器的条件Condition而不是动作Action。
    function CreateTimerEventTrigger takes real timeout, boolean periodic, code func returns integer
        local trigger trig = CreateTrigger()
        local integer iHandleId = GetHandleId(trig)

        call TriggerAddCondition(trig, Condition( func))
        call TriggerRegisterTimerEvent(trig, timeout, periodic)

        set trig = null
        return iHandleId
    endfunction



 


 






    private function Init takes nothing returns nothing
        set LocalPlayer = GetLocalPlayer()
        // 使用 GetGameTime() 获取游戏逝去时间
        call TimerStart(GameTimer, 99999., false, null)
        // 定期清触发器
        call CreateTimerEventTrigger(15, true, function TimedCleanupTrigger)
                // 初始化单位组线性表
                call CreateMainGroup()
        // 物品被a掉
        call TriggerAddCondition(ItemDeathEventTrigger, Condition( function ItemDeathEventTriggerCallBack))
        call M_AnyItemDeathEnumItem()


        //用于修正坐标
        set CorrectionMinX = GetRectMinX(bj_mapInitialPlayableArea)+ 75
        set CorrectionMaxX = GetRectMaxX(bj_mapInitialPlayableArea)- 75
        set CorrectionMinY = GetRectMinY(bj_mapInitialPlayableArea)+ 75
        set CorrectionMaxY = GetRectMaxY(bj_mapInitialPlayableArea)- 75
    
    endfunction

endlibrary

