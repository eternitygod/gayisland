
library math initializer Init

    globals
        private hashtable Prd = InitHashtable()
    endglobals
    
    // 得到XY之间的角度
    function AngleBetweenXY takes real x1, real y1, real x2, real y2 returns real
        return bj_RADTODEG * Atan2(y2 - y1, x2 - x1)
    endfunction

    // 单位之间的角度
    function AngleBetweenUnit takes unit u1, unit u2 returns real
        return bj_RADTODEG * Atan2(GetUnitY(u2) - GetUnitY(u1), GetUnitX(u2) - GetUnitX(u1))
    endfunction

    // xy距离
    function GetDistanceBetween takes real x1, real y1, real x2, real y2 returns real
        return SquareRoot((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))
    endfunction

    // 单位之间的距离
    function GetDistanceBetweenUnits takes unit u1, unit u2 returns real
        return SquareRoot((GetUnitX(u1) - GetUnitX(u2)) * (GetUnitX(u1) - GetUnitX(u2)) + (GetUnitY(u1) - GetUnitY(u2)) * (GetUnitY(u1) - GetUnitY(u2)))
    endfunction


    //初始化prd的值
    private function InitPrd takes nothing returns nothing
        call SaveReal(Prd,- 1, 0, .0038)
        call SaveReal(Prd,- 1, 1, .0147)
        call SaveReal(Prd,- 1, 2, .0322)
        call SaveReal(Prd,- 1, 3, .0557)
        call SaveReal(Prd,- 1, 4, .0847)
        call SaveReal(Prd,- 1, 5, .1189)
        call SaveReal(Prd,- 1, 6, .1579)
        call SaveReal(Prd,- 1, 7, .2015)
        call SaveReal(Prd,- 1, 8, .2493)
        call SaveReal(Prd,- 1, 9, .3021)
        call SaveReal(Prd,- 1, 10, .3604)
        call SaveReal(Prd,- 1, 11, .4226)
        call SaveReal(Prd,- 1, 12, .4811)
        call SaveReal(Prd,- 1, 13, .5714)
        call SaveReal(Prd,- 1, 14, .6666)
        call SaveReal(Prd,- 1, 15, .75)
        call SaveReal(Prd,- 1, 16, .8235)
        call SaveReal(Prd,- 1, 17, .8888)
        call SaveReal(Prd,- 1, 18, .9473)
        call SaveReal(Prd,- 1, 19, 1.)
    endfunction

    // Prd随机数 取5的整数
    function GetPrdRandom takes unit u, integer abId, real value returns boolean
        local integer h = GetHandleId(u)
        local real newValue
        if not IsUnitType(u, UNIT_TYPE_HERO) then
            return GetRandomInt(1, 100)< value	//如果不是英雄 则直接返回随机数
        endif
        set newValue = LoadReal(Prd,- 1, R2I( R2I(value * .2 )* 5. * .2)- 1)  + LoadReal(Prd, h, abId)
        //call Debug("log","几率: " + R2S(newValue) )
        if GetRandomReal(.0, 1.) < newValue then
            call SaveReal(Prd, h, abId, .0)
            return true
        else
            call SaveReal(Prd, h, abId, newValue)
            return false
        endif
    endfunction

    private function Init takes nothing returns nothing
        call InitPrd()
    endfunction

endlibrary


