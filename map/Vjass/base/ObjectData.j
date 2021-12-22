


library ObjectData

    globals
        hashtable ObjectData = InitHashtable()
        // 哈希表父KEY
        private key KEY_HERO_PRIMARY
        private key KEY_UNIT_SHADOW
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
    function GetHeroPrimaryById takes integer whichType returns string
        return GetObjectDataBySlk(whichType, "unit", "Primary")
    endfunction

    function GetHeroPrimary takes unit whichUnit returns string
        local integer whichType = GetUnitTypeId(whichUnit)
        local string data = LoadStr( ObjectData, KEY_HERO_PRIMARY, whichType )
        if data == null then
            set data = GetObjectDataBySlk(whichType, "unit", "Primary")
        endif
        return data
    endfunction

    // 原生的阴影 还是从slk库中获取
    function GetUnitOriginShadow takes unit whichUnit returns string
        local integer whichType = GetUnitTypeId(whichUnit)
        local string data = LoadStr( ObjectData, KEY_UNIT_SHADOW, whichType )
        if data == null then
            set data = GetObjectDataBySlk(whichType, "unit", "Primary")
        endif
        return data
    endfunction

    function GetHeroPrimaryValue takes unit whichUnit returns integer
        local string data = GetHeroPrimary(whichUnit)
        if data == "STR" then
            return GetHeroStr(whichUnit, true)
        elseif data == "AGI" then
            return GetHeroAgi(whichUnit, true)
        elseif data == "INT" then
            return GetHeroInt(whichUnit, true)
        endif
        return 0
    endfunction

endlibrary

