
library UnitStateRefresh requires Common
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

    function RefreshLifeUnitRestore takes unit u returns nothing
        local integer h = GetHandleId(u)
        local integer index = LoadInteger(DynamicData, h, UNIT_LIFERESTORE)
        set LifeRestoreValue[index] = (LoadReal(DynamicData, h, UNIT_LIFERESTORE) +(GetHeroStr(u, true) * 0.04)) * RestoreFrame
    endfunction
    function RefreshManaUnitRestore takes unit u returns nothing
        local integer h = GetHandleId(u)
        local integer index = LoadInteger(DynamicData, h, UNIT_MANARESTORE)
        set ManaRestoreValue[index] = (LoadReal(DynamicData, h, UNIT_MANARESTORE) +(GetHeroInt(u, true) * 0.03)) * RestoreFrame
    endfunction

    function RefreshUnitRestore takes unit u returns nothing
        local integer h = GetHandleId(u)
        set LifeRestoreValue[LoadInteger(DynamicData, h, UNIT_LIFERESTORE)] = (LoadReal(DynamicData, h, UNIT_LIFERESTORE) +(GetHeroStr(u, true) * 0.04)) * RestoreFrame
        set ManaRestoreValue[LoadInteger(DynamicData, h, UNIT_MANARESTORE)] = (LoadReal(DynamicData, h, UNIT_MANARESTORE) +(GetHeroInt(u, true) * 0.03)) * RestoreFrame
    endfunction

    globals
        // 哈希表的Key
        // DynamicData
        constant key UNIT_BASE_ARMOR
        constant key UNIT_BASE_DAMAGE
        constant key UNIT_LIFERESTORE
        constant key UNIT_MANARESTORE
    endglobals
    
    //刷新单位属性
    //call RefreshUnitArmor(u)		//刷新护甲
    //call RefreshUnitBaseAttack(u)	//刷新基础攻击力
    //call RefreshUnitRestor(u)		//刷新状态恢复
    function RefreshUnitState takes unit u returns nothing
        local integer h = GetHandleId(u) //刷新基础护甲
        local real value = LoadReal(DynamicData, h, BONUS_ARMOR) + LoadReal(DynamicData, UNIT_BASE_ARMOR, h)
        local real newValue = (GetHeroAgi(u, true) / 6.00)* 1. + value
        local integer i
        call SetUnitState(u, UNIT_STATE_ARMOR, newValue)
        //刷新基础攻击力
        set value = OBJ_GetHeroPrimaryValue(u)
        set newValue = value + LoadInteger(DynamicData, h, UNIT_BASE_DAMAGE)
        call SetUnitState(u, UNIT_STATE_ATTACK1_DAMAGE_BASE, newValue)
        //刷新 生命/魔法恢复速度
        call RefreshUnitRestore(u)
        debug call Debug("log",GetUnitName(u) + "生命/魔法 恢复：" + R2S(LoadReal(DynamicData, h, UNIT_LIFERESTORE) + GetHeroStr(u, true)* 0.04) + "/" + R2S(LoadReal(DynamicData, h, UNIT_MANARESTORE) + GetHeroInt(u, true)* 0.03) )
        //同时刷新面板
        //call UnitStateUpdateCallback()
    endfunction

endlibrary



