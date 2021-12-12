

#include "Stun.j"

scope BuffSystem initializer InitBuff

    globals
        
        hashtable UnitBuff = InitHashtable()

        private hashtable Buff = InitHashtable()

        key BUFF_TYPE_POSITIVE // 正面
        key BUFF_TYPE_NEGATIVE // 负面

        key BUFF_TYPE_MAGIC // 魔法
        key BUFF_TYPE_PHYSICAL // 物理
        key BUFF_TYPE_AUTODISPEL // 不可驱散Buff

        // 
        key BUFF_TYPE_BUFFID // BuffId 龙卷风光环的BuffId

        key BUFF_TYPE_IS_BUFF // 表示是一个Buff 死亡时会驱散此类
    endglobals


    function SetBuffType takes integer whichAbilityId, integer whichBuffId, integer whichPolarity, integer whichType returns nothing
        call SaveBoolean( Buff, whichType, whichAbilityId, true )
        call SaveInteger( Buff, whichAbilityId, BUFF_TYPE_BUFFID, whichBuffId )
        if whichPolarity != 0 then
            call SaveBoolean( Buff, whichPolarity, whichAbilityId, true )
        endif
        call SaveBoolean( Buff, BUFF_TYPE_IS_BUFF, whichAbilityId, true )
        
    endfunction

    private function InitBuff takes nothing returns nothing
        // 晕眩 负面 物理
        call SetBuffType( 'Aasl', 'BPSE', BUFF_TYPE_NEGATIVE, BUFF_TYPE_PHYSICAL )





    endfunction

    // 
    private function IsBuffType takes integer whichAbilityId, integer whichType returns boolean
        return LoadBoolean( Buff, whichType, whichAbilityId )
    endfunction

    private function GetAbilityBuff takes integer whichAbilityId returns integer
        return LoadInteger( Buff, whichAbilityId, BUFF_TYPE_BUFFID )
    endfunction

    // 单位死亡时移除的Buff
    function EXUnitRemoveBuffs takes unit whichUnit, integer whichType returns nothing
        local integer abilityId = 0
        local integer loop__Index = 0
        local trigger buffTrig
        local integer iHandleId = GetHandleId( whichUnit )
        loop
            set abilityId = EXGetAbilityId( EXGetUnitAbilityByIndex( whichUnit, loop__Index ) )
            exitwhen abilityId == 0

            if IsBuffType( abilityId, whichType ) then
                call UnitRemoveAbility( whichUnit, abilityId )
                set abilityId = GetAbilityBuff( abilityId )
                if abilityId != 0 then
                    set buffTrig = LoadTriggerHandle( UnitKeyBuff, iHandleId, abilityId )
                    call UnitRemoveAbility( whichUnit, abilityId )
                    if buffTrig != null then
                        call TriggerEvaluate( buffTrig )
                    endif
                endif

                debug call Debug( "log", GetUnitName(whichUnit) + " 删除Buff " + GetObjectName(abilityId) + " Id:" + YDWEId2S(abilityId) )
            endif

            set loop__Index = loop__Index + 1
        endloop

        set buffTrig = null

    endfunction

endscope











/*
scope BuffSystem

    // 给单位添加Buff时, 添加成功返回Buff索引, 添加失败返回 0
    // Buff有单独的添加和删除事件
    // 模拟Buff系统
    globals

        // HT
        hashtable UnitBuff = InitHashtable()
        hashtable HT_Buff = InitHashtable()
        integer array BuffArtButton
        integer array BuffArtTexture
        integer array BuffButtonId
        // 
        integer UnitPanelBuffFrame
        integer BuffTipsBackDrop
        integer BuffTipsText
        integer BuffTipsLevel
        integer BuffUberTipsText

        // data
        private key KEY_BUFF_INDEX // 索引
        private key KEY_BUFF_ID // Id
        private key KEY_BUFF_LEVEL // 等级

        // type
        private key KEY_BUFF_IS_COEXIST // 共存Buff

        // evnet
        private key KEY_BUFF_ADD_EVENT // 添加Buff事件
        private key KEY_BUFF_REMOVE_EVENT // 删除Buff事件
        // private key KEY_BUFF_COEXIST_EVENT

        // temp
        integer Temp__BuffId
        integer Temp__BuffLevel
        unit Temp_SourecUnit = null
        unit Temp_TriggerBuffUnit = null

    endglobals



    struct Buff
        integer BuffId
        integer BuffIndex
        integer BuffLevel
        unit BuffSourecUnit
        unit BuffTriggerBuffUnit 
    endstruct

    globals
        private Buff TempIndex = 0
    endglobals
    // 如果添加一个光环 
    // 需要知道Buff的来源
    // 如果多个光环碰撞 取单位所拥有同名Buff中的最高值
    // 这个时候就是共存模式
    // 遍历单位身上所有同名Buff 查找最高值

    // 运行Buff添加事件
    // 事先设置temp变量
    function ExecuteBuffEvent takes integer evnetType returns nothing
        call ExecuteFunc( LoadStr( HT_Buff, evnetType, Temp__BuffId ) )
    endfunction

    // 是否是共存Buff
    function IsCoexistBuff takes integer whichBuffId returns boolean
        return LoadBoolean( HT_Buff, KEY_BUFF_IS_COEXIST, whichBuffId )
    endfunction

    // 获取单位的Buff索引
    function GetUnitBuff takes unit whichUnit, integer buffId returns integer
        return LoadInteger(UnitBuff, GetHandleId(whichUnit), buffId)
    endfunction

    // 成功返回true 失败false
    function UnitRemoveBuff takes unit whichUnit, Buff buffIndex returns boolean
        local integer iHandleId = GetHandleId( whichUnit )
        local integer maxCount
        local integer count 
        debug call Debug( "log", GetUnitName(whichUnit) + " 删除Buff " + I2S(buffIndex) + " Id:" + YDWEId2S(buffIndex.BuffId) )
        if buffIndex == 0 then
            return false
        endif
        set maxCount = LoadInteger( UnitBuff, iHandleId, 0 )
        set count = LoadInteger( HT_Buff, buffIndex, KEY_BUFF_INDEX )
        if maxCount != count then
            call SaveInteger( UnitBuff, iHandleId, count, LoadInteger( UnitBuff, iHandleId, maxCount ) )
        endif
       
        call SaveInteger( UnitBuff, iHandleId, 0, maxCount - 1)
        call buffIndex.destroy()
        return true
    endfunction

    function GetBuffLevel takes Buff index returns integer
        return index.BuffLevel
    endfunction

    private function AddBuff takes unit whichUnit, integer buffIndex returns nothing
        local integer iHandleId = GetHandleId(whichUnit)
        local integer maxCount = LoadInteger( UnitBuff, iHandleId, 0 ) + 1

        call SaveInteger( UnitBuff, iHandleId, maxCount, buffIndex )

        call SaveInteger( UnitBuff, iHandleId, 0, maxCount )
        call SaveInteger( HT_Buff, buffIndex, KEY_BUFF_INDEX, maxCount )
    endfunction

    // 返回 0 代表添加失败
    // whichUnit = 被添加buff的单位 sourecUnit = 来源单位
    // Buff等级是以来源技能为准
    function UnitAddAbilityBuff takes unit whichUnit, unit sourecUnit, integer sourecAbilityId, integer whichBuffId returns integer
        local integer iHandleId = GetHandleId( whichUnit )
        local Buff buffIndex = GetUnitBuff( whichUnit, whichBuffId )
        // 从来源单位身上获取 技能的等级 作为 Buff 等级
        local integer buffLevel = GetUnitAbilityLevel( sourecUnit, sourecAbilityId )
        local boolean coexist = IsCoexistBuff( whichBuffId )

        if sourecAbilityId == 0 then
            set buffLevel = 1
        endif

        if buffIndex == 0 or coexist then

            set buffIndex = Buff.create()

            call AddBuff( whichUnit, buffIndex )

            call SaveInteger( HT_Buff, buffIndex, KEY_BUFF_LEVEL, buffLevel )

            call SaveInteger( HT_Buff, buffIndex, KEY_BUFF_ID, whichBuffId )

            set TempIndex = buffIndex
            set buffIndex.BuffLevel = buffLevel
            set buffIndex.BuffId = whichBuffId
            set buffIndex.BuffSourecUnit = sourecUnit
            set buffIndex.BuffTriggerBuffUnit = whichUnit
    
            //call ExecuteBuffEvent( KEY_BUFF_ADD_EVENT )


            debug call Debug( "log", GetUnitName(whichUnit) + " 添加Buff " + I2S(buffIndex)+ " 等级 " + I2S(buffLevel) + " Id:" + YDWEId2S(whichBuffId) )

        else

            debug call Debug( "log", GetUnitName(whichUnit) + " 添加Buff, 有重名Buff, 开始叠加. BuffId:" + YDWEId2S(whichBuffId) )

            if buffLevel > GetBuffLevel( buffIndex ) then

                set TempIndex = buffIndex
                set buffIndex.BuffLevel = buffLevel
                set buffIndex.BuffId = whichBuffId
                set buffIndex.BuffSourecUnit = sourecUnit
                set buffIndex.BuffTriggerBuffUnit = whichUnit
                //call ExecuteBuffEvent( KEY_BUFF_ADD_EVENT )
                // if coexist then
                //     call ExecuteBuffEvent( KEY_BUFF_COEXIST_EVENT )
                // endif

                debug else
                debug call Debug( "log", GetUnitName(whichUnit) + " Buff添加失败 等级不足以覆盖. BuffId: " + YDWEId2S(whichBuffId) )

            endif
        endif

        return buffIndex
    endfunction

    function GetTriggerBuffId takes nothing returns integer
        return TempIndex.BuffId
    endfunction

    function GetTriggerBuffLevel takes nothing returns integer
        return TempIndex.BuffLevel
    endfunction

    function GetTriggerBuffSourecUnit takes nothing returns unit
        return TempIndex.BuffSourecUnit
    endfunction

    function GetTriggerBuffUnit takes nothing returns unit
        return TempIndex.BuffTriggerBuffUnit
    endfunction

    function RegisterBuff takes integer buffId, string addEvent, string removeEvent returns nothing
        // 添加Buff事件
        call SaveStr( HT_Buff, KEY_BUFF_ADD_EVENT, buffId, addEvent )
        call SaveStr( HT_Buff, KEY_BUFF_REMOVE_EVENT, buffId, removeEvent )
    endfunction

    function RemoveDeathDisperseBuff takes unit whichUnit returns nothing
        local integer iHandleId = GetHandleId( whichUnit )
        // local integer 



    endfunction
    /*

    function CreateBuffToolTip takes nothing returns nothing
        set BuffTipsBackDrop = DzCreateFrameByTagName("BACKDROP", null, GameUI, "TooltipBackDrop", 0)
        set BuffTipsText = DzCreateFrameByTagName("TEXT", null, BuffTipsBackDrop, "TipText", 0)
        set BuffTipsLevel = DzCreateFrameByTagName("TEXT", null, BuffTipsBackDrop, "TipText", 0)
        set BuffUberTipsText = DzCreateFrameByTagName("TEXT", null, BuffTipsBackDrop, "TipText", 0)
        //设置tip和ubertip
        call DzFrameSetText(BuffTipsText, "TipsText")
        call DzFrameSetText(BuffTipsLevel, null)
        call DzFrameSetText(BuffUberTipsText, "UberTipsText")
	
        //
        //call DzFrameSetSize(BuffTipsBackDrop, 0.209, 0)
        call DzFrameSetSize(BuffTipsText, 0.209, 0)
        call DzFrameSetSize(BuffTipsLevel, 0.209, 0)
        call DzFrameSetSize(BuffUberTipsText, 0.209, 0)
        //设置"提示背景"的左上为"提示"的左上
        call DzFrameSetPoint(BuffTipsBackDrop, 0, BuffTipsText, 0, - 0.004, 0.004)
        //设置"提示"的底部为"需求提示"的顶部
        call DzFrameSetPoint(BuffTipsText, 6, BuffTipsLevel, 0, 0, 0.004)

        call DzFrameSetPoint(BuffTipsLevel, 6, BuffUberTipsText, 0, 0, 0.004)
        //设置"提示背景"的右下为"扩展提示"的右下
        call DzFrameSetPoint(BuffTipsBackDrop, 8, BuffUberTipsText, 8, 0.004, - 0.004)
        call DzFrameSetAbsolutePoint(BuffUberTipsText, 8, 0.7935, 0.168)

        call DzFrameShow(BuffTipsBackDrop, false)
    endfunction

    function EnterBuffButton takes nothing returns nothing
        local integer frame = DzGetTriggerUIEventFrame()
        local integer loop_i = 1
        local integer iBuff
        loop
            exitwhen BuffArtButton[loop_i] == frame
            set loop_i = loop_i + 1
        endloop
        set iBuff = BuffButtonId[loop_i]
        call DzFrameSetText(BuffTipsText, BuffDataTips[iBuff])
        call DzFrameSetText(BuffTipsLevel, "|Cff808080等级：|R " + I2S(BuffDataLevel[iBuff]))
        call DzFrameSetText(BuffUberTipsText, BuffDataUberTips[iBuff])
        call DzFrameShow(BuffTipsBackDrop, true)
    endfunction

    function LeaveBuffButton takes nothing returns nothing
        call DzFrameShow(BuffTipsBackDrop, false)
    endfunction


    function ShowUnitBuffBar takes unit whichUnit returns nothing
        local integer iHandleId
        local integer buffCount
        local integer loop_i
        local integer iBuff
        set iHandleId = GetHandleId(whichUnit)
        set buffCount = LoadInteger(UnitBuff, iHandleId, 1000)
        if buffCount == 0 then
            call DzFrameSetAbsolutePoint( BuffArtButton[1], 4, - 0.8, - 0.6)
            return
        endif
        set buffCount = IMinBJ(buffCount, 8)
        call DzFrameSetAbsolutePoint( BuffArtButton[buffCount], 4, 0.36 + 0.016 * buffCount, 0.012)
        set loop_i = 1
        loop
            set iBuff = GetUnitBuff(whichUnit, LoadInteger(UnitBuff, iHandleId, loop_i))
            call DzFrameSetTexture(BuffArtTexture[loop_i] , BuffDataArt[iBuff], 0)
            set BuffButtonId[loop_i] = iBuff
            //call DzFrameSetText(BuffTipsText, "|cff20c000"+LoadStr(UnitBuff, ibuff, 2)+"|r")
            //call DzFrameSetText(BuffUberTipsText, LoadStr(UnitBuff, ibuff, 3))
            exitwhen loop_i == buffCount
            set loop_i = loop_i + 1
        endloop
    endfunction

    function Update_Callback takes nothing returns nothing
        local unit selectUnit = GetRescuer()

        if selectUnit == null then
            set selectUnit = null
            return
        endif
        set LoaclPlayerSelectUnit = selectUnit
        call ShowUnitBuffBar(selectUnit)
    endfunction

    function InitBuffUI takes nothing returns nothing
        local integer i = 0
        local string dummyStr
        set UnitPanelBuffFrame = DzCreateSimpleFrame("BuffButtonFrame", DzSimpleFrameFindByName("SimpleInfoPanelUnitDetail", 0), 0)
        call DzFrameSetAbsolutePoint(UnitPanelBuffFrame, 4, 0.43, 0.012)
        call CreateBuffToolTip()
        set i = 1
        loop
            exitwhen i > 8
            set dummyStr = I2S(i)
            set BuffArtButton[i] = DzSimpleFrameFindByName("BuffButton0" + dummyStr, 0)
            set BuffArtTexture[i] = DzSimpleTextureFindByName("BuffButtonBackground0" + dummyStr, 0)
            call DzFrameSetScriptByCode( BuffArtButton[i], 2, function EnterBuffButton, false)
            call DzFrameSetScriptByCode( BuffArtButton[i], 3, function LeaveBuffButton, false)
            //初始时 隐藏
            call DzFrameSetAbsolutePoint( BuffArtButton[i], 4, - 0.8 , - 0.6 )
            call DzFrameSetTexture(BuffArtTexture[i], "ReplaceableTextures\\CommandButtons\\BTNGlacier.blp", 0)
            set i = i + 1
        endloop
    endfunction
    */

endscope

*/

