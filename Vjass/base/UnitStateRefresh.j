
library UnitStateRefresh requires Common, UnitBonusSystem
    //UNIT_LIFERESTORE
    //UNIT_MANARESTORE
    //风暴之灵
    //刷新球状闪电施法需要的耗蓝
    //30 + 6%最大魔法值 作为初始耗蓝
    function RefreshAbilityCost takes unit u returns nothing
        local ability abil
        local integer i = 1
        local integer cost = 0
        if GetUnitAbilityLevel(u, 'Ast0') > 0 then //球状闪电
            set abil = EXGetUnitAbility(u, 'Ast0')
            set cost = R2I(30 + .06 * GetUnitState(u, UNIT_STATE_MAX_MANA)) //30 + 6%最大魔法值
            loop
                call EXSetAbilityDataInteger(abil, i, ABILITY_DATA_COST, cost)
                set i = i + 1
                exitwhen i > 3
            endloop
        endif
        set abil = null
    endfunction



    globals
        // 哈希表的Key
        // DynamicData

        constant key UNIT_LIFERESTORE_BONUS
        constant key UNIT_MANARESTORE_BONUS
    endglobals

    
    //刷新单位属性 攻击 护甲 生命恢复
    function RefreshUnitState takes unit u returns nothing

        local integer h = GetHandleId(u) 
        local real value
        local real newValue

        //刷新基础护甲
        // 先获得单位的白字护甲 - 单位的基础护甲和基础护甲奖励
        set value = GetUnitBaseDamageBonus(h) + OBJ_GetUnitBaseDamage1(u)
        set newValue = (GetHeroAgi(u, true) / 6.00)* 1. + value
        call SetUnitState(u, UNIT_STATE_ARMOR, newValue)

        //刷新基础攻击力 攻击方式 1
        set value = GetUnitBaseArmorBonus(h) + OBJ_GetUnitBaseArmor(u)
        set newValue = value + OBJ_GetHeroPrimaryValue(u)
        call SetUnitState(u, UNIT_STATE_ATTACK1_DAMAGE_BASE, newValue)

        //刷新 生命/魔法恢复速度
        call RefreshUnitRestore(u)
        debug call Debug("log",GetUnitName(u) + "生命/魔法 恢复：" + R2S(LoadReal(DynamicData, h, UNIT_LIFERESTORE) + GetHeroStr(u, true)* 0.04) + "/" + R2S(LoadReal(DynamicData, h, UNIT_MANARESTORE) + GetHeroInt(u, true)* 0.03) )
        // 同时刷新面板
        // call UnitStateUpdateCallback()

    endfunction

endlibrary



