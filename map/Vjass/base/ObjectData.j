


library ObjectData
    // 读取一些物编的数据
    globals
        string SlkdataType = ""
        string SlkType = "" 
        hashtable ObjectData = InitHashtable()
        // 哈希表父KEY
        private key HERO_PRIMARY
        private key UNIT_SHADOW
        
        private key UNIT_ATTACK1_DAMAGE_BASE
        private key UNIT_ARMOR_BASE
    endglobals

    // 与lua交互获得Slk数据
    function GetObjectDataBySlk takes integer objectId, string tableName, string dataType returns string
        set SlkType = tableName
        set SlkdataType = dataType
        return AbilityId2String(objectId) // lua hook了此函数 调用slk库
    endfunction

    function GetUnitSlkData takes integer objectId, string dataType returns string
        return GetObjectDataBySlk( objectId, "unit", dataType )
    endfunction

    //获取英雄单位的主属性 primary: 1 == str  2 == int  3 = agi 
    function OBJ_GetHeroPrimaryByType takes integer whichType returns string
        return GetObjectDataBySlk(whichType, "unit", "Primary")
    endfunction

    function OBJ_GetHeroPrimary takes unit whichUnit returns string
        local integer whichType = GetUnitTypeId(whichUnit)
        local string data = LoadStr( ObjectData, HERO_PRIMARY, whichType )
        if data == null then
            set data = GetObjectDataBySlk(whichType, "unit", "Primary")
        endif
        return data
    endfunction

    // 原生的阴影 还是从slk库中获取
    function OBJ_GetUnitOriginShadow takes unit whichUnit returns string
        local integer whichType = GetUnitTypeId(whichUnit)
        local string data = LoadStr( ObjectData, UNIT_SHADOW, whichType )
        if data == null then
            set data = GetObjectDataBySlk(whichType, "unit", "Primary")
        endif
        return data
    endfunction

    function OBJ_GetHeroPrimaryValue takes unit whichUnit returns integer
        local string data = OBJ_GetHeroPrimary(whichUnit)
        if data == "STR" then
            return GetHeroStr(whichUnit, true)
        elseif data == "AGI" then
            return GetHeroAgi(whichUnit, true)
        elseif data == "INT" then
            return GetHeroInt(whichUnit, true)
        endif
        return 0
    endfunction

    // 获取攻击方式 1 攻击力
    function OBJ_GetUnitBaseDamage1 takes unit whichUnit returns integer
        local integer whichType = GetUnitTypeId(whichUnit)
        local integer data
        if HaveSavedInteger( ObjectData, UNIT_ATTACK1_DAMAGE_BASE, whichType ) then
            return LoadInteger( ObjectData, UNIT_ATTACK1_DAMAGE_BASE, whichType )
        else
            set data = S2I( GetObjectDataBySlk(whichType, "unit", "dmgplus1") )
            call SaveInteger( ObjectData, UNIT_ATTACK1_DAMAGE_BASE, whichType, data )
        endif
        return data
    endfunction

    // 获取基础护甲
    function OBJ_GetUnitBaseArmor takes unit whichUnit returns real
        local integer whichType = GetUnitTypeId(whichUnit)
        local real data
        if HaveSavedReal( ObjectData, UNIT_ARMOR_BASE, whichType ) then
            return LoadReal( ObjectData, UNIT_ARMOR_BASE, whichType )
        else
            set data = S2I( GetObjectDataBySlk(whichType, "unit", "def") )
            call SaveReal( ObjectData, UNIT_ARMOR_BASE, whichType, data )
        endif
        return data
    endfunction

    // 获取攻击方式 1 攻击力
    function OBJ_GetUnitBaseDamage1ByType takes integer whichType returns integer
        local integer data
        if HaveSavedInteger( ObjectData, UNIT_ATTACK1_DAMAGE_BASE, whichType ) then
            return LoadInteger( ObjectData, UNIT_ATTACK1_DAMAGE_BASE, whichType )
        else
            set data = S2I( GetObjectDataBySlk(whichType, "unit", "dmgplus1") )
            call SaveInteger( ObjectData, UNIT_ATTACK1_DAMAGE_BASE, whichType, data )
        endif
        return data
    endfunction

    // 获取基础护甲
    function OBJ_GetUnitBaseArmorByType takes integer whichType returns real
        local real data
        if HaveSavedReal( ObjectData, UNIT_ARMOR_BASE, whichType ) then
            return LoadReal( ObjectData, UNIT_ARMOR_BASE, whichType )
        else
            set data = S2I( GetObjectDataBySlk(whichType, "unit", "def") )
            call SaveReal( ObjectData, UNIT_ARMOR_BASE, whichType, data )
        endif
        return data
    endfunction

endlibrary

