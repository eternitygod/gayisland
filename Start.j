function Trig_Dummy_And_StartActions takes nothing returns nothing
    local integer S
    local integer G
    local integer D
    // 初始单位组
    set udg_StartTent[0] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'nte0', -25250.00, -24550.00, 340)
    set udg_StartTent[1] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'nte1', -25050.00, -24550.00, 300)
    set udg_Circle[0] = CreateUnit(Player(0), 'ncir', -25250.00, -24350.00, 0)
    set udg_Circle[1] = CreateUnit(Player(1), 'ncir', -25050.00, -24350.00, 0)
    set udg_Circle[2] = CreateUnit(Player(2), 'ncir', -25450.00, -24550.00, 0)
    set udg_Circle[3] = CreateUnit(Player(3), 'ncir', -24850.00, -24550.00, 0)
    set udg_Circle[4] = CreateUnit(Player(4), 'ncir', -25450.00, -24750.00, 0)
    set udg_Circle[5] = CreateUnit(Player(5), 'ncir', -24850.00, -24750.00, 0)
    set udg_Circle[6] = CreateUnit(Player(7), 'ncir', -25250.00, -24950.00, 0)
    set udg_Circle[7] = CreateUnit(Player(6), 'ncir', -25050.00, -24950.00, 0)
    //set udg_Circle[8] = CreateUnit(Player(8), 'ncir', -25100.00, -24800.00, 0)
    //set udg_Circle[9] = CreateUnit(Player(9), 'ncir', -24900.00, -24800.00, 0)
    call GroupAddUnit(udg_StrartUnitGroup, udg_StartTent[0])
    call GroupAddUnit(udg_StrartUnitGroup, udg_StartTent[1])
    set S = 0
    loop
        exitwhen S > 9
        call GroupAddUnit(udg_StrartUnitGroup, udg_Circle[S])
        set S = S + 1
    endloop
    call AddUnitToStock(udg_StartTent[0],'Hart', 1, 1) //圣骑士
    //call AddUnitToStock(udg_StartTent[0],'Hpri', 1, 1) //牧师
    //call AddUnitToStock(udg_StartTent[0],'Hsrr', 1, 1) //火焰法师
    //call AddUnitToStock(udg_StartTent[0],'Hvwd', 1, 1) //游侠
    //call AddUnitToStock(udg_StartTent[0],'Nspt', 1, 1) //盾战士
    call AddUnitToStock(udg_StartTent[0],'Otwl', 1, 1) //巨魔战将
    call AddUnitToStock(udg_StartTent[0],'Ngru', 1, 1) //兽族步兵
    //call AddUnitToStock(udg_StartTent[0],'Ndoc', 1, 1) //巨魔巫医
    call AddUnitToStock(udg_StartTent[0],'Oomg', 1, 1) //食人魔魔法师
    //call AddUnitToStock(udg_StartTent[0],'Nalc', 1, 1) //炼金术士
    //call AddUnitToStock(udg_StartTent[0],'Hvil', 1, 1) //暗影刺客
    call AddUnitToStock(udg_StartTent[1],'Hbel', 1, 1) //中尉
    call AddUnitToStock(udg_StartTent[1],'Nsto', 1, 1) //风暴之灵
    // 演员Dummy
    set udg_Dummy[0] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'Oomg', -25184.00, -24416.00, 0)
    set udg_Dummy[1] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'Nalc', -25408.00, -24288.00, 0)
    set udg_Dummy[2] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'Hvwd', -25504.00, -24480.00, 0)
    set udg_Dummy[3] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'Nspt', -24960.00, -24320.00, 0)
    set udg_Dummy[4] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'Hpri', -24768.00, -24448.00, 0)
    set udg_Dummy[5] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'Hsrr', -24928.00, -24928.00, 0)
    set udg_Dummy[6] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'Otwl', -25536.00, -24672.00, 0)
    set udg_Dummy[7] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'Ngru', -25408.00, -24896.00, 0)
    set udg_Dummy[8] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'Ndoc', -25184.00, -24992.00, 0)
    set udg_Dummy[9] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'Hvil', -25312.00, -24960.00, 0)
    set udg_Dummy[10] = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'Hart', -24800.00, -24736.00, 0)
    set G = 0
    loop
        exitwhen G > 10
        call GroupAddUnit(udg_DummyGroup, udg_Dummy[G])
        set G = G + 1
    endloop
    set D = 0
    loop
        exitwhen D > 10
        call GroupAddUnit(udg_DummyGroup, udg_Dummy[D])
        set D = D + 1
    endloop
    call ForGroup(udg_StrartUnitGroup, function showunitF)
    // 注册
    call ExecuteFunc("InitTrig_Register_Orig")
    call ConditionalTriggerExecute(gg_trg_Register)
    // End
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

//===========================================================================
function InitTrig_Dummy_And_Start takes nothing returns nothing
    set gg_trg_Dummy_And_Start = CreateTrigger()
#ifdef DEBUG
    call YDWESaveTriggerName(gg_trg_Dummy_And_Start, "Dummy And Start")
#endif
    call TriggerRegisterTimerEventSingle(gg_trg_Dummy_And_Start, 0.00)
    call TriggerAddAction(gg_trg_Dummy_And_Start, function Trig_Dummy_And_StartActions)
endfunction
