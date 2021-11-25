
scope UnitBonusSystem 

    globals
        //ObjectData
        key BONUS_DAMAGE// = 0   //攻击
        key BONUS_ARMOR// = 1 //护甲
        key BONUS_ATTACK// = 2    //攻速
        key BONUS_LIFE// = 3 //最大生命
        key BONUS_MANA// = 4 //最大魔法
        key BONUS_STR// = 5
        key BONUS_AGI// = 6
        key BONUS_INT// = 7
        key BONUS_MOVESPEED// = 8   //移动速度
    endglobals

    //设置单位生命恢复速度 这里GetHandleId用了三次 待优化
    function UnitSetLifeRestore takes unit whichUnit, real newValue returns nothing
        local integer h = GetHandleId(whichUnit)
        local integer index = LoadInteger(UnitData, h, UNIT_LIFERESTORE)
        if index == 0 then
            call QueuedUnitLifeRestoreAdd(whichUnit)
        endif
        call SaveReal(UnitData, h, UNIT_LIFERESTORE, newValue)
        call RefreshLifeUnitRestore(whichUnit)
    endfunction
    function UnitAddLifeRestore takes unit whichUnit, real value returns nothing
        call UnitSetLifeRestore(whichUnit, LoadReal(UnitData, GetHandleId(whichUnit), UNIT_LIFERESTORE) + value)
    endfunction
    function UnitReduceLifeRestore takes unit whichUnit, real value returns nothing
        call UnitSetLifeRestore(whichUnit, LoadReal(UnitData, GetHandleId(whichUnit), UNIT_LIFERESTORE) - value)
    endfunction
    //设置单位魔法恢复速度
    function UnitSetManaRestore takes unit whichUnit, real newValue returns nothing
        local integer h = GetHandleId(whichUnit)
        local integer index = LoadInteger(UnitData, h, UNIT_MANARESTORE)
        if index == 0 then
            call QueuedUnitManaRestoreAdd(whichUnit)
        endif
        call SaveReal(UnitData, h, UNIT_MANARESTORE, newValue)
        call RefreshManaUnitRestore(whichUnit)
    endfunction
    function UnitAddManaRestore takes unit whichUnit, real value returns nothing
        call UnitSetManaRestore(whichUnit, LoadReal(UnitData, GetHandleId(whichUnit), UNIT_MANARESTORE) + value)
    endfunction
    function UnitReduceManaRestore takes unit whichUnit, real value returns nothing
        call UnitSetManaRestore(whichUnit, LoadReal(UnitData, GetHandleId(whichUnit), UNIT_MANARESTORE) - value)
    endfunction
    //JAPI修改技能数据，并且刷新。
    //*额外 攻击 防御 攻速*/
    //升级并降低技能等级以此达到刷新属性的目的
    function UnitAddAttackSpeedBonus takes unit whichUnit, real value returns nothing
        local integer h = GetHandleId(whichUnit)
        if GetUnitAbilityLevel(whichUnit, 'AIsx') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'AIsx')
        endif
        set value = LoadReal(UnitData, h, BONUS_ATTACK) + value
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIsx'), 1, ABILITY_DATA_DATA_A, value)
        call IncUnitAbilityLevel(whichUnit, 'AIsx' ) 
        call DecUnitAbilityLevel(whichUnit, 'AIsx' )
        call SaveReal(UnitData, h, BONUS_ATTACK, value)
    endfunction
    function UnitReduceAttackSpeedBonus takes unit whichUnit, real value returns nothing
        local integer h = GetHandleId(whichUnit)
        if GetUnitAbilityLevel(whichUnit, 'AIsx') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'AIsx')
        endif
        set value = LoadReal(UnitData, h, BONUS_ATTACK) - value
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIsx'), 1, ABILITY_DATA_DATA_A, value)
        call IncUnitAbilityLevel(whichUnit, 'AIsx' ) 
        call DecUnitAbilityLevel(whichUnit, 'AIsx' )
        call SaveReal(UnitData, h, BONUS_ATTACK, value)
    endfunction
    function UnitSetAttackSpeedBonus takes unit whichUnit, real newValue returns nothing
        if GetUnitAbilityLevel(whichUnit, 'AIsx') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'AIsx')
        endif
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIsx'), 1, ABILITY_DATA_DATA_A, newValue)
        call IncUnitAbilityLevel(whichUnit, 'AIsx' )
        call DecUnitAbilityLevel(whichUnit, 'AIsx' )
        call SaveReal(UnitData, GetHandleId(whichUnit), BONUS_ATTACK, newValue)
    endfunction


    function UnitAddArmorBonus takes unit whichUnit, real value returns nothing
        local integer h = GetHandleId(whichUnit)
        if GetUnitAbilityLevel(whichUnit, 'AId1') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'AId1')
        endif
        set value = LoadReal(UnitData, h, BONUS_ARMOR) + value
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AId1'), 1, ABILITY_DATA_DATA_A, value)
        call IncUnitAbilityLevel(whichUnit, 'AId1' ) 
        call DecUnitAbilityLevel(whichUnit, 'AId1' )
        call SaveReal(UnitData, h, BONUS_ARMOR, value)
    endfunction
    function UnitReduceArmorBonus takes unit whichUnit, real value returns nothing
        local integer h = GetHandleId(whichUnit)
        if GetUnitAbilityLevel(whichUnit, 'AId1') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'AId1')
        endif
        set value = LoadReal(UnitData, h, BONUS_ARMOR) - value
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AId1'), 1, ABILITY_DATA_DATA_A, value)
        call IncUnitAbilityLevel(whichUnit, 'AId1' ) 
        call DecUnitAbilityLevel(whichUnit, 'AId1' )
        call SaveReal(UnitData, h, BONUS_ARMOR, value)
    endfunction
    function UnitSetArmorBonus takes unit whichUnit, real newValue returns nothing
        if GetUnitAbilityLevel(whichUnit, 'AId1') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'AId1')
        endif
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AId1'), 1, ABILITY_DATA_DATA_A, newValue)
        call IncUnitAbilityLevel(whichUnit, 'AId1' )
        call DecUnitAbilityLevel(whichUnit, 'AId1' )
        call SaveReal(UnitData, GetHandleId(whichUnit), BONUS_ARMOR, newValue)
    endfunction

    //增加单位移动速度
    function UnitAddMoveSpeedBonus takes unit whichUnit, real value returns nothing
        local integer h = GetHandleId(whichUnit)
        if GetUnitAbilityLevel(whichUnit, 'AIms') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'AIms')
        endif
        set value = LoadReal(UnitData, h, BONUS_MOVESPEED) + value
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIms'), 1, ABILITY_DATA_DATA_A, value)
        call IncUnitAbilityLevel(whichUnit, 'AIms' ) 
        call DecUnitAbilityLevel(whichUnit, 'AIms' )
        call SaveReal(UnitData, h, BONUS_MOVESPEED, value)
    endfunction
    //减少单位移动速度
    function UnitReduceMoveSpeedBonus takes unit whichUnit, real value returns nothing
        local integer h = GetHandleId(whichUnit)
        if GetUnitAbilityLevel(whichUnit, 'AIms') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'AIms')
        endif
        set value = LoadReal(UnitData, h, BONUS_MOVESPEED) - value
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIms'), 1, ABILITY_DATA_DATA_A, value)
        call IncUnitAbilityLevel(whichUnit, 'AIms' ) 
        call DecUnitAbilityLevel(whichUnit, 'AIms' )
        call SaveReal(UnitData, h, BONUS_MOVESPEED, value)
    endfunction
    //设置单位移动速度
    function UnitSetMoveSpeedBonus takes unit whichUnit, real newValue returns nothing
        if GetUnitAbilityLevel(whichUnit, 'AIms') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'AIms')
        endif
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIms'), 1, ABILITY_DATA_DATA_A, newValue)
        call IncUnitAbilityLevel(whichUnit, 'AIms' )
        call DecUnitAbilityLevel(whichUnit, 'AIms' )
        call SaveReal(UnitData, GetHandleId(whichUnit), BONUS_MOVESPEED, newValue)
    endfunction

    function UnitAddDamageBonus takes unit whichUnit, real value returns nothing
        local integer h = GetHandleId(whichUnit)
        if GetUnitAbilityLevel(whichUnit, 'AIat') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'AIat')
        endif
        set value = LoadReal(UnitData, h, BONUS_DAMAGE) + value
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIat'), 1, ABILITY_DATA_DATA_A, value)
        call IncUnitAbilityLevel(whichUnit, 'AIat' ) 
        call DecUnitAbilityLevel(whichUnit, 'AIat' )
        call SaveReal(UnitData, h, BONUS_DAMAGE, value)
    endfunction
    function UnitReduceDamageBonus takes unit whichUnit, real value returns nothing
        local integer h = GetHandleId(whichUnit)
        if GetUnitAbilityLevel(whichUnit, 'AIat') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'AIat')
        endif
        set value = LoadReal(UnitData, h, BONUS_DAMAGE) - value
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIat'), 1, ABILITY_DATA_DATA_A, value)
        call IncUnitAbilityLevel(whichUnit, 'AIat' ) 
        call DecUnitAbilityLevel(whichUnit, 'AIat' )
        call SaveReal(UnitData, h, BONUS_DAMAGE, value)
    endfunction
    function UnitSetDamageBonus takes unit whichUnit, real newValue returns nothing
        if GetUnitAbilityLevel(whichUnit, 'AIat') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'AIat')
        endif
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIat'), 1, ABILITY_DATA_DATA_A, newValue)
        call IncUnitAbilityLevel(whichUnit, 'AIat' )
        call DecUnitAbilityLevel(whichUnit, 'AIat' )
        call SaveReal(UnitData, GetHandleId(whichUnit), BONUS_DAMAGE, newValue)
    endfunction

    function UnitAddStrBonus takes unit whichUnit, integer value returns nothing
        local integer h = GetHandleId(whichUnit)
        local ability abAamk = EXGetUnitAbility(whichUnit, 'Aamk')
        if GetUnitAbilityLevel(whichUnit, 'Aamk') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'Aamk')
        endif
        set value = LoadInteger(UnitData, h, BONUS_STR) + value
        call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_C, value)
        call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_B, LoadInteger(UnitData, h, BONUS_INT))
        call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_A, LoadInteger(UnitData, h, BONUS_AGI))
        call IncUnitAbilityLevel(whichUnit, 'Aamk' ) 
        call DecUnitAbilityLevel(whichUnit, 'Aamk' )
        call SaveInteger(UnitData, h, BONUS_STR, value)
        set abAamk = null
    endfunction
    function UnitReduceStrBonus takes unit whichUnit, integer value returns nothing
        local integer h = GetHandleId(whichUnit)
        local ability abAamk = EXGetUnitAbility(whichUnit, 'Aamk')
        if GetUnitAbilityLevel(whichUnit, 'Aamk') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'Aamk')
        endif
        set value = LoadInteger(UnitData, h, BONUS_STR) - value
        call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_C, value)
        call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_B, LoadInteger(UnitData, h, BONUS_INT))
        call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_A, LoadInteger(UnitData, h, BONUS_AGI))
        call IncUnitAbilityLevel(whichUnit, 'Aamk' ) 
        call DecUnitAbilityLevel(whichUnit, 'Aamk' )
        call SaveInteger(UnitData, h, BONUS_STR, value)
        set abAamk = null
    endfunction
    function UnitSetStrBonus takes unit whichUnit, integer newValue returns nothing
        local integer h = GetHandleId(whichUnit)
        local ability abAamk = EXGetUnitAbility(whichUnit, 'Aamk')
        if GetUnitAbilityLevel(whichUnit, 'Aamk') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'Aamk')
        endif
        call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_C, newValue)
        call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_B, LoadInteger(UnitData, h, BONUS_INT))
        call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_A, LoadInteger(UnitData, h, BONUS_AGI))
        call IncUnitAbilityLevel(whichUnit, 'Aamk' )
        call DecUnitAbilityLevel(whichUnit, 'Aamk' )
        call SaveInteger(UnitData, h, BONUS_STR, newValue)
        set abAamk = null
    endfunction

    //设置单位最大生命值 会按当前比例改变
    function UnitAddMaxLife takes unit whichUnit, real value returns nothing
        local real maxlife = GetUnitState(whichUnit, UNIT_STATE_MAX_LIFE)
        set value = maxlife + value
        call SetUnitState(whichUnit, UNIT_STATE_MAX_LIFE, value)
        if UnitAlive(whichUnit) then
            call SetWidgetLife(whichUnit, GetWidgetLife(whichUnit) * (value / maxlife) )
        endif
    endfunction
    function UnitReduceMaxLife takes unit whichUnit, real value returns nothing
        local real maxlife = GetUnitState(whichUnit, UNIT_STATE_MAX_LIFE)
        local real life = GetWidgetLife(whichUnit)
        set value = maxlife - value
        call SetUnitState(whichUnit, UNIT_STATE_MAX_LIFE, value)
        if UnitAlive(whichUnit) and maxlife != life then
            call SetWidgetLife(whichUnit, life * (value / maxlife) )
        endif
    endfunction
    function UnitSetMaxLife takes unit whichUnit, real newVal returns nothing
        local real maxlife = GetUnitState(whichUnit, UNIT_STATE_MAX_LIFE)
        call SetUnitState(whichUnit, UNIT_STATE_MAX_LIFE, newVal)
        if UnitAlive(whichUnit) then
            call SetWidgetLife(whichUnit, GetWidgetLife(whichUnit) * (newVal / maxlife) ) //按比例改变血量
        endif
    endfunction

    //设置单位最大魔法值 会按当前比例改变
    function UnitAddMaxMana takes unit whichUnit, real value returns nothing
        local real maxmana = GetUnitState(whichUnit, UNIT_STATE_MAX_MANA)
        local real mana = GetUnitState(whichUnit, UNIT_STATE_MANA)
        set value = maxmana + value
        call SetUnitState(whichUnit, UNIT_STATE_MAX_MANA, value)
        if UnitAlive(whichUnit) then
            if maxmana == mana then
                call SetUnitState(whichUnit, UNIT_STATE_MANA, value)
            else
                call SetUnitState(whichUnit, UNIT_STATE_MANA, GetUnitState(whichUnit, UNIT_STATE_MANA) * (value / maxmana) )
            endif
        endif
    endfunction
    function UnitReduceMaxMana takes unit whichUnit, real value returns nothing
        local real maxmana = GetUnitState(whichUnit, UNIT_STATE_MAX_MANA)
        local real mana = GetUnitState(whichUnit, UNIT_STATE_MANA)
        set value = maxmana - value
        call SetUnitState(whichUnit, UNIT_STATE_MAX_MANA, value)
        if UnitAlive(whichUnit) and maxmana != mana then
            call SetUnitState(whichUnit, UNIT_STATE_MANA, mana * (value / maxmana) )
        endif
    endfunction
    function UnitSetMaxMana takes unit whichUnit, real newVal returns nothing
        local real maxmana = GetUnitState(whichUnit, UNIT_STATE_MAX_MANA)
        call SetUnitState(whichUnit, UNIT_STATE_MAX_MANA, newVal)
        if UnitAlive(whichUnit) then
            call SetUnitState(whichUnit, UNIT_STATE_MANA, GetUnitState(whichUnit, UNIT_STATE_MANA) * (newVal / maxmana) )
        endif
    endfunction

    //仅用作物品刷新属性
    function UnitAddAttribute takes unit whichUnit, integer itemId returns nothing
        local integer h = GetHandleId(whichUnit)
        local integer str = LoadInteger(UnitData, h, BONUS_STR) + LoadInteger(ObjectData, itemId, BONUS_STR)
        local integer agi = LoadInteger(UnitData, h, BONUS_AGI) + LoadInteger(ObjectData, itemId, BONUS_AGI)
        local integer int = LoadInteger(UnitData, h, BONUS_INT) + LoadInteger(ObjectData, itemId, BONUS_INT)
        if GetUnitAbilityLevel(whichUnit, 'Aamk') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'Aamk')
        endif
        call SaveInteger(UnitData, h, BONUS_STR, str)
        call SaveInteger(UnitData, h, BONUS_AGI, agi)
        call SaveInteger(UnitData, h, BONUS_INT, int)
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'Aamk'), 1, ABILITY_DATA_DATA_C, str)
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'Aamk'), 1, ABILITY_DATA_DATA_B, int)
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'Aamk'), 1, ABILITY_DATA_DATA_A, agi)
        call IncUnitAbilityLevel(whichUnit, 'Aamk' )
        call DecUnitAbilityLevel(whichUnit, 'Aamk' )
    endfunction
    function UnitReduceAttribute takes unit whichUnit, integer itemId returns nothing
        local integer h = GetHandleId(whichUnit)
        local integer str = LoadInteger(UnitData, h, BONUS_STR) - LoadInteger(ObjectData, itemId, BONUS_STR)
        local integer agi = LoadInteger(UnitData, h, BONUS_AGI) - LoadInteger(ObjectData, itemId, BONUS_AGI)
        local integer int = LoadInteger(UnitData, h, BONUS_INT) - LoadInteger(ObjectData, itemId, BONUS_INT)
        if GetUnitAbilityLevel(whichUnit, 'Aamk') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'Aamk')
        endif
        call SaveInteger(UnitData, h, BONUS_STR, str)
        call SaveInteger(UnitData, h, BONUS_AGI, agi)
        call SaveInteger(UnitData, h, BONUS_INT, int)
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'Aamk'), 1, ABILITY_DATA_DATA_C, str)
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'Aamk'), 1, ABILITY_DATA_DATA_B, int)
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'Aamk'), 1, ABILITY_DATA_DATA_A, agi)
        call IncUnitAbilityLevel(whichUnit, 'Aamk' )
        call DecUnitAbilityLevel(whichUnit, 'Aamk' )
    endfunction

    function GetUnitStateBonus takes unit whichUnit, integer iBonusType returns real
        return LoadReal(UnitData, GetHandleId(whichUnit), iBonusType)
    endfunction

    // 通过句柄来查单位的额外属性加成 会被内联
    function GetUnitStateBonusByHandleId takes integer whichHandleId, integer iBonusType returns real
        return LoadReal(UnitData, whichHandleId, iBonusType)
    endfunction

    // 同步镜像与本体的属性
    function SyncIllusionUnitState takes unit hIllusionUnit, unit hMasterUnit returns nothing
        local real value = 0.
        local ability hAbilityAamk
        local integer iMasterUnitHandleId = GetHandleId(hMasterUnit)
        // 攻击力
        set value = GetUnitStateBonusByHandleId(iMasterUnitHandleId, BONUS_DAMAGE)
        call UnitSetDamageBonus(hIllusionUnit, value)
        // 护甲
        set value = GetUnitStateBonusByHandleId(iMasterUnitHandleId, BONUS_ARMOR)
        call UnitSetArmorBonus(hIllusionUnit, value) 
        // 攻速
        set value = GetUnitStateBonusByHandleId(iMasterUnitHandleId, BONUS_ATTACK)
        call UnitAddAttackSpeedBonus(hIllusionUnit, value)
        // 如果AHer ＞ 0 就是英雄单位镜像
        if GetUnitAbilityLevel(hIllusionUnit, 'AHer') > 0 and GetUnitAbilityLevel(hMasterUnit, 'Aamk') > 0 then
            set hAbilityAamk = EXGetUnitAbility(hIllusionUnit, 'Aamk')
            call EXSetAbilityDataReal(hAbilityAamk, 1, ABILITY_DATA_DATA_C, GetUnitStateBonusByHandleId(iMasterUnitHandleId, BONUS_STR))
            call EXSetAbilityDataReal(hAbilityAamk, 1, ABILITY_DATA_DATA_B, GetUnitStateBonusByHandleId(iMasterUnitHandleId, BONUS_INT))
            call EXSetAbilityDataReal(hAbilityAamk, 1, ABILITY_DATA_DATA_A, GetUnitStateBonusByHandleId(iMasterUnitHandleId, BONUS_AGI))
            set hAbilityAamk = null
            call IncUnitAbilityLevel(hIllusionUnit, 'Aamk' )
            call DecUnitAbilityLevel(hIllusionUnit, 'Aamk' )
            // 生命值和魔法值默认同步 但如果修改了额外属性可能会导致不一致
            // 最大生命值
            set value = GetUnitState(hMasterUnit, UNIT_STATE_MAX_LIFE)
            call SetUnitState(hIllusionUnit, UNIT_STATE_MAX_LIFE, value)
            // 最大魔法值
            set value = GetUnitState(hMasterUnit, UNIT_STATE_MAX_MANA)
            call SetUnitState(hIllusionUnit, UNIT_STATE_MAX_MANA, value)
        endif
    endfunction

    //初始化单位属性 暂时弃用 (因为每个单位要加出生直接多4个技能太浪费了)
    /*function InitUnitBonus takes unit whichUnit returns nothing
    local ability abAamk = null
    if not IsInitUnit then
        call EXSetAbilityDataReal(EXGetUnitAbility(BonusDummy, 'AIat'), 1, ABILITY_DATA_DATA_A, 0)
        call EXSetAbilityDataReal(EXGetUnitAbility(BonusDummy, 'AId1'), 1, ABILITY_DATA_DATA_A, 0)
        call EXSetAbilityDataReal(EXGetUnitAbility(BonusDummy, 'AIsx'), 1, ABILITY_DATA_DATA_A, 0)
        call EXSetAbilityDataReal(EXGetUnitAbility(BonusDummy, 'AIms'), 1, ABILITY_DATA_DATA_A, 0)
    endif
    //给单位添加额外属性
    //攻击
    call UnitAddPermanentAbility(whichUnit, 'AIat')
    //防御
    call UnitAddPermanentAbility(whichUnit, 'AId1')
    //攻速
    call UnitAddPermanentAbility(whichUnit, 'AIsx')
    //移速
    call UnitAddPermanentAbility(whichUnit, 'AIms')
    if IsUnitType(whichUnit, UNIT_TYPE_HERO) then
        //三围
        if not IsInitUnit then
            set abAamk = EXGetUnitAbility(BonusDummy, 'Aamk')
            call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_C, 0)
            call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_B, 0)
            call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_A, 0)
            set abAamk = null
        endif
        call UnitAddPermanentAbility(whichUnit, 'Aamk')
    endif
endfunction */

endscope




