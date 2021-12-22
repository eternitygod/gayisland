
scope YDWEJapi
    native EXExecuteScript takes string script returns string
    // Abilitys
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
    endglobals

    native EXGetUnitAbility takes unit u, integer abilcode returns ability
	native EXGetUnitAbilityByIndex takes unit u, integer index returns ability
	native EXGetAbilityId takes ability abil returns integer
	native EXGetAbilityState takes ability abil, integer state_type returns real
	native EXSetAbilityState takes ability abil, integer state_type, real value returns boolean
	native EXGetAbilityDataReal takes ability abil, integer level, integer data_type returns real
	native EXSetAbilityDataReal takes ability abil, integer level, integer data_type, real value returns boolean
	native EXGetAbilityDataInteger takes ability abil, integer level, integer data_type returns integer
	native EXSetAbilityDataInteger takes ability abil, integer level, integer data_type, integer value returns boolean
	native EXGetAbilityDataString takes ability abil, integer level, integer data_type returns string
	native EXSetAbilityDataString takes ability abil, integer level, integer data_type, string value returns boolean

    // 技能属性 [JAPI]
    function YDWEGetUnitAbilityState takes unit u, integer abilcode, integer state_type returns real
        return EXGetAbilityState(EXGetUnitAbility(u, abilcode), state_type)
    endfunction
    // 技能数据 (整数) [JAPI]
    function YDWEGetUnitAbilityDataInteger takes unit u, integer abilcode, integer level, integer data_type returns integer
        return EXGetAbilityDataInteger(EXGetUnitAbility(u, abilcode), level, data_type)
    endfunction
    // 技能数据 (实数) [JAPI]
    function YDWEGetUnitAbilityDataReal takes unit u, integer abilcode, integer level, integer data_type returns real
        return EXGetAbilityDataReal(EXGetUnitAbility(u, abilcode), level, data_type)
    endfunction
    // 技能数据 (字符串) [JAPI]
    function YDWEGetUnitAbilityDataString takes unit u, integer abilcode, integer level, integer data_type returns string
        return EXGetAbilityDataString(EXGetUnitAbility(u, abilcode), level, data_type)
    endfunction
    // 设置技能属性 [JAPI]
    function YDWESetUnitAbilityState takes unit u, integer abilcode, integer state_type, real value returns boolean
        return EXSetAbilityState(EXGetUnitAbility(u, abilcode), state_type, value)
    endfunction
    // 设置技能数据 (整数) [JAPI]
    function YDWESetUnitAbilityDataInteger takes unit u, integer abilcode, integer level, integer data_type, integer value returns boolean
        return EXSetAbilityDataInteger(EXGetUnitAbility(u, abilcode), level, data_type, value)
    endfunction
    // 设置技能数据 (实数) [JAPI]
    function YDWESetUnitAbilityDataReal takes unit u, integer abilcode, integer level, integer data_type, real value returns boolean
        return EXSetAbilityDataReal(EXGetUnitAbility(u, abilcode), level, data_type, value)
    endfunction
    // 设置技能数据 (字符串) [JAPI]
    function YDWESetUnitAbilityDataString takes unit u, integer abilcode, integer level, integer data_type, string value returns boolean
        return EXSetAbilityDataString(EXGetUnitAbility(u, abilcode), level, data_type, value)
    endfunction

	native EXSetAbilityAEmeDataA takes ability abil, integer unitid returns boolean
    
    /* // 单位变身  [JAPI]
    function YDWEUnitTransform takes unit u, integer abilcode, integer targetid returns nothing
        call UnitAddAbility(u, abilcode)
        call EXSetAbilityDataInteger(EXGetUnitAbility(u, abilcode), 1, ABILITY_DATA_UNITID, GetUnitTypeId(u))
        call EXSetAbilityAEmeDataA(EXGetUnitAbility(u, abilcode), GetUnitTypeId(u))
        call UnitRemoveAbility(u, abilcode)
        call UnitAddAbility(u, abilcode)
        call EXSetAbilityAEmeDataA(EXGetUnitAbility(u, abilcode), targetid)
        call UnitRemoveAbility(u, abilcode)
    endfunction
    */
    //==============================================================================
    // units
    //==============================================================================
    native EXSetUnitFacing takes unit u, real angle returns nothing
    native EXPauseUnit takes unit u, boolean flag returns nothing
    native EXSetUnitCollisionType takes boolean enable, unit u, integer t returns nothing
    native EXSetUnitMoveType takes unit u, integer t returns nothing
        
    function YDWEUnitAddStun takes unit u returns nothing
        call EXPauseUnit(u, true)
    endfunction
        
    function YDWEUnitRemoveStun takes unit u returns nothing
        call EXPauseUnit(u, false)
    endfunction
    
    globals
        //------------单位数据类型--------------
        // 攻击1 伤害骰子数量
        constant unitstate UNIT_STATE_ATTACK1_DAMAGE_DICE = ConvertUnitState(0x10)
    
        // 攻击1 伤害骰子面数
        constant unitstate UNIT_STATE_ATTACK1_DAMAGE_SIDE = ConvertUnitState(0x11)
    
        // 攻击1 基础伤害
        constant unitstate UNIT_STATE_ATTACK1_DAMAGE_BASE = ConvertUnitState(0x12)
    
        // 攻击1 升级奖励
        constant unitstate UNIT_STATE_ATTACK1_DAMAGE_BONUS = ConvertUnitState(0x13)
    
        // 攻击1 最小伤害
        constant unitstate UNIT_STATE_ATTACK1_DAMAGE_MIN = ConvertUnitState(0x14)
    
        // 攻击1 最大伤害
        constant unitstate UNIT_STATE_ATTACK1_DAMAGE_MAX = ConvertUnitState(0x15)
    
        // 攻击1 全伤害范围
        constant unitstate UNIT_STATE_ATTACK1_RANGE = ConvertUnitState(0x16)
    
        // 装甲
        constant unitstate UNIT_STATE_ARMOR = ConvertUnitState(0x20)
    
        // attack 1 attribute adds
        // 攻击1 伤害衰减参数
        constant unitstate UNIT_STATE_ATTACK1_DAMAGE_LOSS_FACTOR = ConvertUnitState(0x21)
    
        // 攻击1 武器声音
        constant unitstate UNIT_STATE_ATTACK1_WEAPON_SOUND = ConvertUnitState(0x22)
    
        // 攻击1 攻击类型
        constant unitstate UNIT_STATE_ATTACK1_ATTACK_TYPE = ConvertUnitState(0x23)
    
        // 攻击1 最大目标数
        constant unitstate UNIT_STATE_ATTACK1_MAX_TARGETS = ConvertUnitState(0x24)
    
        // 攻击1 攻击间隔
        constant unitstate UNIT_STATE_ATTACK1_INTERVAL = ConvertUnitState(0x25)
    
        // 攻击1 攻击延迟/summary>
        constant unitstate UNIT_STATE_ATTACK1_INITIAL_DELAY = ConvertUnitState(0x26)
    
        // 攻击1 弹射弧度
        constant unitstate UNIT_STATE_ATTACK1_BACK_SWING = ConvertUnitState(0x28)
    
        // 攻击1 攻击范围缓冲
        constant unitstate UNIT_STATE_ATTACK1_RANGE_BUFFER = ConvertUnitState(0x27)
    
        // 攻击1 目标允许
        constant unitstate UNIT_STATE_ATTACK1_TARGET_TYPES = ConvertUnitState(0x29)
    
        // 攻击1 溅出区域
        constant unitstate UNIT_STATE_ATTACK1_SPILL_DIST = ConvertUnitState(0x56)
    
        // 攻击1 溅出半径
        constant unitstate UNIT_STATE_ATTACK1_SPILL_RADIUS = ConvertUnitState(0x57)
    
        // 攻击1 武器类型
        constant unitstate UNIT_STATE_ATTACK1_WEAPON_TYPE = ConvertUnitState(0x58)
    
        // attack 2 attributes (sorted in a sequencial order based on memory address)
        // 攻击2 伤害骰子数量
        constant unitstate UNIT_STATE_ATTACK2_DAMAGE_DICE = ConvertUnitState(0x30)
    
        // 攻击2 伤害骰子面数
        constant unitstate UNIT_STATE_ATTACK2_DAMAGE_SIDE = ConvertUnitState(0x31)
    
        // 攻击2 基础伤害
        constant unitstate UNIT_STATE_ATTACK2_DAMAGE_BASE = ConvertUnitState(0x32)
    
        // 攻击2 升级奖励
        constant unitstate UNIT_STATE_ATTACK2_DAMAGE_BONUS = ConvertUnitState(0x33)
    
        // 攻击2 伤害衰减参数
        constant unitstate UNIT_STATE_ATTACK2_DAMAGE_LOSS_FACTOR = ConvertUnitState(0x34)
    
        // 攻击2 武器声音
        constant unitstate UNIT_STATE_ATTACK2_WEAPON_SOUND = ConvertUnitState(0x35)
    
        // 攻击2 攻击类型
        constant unitstate UNIT_STATE_ATTACK2_ATTACK_TYPE = ConvertUnitState(0x36)
    
        // 攻击2 最大目标数
        constant unitstate UNIT_STATE_ATTACK2_MAX_TARGETS = ConvertUnitState(0x37)
    
        // 攻击2 攻击间隔
        constant unitstate UNIT_STATE_ATTACK2_INTERVAL = ConvertUnitState(0x38)
    
        // 攻击2 攻击延迟
        constant unitstate UNIT_STATE_ATTACK2_INITIAL_DELAY = ConvertUnitState(0x39)
    
        // 攻击2 攻击范围
        constant unitstate UNIT_STATE_ATTACK2_RANGE = ConvertUnitState(0x40)
    
        // 攻击2 攻击缓冲
        constant unitstate UNIT_STATE_ATTACK2_RANGE_BUFFER = ConvertUnitState(0x41)
    
        // 攻击2 最小伤害
        constant unitstate UNIT_STATE_ATTACK2_DAMAGE_MIN = ConvertUnitState(0x42)
    
        // 攻击2 最大伤害
        constant unitstate UNIT_STATE_ATTACK2_DAMAGE_MAX = ConvertUnitState(0x43)
    
        // 攻击2 弹射弧度
        constant unitstate UNIT_STATE_ATTACK2_BACK_SWING = ConvertUnitState(0x44)
    
        // 攻击2 目标允许类型
        constant unitstate UNIT_STATE_ATTACK2_TARGET_TYPES = ConvertUnitState(0x45)
    
        // 攻击2 溅出区域
        constant unitstate UNIT_STATE_ATTACK2_SPILL_DIST = ConvertUnitState(0x46)
    
        // 攻击2 溅出半径
        constant unitstate UNIT_STATE_ATTACK2_SPILL_RADIUS = ConvertUnitState(0x47)
    
        // 攻击2 武器类型
        constant unitstate UNIT_STATE_ATTACK2_WEAPON_TYPE = ConvertUnitState(0x59)
    
        // 装甲类型
        constant unitstate UNIT_STATE_ARMOR_TYPE = ConvertUnitState(0x50)
    
        // 攻速 取百分比
        constant unitstate UNIT_STATE_RATE_OF_FIRE = ConvertUnitState(0x51) // global attack rate of unit, work on both attacks
        // 寻敌 原生cj也有
        constant unitstate UNIT_STATE_ACQUISITION_RANGE = ConvertUnitState(0x52) // how far the unit will automatically look for targets
        
        // 生命恢复 当恢复类型为总是时 不知道如何使其刷新
        constant unitstate UNIT_STATE_LIFE_REGEN = ConvertUnitState(0x53)
        // 魔法恢复  
        constant unitstate UNIT_STATE_MANA_REGEN = ConvertUnitState(0x54)
    
        // 最小射程
        constant unitstate UNIT_STATE_MIN_RANGE = ConvertUnitState(0x55)
    
        // 目标类型
        constant unitstate UNIT_STATE_AS_TARGET_TYPE = ConvertUnitState(0x60)
    
        // 作为目标类型
        constant unitstate UNIT_STATE_TYPE = ConvertUnitState(0x61)
    endglobals
    //==============================================================================
    globals
        // 模型路径
        constant integer UNIT_STRING_MODEL_PATH = 13
        // 大头像模型路径
        constant integer UNIT_STRING_MODEL_PORTRAIT_PATH = 14
        // 单位阴影
        constant integer UNIT_STRING_SHADOW_PATH = 0x13
        // 模型缩放
        constant integer UNIT_REAL_MODEL_SCALE = 0x2c
        // 阴影图像 - X轴偏移
        constant integer UNIT_REAL_SHADOW_X = 0x20
        // 阴影图像 - Y轴偏移
        constant integer UNIT_REAL_SHADOW_Y = 0x21
        // 阴影图像 - 宽度
        constant integer UNIT_REAL_SHADOW_W = 0x22
        // 阴影图像 - 高度
        constant integer UNIT_REAL_SHADOW_H = 0x23
    endglobals

    native EXGetUnitString takes integer unitcode, integer Type returns string
    native EXSetUnitString takes integer unitcode,integer Type,string value returns boolean
    native EXGetUnitReal takes integer unitcode, integer Type returns real
    native EXSetUnitReal takes integer unitcode,integer Type,real value returns boolean
    native EXGetUnitInteger takes integer unitcode, integer Type returns integer
    native EXSetUnitInteger takes integer unitcode,integer Type,integer value returns boolean
    native EXGetUnitArrayString takes integer unitcode, integer Type,integer index returns string

    //==============================================================================
    // Items
    //==============================================================================
    native EXGetItemDataString takes integer itemcode, integer data_type returns string
    native EXSetItemDataString takes integer itemcode, integer data_type, string value returns boolean
                
    //==============================================================================
    // Effects
    //==============================================================================
    native EXGetEffectX takes effect e returns real
    native EXGetEffectY takes effect e returns real
    native EXGetEffectZ takes effect e returns real
    native EXSetEffectXY takes effect e, real x, real y returns nothing
    native EXSetEffectZ takes effect e, real z returns nothing
    native EXGetEffectSize takes effect e returns real
    native EXSetEffectSize takes effect e, real size returns nothing
    native EXEffectMatRotateX takes effect e, real angle returns nothing
    native EXEffectMatRotateY takes effect e, real angle returns nothing
    native EXEffectMatRotateZ takes effect e, real angle returns nothing //特效面对方向
    native EXEffectMatScale takes effect e, real x, real y, real z returns nothing
    native EXEffectMatReset takes effect e returns nothing
    native EXSetEffectSpeed takes effect e, real speed returns nothing

    //==============================================================================
    // Buffs
    //==============================================================================
    // Buff的Japi在1.27a不可用，最新的YDWE版本修复了这个问题，但官方平台上似乎不可用。
    native EXGetBuffDataString takes integer buffcode, integer data_type returns string
    native EXSetBuffDataString takes integer buffcode, integer data_type, string value returns boolean

endscope

scope BlzAPI
    globals
        // BlzApi UIEvent 的一些常量
    
        // 按下事件
        constant integer FRAME_EVENT_PRESSED = 1
        // 鼠标进入
        constant integer FRAME_MOUSE_ENTER = 2
        // 鼠标离开
        constant integer FRAME_MOUSE_LEAVE = 3
        // 鼠标按下
        constant integer FRAME_MOUSE_UP = 4
        // 鼠标弹起
        constant integer FRAME_MOUSE_DOWN = 5
        // 鼠标滚轮
        constant integer FRAME_MOUSE_WHEEL = 6
        // 激活焦点
        constant integer FRAME_FOCUS_ENTER = FRAME_MOUSE_ENTER
        // 取消焦点
        constant integer FRAME_FOCUS_LEAVE = FRAME_MOUSE_LEAVE
        // 激活复选框
        constant integer FRAME_CHECKBOX_CHECKED = 7
        // 取消复选框
        constant integer FRAME_CHECKBOX_UNCHECKED = 8
        // 对话框文字改变
        constant integer FRAME_EDITBOX_TEXT_CHANGED = 9
        // 开始弹出菜单项目 (POPUPMENU类似于大厅选种族)
        constant integer FRAME_POPUPMENU_ITEM_CHANGE_START = 10
        // 弹出的菜单项目被更改
        constant integer FRAME_POPUPMENU_ITEM_CHANGED = 11
        // 鼠标双击 但没找到能响应双击事件的UI
        constant integer FRAME_MOUSE_DOUBLECLICK = 12
        // 模型动画更新
        constant integer FRAME_SPRITE_ANIM_UPDATE = 13
    
        // UI Positions framepointtype
    
        // 左上
        constant integer FRAMEPOINT_TOPLEFT = 0
        // 上
        constant integer FRAMEPOINT_TOP = 1
        // 右上
        constant integer FRAMEPOINT_TOPRIGHT = 2
        // 左
        constant integer FRAMEPOINT_LEFT = 3
        // 中间
        constant integer FRAMEPOINT_CENTER = 4
        // 右
        constant integer FRAMEPOINT_RIGHT = 5
        // 左下
        constant integer FRAMEPOINT_BOTTOMLEFT = 6
        // 下
        constant integer FRAMEPOINT_BOTTOM = 7
        // 右下
        constant integer FRAMEPOINT_BOTTOMRIGHT = 8
        
    endglobals
endscope
    
