
library Common

    //常量
    globals
        //JAPI常量 - 技能
        constant integer ABILITY_STATE_COOLDOWN = 1
	
        constant integer ABILITY_DATA_TARGS = 100 // integer
        constant integer ABILITY_DATA_CAST = 101 // real
        constant integer ABILITY_DATA_DUR = 102 // real
        constant integer ABILITY_DATA_HERODUR = 103 // real
        constant integer ABILITY_DATA_COST = 104 // integer
        constant integer ABILITY_DATA_COOL = 105 // real
        constant integer ABILITY_DATA_AREA = 106 // real
        constant integer ABILITY_DATA_RNG = 107 // real
        constant integer ABILITY_DATA_DATA_A = 108 // real
        constant integer ABILITY_DATA_DATA_B = 109 // real
        constant integer ABILITY_DATA_DATA_C = 110 // real
        constant integer ABILITY_DATA_DATA_D = 111 // real
        constant integer ABILITY_DATA_DATA_E = 112 // real
        constant integer ABILITY_DATA_DATA_F = 113 // real
        constant integer ABILITY_DATA_DATA_G = 114 // real
        constant integer ABILITY_DATA_DATA_H = 115 // real
        constant integer ABILITY_DATA_DATA_I = 116 // real
        constant integer ABILITY_DATA_UNITID = 117 // integer
	
        constant integer ABILITY_DATA_HOTKET = 200 // integer
        constant integer ABILITY_DATA_UNHOTKET = 201 // integer
        constant integer ABILITY_DATA_RESEARCH_HOTKEY = 202 // integer
        constant integer ABILITY_DATA_NAME = 203 // string
        constant integer ABILITY_DATA_ART = 204 // string
        constant integer ABILITY_DATA_TARGET_ART = 205 // string
        constant integer ABILITY_DATA_CASTER_ART = 206 // string
        constant integer ABILITY_DATA_EFFECT_ART = 207 // string
        constant integer ABILITY_DATA_AREAEFFECT_ART = 208 // string
        constant integer ABILITY_DATA_MISSILE_ART = 209 // string
        constant integer ABILITY_DATA_SPECIAL_ART = 210 // string
        constant integer ABILITY_DATA_LIGHTNING_EFFECT = 211 // string
        constant integer ABILITY_DATA_BUFF_TIP = 212 // string
        constant integer ABILITY_DATA_BUFF_UBERTIP = 213 // string
        constant integer ABILITY_DATA_RESEARCH_TIP = 214 // string
        constant integer ABILITY_DATA_TIP = 215 // string
        constant integer ABILITY_DATA_UNTIP = 216 // string
        constant integer ABILITY_DATA_RESEARCH_UBERTIP = 217 // string
        constant integer ABILITY_DATA_UBERTIP = 218 // string
        constant integer ABILITY_DATA_UNUBERTIP = 219 // string
        constant integer ABILITY_DATA_UNART = 220 // string
	
        //JAPI常量 - UnitState 单位状态
        //攻击1 伤害骰子数量
        constant unitstate UNIT_STATE_ATTACK1_DAMAGE_DICE = ConvertUnitState(0x10) 

        //攻击1 伤害骰子面数
        constant unitstate UNIT_STATE_ATTACK1_DAMAGE_SIDE = ConvertUnitState(0x11) 

        //攻击1 基础伤害
        constant unitstate UNIT_STATE_ATTACK1_DAMAGE_BASE = ConvertUnitState(0x12) 

        //攻击1 全伤害范围
        constant unitstate UNIT_STATE_ATTACK1_RANGE = ConvertUnitState(0x16)

        //装甲
        constant unitstate UNIT_STATE_ARMOR = ConvertUnitState(0x20)

        //攻击1 攻击类型
        constant unitstate UNIT_STATE_ATTACK1_ATTACK_TYPE = ConvertUnitState(0x23)

        //攻击1 攻击间隔
        constant unitstate UNIT_STATE_ATTACK1_INTERVAL = ConvertUnitState(0x25)

        //攻击1 弹射弧度
        constant unitstate UNIT_STATE_ATTACK1_BACK_SWING = ConvertUnitState(0x28)

        //攻击2 攻击类型
        constant unitstate UNIT_STATE_ATTACK2_ATTACK_TYPE = ConvertUnitState(0x36)

        //攻击2 攻击间隔
        constant unitstate UNIT_STATE_ATTACK2_INTERVAL = ConvertUnitState(0x38)

        //装甲类型
        constant unitstate UNIT_STATE_ARMOR_TYPE = ConvertUnitState(0x50)

        //攻击速度 对两种攻击模式都有效
        constant unitstate UNIT_STATE_RATE_OF_FIRE = ConvertUnitState(0x51)

        //攻击1 武器类型
        constant unitstate UNIT_STATE_ATTACK1_WEAPON_TYPE = ConvertUnitState(0x58)

        //攻击2 武器类型
        constant unitstate UNIT_STATE_ATTACK2_WEAPON_TYPE = ConvertUnitState(0x59)

	

        // 伤害事件
        constant integer EVENT_DAMAGE_DATA_VAILD = 0
        //物理伤害
        constant integer EVENT_DAMAGE_DATA_IS_PHYSICAL = 1 
        //攻击伤害
        constant integer EVENT_DAMAGE_DATA_IS_ATTACK = 2 
        //远程伤害
        constant integer EVENT_DAMAGE_DATA_IS_RANGED = 3 
        //伤害类型
        constant integer EVENT_DAMAGE_DATA_DAMAGE_TYPE = 4 
        //武器类型
        constant integer EVENT_DAMAGE_DATA_WEAPON_TYPE = 5 
        //攻击类型
        constant integer EVENT_DAMAGE_DATA_ATTACK_TYPE = 6 
    endglobals

    globals
        //是否要DeBug
        boolean IsMirage = false 
    endglobals

    function Debug takes string debugtype, string msg returns nothing
        if IsMirage then
            call DisplayTimedTextToPlayer(LocalPlayer,0,0,60,msg)
        endif
    endfunction

    function GetBuffSlkData takes integer Id, string data returns string
        set SlkType = "buff"
        set SlkdataType = data
        return AbilityId2String(Id)
    endfunction
    
    //与lua交互获得Slk数据
    function GetUnitSlkData takes integer Id, string data returns string
        set SlkType = "unit"
        set SlkdataType = data
        return AbilityId2String(Id)
    endfunction

    //获取英雄单位的主属性 primary: 1 == str  2 == int  3 = agi 
    function GetUnitPrimaryById takes integer whichType returns string
        return GetUnitSlkData(whichType, "Primary")
    endfunction

    function GetUnitPrimary takes unit whichUnit returns string
        local integer i = GetUnitTypeId(whichUnit)
        return GetUnitSlkData(i, "Primary")
    endfunction

    function GetUnitPrimaryValue takes unit whichUnit returns integer
        local string data = GetUnitPrimary(whichUnit)
        if data == "STR" then
            return GetHeroStr(whichUnit, true)
        elseif data == "AGI" then
            return GetHeroAgi(whichUnit, true)
        elseif data == "INT" then
            return GetHeroInt(whichUnit, true)
        endif
        return 0
    endfunction

    //关于Buff的思考
    //移除魔法效果用Loop来遍历一个数组删除应该合理些
    //Buff相关 一般为添加龙卷风破坏光环
    function unitAddAbilityTimed_CallBack takes nothing returns boolean
        local trigger trig = GetTriggeringTrigger()
        local integer iHandleId = GetHandleId(trig)
        local unit whichUnit = LoadUnitHandle(HT, iHandleId, 17)
        local integer abilityId = LoadInteger(HT, iHandleId, 59)
        local integer buffId = LoadInteger(HT, iHandleId, 60)
        local timer durTimer = LoadTimerHandle(HT, iHandleId, 10)
        call SaveBoolean(HT, iHandleId, 0, true)
        call UnitRemoveAbility(whichUnit, abilityId)
        call UnitRemoveAbility(whichUnit, buffId)
        if GetUnitAbilityLevel(whichUnit, abilityId) == 0 then
            call FlushChildHashtable(HT, iHandleId)
            call ClearTrigger(trig)
            call DestroyTimer(durTimer)
            call RemoveSavedHandle(HT, GetHandleId(whichUnit), 0 - abilityId)
        else
            call TimerStart(durTimer, 1, true, null)
        endif
        set whichUnit = null
        set trig = null
        set durTimer = null
        return false
    endfunction
    function UnitAddAbilityTimed takes unit whichUnit, integer abilityId, integer level, real duration, integer buffId, integer i returns nothing
        local trigger trig
        local integer iHandleId
        local real remaining
        local timer durTimer
        if not UnitAlive(whichUnit) then
            return
        endif
        if HaveSavedHandle(HT, GetHandleId(whichUnit), 0 - abilityId) then
            set trig = LoadTriggerHandle(HT, GetHandleId(whichUnit), 0 - abilityId)
            set iHandleId = GetHandleId(trig)
            set durTimer = LoadTimerHandle(HT, iHandleId, 10)
        else
            set trig = CreateTrigger()
            set iHandleId = GetHandleId(trig)
            set durTimer = CreateTimer()
            call FlushChildHashtable(HT, iHandleId)
            call SaveUnitHandle(HT, iHandleId, 17, whichUnit)
            call SaveInteger(HT, iHandleId, 59, abilityId)
            call SaveInteger(HT, iHandleId, 60, buffId)
            call SaveReal(HT, iHandleId, 0, 0)
            call TriggerRegisterDeathEvent(trig, whichUnit)
            call SaveTimerHandle(HT, iHandleId, 10, durTimer)
            call TriggerRegisterTimerExpireEvent(trig, durTimer)
            call TriggerAddCondition(trig, Condition(function unitAddAbilityTimed_CallBack))
            call SaveTriggerHandle(HT, GetHandleId(whichUnit), 0 - abilityId, trig)
        endif
        call RemoveSavedBoolean(HT, iHandleId, 0)
        set remaining = TimerGetRemaining(durTimer)
        if remaining < duration then
            call TimerStart(durTimer, duration, false, null)
        endif
        call UnitAddPermanentAbilitySetlevel(whichUnit, abilityId, level)
        set trig = null
        set durTimer = null
    endfunction

    //造成伤害 脚本中除了普攻以外的伤害都由此造成
    function DamageUnit takes unit whichUnit, unit target, integer Type, real amount returns nothing
        if Type == 0 or amount < 0 then
            return
        endif
        if Type == 1 then //法术,火焰伤害(魔法伤害)
            call UnitDamageTarget(whichUnit, target, amount, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_FIRE, WEAPON_TYPE_WHOKNOWS)
        elseif Type == 2 then //英雄,普通伤害(物理伤害)
            call UnitDamageTarget(whichUnit, target, amount, false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
        elseif Type == 3 then //英雄,魔法伤害(纯粹伤害)
            call UnitDamageTarget(whichUnit, target, amount, false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
        elseif Type == 4 then //穿刺，普通伤害(?)
            call UnitDamageTarget(whichUnit, target, amount, false, false, ATTACK_TYPE_PIERCE, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
        elseif Type == 5 then //法术，普通伤害(?)
            call UnitDamageTarget(whichUnit, target, amount, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
        elseif Type == 6 then //英雄，通用伤害(神圣伤害)
            call UnitDamageTarget(whichUnit, target, amount, false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS)
        elseif Type == 7 then //英雄，加强伤害(?)
            call UnitDamageTarget(whichUnit, target, amount, false, false, ATTACK_TYPE_HERO, DAMAGE_TYPE_ENHANCED, WEAPON_TYPE_WHOKNOWS)
        elseif Type == 8 then //法术，通用伤害(?)
            call UnitDamageTarget(whichUnit, target, amount, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS)
        elseif Type == 9 then //生命移除
        endif
    endfunction


    
    //模拟行为限制
    //模拟晕眩
    //EXPauseUnit内部自带计数 为true时+1 false时-1 计数 <=0 时单位不再晕眩
    //移除晕眩
    function UnitRemoveStun takes unit u returns boolean
        local integer h
        local integer uh = GetHandleId(u)
        local timer t = null
        if HaveSavedHandle(UnitKeyBuff, uh, UNITBUFF_STUN) then
            set t = LoadTimerHandle(UnitKeyBuff, uh, UNITBUFF_STUN)
            set h = GetHandleId(t)
            call RemoveSavedHandle(UnitKeyBuff, uh, UNITBUFF_STUN)
            call RemoveSavedHandle(HT, h, 0)
            call DestroyTimer(t)
            call EXPauseUnit(u, false) //此函数内部自带计数
            call UnitRemoveAbility(u, 'Aasl')
            call UnitRemoveAbility(u, 'BPSE')
            set t = null
            return true
        endif
        return false
    endfunction

    function UnitStun_Actions takes nothing returns nothing
        local timer t = GetExpiredTimer()
        local integer h = GetHandleId(t)
        local unit u = LoadUnitHandle(HT, h, 0)
        local integer uh = GetHandleId(u)
        //call SaveInteger(UnitKeyBuff, uh, UNITBUFF_STUN,  LoadInteger(UnitKeyBuff, uh, UNITBUFF_STUN) - 1 )
        call RemoveSavedHandle(UnitKeyBuff, uh, UNITBUFF_STUN)
        call RemoveSavedHandle(HT, h, 0)
        call DestroyTimer(t)
        call EXPauseUnit(u, false) //此函数内部自带计数
        call UnitRemoveAbility(u, 'Aasl')
        call UnitRemoveAbility(u, 'BPSE')
        set t = null
        set u = null
    endfunction
    //单位、持续时间、是否无视魔免
    function UnitSetStun takes unit u, real dur returns boolean
        local timer t
        local integer h = GetHandleId(u)
        local real time = 0
        if HaveSavedHandle(UnitKeyBuff, h, UNITBUFF_STUN) then
            set t = LoadTimerHandle(UnitKeyBuff, h, UNITBUFF_STUN)
            set time = TimerGetRemaining(t)
        else
            set t = CreateTimer()
            call EXPauseUnit(u, true)
            //call SaveInteger(UnitKeyBuff, h, UNITBUFF_STUN, LoadInteger(UnitKeyBuff, h, UNITBUFF_STUN) + 1)
            call UnitAddAbility(u, 'Aasl')
            call UnitMakeAbilityPermanent(u, true, 'Aasl')
            call SaveTimerHandle(UnitKeyBuff, h, UNITBUFF_STUN, t)
            call SaveUnitHandle(HT, GetHandleId(t), 0, u)
        endif
        if time < dur then
            set time = dur
        endif
        if time != 0 then
            call TimerStart(t, time, false, function UnitStun_Actions)
        endif
        set t = null
        return true
    endfunction
    //封装了一层本质上是使用UnitSetStun 参数b为是否无视魔法免疫
    function M_UnitSetStun takes unit u, real dur, real herodur, boolean b returns boolean
        if IsUnitType(u, UNIT_TYPE_MAGIC_IMMUNE) and not b then//检查是否魔免
            return false
        endif
        if GetUnitAbilityLevel(u, 'AHer') == 1 then //如果单位为英雄 那么就会有此技能
            set dur = herodur
        endif
        return UnitSetStun(u, dur)
    endfunction

    
    //移除单位枷锁
    function UnitRemoveLeash takes unit u, integer abid, integer buffId returns nothing
	
    endfunction

    //GetTriggerEventId() == EVENT_UNIT_SPELL_ENDCAST and GetSpellAbilityId() == LoadInteger(HT, h, 50)//
    //似乎不需要记录技能Id
    function UnitSetLeash_Actions takes nothing returns boolean
        local trigger t = GetTriggeringTrigger()
        local integer h = GetHandleId(t)
        local unit u = LoadUnitHandle(HT, h, 1)
        local unit target = LoadUnitHandle(HT, h, 0)
        local integer c = GetTriggerEvalCount(t)
        local real damage
        local eventid trigEventId = GetTriggerEventId()
        //时间到期 或 Buff等级为0 或 单位死亡
        if c == LoadInteger(HT, h, 30) or GetUnitAbilityLevel(target, LoadInteger(HT, h, 2)) == 0 or trigEventId == EVENT_WIDGET_DEATH or ( trigEventId == EVENT_UNIT_SPELL_ENDCAST and GetSpellAbilityId() == LoadInteger(HT, h, 55) ) then
            call DestroyLightning(LoadLightningHandle(HT, h, 10))
            call EXPauseUnit(target, false)
            call UnitRemoveAbility(target, LoadInteger(HT, h, 1) )
            call UnitRemoveAbility(target, LoadInteger(HT, h, 2) )
            call FlushChildHashtable(HT, h)
            call ClearTrigger(t)
        else
            if HaveSavedHandle(HT, h, 10) then
                call MoveLightning(LoadLightningHandle(HT, h, 10), true, GetUnitX(u), GetUnitY(u), GetUnitX(target), GetUnitY(target))
                if ModuloInteger(c, 20) == 1 then //伤害单位
                    set damage = LoadReal(HT, h, 30)
                    if damage != 0 then
                        call DamageUnit(u, target, 1, damage) //枷锁只会造成法术攻击 魔法伤害
                    endif
                endif
            else
                set damage = LoadReal(HT, h, 30)
                if damage != 0 then
                    call DamageUnit(u, target, 1, damage) //如果没存闪电效果则每次回调造成一次伤害
                endif
            endif
        endif
        set trigEventId = null
        set t = null
        set target = null
        set u = null
        return false
    endfunction

    //关于单位枷锁，Buff的叠加类型为 同类型Buff重复释放刷新持续时间。
    //codeName填 "_" 则不会有闪电效果 如果需要单位持续施法，使用UnitSetLeashByAbility。
    function UnitSetLeash takes unit spellUnit, unit targetUnit, string codeName, integer spellAbility,integer abilityId, integer buffId, real dur, real herodur, real damage, boolean ignoreMagicImmunes returns boolean
        local integer h
        local trigger t
        local real time = 0.
        if IsUnitType(targetUnit, UNIT_TYPE_MAGIC_IMMUNE) and not ignoreMagicImmunes then
            return false
        endif
        set h = GetHandleId(targetUnit)
        if GetUnitAbilityLevel(targetUnit, 'AHer') == 1 then
            set dur = herodur
        endif
        if GetUnitAbilityLevel(targetUnit, buffId) == 1 then
            set t = LoadTriggerHandle(UnitKeyBuff, h, Leash + buffId)//防止buff的key冲突所以加一下
        else
            call EXPauseUnit(targetUnit, true)
            call SaveInteger(UnitKeyBuff, h, UNITBUFF_STUN, LoadInteger(UnitKeyBuff, h, UNITBUFF_STUN ) + 1)
            set t = CreateTrigger()
            call TriggerAddCondition(t, Condition( function UnitSetLeash_Actions))
            call SaveTriggerHandle(UnitKeyBuff, h, Leash + buffId, t)
            set h = GetHandleId(t)
            if spellAbility != 0 then
                call SaveInteger(HT, h, 55, spellAbility)
                call TriggerRegisterUnitEvent(t, spellUnit, EVENT_UNIT_SPELL_ENDCAST)
            endif
            call UnitAddAbility(targetUnit, abilityId)
            call UnitMakeAbilityPermanent(targetUnit, true, abilityId)
            call SaveUnitHandle(HT, h, 0, targetUnit)
            call SaveUnitHandle(HT, h, 1, spellUnit)
            if codeName != "_" then
                call SaveLightningHandle(HT, h, 10, AddLightning(codeName, true, GetUnitX(spellUnit), GetUnitY(spellUnit), GetUnitX(targetUnit), GetUnitY(targetUnit)))
                call TriggerRegisterTimerEvent(t, LeashFrame, true) //
            else
                call TriggerRegisterTimerEvent(t, 1, true) //如果没有闪电特效，则一秒回调一次。
            endif
            if damage != 0 then //直接存入伤害值
                call SaveReal(HT, h, 30, damage)
            endif
            call SaveInteger(HT, h, 1, abilityId)
            call SaveInteger(HT, h, 2, buffId)
            call SaveInteger(HT, h, 30, R2I( dur / LeashFrame ) ) //此项为最大赋值次数(持续时间)  dur / (LeashFrame)
        endif
        if time < dur then
            set time = dur
        endif
        if time != 0 then
            call TriggerRegisterDeathEvent(t, spellUnit)
            call TriggerRegisterDeathEvent(t, targetUnit)
        endif
        set t = null
        return true
    endfunction


    function UnitRemoveInvulnerable takes unit whichUnit returns nothing
        call SetUnitInvulnerable(whichUnit, true)
    endfunction

    //设置单位无敌 封装了一层 不会因为独立更改而导致无敌失效
    function UnitAddInvulnerable takes unit whichUnit returns nothing
        call SetUnitInvulnerable(whichUnit, true)
    endfunction

    function UnitSetMagicImmunityRemove takes nothing returns boolean
        local trigger trig = GetTriggeringTrigger()
        local integer iHandleId = GetHandleId(trig)
        local unit whichUnit = LoadUnitHandle(HT, iHandleId, 0)

        call UnitRemoveAbility(whichUnit, 'Amai')

        set trig = null
        return false
    endfunction

    function UnitSetMagicImmunity takes unit whichUnit, real time returns nothing
        local integer iHandleId = GetHandleId(whichUnit)
        local trigger trig = LoadTriggerHandle(UnitKeyBuff, iHandleId, MagicImmunity)
        local real elapsed
        if trig == null then
            set trig = CreateTrigger()
            set iHandleId = GetHandleId(trig)
            call UnitAddPermanentAbility(whichUnit, 'Amai')
            call UnitMakeAbilityPermanent(whichUnit, true, 'Amim')
            call TriggerRegisterTimerEvent(trig, time, false)
            call TriggerAddCondition(trig, Condition( function UnitSetMagicImmunityRemove))
            call SaveUnitHandle(HT, iHandleId, 0, whichUnit)
            call SaveReal(HT, iHandleId, 0, time + TimerGetElapsed(GameTimer))
        else
            set iHandleId = GetHandleId(trig)
            set elapsed = TimerGetElapsed(GameTimer) - LoadReal(HT, iHandleId, 0)
            if elapsed < time then
                call FlushChildHashtable(HT, iHandleId)
                call ClearTrigger(trig)
                call RemoveSavedHandle(UnitKeyBuff, GetHandleId(whichUnit), MagicImmunity)
                call UnitSetMagicImmunity(whichUnit, time)
            endif
        endif
        set trig = null
    endfunction


    //注意filterId的值不宜过高,Jass的数值最大值为8191
    //每个filterId可以注册200个事件,通常不会用那么多
    //给触发器注册任意单位受伤事件
    //通常一个攻击特效filterId用1, (敌对,非建筑)CommonAttackEffectFilter
    function TriggerRegisterAnyUnitDamagedEvent takes trigger trig, integer filterId returns nothing
        local integer id = filterId * 200
        if trig == null then
            return
        endif
        set DamageEventQueue[id + DamageEventNumber[filterId]] = trig
        set DamageEventNumber[filterId] = id + DamageEventNumber[filterId] + 1
        //call Debug("log","register" + I2S(GetHandleId(DamageEventQueue[200])))
    endfunction

    //此函数会将触发器推入队列顶端,每次loop时优先触发,适用于会更改伤害值的事件/*暂时不需要此函数 因为暴击的计算独立了
    //function ExTriggerRegisterAnyUnitDamagedEvent takes trigger trig returns nothing
    //	local integer i = DamageEventNumber + 1
    //	if trig == null then
    //		return
    //	endif
    //	if DamageEventNumber == 0 then
    //		call TriggerRegisterAnyUnitDamagedEvent(trig)
    //	endif
    //	loop
    //		set DamageEventQueue[i - 1] = DamageEventQueue[i]
    //		set i = i - 1
    //		exitwhen i == 0
    //	endloop
    //	set DamageEventQueue[0] = trig
    //	set DamageEventNumber = DamageEventNumber + 1
    //endfunction

    //计时器回调到期则设置变量为false
    function DisableAttackEffect takes nothing returns nothing
        set EffectIsEnabled[LoadInteger(HT, GetHandleId(GetExpiredTimer()), 0)]= false
    endfunction
    //在一定时间内激活暴击 key的值不能为0  time为0则是永久激活
    function EnabledAttackEffect takes integer key, real time returns nothing
        if not EffectIsEnabled[0] then
            set EffectIsEnabled[0] = true
        endif
        set EffectIsEnabled[key] = true
        if time == 0 then
            return
        elseif EffectEnabledTimer[key] == null then
            set EffectEnabledTimer[key] = CreateTimer()
            call SaveInteger(HT, GetHandleId(EffectEnabledTimer[key]), 0, key)
        endif
        if TimerGetRemaining(EffectEnabledTimer[key])< time then
            call TimerStart(EffectEnabledTimer[key], time, false, function DisableAttackEffect)
        endif
    endfunction

    function KillDestructablesInCircle_Actions takes nothing returns nothing
        if GetDestructableLife(GetEnumDestructable()) > 0.00 then
            call KillDestructable(GetEnumDestructable())
        endif
    endfunction
    //用一个中心区域来当马甲
    //摧毁范围内的可破坏物
    function KillDestructablesInCircle takes real x, real y, real d returns nothing
        call SetRect(RectDummy, x - d, y - d, x + d, y + d)
        call EnumDestructablesInRect(RectDummy, null, function KillDestructablesInCircle_Actions)
    endfunction

    function GetDestructablesAmountInCircle_Actions takes nothing returns nothing
        if GetDestructableLife(GetEnumDestructable()) > 0.00 then
            set Tmp_DummyAmount = Tmp_DummyAmount + 1
        endif
    endfunction

    function GetDestructablesAmountInCircle takes real x, real y, real d returns integer
        call SetRect(RectDummy, x - d, y - d, x + d, y + d)
        set Tmp_DummyAmount = 0
        call EnumDestructablesInRect(RectDummy, null, function GetDestructablesAmountInCircle_Actions)
        return Tmp_DummyAmount
    endfunction

    function FindNearestDestructable takes nothing returns nothing
        local destructable enumDestructable = GetEnumDestructable()
        local real x = GetWidgetX(enumDestructable)
        local real y = GetWidgetY(enumDestructable)
        local real dis = GetDistanceBetween(Tmp_GetNearestDestructableUnitX, Tmp_GetNearestDestructableUnitY, x, y)
	
        if dis > Tmp_NearestDestructableDistance then
            set Tmp_NearestDestructableDistance = dis
            set Tmp_Destructable = enumDestructable
        endif

        set Tmp_Destructable = enumDestructable
        set enumDestructable = null
    endfunction

    // 获取单位范围内的最近可破坏物
    function GetNearestDestructable takes unit whichUnit, real radius returns destructable
        local real x = GetUnitX(whichUnit)
        local real y = GetUnitY(whichUnit)
        set Tmp_GetNearestDestructableUnitX = x
        set Tmp_GetNearestDestructableUnitY = y
        call SetRect(RectDummy, x - radius, y - radius, x + radius, y + radius)
        set Tmp_Destructable = null
        set Tmp_NearestDestructableDistance = 0.
        call EnumDestructablesInRect(RectDummy, null, function FindNearestDestructable)
        return Tmp_Destructable
    endfunction



    //逆变身 使用后需要刷新一下单位的基础攻击力
    function YDWEUnitTransform takes unit u, integer targetid returns nothing
        local integer i = GetUnitTypeId(u)
        if i != targetid and i != 0 then
            call UnitAddAbility(u, 'Abrf')
            call EXSetAbilityDataInteger(EXGetUnitAbility(u, 'Abrf'), 1, ABILITY_DATA_UNITID, i)
            call EXSetAbilityAEmeDataA(EXGetUnitAbility(u, 'Abrf'), i)
            call UnitRemoveAbility(u, 'Abrf')
            call UnitAddAbility(u, 'Abrf')
            call EXSetAbilityAEmeDataA(EXGetUnitAbility(u, 'Abrf'), targetid)
            call UnitRemoveAbility(u, 'Abrf')
        endif
    endfunction

    // 使用无目标技能(ID)
    function IssueImmediateAbilityById takes unit whichUnit, integer abilityId returns nothing
        if HaveSavedString(ObjectData, SPELL_EFFECT, abilityId) then
            set Tmp_SpellAbilityUnit = whichUnit
            call DzExecuteFunc(LoadStr(ObjectData, SPELL_EFFECT, abilityId))
        endif
    endfunction

    function IssueTargetOrderByIdWait0S_CallBack takes nothing returns boolean
        local trigger trig = CreateTrigger()
        local integer iHandleId = GetHandleId(trig)
        local integer order = LoadInteger(HT, iHandleId, 0)
        local unit whichUnit = LoadUnitHandle(HT, iHandleId, 0)
        local widget targetWidget = LoadWidgetHandle(HT, iHandleId, 1)

        call IssueTargetOrderById(whichUnit, order, targetWidget)
        call FlushChildHashtable(HT, iHandleId)
        call ClearTrigger(trig)

        set trig = null
        set whichUnit = null
        set targetWidget = null
        return false
    endfunction
    //延迟0秒后再发布技能,单位事件中直接发动可能会卡住
    function IssueTargetOrderByIdWait0S takes unit whichUnit, integer order, widget targetWidget returns nothing
        local trigger trig = CreateTrigger()
        local integer iHandleId = GetHandleId(trig)

        call TriggerRegisterTimerEvent(trig, 0., false)
        call TriggerAddCondition( trig, Condition( function IssueTargetOrderByIdWait0S_CallBack))
        call SaveInteger(HT, iHandleId, 0, order)
        call SaveUnitHandle(HT, iHandleId, 0, whichUnit)
        call SaveWidgetHandle(HT, iHandleId, 1, targetWidget)

        set trig = null
    endfunction
    
    //不推荐使用
    //本质上只是使用两次逆变身来刷新，whichType则是刷新后的状态
    function RefreshUnitModelById takes unit whichUnit , integer whichType returns nothing
        call YDWEUnitTransform(whichUnit, 'Uwar')
        call YDWEUnitTransform(whichUnit, whichType)
    endfunction
    //与上面不同的是，此函数不会改变单位类别，始终会变回原来的类别
    function RefreshUnitModel takes unit whichUnit returns nothing
        local integer unitType = GetUnitTypeId(whichUnit)
        call YDWEUnitTransform(whichUnit, 'Uwar')
        call YDWEUnitTransform(whichUnit, unitType)
    endfunction
    //设置单位阴影，参数可填 Shadow 或 _ ,会进行一次逆变身
    function SetUnitShadow takes unit whichUnit, integer whichType, string modelName returns nothing
        call EXSetUnitString(whichType, 0x13, modelName)
        call RefreshUnitModel(whichUnit)
    endfunction

    // 会被函数内联优化掉 所以封装一层使得可读性更强
    function M_GetSpellAbilityUnit takes nothing returns unit
        return Tmp_SpellAbilityUnit
    endfunction

    function M_GetSpellTargetUnit takes nothing returns unit
        return Tmp_SpellTargetUnit
    endfunction

    function M_GetSpellAbilityLevel takes nothing returns integer
        return Tmp_SpellAbilityLevel
    endfunction

    function M_GetSpellTargetX takes nothing returns real
        return Tmp_SpellTargetX
    endfunction

    function M_GetSpellTargetY takes nothing returns real
        return Tmp_SpellTargetY
    endfunction

    globals
        key UnitDelayedStandingKey
    endglobals

    function UnitDelayStandActions takes nothing returns nothing
        local timer hTimer = GetExpiredTimer()
        local integer iHandleId = GetHandleId(hTimer)
        local unit whichUnit = LoadUnitHandle(HT, iHandleId, 0)

        if UnitAlive(whichUnit) then
            call SetUnitAnimation(whichUnit, "Stand")
        endif
        call RemoveSavedHandle(UnitKeyBuff, GetHandleId(whichUnit), UnitDelayedStandingKey)

        call DestroyTimer(hTimer)
        set hTimer = null
        set whichUnit = null
    endfunction

    // 让单位在等待一段时间后播放Stand动作 重复使用会覆盖
    function UnitDelayedStanding takes unit whichUnit, real dur returns nothing
        local integer iHandleId = GetHandleId(whichUnit)
        local timer hTimer = LoadTimerHandle(UnitKeyBuff, iHandleId, UnitDelayedStandingKey)
        if hTimer == null then
            set hTimer = CreateTimer()
            call SaveUnitHandle(HT, GetHandleId(hTimer), 0, whichUnit)
            call SaveTimerHandle(UnitKeyBuff, iHandleId, UnitDelayedStandingKey, hTimer)
        endif
        call TimerStart(hTimer, dur, false, function UnitDelayStandActions)

        set hTimer = null
    endfunction

    globals
        hashtable UnitAbilityTrigger = InitHashtable()
    endglobals

    // 创建一个绑定单位技能的触发器(使用重修之书后将删除此触发器) 多用于某些给单一单位注册的触发器
    function CreateUnitAbilityTrigger takes unit whichUnit, integer iAbilityId returns trigger
        local integer iHandleId = GetHandleId(whichUnit)
        set bj_lastCreatedTrigger = CreateTrigger()
        call SaveTriggerHandle(UnitAbilityTrigger, iHandleId, iAbilityId, bj_lastCreatedTrigger)
        return bj_lastCreatedTrigger
    endfunction


endlibrary



