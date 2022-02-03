
library Missile requires base

    // 暂不考虑抛物线 仅做平面位移
    private function EffectMissileMoveCallBack takes nothing returns boolean
        local trigger trig = GetTriggeringTrigger()
        local integer h = GetHandleId( trig )
        local unit targetUnit = LoadUnitHandle( HT, h, 1 )
        local effect missileEffect = LoadEffectHandle( HT, h, 10 )
        local real targetX = GetUnitX( targetUnit )
        local real targetY = GetUnitY( targetUnit )
        local real missileX = EXGetEffectX( missileEffect )
        local real missileY = EXGetEffectY( missileEffect )
        local real angle = AngleBetweenXY( missileX, missileY, targetX, targetY )
        local real radian = angle * bj_DEGTORAD
        local real speed = LoadReal( HT, h , 20 )

        // 通过移动点来获取目标点Z轴
        call MoveLocation( Tmp__Location, startX, startY )
        if IsUnitInRangeXY( targetUnit, missileX, missileY, speed ) then
            call EXEffectMatReset( missileEffect )
            call EXEffectMatRotateZ( missileEffect, angle )
            call EXGetEffectZ( missileEffect, LoadReal( HT, h, 22 ) + GetLocationZ( Tmp__Location ) )
            call EXSetEffectXY( missileEffect, targetX, targetY )
            call DestroyEffect( missileEffect )
            if LoadStr( HT, h, 30 ) != null then
                set Tmp__ArrayUnit[0] = LoadUnitHandle( HT, h, 0 )
                set Tmp__ArrayUnit[1] = targetUnit
                call ExecuteFunc( LoadStr( HT, h, 30 ) )
            endif
            call FlushChildHashtable( HT, h )
            call ClearTrigger( trig )
        else
            set missileX = CoordinateX( missileX + speed * Cos( radian ) )
            set missileY = CoordinateY( missileY + speed * Sin( radian ) )
            // 移动过远重置特效 特效如果超出镜头中心 则不会渲染  > 1000 (实际不止)
            if GetDistanceBetween( LoadReal( HT, h, 40 ), LoadReal( HT, h, 41 ), missileX, missileY ) > 1000  then
                call EXGetEffectZ( missileEffect, -9999 )
                call DestroyEffect( missileEffect )
                set missileEffect = AddSpecialEffect( LoadStr( HY, h, 23), missileX, missileY )
                call SaveEffectHandle( HT, h, 10, missileEffect )
                call SaveReal( HT, h, 40, missileX )
                call SaveReal( HT, h, 41, missileY )
            else
                call EXEffectMatReset( missileEffect )
                call EXEffectMatRotateZ( missileEffect, angle )
                call EXSetEffectXY( missileEffect, missileX, missileY ) 
            endif
            call EXGetEffectZ( missileEffect, LoadReal( HT, h, 22 ) + GetLocationZ( Tmp__Location ) )

        endif

        set missileEffect = null
        set targetUnit = null
        set trig = null
        return false
    endfunction

    // 发射一个特效
    function UnitLaunchesMissileToTarget takes unit whichUnit, unit targetUnit, string modelName, real speed, real arc, real height, string callback returns nothing
        local integer h = CreateTimerEventTrigger( 0.02, false, function EffectMissileMoveCallBack )
        local real startX = GetUnitX( whichUnit )
        local real startY = GetUnitY( whichUnit )
        local effect missile = AddSpecialEffect( modelName, startX, startY )

        call SaveUnitHandle( HT, h, 0, whichUnit )
        call SaveUnitHandle( HT, h, 1, targetUnit )
        call SaveEffectHandle( HT, h, 10, missile )

        call SaveReal( HT, h, 20, speed * 0.02 )
        call SaveReal( HT, h, 21, arc )
        call SaveReal( HT, h, 22, height )
        call SaveStr( HY, h, 23, modelName )
        call SaveStr( HT, h, 30, callback )

        call SaveReal( HT, h, 40, startX )
        call SaveReal( HT, h, 41, startY )

        call EXSetEffectZ( missile, height + EXGetEffectZ( missile ) )
        set missile = null
    endfunction

endlibrary

