


library TestSystem initializer Init requires Common

    globals
    
    endglobals

    private function ExecuteTestOrderFunc takes string msg, boolean execute returns nothing
        if execute and msg != null then
            call ExecuteFunc( SCOPE_PRIVATE + msg )
        endif
    endfunction

    private function AddAbility takes nothing returns nothing
        local string idStr = SubString(GetEventPlayerChatString(), 4, 99999)
        local integer abilityId = YDWES2Id( idStr )
        if UnitAddAbility( GetPlayerSelectedUnit(), abilityId ) then
            call Debug( "Test", "AddAbility 成功 " + idStr )
        else
            call Debug( "Test", "AddAbility 失败 " + idStr )
        endif
    endfunction

    private function AddItem takes nothing returns nothing
        local string idStr = SubString(GetEventPlayerChatString(), 4, 99999)
        local integer abilityId = YDWES2Id( idStr )
        if UnitAddItemById( GetPlayerSelectedUnit(), abilityId ) != null then
            call Debug( "Test", "AddItem 成功 " + idStr )
        else
            call Debug( "Test", "AddItem 失败 " + idStr )
        endif
    endfunction

    private function LocalCreateUnit takes nothing returns nothing
        local string idStr = SubString(GetEventPlayerChatString(), 4, 99999)
        local integer abilityId = YDWES2Id( idStr )
        if CreateUnit( LocalPlayer , abilityId, DzGetMouseTerrainX(), DzGetMouseTerrainY(), 0 ) != null then
            call Debug( "Test", "CreateUnit 成功 " + idStr )
        else
            call Debug( "Test", "CreateUnit 失败 " + idStr )
        endif
    endfunction

    private function TestPlayerChat__CallBack takes nothing returns boolean
        local string chatMessage = StringCase(GetEventPlayerChatString(), false)
        local boolean addAbility = SubString(chatMessage, 0, 4)== "-aa "
        local boolean addItem = SubString(chatMessage, 0, 4)== "-ai "
        local boolean createUnit = SubString(chatMessage, 0, 4)== "-cu "

        call ExecuteTestOrderFunc( "AddAbility" , addAbility )
        call ExecuteTestOrderFunc( "AddItem" , addItem )
        call ExecuteTestOrderFunc( "LocalCreateUnit" , createUnit )
        
        return false
    endfunction

    function funcTestSpeed takes nothing returns nothing
        
        local integer i = 0
        loop
            exitwhen i == 1000
            call GetDetectedUnit()
            set i = i + 1
        endloop

    endfunction
    
    function TestEsc takes nothing returns boolean
    
        local integer i = 0
        local real time 
    
        call ClearTextMessages()
    
        if false then
            set time = S2R(EXExecuteScript( "os.clock()" ))
            loop
                exitwhen i == 100
                call ExecuteFunc("funcTestSpeed")
                set i = i + 1
            endloop
    
            //call ClearTextMessages()
    
            call DisplayTextToPlayer(GetLocalPlayer(),0,0, "运行时间" + R2S( S2R(EXExecuteScript( "os.clock()" )) - time  ) )
            call BJDebugMsg(R2S(GetUnitState(LocalPlayerSelectUnit, UNIT_STATE_RATE_OF_FIRE)))
        endif
    
        //call GetLocalizedHotkey("yd_leak_monitor::create_report")
        //call EnableNewUnitStateUI(not NewUnitStateUIIsEnable)

        return false
    endfunction

    private function Init takes nothing returns nothing
        local trigger trig = CreateTrigger()
        call TriggerRegisterPlayerChatEvent( trig, LocalPlayer, null, false )
        call TriggerAddCondition( trig, Condition( function TestPlayerChat__CallBack ) )
        //单机测试
        if bj_isSinglePlayer then
            call SetPlayerState(Player(0), PLAYER_STATE_RESOURCE_GOLD, 99999)
            //测试时Esc清屏
            set IsMirage = true
            call FogEnable(false)
            call FogMaskEnable(false)
            set trig = CreateTrigger()
            call TriggerRegisterPlayerEvent(trig, Player(0), EVENT_PLAYER_END_CINEMATIC)
            call TriggerAddCondition(trig, Condition( function TestEsc))
        endif
        set trig = null
    endfunction
endlibrary


