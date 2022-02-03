


library UnitBonusSystem initializer Init requires Common, UnitRestore

    globals
        private hashtable DynamicData = InitHashtable()
    endglobals

    //JAPI修改技能数据，并且刷新。
    //*额外 攻击 防御 攻速*/
    //升级并降低技能等级以此达到刷新属性的目的
    function UnitAddAttackSpeedBonus takes unit whichUnit, real value returns nothing
        local integer h = GetHandleId(whichUnit)
        if GetUnitAbilityLevel(whichUnit, 'AIsx') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'AIsx')
        endif
        set value = LoadReal(DynamicData, h, BONUS_ATTACK) + value
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIsx'), 1, ABILITY_DATA_DATA_A, value)
        call IncUnitAbilityLevel(whichUnit, 'AIsx' ) 
        call DecUnitAbilityLevel(whichUnit, 'AIsx' )
        call SaveReal(DynamicData, h, BONUS_ATTACK, value)
    endfunction
    function UnitReduceAttackSpeedBonus takes unit whichUnit, real value returns nothing
        local integer h = GetHandleId(whichUnit)
        if GetUnitAbilityLevel(whichUnit, 'AIsx') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'AIsx')
        endif
        set value = LoadReal(DynamicData, h, BONUS_ATTACK) - value
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIsx'), 1, ABILITY_DATA_DATA_A, value)
        call IncUnitAbilityLevel(whichUnit, 'AIsx' ) 
        call DecUnitAbilityLevel(whichUnit, 'AIsx' )
        call SaveReal(DynamicData, h, BONUS_ATTACK, value)
    endfunction
    function UnitSetAttackSpeedBonus takes unit whichUnit, real newValue returns nothing
        if GetUnitAbilityLevel(whichUnit, 'AIsx') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'AIsx')
        endif
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIsx'), 1, ABILITY_DATA_DATA_A, newValue)
        call IncUnitAbilityLevel(whichUnit, 'AIsx' )
        call DecUnitAbilityLevel(whichUnit, 'AIsx' )
        call SaveReal(DynamicData, GetHandleId(whichUnit), BONUS_ATTACK, newValue)
    endfunction

    function UnitAddArmorBonus takes unit whichUnit, real value returns nothing
        local integer h = GetHandleId(whichUnit)
        if GetUnitAbilityLevel(whichUnit, 'AId1') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'AId1')
        endif
        set value = LoadReal(DynamicData, h, BONUS_ARMOR) + value
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AId1'), 1, ABILITY_DATA_DATA_A, value)
        call IncUnitAbilityLevel(whichUnit, 'AId1' ) 
        call DecUnitAbilityLevel(whichUnit, 'AId1' )
        call SaveReal(DynamicData, h, BONUS_ARMOR, value)
    endfunction

    function UnitReduceArmorBonus takes unit whichUnit, real value returns nothing
        local integer h = GetHandleId(whichUnit)
        if GetUnitAbilityLevel(whichUnit, 'AId1') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'AId1')
        endif
        set value = LoadReal(DynamicData, h, BONUS_ARMOR) - value
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AId1'), 1, ABILITY_DATA_DATA_A, value)
        call IncUnitAbilityLevel(whichUnit, 'AId1' ) 
        call DecUnitAbilityLevel(whichUnit, 'AId1' )
        call SaveReal(DynamicData, h, BONUS_ARMOR, value)
    endfunction
    function UnitSetArmorBonus takes unit whichUnit, real newValue returns nothing
        if GetUnitAbilityLevel(whichUnit, 'AId1') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'AId1')
        endif
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AId1'), 1, ABILITY_DATA_DATA_A, newValue)
        call IncUnitAbilityLevel(whichUnit, 'AId1' )
        call DecUnitAbilityLevel(whichUnit, 'AId1' )
        call SaveReal(DynamicData, GetHandleId(whichUnit), BONUS_ARMOR, newValue)
    endfunction

    //增加单位移动速度
    function UnitAddMoveSpeedBonus takes unit whichUnit, real value returns nothing
        local integer h = GetHandleId(whichUnit)
        if GetUnitAbilityLevel(whichUnit, 'AIms') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'AIms')
        endif
        set value = LoadReal(DynamicData, h, BONUS_MOVESPEED) + value
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIms'), 1, ABILITY_DATA_DATA_A, value)
        call IncUnitAbilityLevel(whichUnit, 'AIms' ) 
        call DecUnitAbilityLevel(whichUnit, 'AIms' )
        call SaveReal(DynamicData, h, BONUS_MOVESPEED, value)
    endfunction
    //减少单位移动速度
    function UnitReduceMoveSpeedBonus takes unit whichUnit, real value returns nothing
        local integer h = GetHandleId(whichUnit)
        if GetUnitAbilityLevel(whichUnit, 'AIms') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'AIms')
        endif
        set value = LoadReal(DynamicData, h, BONUS_MOVESPEED) - value
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIms'), 1, ABILITY_DATA_DATA_A, value)
        call IncUnitAbilityLevel(whichUnit, 'AIms' ) 
        call DecUnitAbilityLevel(whichUnit, 'AIms' )
        call SaveReal(DynamicData, h, BONUS_MOVESPEED, value)
    endfunction
    //设置单位移动速度
    function UnitSetMoveSpeedBonus takes unit whichUnit, real newValue returns nothing
        if GetUnitAbilityLevel(whichUnit, 'AIms') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'AIms')
        endif
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIms'), 1, ABILITY_DATA_DATA_A, newValue)
        call IncUnitAbilityLevel(whichUnit, 'AIms' )
        call DecUnitAbilityLevel(whichUnit, 'AIms' )
        call SaveReal(DynamicData, GetHandleId(whichUnit), BONUS_MOVESPEED, newValue)
    endfunction

    function UnitAddDamageBonus takes unit whichUnit, real value returns nothing
        local integer h = GetHandleId(whichUnit)
        if GetUnitAbilityLevel(whichUnit, 'AIat') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'AIat')
        endif
        set value = LoadReal(DynamicData, h, BONUS_DAMAGE) + value
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIat'), 1, ABILITY_DATA_DATA_A, value)
        call IncUnitAbilityLevel(whichUnit, 'AIat' ) 
        call DecUnitAbilityLevel(whichUnit, 'AIat' )
        call SaveReal(DynamicData, h, BONUS_DAMAGE, value)
    endfunction
    function UnitReduceDamageBonus takes unit whichUnit, real value returns nothing
        local integer h = GetHandleId(whichUnit)
        if GetUnitAbilityLevel(whichUnit, 'AIat') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'AIat')
        endif
        set value = LoadReal(DynamicData, h, BONUS_DAMAGE) - value
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIat'), 1, ABILITY_DATA_DATA_A, value)
        call IncUnitAbilityLevel(whichUnit, 'AIat' ) 
        call DecUnitAbilityLevel(whichUnit, 'AIat' )
        call SaveReal(DynamicData, h, BONUS_DAMAGE, value)
    endfunction
    function UnitSetDamageBonus takes unit whichUnit, real newValue returns nothing
        if GetUnitAbilityLevel(whichUnit, 'AIat') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'AIat')
        endif
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIat'), 1, ABILITY_DATA_DATA_A, newValue)
        call IncUnitAbilityLevel(whichUnit, 'AIat' )
        call DecUnitAbilityLevel(whichUnit, 'AIat' )
        call SaveReal(DynamicData, GetHandleId(whichUnit), BONUS_DAMAGE, newValue)
    endfunction

    function UnitAddStrBonus takes unit whichUnit, integer value returns nothing
        local integer h = GetHandleId(whichUnit)
        local ability abAamk = EXGetUnitAbility(whichUnit, 'Aamk')
        if GetUnitAbilityLevel(whichUnit, 'Aamk') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'Aamk')
        endif
        set value = LoadInteger(DynamicData, h, BONUS_STR) + value
        call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_C, value)
        call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_B, LoadInteger(DynamicData, h, BONUS_INT))
        call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_A, LoadInteger(DynamicData, h, BONUS_AGI))
        call IncUnitAbilityLevel(whichUnit, 'Aamk' ) 
        call DecUnitAbilityLevel(whichUnit, 'Aamk' )
        call SaveInteger(DynamicData, h, BONUS_STR, value)
        set abAamk = null
    endfunction
    function UnitReduceStrBonus takes unit whichUnit, integer value returns nothing
        local integer h = GetHandleId(whichUnit)
        local ability abAamk = EXGetUnitAbility(whichUnit, 'Aamk')
        if GetUnitAbilityLevel(whichUnit, 'Aamk') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'Aamk')
        endif
        set value = LoadInteger(DynamicData, h, BONUS_STR) - value
        call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_C, value)
        call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_B, LoadInteger(DynamicData, h, BONUS_INT))
        call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_A, LoadInteger(DynamicData, h, BONUS_AGI))
        call IncUnitAbilityLevel(whichUnit, 'Aamk' ) 
        call DecUnitAbilityLevel(whichUnit, 'Aamk' )
        call SaveInteger(DynamicData, h, BONUS_STR, value)
        set abAamk = null
    endfunction
    function UnitSetStrBonus takes unit whichUnit, integer newValue returns nothing
        local integer h = GetHandleId(whichUnit)
        local ability abAamk = EXGetUnitAbility(whichUnit, 'Aamk')
        if GetUnitAbilityLevel(whichUnit, 'Aamk') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'Aamk')
        endif
        call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_C, newValue)
        call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_B, LoadInteger(DynamicData, h, BONUS_INT))
        call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_A, LoadInteger(DynamicData, h, BONUS_AGI))
        call IncUnitAbilityLevel(whichUnit, 'Aamk' )
        call DecUnitAbilityLevel(whichUnit, 'Aamk' )
        call SaveInteger(DynamicData, h, BONUS_STR, newValue)
        set abAamk = null
    endfunction

    //设置单位最大生命值 会按当前比例改变
    function UnitAddMaxLife takes unit whichUnit, real value returns nothing
        local real maxlife = GetUnitState(whichUnit, UNIT_STATE_MAX_LIFE)
        local real currentLife
        set value = maxlife + value
        call SetUnitState(whichUnit, UNIT_STATE_MAX_LIFE, value)
        set currentLife = GetWidgetLife(whichUnit)
        if UnitAlive(whichUnit) and currentLife != value then
            call SetWidgetLife(whichUnit, currentLife * (value / maxlife) )
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
        local integer str = LoadInteger(DynamicData, h, BONUS_STR) + LoadInteger(ObjectData, itemId, BONUS_STR)
        local integer agi = LoadInteger(DynamicData, h, BONUS_AGI) + LoadInteger(ObjectData, itemId, BONUS_AGI)
        local integer int = LoadInteger(DynamicData, h, BONUS_INT) + LoadInteger(ObjectData, itemId, BONUS_INT)
        if GetUnitAbilityLevel(whichUnit, 'Aamk') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'Aamk')
        endif
        call SaveInteger(DynamicData, h, BONUS_STR, str)
        call SaveInteger(DynamicData, h, BONUS_AGI, agi)
        call SaveInteger(DynamicData, h, BONUS_INT, int)
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'Aamk'), 1, ABILITY_DATA_DATA_C, str)
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'Aamk'), 1, ABILITY_DATA_DATA_B, int)
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'Aamk'), 1, ABILITY_DATA_DATA_A, agi)
        call IncUnitAbilityLevel(whichUnit, 'Aamk' )
        call DecUnitAbilityLevel(whichUnit, 'Aamk' )
    endfunction
    function UnitReduceAttribute takes unit whichUnit, integer itemId returns nothing
        local integer h = GetHandleId(whichUnit)
        local integer str = LoadInteger(DynamicData, h, BONUS_STR) - LoadInteger(ObjectData, itemId, BONUS_STR)
        local integer agi = LoadInteger(DynamicData, h, BONUS_AGI) - LoadInteger(ObjectData, itemId, BONUS_AGI)
        local integer int = LoadInteger(DynamicData, h, BONUS_INT) - LoadInteger(ObjectData, itemId, BONUS_INT)
        if GetUnitAbilityLevel(whichUnit, 'Aamk') <= 0 then
            call UnitAddPermanentAbility(whichUnit, 'Aamk')
        endif
        call SaveInteger(DynamicData, h, BONUS_STR, str)
        call SaveInteger(DynamicData, h, BONUS_AGI, agi)
        call SaveInteger(DynamicData, h, BONUS_INT, int)
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'Aamk'), 1, ABILITY_DATA_DATA_C, str)
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'Aamk'), 1, ABILITY_DATA_DATA_B, int)
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'Aamk'), 1, ABILITY_DATA_DATA_A, agi)
        call IncUnitAbilityLevel(whichUnit, 'Aamk' )
        call DecUnitAbilityLevel(whichUnit, 'Aamk' )
    endfunction

    // 添加单位视野
    function AddUnitVision takes unit whichUnit, integer value returns nothing
        call UnitAddAbility( whichUnit, 'AIsi' )
        call YDWESetUnitAbilityDataReal( whichUnit, 'AIsi', 2, ABILITY_DATA_DATA_A, - value )
        call IncUnitAbilityLevel( whichUnit, 'AIsi')
        call UnitRemoveAbility( whichUnit, 'AIsi' )
    endfunction

    function GetUnitStateBonus takes unit whichUnit, integer iBonusType returns real
        return LoadReal(DynamicData, GetHandleId(whichUnit), iBonusType)
    endfunction

    // 通过句柄来查单位的额外属性加成 会被内联
    function GetUnitStateBonusByHandleId takes integer whichHandleId, integer iBonusType returns real
        return LoadReal(DynamicData, whichHandleId, iBonusType)
    endfunction

    // 同步镜像与本体的属性
    function SyncIllusionUnitState takes unit hIllusionUnit, unit hMasterUnit returns nothing
        local real value = 0.
        local ability hAbilityAamk = null
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

    private function Init takes nothing returns nothing
        // 镜像单位
    endfunction

endlibrary




