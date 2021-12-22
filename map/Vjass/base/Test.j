


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

    private function Init takes nothing returns nothing
        local trigger trig = CreateTrigger()
        call TriggerRegisterPlayerChatEvent( trig, LocalPlayer, null, false )
        call TriggerAddCondition( trig, Condition( function TestPlayerChat__CallBack ) )
    endfunction
endlibrary


