function Trig_StarUnitActions takes nothing returns nothing
    //屠夫
    set udg_Boos[0] = CreateUnit(Player(10), 'Uabo', -13580.00, -26820.00, 180.00)
    call UnitAddAbility(udg_Boos[0], 'A00J') //肢解
    call UnitAddAbility(udg_Boos[0], 'AHHH') //碾压
    call UnitAddAbility(udg_Boos[0], 'ATft') //肉钩
    call ADDXP(udg_Boos[0],5400) //10级
    call SetUnitAnimation(udg_Boos[1], "Death")
    //骷髅王
    set udg_Boos[1] = CreateUnit(Player(10), 'NSlk', -13700.00, -24450.00, 220.00)
    call UnitAddAbility(udg_Boos[1], 'AHHH') //碾压
    call UnitAddAbility(udg_Boos[1], 'ASlT') //冥火暴击
    call UnitAddAbility(udg_Boos[1], 'ASlb') //重击
    call UnitAddAbility(udg_Boos[1], 'ASlr') //重生
    call UnitAddAbility(udg_Boos[1], 'ASlw') //震荡波
    call SetUnitAbilityLevel(udg_Boos[1], 'AHHH', 2) //二级碾压
    call ADDXP(udg_Boos[1],9000) //13级
    //死灵法师
    set udg_Boos[2] = CreateUnit(Player(10), 'Unec', -7600.00, -18464.00, 200.00)
    call ADDXP(udg_Boos[2],11900) //15级
    call UnitAddAbility(udg_Boos[2],'ANeh') //竭心光环
    // Ghoul
    call  CreateUnit(Player(10), 'ugho', -24000.00, -23800.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'ugho', -23900.00, -25200.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'ugho', -23450.00, -25000.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'ugho', -23450.00, -25000.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'ugho', -23000.00, -25184.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'ugho', -23744.00, -25888.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'ugho', -24128.00, -26368.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'ugho', -22240.00, -24672.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'ugho', -21216.00, -23872.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'ugho', -21376.00, -26400.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'ugho', -21408.00, -27072.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'ugho', -22752.00, -26016.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'ugho', -18384.00, -27264.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'ugho', -16256.00, -20800.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'ugho', -16000.00, -20512.00, GetRandomDirectionDeg())
    // Ghoul
    // 屠夫前
    call  CreateUnit(Player(10), 'u003', -21312.00, -22720.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'u003', -22272.00, -25920.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'ugho', -18336.00, -27136.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'ugho', -18240.00, -27392.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'ugho', -16960.00, -26880.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'u003', -17152.00, -27104.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'ugho', -21120.00, -22272.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'ugho', -20928.00, -22336.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'ugho', -22304.00, -25792.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'ugho', -18000.00, -27104.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'ugho', -18000.00, -27360.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'slAc', -16928.00, -27296.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'uslm', -16768.00, -27040.00, GetRandomDirectionDeg())
    // Skeleton
    call  CreateUnit(Player(10), 'u003', -13280.00, -23648.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'u003', -13440.00, -23040.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'u003', -13696.00, -23104.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'u003', -13120.00, -23392.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'slAc', -13632.00, -22880.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'ugho', -14176.00, -21984.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'ugho', -14304.00, -21856.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'slAc', -14432.00, -21664.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'uslm', -14592.00, -21824.00, GetRandomDirectionDeg())
    call  CreateUnit(Player(10), 'uslm', -16096.00, -20672.00, GetRandomDirectionDeg())
    // End
    call DestroyTrigger(GetTriggeringTrigger())
endfunction

//===========================================================================
function InitTrig_StarUnit_Orig takes nothing returns nothing
    set gg_trg_StarUnit = CreateTrigger()
#ifdef DEBUG
    call YDWESaveTriggerName(gg_trg_StarUnit, "StarUnit")
#endif
    call TriggerAddAction(gg_trg_StarUnit, function Trig_StarUnitActions)
endfunction

function InitTrig_StarUnit takes nothing returns nothing
endfunction

