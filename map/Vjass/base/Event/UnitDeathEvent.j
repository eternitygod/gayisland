


scope UnitDeathEvent initializer Init

    //清空以单位handleId为父key的大部分数据
    function FlushUnitData takes unit whichUnit returns nothing
        local integer iHandleId = GetHandleId(whichUnit)
        local integer loop_index = 0
        //如果单位会恢复生命值或魔法值,那么将其移除恢复队列
        if HaveSavedInteger(UnitData, iHandleId, UNIT_LIFERESTORE) then
            call QueuedUnitLifeRestoreRemove(whichUnit)
        endif
        if HaveSavedInteger(UnitData, iHandleId, UNIT_MANARESTORE) then
            call QueuedUnitManaRestoreRemove(whichUnit)
        endif

        call FlushChildHashtable(HT, iHandleId)
        call FlushChildHashtable(UnitData, iHandleId)
        call FlushChildHashtable(UnitKeyBuff, iHandleId)

        call Debug("log", GetUnitName(whichUnit)+ " 数据已清空")	
    endfunction

    //任意单位死亡
    function UnitDeathEvnetActions takes nothing returns boolean
        local unit dyingUnit = GetDyingUnit()
        local integer unitType = GetUnitTypeId(dyingUnit)
        local integer deathType

        call EXUnitRemoveBuffs( dyingUnit, BUFF_TYPE_IS_BUFF )

        if IsUnitType(dyingUnit, UNIT_TYPE_HERO) then

        else
            //非英雄单位死亡直接清空哈希表子目录
            call FlushUnitData(dyingUnit)
            //set deathType = S2I(GetUnitSlkData(unitType, "deathType"))
            //if deathType == 0 or deathType == 1 then
            //	call Debug("log", GetUnitName(dyingUnit)+ " 死亡，不会腐烂")
            //endif
        endif
        set dyingUnit = null
        return false
    endfunction

    private function Init takes nothing returns nothing
        local trigger trig = CreateTrigger() 
        call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_DEATH)
        call TriggerAddCondition(trig, Condition(function UnitDeathEvnetActions))
        set trig = null
    endfunction

endscope

