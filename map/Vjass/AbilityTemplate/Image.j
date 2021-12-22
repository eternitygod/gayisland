


scope Image

    globals
        private constant integer ImageAbility = 'AIil'
        constant key IMAGO_UNIT_IS_SUMMONING_ILLUSIONS
    endglobals

    // 设置单位高度来到达隐藏单位，并同时隐藏单位阴影(需要用逆变身来刷新)。
    function M_ShowUnit takes unit whichUnit, boolean bIsShow returns nothing
        if bIsShow then
            call SetUnitShadow(whichUnit, OBJ_GetUnitOriginShadow(whichUnit) )
            call SetUnitInvulnerable(whichUnit, false)
            call EXPauseUnit(whichUnit, false)
            call SetUnitFlyHeight(whichUnit, GetUnitDefaultFlyHeight(whichUnit), 0)
        else
            call SetUnitShadow(whichUnit, "_")
            call SetUnitInvulnerable(whichUnit, true)
            call EXPauseUnit(whichUnit, true)
            call UnitAddAbility(whichUnit, 'Arav')
            call UnitRemoveAbility(whichUnit, 'Arav')
            call SetUnitFlyHeight(whichUnit, 9999, 0)
        endif
    endfunction

    private function CreateIllusionUnit takes integer iHandleId, integer iMaxAmount returns nothing
        local trigger trig = LoadTriggerHandle(HT, iHandleId, 0)
        local integer iHandleId2 = GetHandleId(trig)
        local unit whichUnit = LoadUnitHandle(HT, iHandleId2, 0)
        local unit dummyUnit = CreateUnit(GetOwningPlayer(whichUnit), 'ndum', GetUnitX(whichUnit), GetUnitY(whichUnit), 0)
        local integer realUnitIndex = GetRandomInt(1, iMaxAmount)
        local real dataB = LoadReal(HT, iHandleId2, 'B')
        local real dataC = LoadReal(HT, iHandleId2, 'C')
        local real rDur = LoadReal(HT, iHandleId2, 0)
        local integer loop__i = 1
        local effect eImageMissileEff
        local ability hAbilityAIil
        call SaveUnitHandle(HT, GetHandleId(dummyUnit), KEY_MASTERUNIT, whichUnit)
        call UnitAddAbility(dummyUnit, ImageAbility)
        set hAbilityAIil = EXGetUnitAbility(dummyUnit, ImageAbility)
        call EXSetAbilityDataReal(hAbilityAIil, 1, ABILITY_DATA_DUR, rDur)
        call EXSetAbilityDataReal(hAbilityAIil, 1, ABILITY_DATA_HERODUR, rDur)
        set hAbilityAIil = null
        // 给召唤者标识一下
        call SaveBoolean(DynamicData, GetHandleId(whichUnit), IMAGO_UNIT_IS_SUMMONING_ILLUSIONS, true)
        set Tmp__ArrayReal['B'] = dataB
        set Tmp__ArrayReal['C'] = dataC
        call M_ShowUnit(whichUnit, true)
        loop
            set eImageMissileEff = LoadEffectHandle(HT, iHandleId, loop__i)
            if loop__i != realUnitIndex then
                set Tmp__ArrayReal['X'] = EXGetEffectX(eImageMissileEff)
                set Tmp__ArrayReal['Y'] = EXGetEffectY(eImageMissileEff)
                call IssueTargetOrderById(dummyUnit, 852274, whichUnit)
            else
                call SetUnitX(whichUnit, EXGetEffectX(eImageMissileEff))
                call SetUnitY(whichUnit, EXGetEffectY(eImageMissileEff))
            endif
            call DestroyEffect(eImageMissileEff)
            exitwhen loop__i == iMaxAmount
            set loop__i = loop__i + 1
        endloop
        call RemoveSavedBoolean(DynamicData, GetHandleId(whichUnit), IMAGO_UNIT_IS_SUMMONING_ILLUSIONS)
        call DestroyFogModifier(LoadFogModifierHandle(HT, iHandleId2, 20))

        call ClearTrigger(trig)
        call FlushChildHashtable(HT, iHandleId2)
        set trig = null
        set eImageMissileEff = null
        set whichUnit = null
        set dummyUnit = null
    endfunction

    private function ImageMissileMovement takes nothing returns boolean
        local integer iHandleId = GetHandleId(GetTriggeringTrigger())
        local integer iMaxAmount = LoadInteger(HT, iHandleId, 'A')
        local real rMissileSpeed = LoadReal(HT, iHandleId, 'S')
        local effect eImageMissileEff
        local integer loop__i = 1
        local real angle
        local real rTargetX
        local real rTargetY
        local integer iCount = LoadInteger(HT, iHandleId, 'C')

        set iCount = iCount - 1
        if iCount > 0 then
            call SaveInteger(HT, iHandleId, 'C', iCount )
            loop
                set angle = ( loop__i * 360 / iMaxAmount ) * bj_DEGTORAD
                set eImageMissileEff = LoadEffectHandle(HT, iHandleId, loop__i)
                set rTargetX = CoordinateX(EXGetEffectX(eImageMissileEff) + rMissileSpeed * Cos(angle))
                set rTargetY = CoordinateY(EXGetEffectY(eImageMissileEff) + rMissileSpeed * Sin(angle))
                call EXSetEffectXY(eImageMissileEff, rTargetX, rTargetY)
                exitwhen loop__i == iMaxAmount
                set loop__i = loop__i + 1
            endloop
        else
            call CreateIllusionUnit(iHandleId, iMaxAmount)
            call ClearTrigger(GetTriggeringTrigger())
            call FlushChildHashtable(HT, iHandleId)
        endif
        set eImageMissileEff = null

        return false
    endfunction

    // 创建镜像的投射物
    private function CreateImageMissile takes nothing returns boolean
        // 镜像的机制 如果镜像数量＜2 则取随机±180角度
        local integer iHandleId = GetHandleId(GetTriggeringTrigger())
        local unit whichUnit = LoadUnitHandle(HT, iHandleId, 0)
        local real rStartX = GetUnitX(whichUnit)
        local real rStartY = GetUnitY(whichUnit)
        // 投射物数量 = 幻象数量 + 1 因为本体也要有一个投射物
        local integer iMaxAmount = LoadInteger(HT, iHandleId, 'A') + 1
        local real rRng = LoadReal(HT, iHandleId, 'R')
        local real rMissileSpeed = LoadReal(HT, iHandleId, 'S') * 0.03
        local string sMissileArt = LoadStr(HT, iHandleId, 10)
        local real rFace = GetUnitFacing(whichUnit)
        local effect eImageMissileEff
        local integer loop__i
        // 对于上个触发器的参数读取应该在这条注释上面
        call BJDebugMsg(I2S(iMaxAmount)+ "iMaxAmount")
        set iHandleId = CreateTimerEventTrigger(0.03, true, function ImageMissileMovement)
        if HaveSavedHandle(HT, iHandleId, 100) then
            call DestroyEffect(LoadEffectHandle(HT, iHandleId, 100))
        endif
        // 继续传参
        call SaveInteger(HT, iHandleId, 'A', iMaxAmount)
        call SaveReal(HT, iHandleId, 'R', rRng)
        call SaveReal(HT, iHandleId, 'S', rMissileSpeed)
        // 触发器的最大运行次数
        call SaveInteger(HT, iHandleId, 'C', R2I(rRng / rMissileSpeed) )

        set loop__i = 1
        loop
            set eImageMissileEff = AddSpecialEffect(sMissileArt, rStartX, rStartY)
            call SaveEffectHandle(HT, iHandleId, loop__i, eImageMissileEff)
            exitwhen loop__i == iMaxAmount
            set loop__i = loop__i + 1
        endloop
        set eImageMissileEff = null

        call SaveTriggerHandle(HT, iHandleId, 0, GetTriggeringTrigger())
        //call TriggerRegisterTimerEvent(hTrig, 0.03, true)
        set whichUnit = null
        return false
    endfunction

    // 单位释放分身 (剑圣分身)
    // DataA分身数量,DataB伤害比例,DataC受伤比例,DataD技能延迟,Rng施法距离(位移距离),Area作用范围(施法时提供的视野)
    function UnitSpellImage takes unit whichUnit, real rDataA, real rDataB, real rDataC, real rDataD, real rDur, string sSpecialArt, string sMissileArt, real rMissileSpeed, real rRng, real rArea returns nothing
        local integer iHandleId = CreateTimerEventTrigger(rDataD, false, function CreateImageMissile)
        local real rUnitX = GetUnitX(whichUnit)
        local real rUnitY = GetUnitY(whichUnit)
        local fogmodifier hImageFog = CreateFogModifierRadius(GetOwningPlayer(whichUnit), FOG_OF_WAR_VISIBLE, rUnitX, rUnitY, rArea, true, false)
        if sSpecialArt != null then
            call SaveEffectHandle(HT, iHandleId, 100, AddSpecialEffect(sSpecialArt, rUnitX, rUnitY)) 
        endif
        call M_ShowUnit(whichUnit, false)
        // call SavePlayerHandle(HT, iHandleId, 'P', GetOwningPlayer(whichUnit))
        call SaveUnitHandle(HT, iHandleId, 0, whichUnit)
        call SaveInteger(HT, iHandleId, 'A', R2I(rDataA))
        call SaveReal(HT, iHandleId, 'B', rDataB)
        call SaveReal(HT, iHandleId, 'C', rDataC)
        call SaveReal(HT, iHandleId, 'D', rDataD)
        call SaveReal(HT, iHandleId, 'R', rRng)
        call SaveReal(HT, iHandleId, 'S', rMissileSpeed)
        call SaveReal(HT, iHandleId, 0, rDur)
        call SaveStr(HT, iHandleId, 10, sMissileArt)
        call SaveFogModifierHandle(HT, iHandleId, 20, hImageFog)
        // 这里应该清除一下魔法效果
        set hImageFog = null
    endfunction

endscope

