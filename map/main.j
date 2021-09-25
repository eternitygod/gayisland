
// 大部分的常用函数
//! import "Vjass\CommonFunc.j"
// 单位选取的过滤条件
//! import "Vjass\Filter.j"


//! import "Vjass\UnitRestore.j"

//! import "Vjass\UnitStateRefresh.j"

//! import "Vjass\UnitBonusSystem.j"

// 一些通用技能模板
//! import "Vjass\AbilityTemplate.j"

//! import "Vjass\ItemSystem.j"

// 物品相关事件包含在ItemSystem.j
//! import "Vjass\Event.j"

// 英雄尽量在后面加载
//! import "Vjass\Hero.j"
//! import "Vjass\Boss.j"

// UI在英雄后面加载
//! import "Vjass\UI.j"

globals
	// Generated
	rect gg_rct_TriggerTiny = null
	rect gg_rct_1_0_Movie_OgreMagi1 = null
	rect gg_rct_1_0_Movie_InitSt = null
	rect gg_rct_1_0_Movie_Portal1 = null
	rect gg_rct_1_0_Movie_Portal2 = null
	rect gg_rct_1_0_Movie_OgreMagi2 = null
	rect gg_rct_1_0_Movie_TrollWarlord1 = null
	rect gg_rct_1_0_Movie_LCQY1 = null
	rect gg_rct_1_0_Movie_PAL1 = null
	rect gg_rct_1_0_Movie_Portal3 = null
	rect gg_rct_1_0_Movie_Portal4 = null
	rect gg_rct_1_0_Movie_Portal5 = null
	rect gg_rct_1_0_Movie_Portal6 = null
	rect gg_rct_1_0_Movie_Init = null
	rect gg_rct_1_0_Movie_injoker1 = null
	rect gg_rct_1_0_Movie_injoker2 = null
	rect gg_rct_SB = null

	// 镜头
	camerasetup gg_cam_OrgeInitialPoint = null


	sound gg_snd_ShouSiJuHua = null
	sound gg_snd_FootmanYes1 = null
	sound gg_snd_PeasantPissed3 = null
	sound gg_snd_SkeletonYes1 = null
	sound gg_snd_ForestTrollYesAttack2 = null
	sound gg_snd_ForestTrollWarcry1 = null
	sound gg_snd_PriestYesAttack1 = null
	sound gg_snd_ArthasPissed4 = null
	sound gg_snd_NecromancerPissed4 = null
	sound gg_snd_NecromancerWhat1 = null
	sound gg_snd_pl_impact_stun = null
	sound gg_snd_JuHuaXiao = null
	sound gg_snd_HeroLichReady1 = null
	sound gg_snd_S03Illidan45 = null
	sound gg_snd_JuHuaWuGu = null
	sound gg_snd_FlashBack1Second = null
	sound gg_snd_BigSven_u = null
	sound gg_snd_Sven_sevn_u = null
	sound gg_snd_LongZhu_u = null
	sound gg_snd_WoKaoJuQingSha = null
	sound gg_snd_Ai_o_u = null
	sound gg_snd_LZGL = null
	string gg_snd_PursuitTheme
	sound gg_snd_LJDTtth = null
	sound gg_snd_MaLiuDXiu = null
	sound gg_snd_OgreYesAttack3 = null
	unit gg_unit_nvde_0068 = null
	unit gg_unit_Hpal_0268 = null
	unit gg_unit_ospw_0050 = null
	unit gg_unit_hbew_0052 = null

	region WorldRegion = null

	unit W2 = null
	

	

	
	
	
	trigger array DamageEventQueue
	integer array DamageEventNumber
	
	hashtable ObjectData = InitHashtable()
	
	//Frame
	//光环刷新间隔
	constant real AuraFrame = 0.5 
	//单位恢复间隔
	constant real RestoreFrame = 0.2 
	//枷锁闪电效果移动间隔
	constant real LeashFrame = 0.05 

	//单位类型 数据
	
	trigger LevelUpTrigger = null
	trigger EnterMapTrigger = null


	
	//单位哈希表
	hashtable UnitData = InitHashtable() 


	//===========================================


	constant integer BuffAddType_Positive = 1 //正面Buff
	constant integer BuffAddType_Negative = 2 //负面Buff
	constant integer BuffAddType_Magic = 8 //魔法Buff
	constant integer BuffAddType_Physical = 16 //物理Buff
	constant integer BuffAddType_Aura = 32 //光环Buff
	constant integer BuffAddType_AutoDispel = 64 //不可驱散Buff

	//===========================================

	//主要任务
	quest array MainQuest
	//支线任务
	quest array SideQuest


	


	//中转全局变量
	unit Tmp_SpellAbilityUnit = null
	unit Tmp_SpellTargetUnit = null
	integer Tmp_SpellAbilityLevel
	real Tmp_SpellTargetX
	real Tmp_SpellTargetY


	integer Tmp_DummyAmount = 0

	//伤害事件

	//伤害来源
	unit Tmp_DamageSource = null //GetEventDamageSource()
	//受伤者
	unit Tmp_DamageInjured = null
	//伤害值
	real Tmp_DamageValue
	boolean array EffectIsEnabled //用来一些特效是否被启用 减少运算资源
	timer array EffectEnabledTimer

	//哈希表的Key
	//UnitData
	constant integer UNIT_BASE_ARMOR = 101
	constant integer UNIT_BASE_DAMAGE = 102
	constant integer UNIT_LIFERESTORE = 103
	constant integer UNIT_MANARESTORE = 104
	
	//ObjectData
	constant integer BONUS_DAMAGE = 0   //攻击
	constant integer BONUS_ARMOR = 1 //护甲
	constant integer BONUS_ATTACK = 2    //攻速
	constant integer BONUS_LIFE = 3 //最大生命
	constant integer BONUS_MANA = 4 //最大魔法
	constant integer BONUS_STR = 5
	constant integer BONUS_AGI = 6
	constant integer BONUS_INT = 7
	constant integer BONUS_MOVESPEED = 8   //移动速度


	//技能事件的哈希表key
	//准备释放技能
	constant integer SPELL_CHANNEL = 10
	//发动技能效果
	constant integer SPELL_EFFECT = 11
	//学习技能
	constant integer LEARN_SKILL = 14
	//学习技能1级
	constant integer LEARN_FIRST_LEVEL_SKILL = 15



	//UnitBuff
	hashtable UnitBuff = InitHashtable()
	hashtable UnitKeyBuff = InitHashtable()
	constant integer AttackTarget = - 100 //攻击目标 用于判断与攻击事件
	constant integer AttackReadyTrg = - 101 //捕捉远程攻击弹道出手的触发器
	constant integer AttackReadyTimer = - 102 //捕捉远程攻击弹道出手的计时器
	constant integer CriticalStrikeDamage = - 99 //暴击伤害的Key


	constant integer Leash = - 1 //枷锁 + BuffId
	constant integer UNITBUFF_STUN = 0 // 单位晕眩
	constant integer ZeroCast = 1 //零重施法
	constant integer BallLightningCount = 7 //球状闪电计数 计数为0时才逆变身

	constant integer MagicImmunity = 11

	// 一些命令Id
	// 攻击
	constant integer Order_Attack = 851983
	// 右键
	constant integer Order_Smart = 851971
	// 移动
	constant integer Order_Move = 851986
	// 照明弹
	constant integer Order_Flare = 852060
	// 魔法枷锁
	constant integer Order_MagicLeash = 852480
	// 闪电链
	constant integer Order_Chainlightning = 852119
	// 嘲讽
	constant integer Order_Taunt = 852520
	// 采集
	constant integer Order_Harvest = 852018


	//是否是初始化单位
	boolean IsInitUnit = true
	//Dummy 马甲
	rect RectDummy = Rect(0, 0, 0, 0)
	//获取最近的可破坏物
	destructable Tmp_Destructable = null
	real Tmp_NearestDestructableDistance = 0.
	real Tmp_GetNearestDestructableUnitX = 0.
	real Tmp_GetNearestDestructableUnitY = 0.

	//额外属性马甲
	unit BonusDummy = null
	//和lua交互数据的全局变量
	string SlkdataType = ""
	string SlkType = "" 
	integer array StrHeroTypeId
	integer array IntHeroTypeId
	integer array AgiHeroTypeId
	integer array AllHeroTypeId


	constant integer MaxUserAmount = 5


	//

	unit array TavernUnit
	unit array MovieDummyUnit
	unit array PlayerHeroUnit

	//===================================
	//
	//	QuestUnit
	//
	//===================================
	unit Romantic = null
endglobals


// 获取鼠标在游戏内的坐标X
native DzGetMouseTerrainX takes nothing returns real
// 获取鼠标在游戏内的坐标Y
native DzGetMouseTerrainY takes nothing returns real
// 获取鼠标在游戏内的坐标Z
native DzGetMouseTerrainZ takes nothing returns real
// 鼠标是否在游戏内
native DzIsMouseOverUI takes nothing returns boolean
// 获取鼠标屏幕坐标X
native DzGetMouseX takes nothing returns integer
// 获取鼠标屏幕坐标Y
native DzGetMouseY takes nothing returns integer
// 获取鼠标游戏窗口坐标X
native DzGetMouseXRelative takes nothing returns integer
// 获取鼠标游戏窗口坐标Y
native DzGetMouseYRelative takes nothing returns integer
// 设置鼠标位置
native DzSetMousePos takes integer x, integer y returns nothing
// 注册鼠标点击触发（sync为true时，调用TriggerExecute。为false时，直接运行action函数，可以异步不掉线，action里不要有同步操作）
native DzTriggerRegisterMouseEvent takes trigger trig, integer btn, integer status, boolean sync, string func returns nothing
// 注册鼠标点击触发（sync为true时，调用TriggerExecute。为false时，直接运行action函数，可以异步不掉线，action里不要有同步操作）
native DzTriggerRegisterMouseEventByCode takes trigger trig, integer btn, integer status, boolean sync, code funcHandle returns nothing
// 注册键盘点击触发
native DzTriggerRegisterKeyEvent takes trigger trig, integer key, integer status, boolean sync, string func returns nothing
// 注册键盘点击触发
native DzTriggerRegisterKeyEventByCode takes trigger trig, integer key, integer status, boolean sync, code funcHandle returns nothing
// 注册鼠标滚轮触发
native DzTriggerRegisterMouseWheelEvent takes trigger trig, boolean sync, string func returns nothing
// 注册鼠标滚轮触发
native DzTriggerRegisterMouseWheelEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
// 注册鼠标移动触发
native DzTriggerRegisterMouseMoveEvent takes trigger trig, boolean sync, string func returns nothing
// 注册鼠标移动触发
native DzTriggerRegisterMouseMoveEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
// 获取触发器的按键码
native DzGetTriggerKey takes nothing returns integer
// 获取滚轮delta
native DzGetWheelDelta takes nothing returns integer
// 判断按键是否按下
native DzIsKeyDown takes integer iKey returns boolean
// 获取触发key的玩家
native DzGetTriggerKeyPlayer takes nothing returns player
// 获取war3窗口宽度
native DzGetWindowWidth takes nothing returns integer
// 获取war3窗口高度
native DzGetWindowHeight takes nothing returns integer
// 获取war3窗口X坐标
native DzGetWindowX takes nothing returns integer
// 获取war3窗口Y坐标
native DzGetWindowY takes nothing returns integer
// 注册war3窗口大小变化事件
native DzTriggerRegisterWindowResizeEvent takes trigger trig, boolean sync, string func returns nothing
// 注册war3窗口大小变化事件
native DzTriggerRegisterWindowResizeEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
// 判断窗口是否激活
native DzIsWindowActive takes nothing returns boolean
// 设置可摧毁物位置
native DzDestructablePosition takes destructable d, real x, real y returns nothing
// 设置单位位置-本地调用
native DzSetUnitPosition takes unit whichUnit, real x, real y returns nothing
// 异步执行函数
native DzExecuteFunc takes string funcName returns nothing
// 取鼠标指向的单位
native DzGetUnitUnderMouse takes nothing returns unit
// 设置单位的贴图
native DzSetUnitTexture takes unit whichUnit, string path, integer texId returns nothing
//  设置内存数值
native DzSetMemory takes integer address, real value returns nothing
//  替换单位类型 [BZAPI]
native DzSetUnitID takes unit whichUnit, integer id returns nothing
//  替换单位模型 [BZAPI]
native DzSetUnitModel takes unit whichUnit, string path returns nothing
//  原生 - 设置小地图背景贴图
native DzSetWar3MapMap takes string map returns nothing
// 注册数据同步触发器
native DzTriggerRegisterSyncData takes trigger trig, string prefix, boolean server returns nothing
// 同步游戏数据
native DzSyncData takes string prefix, string data returns nothing
// 获取同步的数据
native DzGetTriggerSyncData takes nothing returns string
// 获取同步数据的玩家
native DzGetTriggerSyncPlayer takes nothing returns player
// 隐藏界面元素
native DzFrameHideInterface takes nothing returns nothing
// 修改游戏世界窗口位置
native DzFrameEditBlackBorders takes real upperHeight, real bottomHeight returns nothing
// 头像
native DzFrameGetPortrait takes nothing returns integer
// 小地图
native DzFrameGetMinimap takes nothing returns integer
// 技能按钮
native DzFrameGetCommandBarButton takes integer row, integer column returns integer
// 英雄按钮
native DzFrameGetHeroBarButton takes integer buttonId returns integer
// 英雄血条
native DzFrameGetHeroHPBar takes integer buttonId returns integer
// 英雄蓝条
native DzFrameGetHeroManaBar takes integer buttonId returns integer
// 道具按钮
native DzFrameGetItemBarButton takes integer buttonId returns integer
// 小地图按钮
native DzFrameGetMinimapButton takes integer buttonId returns integer
// 左上菜单按钮
native DzFrameGetUpperButtonBarButton takes integer buttonId returns integer
// 鼠标提示
native DzFrameGetTooltip takes nothing returns integer
// 聊天信息
native DzFrameGetChatMessage takes nothing returns integer
// 单位信息
native DzFrameGetUnitMessage takes nothing returns integer
// 获取最上的信息
native DzFrameGetTopMessage takes nothing returns integer
// 取rgba色值
native DzGetColor takes integer r, integer g, integer b, integer a returns integer
// 设置界面更新回调（非同步）
native DzFrameSetUpdateCallback takes string func returns nothing
// 界面更新回调
native DzFrameSetUpdateCallbackByCode takes code funcHandle returns nothing
// 显示/隐藏窗体
native DzFrameShow takes integer frame, boolean enable returns nothing
// 创建窗体
native DzCreateFrame takes string frame, integer parent, integer id returns integer
// 创建简单的窗体
native DzCreateSimpleFrame takes string frame, integer parent, integer id returns integer
// 销毁窗体
native DzDestroyFrame takes integer frame returns nothing
// 加载内容目录 (Toc table of contents)
native DzLoadToc takes string fileName returns nothing
// 设置窗体相对位置 [0:左上|1:上|2:右上|3:左|4:中|5:右|6:左下|7:下|8:右下]
native DzFrameSetPoint takes integer frame, integer point, integer relativeFrame, integer relativePoint, real x, real y returns nothing
// 设置窗体绝对位置
native DzFrameSetAbsolutePoint takes integer frame, integer point, real x, real y returns nothing
// 清空窗体锚点
native DzFrameClearAllPoints takes integer frame returns nothing
// 设置窗体禁用/启用
native DzFrameSetEnable takes integer name, boolean enable returns nothing
// 注册用户界面事件回调
native DzFrameSetScript takes integer frame, integer eventId, string func, boolean sync returns nothing
//  注册UI事件回调(func handle)
native DzFrameSetScriptByCode takes integer frame, integer eventId, code funcHandle, boolean sync returns nothing
// 获取触发用户界面事件的玩家
native DzGetTriggerUIEventPlayer takes nothing returns player
// 获取触发用户界面事件的窗体
native DzGetTriggerUIEventFrame takes nothing returns integer
// 通过名称查找窗体
native DzFrameFindByName takes string name, integer id returns integer
// 通过名称查找普通窗体
native DzSimpleFrameFindByName takes string name, integer id returns integer
// 查找字符串
native DzSimpleFontStringFindByName takes string name, integer id returns integer
// 查找BACKDROP frame
native DzSimpleTextureFindByName takes string name, integer id returns integer
// 获取游戏用户界面
native DzGetGameUI takes nothing returns integer
// 点击窗体
native DzClickFrame takes integer frame returns nothing
// 自定义屏幕比例
native DzSetCustomFovFix takes real value returns nothing
// 使用宽屏模式
native DzEnableWideScreen takes boolean enable returns nothing
// 设置文字（支持EditBox, TextFrame, TextArea, SimpleFontString、GlueEditBoxWar3、SlashChatBox、TimerTextFrame、TextButtonFrame、GlueTextButton）
native DzFrameSetText takes integer frame, string text returns nothing
// 获取文字（支持EditBox, TextFrame, TextArea, SimpleFontString）
native DzFrameGetText takes integer frame returns string
// 设置字数限制（支持EditBox）
native DzFrameSetTextSizeLimit takes integer frame, integer size returns nothing
// 获取字数限制（支持EditBox）
native DzFrameGetTextSizeLimit takes integer frame returns integer
// 设置文字颜色（支持TextFrame, EditBox）
native DzFrameSetTextColor takes integer frame, integer color returns nothing
// 获取鼠标所在位置的用户界面控件指针
native DzGetMouseFocus takes nothing returns integer
// 设置所有锚点到目标窗体上
native DzFrameSetAllPoints takes integer frame, integer relativeFrame returns boolean
// 设置焦点
native DzFrameSetFocus takes integer frame, boolean enable returns boolean
// 设置模型（支持Sprite、Model、StatusBar）
native DzFrameSetModel takes integer frame, string modelFile, integer modelType, integer flag returns nothing
// 获取控件是否启用
native DzFrameGetEnable takes integer frame returns boolean
// 设置透明度（0-255）
native DzFrameSetAlpha takes integer frame, integer alpha returns nothing
// 获取透明度（0-255）
native DzFrameGetAlpha takes integer frame returns integer
// 设置动画
native DzFrameSetAnimate takes integer frame, integer animId, boolean autocast returns nothing
// 设置动画进度（autocast为false是可用）
native DzFrameSetAnimateOffset takes integer frame, real offset returns nothing
// 设置texture（支持Backdrop、SimpleStatusBar）
native DzFrameSetTexture takes integer frame, string texture, integer flag returns nothing
// 设置缩放
native DzFrameSetScale takes integer frame, real scale returns nothing
// 设置提示
native DzFrameSetTooltip takes integer frame, integer tooltip returns nothing
// 鼠标限制在用户界面内
native DzFrameCageMouse takes integer frame, boolean enable returns nothing
// 获取当前值（支持Slider、SimpleStatusBar、StatusBar）
native DzFrameGetValue takes integer frame returns real
// 设置最大最小值（支持Slider、SimpleStatusBar、StatusBar）
native DzFrameSetMinMaxValue takes integer frame, real minValue, real maxValue returns nothing
// 设置Step值（支持Slider）
native DzFrameSetStepValue takes integer frame, real step returns nothing
// 设置当前值（支持Slider、SimpleStatusBar、StatusBar）
native DzFrameSetValue takes integer frame, real value returns nothing
// 设置窗体大小
native DzFrameSetSize takes integer frame, real w, real h returns nothing
// 根据tag创建窗体
native DzCreateFrameByTagName takes string frameType, string name, integer parent, string template, integer id returns integer
// 设置颜色（支持SimpleStatusBar）
native DzFrameSetVertexColor takes integer frame, integer color returns nothing
// 不明觉厉
native DzOriginalUIAutoResetPoint takes boolean enable returns nothing
//  设置优先级 [NEW]
native DzFrameSetPriority takes integer frame, integer priority returns nothing
//  设置父窗口 [NEW]
native DzFrameSetParent takes integer frame, integer parent returns nothing
//  设置字体 [NEW]
native DzFrameSetFont takes integer frame, string fileName, real height, integer flag returns nothing
//  获取 Frame 的 高度 [NEW]
native DzFrameGetHeight takes integer frame returns real
//  设置对齐方式 [NEW]
native DzFrameSetTextAlignment takes integer frame, integer align returns nothing
//  获取 Frame 的 Parent [NEW]
native DzFrameGetParent takes integer frame returns integer

//==========================================================================


//===========================================================================
// 
// 基佬之岛v1.15
// 
//   Warcraft III map script
//   Generated by the Warcraft III World Editor
//   Date: Wed Apr 07 20:33:49 2021
//   Map Author: 未知
// 
//===========================================================================
//***************************************************************************
//*
//*  Global Variables
//*
//***************************************************************************



// 队伍颜色
// 菊花 - 绿色
// 卡尔 - 紫色

// 创建电影马甲单位
function CreateMovieDummyUnit takes nothing returns nothing
	local player p = Player(6)

	set TavernUnit[1] = CreateUnit(Player(bj_PLAYER_NEUTRAL_VICTIM), 'n001', - 22752.0, - 25376.0, 320)
	call UnitShareVisionToAllPlayer(TavernUnit[1], true)

	set MovieDummyUnit[1] = CreateUnit(p, 'nm01', - 24901, - 25553, 71.69)
	call UnitAddAbility(MovieDummyUnit[1], 'Asla')
	call UnitAddSleepPerm(MovieDummyUnit[1], true)
	call SetUnitAnimation(MovieDummyUnit[1], "Sleep")
	call SetUnitColor(MovieDummyUnit[1], PLAYER_COLOR_GREEN)
	call RemoveGuardPosition(MovieDummyUnit[1])

	set MovieDummyUnit[2] = CreateUnit(p, 'nm02', - 22797, - 25827, 172)
	call SetUnitColor(MovieDummyUnit[2], PLAYER_COLOR_PURPLE)
	call RemoveGuardPosition(MovieDummyUnit[2])

	set MovieDummyUnit[3] = CreateUnit(p, 'nm03', - 22372, - 26034, 146.47)
	call SetUnitColor(MovieDummyUnit[3], PLAYER_COLOR_BLUE)
	call RemoveGuardPosition(MovieDummyUnit[3])
	
	// 偷税师棕色
	set MovieDummyUnit[4] = CreateUnit(p, 'nm04', - 22637, - 26245, 107.84)
	call SetUnitColor(MovieDummyUnit[4], PLAYER_COLOR_BROWN)
	call RemoveGuardPosition(MovieDummyUnit[4])
	
	// 小天红色
	set MovieDummyUnit[5] = CreateUnit(p, 'nm05', - 22800, - 26225, 87.6)
	call SetUnitColor(MovieDummyUnit[5], PLAYER_COLOR_RED)
	call RemoveGuardPosition(MovieDummyUnit[5])

	// 光 蓝色
	set MovieDummyUnit[7] = CreateUnit(p, 'nm07', - 22273, - 25675, 211.92)
	call SetUnitColor(MovieDummyUnit[7], PLAYER_COLOR_BLUE)
	call RemoveGuardPosition(MovieDummyUnit[7])

	// 仓鼠棕色	
	set MovieDummyUnit[6] = CreateUnit(p, 'nm06', - 22421, - 25235, 252.45)
	call SetUnitColor(MovieDummyUnit[6], PLAYER_COLOR_BROWN)
	call RemoveGuardPosition(MovieDummyUnit[6])

	set MovieDummyUnit[101] = CreateUnit(p, 'nhew', - 24660, - 24878, 249.95)
	call SetUnitColor(MovieDummyUnit[101], PLAYER_COLOR_PURPLE)
	call RemoveGuardPosition(MovieDummyUnit[101])

	set MovieDummyUnit[102] = CreateUnit(p, 'nhew', - 24206, - 25453, 176)
	call SetUnitColor(MovieDummyUnit[102], PLAYER_COLOR_PURPLE)

	// 火窖
	set MovieDummyUnit[103] = CreateUnit(p, 'n003', - 24326, - 25439, 270)
	call SetUnitColor(MovieDummyUnit[103], PLAYER_COLOR_PURPLE)
	call SetUnitAnimation(MovieDummyUnit[103], "Decay")

	// 挨打的工人
	set MovieDummyUnit[104] = CreateUnit(p, 'nhew', - 23504, - 23862 , 176)
	call SetUnitColor(MovieDummyUnit[104], PLAYER_COLOR_PURPLE)
	call RemoveGuardPosition(MovieDummyUnit[104])
		
	call CreateUnit(p, 'n002', - 23202, - 26463, 270)

	set p = Player(7)
	// 三个送死的小鱼人
	set MovieDummyUnit[105] = CreateUnit(p, 'nmcf', - 24227, - 23229 , 302.43)
	call RemoveGuardPosition(MovieDummyUnit[105])
	call SetWidgetLife(MovieDummyUnit[105], 50)
	set MovieDummyUnit[106] = CreateUnit(p, 'nmcf', - 24059, - 23311 , 276.04)
	call RemoveGuardPosition(MovieDummyUnit[106])
	call SetWidgetLife(MovieDummyUnit[106], 50)
	set MovieDummyUnit[107] = CreateUnit(p, 'nmcf', - 24244, - 23471 , 313.32)
	call RemoveGuardPosition(MovieDummyUnit[107])
	call SetWidgetLife(MovieDummyUnit[107], 50)

	
	//call SetUnitCreepGuard(MovieDummyUnit[102], false)
endfunction

// 电影相关用到的BJ函数均已处理
// 电影简介
function Intro_Cinematic takes nothing returns boolean
	//local group findFireCellar
	local string message
	local string cinematicFilterPath = "ReplaceableTextures\\CameraMasks\\Black_mask.blp"
	// 开启电影模式

	call CameraSetupApplyForceDuration(gg_cam_OrgeInitialPoint, true, 0.)

	call SuspendTimeOfDay(true)
	call CinematicModeBJ(true, bj_FORCE_ALL_PLAYERS)
	call CinematicFadeCommonBJ(255, 255, 255, 5, cinematicFilterPath, 0, 100)

	call ClearMapMusic()
    call TriggerSleepAction(0.01)
    call PlayThematicMusic("Sound\\Music\\mp3Music\\Orc2.mp3")
    call SetMapMusic("Music", false, 2)

	// 第一个工人砍树
	call IssueTargetOrder(MovieDummyUnit[101], "harvest", GetNearestDestructable(MovieDummyUnit[101], 300))

	// 第二个工人造火窖
	//call IssueBuildOrderById(MovieDummyUnit[102], 'n003', - 24326, - 25439)
	// 不造了,直接造假
	// 背着木头造假更带感
	call AddUnitAnimationProperties(MovieDummyUnit[102] , "Ready Lumber", true)
	call SetUnitAnimation(MovieDummyUnit[102], "Stand Work Lumber")

	call TriggerSleepAction(0.5)

	call VolumeGroupResetBJ()
	// 偷懒一下 通过单位组直接寻找到火窖
	//set findFireCellar = LoginGroup()
	//call GroupEnumUnitsOfType(findFireCellar, UnitId2String('n003'), null)
	//set MovieDummyUnit[103] = FirstOfGroup(findFireCellar)
	//call SetUnitAnimation(MovieDummyUnit[103], "Decay")
	//call LogoutGroup(findFireCellar)
	//set findFireCellar = null

	call DisplayTextToPlayer(LocalPlayer, 0, 0, "菊花打败9D，进入传送门后...")
	call TriggerSleepAction(4.5)
	// 关闭滤镜
	call DisplayCineFilter(false)

	call TriggerSleepAction(1.)

	// 先让菊花吼一下
	call AttachSoundToUnit(gg_snd_OgreYesAttack3, MovieDummyUnit[1])
	call StartSound(gg_snd_OgreYesAttack3)

	call TriggerSleepAction(0.3)
	// 再让菊花起来
	call UnitWakeUp(MovieDummyUnit[1])
	call UnitRemoveAbility(MovieDummyUnit[1], 'Asla')

	call TriggerSleepAction(0.2)
	call IssueImmediateOrder(MovieDummyUnit[101], "Stop")
	call SetUnitFacing(MovieDummyUnit[101], 257)

	call TriggerSleepAction(0.4)
	call SetUnitAnimation(MovieDummyUnit[1], "Stand")
	call QueueUnitAnimation(MovieDummyUnit[1], "Stand Ready")

	call TriggerSleepAction(0.2)
	// 工人1靠近菊花
	call IssuePointOrder(MovieDummyUnit[101], "Move", - 24832, - 25139)

	set message = "它醒了，快去和老板报告下。"
	call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_PURPLE, MovieDummyUnit[101], "工人", null, message, 4, false)
	call TriggerSleepAction(0.3)
	call SetUnitFacingTimed(MovieDummyUnit[1], 37, 1)

	call TriggerSleepAction(1)
	// 工人2去找卡尔
	call IssuePointOrder(MovieDummyUnit[102], "Move", - 23150, - 25595)
	call TriggerSleepAction(2.)
	call SetUnitFacingTimed(MovieDummyUnit[1], 93, 1.2)

	set message = "你们是谁，这是什么地方？"
	call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_GREEN, MovieDummyUnit[1], "菊花", null, message, 4, false)
	call TriggerSleepAction(4.)
	// 卡尔再去找菊花
	call IssuePointOrder(MovieDummyUnit[2], "Move", - 24238, - 25093)

	call TriggerSleepAction(0.3)

	call IssuePointOrder(MovieDummyUnit[102], "Move", - 24200, - 25423)

	set message = "我是开尔新材的，我们的老板要和你谈话。"
	call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_PURPLE, MovieDummyUnit[101], "工人", null, message, 5, false)
	call TriggerSleepAction(3.0)
	// 工人1继续砍树
	call IssueTargetOrder(MovieDummyUnit[101], "harvest", GetNearestDestructable(MovieDummyUnit[101], 300))
	call TriggerSleepAction(2.2)

	// 菊花走向卡尔
	call IssuePointOrder(MovieDummyUnit[1], "Move", - 24678, - 25345)
	call TriggerSleepAction(0.5)
	call SetUnitFacing(MovieDummyUnit[2], 231.)

	// 偷懒不用镜头,直接进行一个平移
	call PanCameraToTimed(- 24238, - 25093, 2.0)

	call TriggerSleepAction(0.5)

	call TriggerSleepAction(0.8)

	set message = "卡尔？这里是哪里？"
	call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_GREEN, MovieDummyUnit[1], "菊花", null, message, 3, false)
	
	call TriggerSleepAction(0.2)
	call SetUnitFacing(MovieDummyUnit[102], 173)
	call TriggerSleepAction(0.5)
	call SetUnitAnimation(MovieDummyUnit[102], "Stand Work")
	call TriggerSleepAction(2.5)

	set message = "菊花，好久不见，我们现在正处于一座岛上，这里是9D的基地。"
	call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_PURPLE, MovieDummyUnit[2], "卡尔", null, message, 5.5, false)

	call TriggerSleepAction(5.5)
	set message = "9D？他已经被我打败了..."
	call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_GREEN, MovieDummyUnit[1], "菊花", null, message, 4, false)

	// 工人2假装自己加了火
	call SetUnitAnimation(MovieDummyUnit[103], "Stand")
	call AddUnitAnimationProperties(MovieDummyUnit[102] , "Ready Lumber", false)
	call TriggerSleepAction(0.5)
	call SetUnitAnimation(MovieDummyUnit[102], "Stand")
	call TriggerSleepAction(1.)
	// 工人2也去砍树
	call IssueTargetOrder(MovieDummyUnit[102], "harvest", GetNearestDestructable(MovieDummyUnit[102], 500))

	call TriggerSleepAction(3.5)
	set message = "9D并没有死，现在他就在这座岛上，你击败的只是一个“猪人”。"
	call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_PURPLE, MovieDummyUnit[2], "卡尔", null, message, 5.0, false)
	call TriggerSleepAction(5.)

	//set message = "开尔新材当初参与这里的了部分设计，我知道这里有许多废弃的“通道”。我需要你来修理“通道”以确保我们在这座岛上的机动性。"
	//call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_PURPLE, MovieDummyUnit[2], "卡尔", null, message, 9., false)
	//call TriggerSleepAction(9.)
	set message = "你可以理解为测试或者是筛选，9D想要养猪你。"
	call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_PURPLE, MovieDummyUnit[2], "卡尔", null, message, 4.5, false)
	call TriggerSleepAction(4.5)

	set message = "太阴暗了，那我们要怎么对付他呢，我们两个和你的手下吗？"
	call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_GREEN, MovieDummyUnit[1], "菊花", null, message, 5, false)

	call TriggerSleepAction(5.0)
	// 偷懒不用镜头,再进行一个平移
	//call PanCameraToTimed(- 24238, - 25093, 1.0)

	set message = "跟我来。"
	call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_PURPLE, MovieDummyUnit[2], "卡尔", null, message, 2., false)
	call TriggerSleepAction(1.0)

	// 卡尔跑路
	call IssuePointOrder(MovieDummyUnit[2], "Move", - 23069, - 25771)

	// 锁定镜头到卡尔
	call SetCameraTargetController(MovieDummyUnit[2], 0, 0, true)

	call TriggerSleepAction(0.7)
	call IssuePointOrder(MovieDummyUnit[1], "Move", - 23212, - 25913)

	call TriggerSleepAction(3.2)
	//call ResetToGameCamera(0)
	// 小天靠近卡尔
	call IssuePointOrder(MovieDummyUnit[5], "Move", - 22906, - 25970)

	call TriggerSleepAction(0.2)
	
	// 偷懒不用镜头,双进行一个平移
	call PanCameraToTimedWithZ(- 22820, - 26100, 325, 0.8)
	// 零重找卡尔
	call IssuePointOrder(MovieDummyUnit[3], "Move", - 22699, - 25891)
	call TriggerSleepAction(0.1)

	set message = "给大家介绍一下，这位是我以前的工友，“通道修理者”菊花。"
	call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_PURPLE, MovieDummyUnit[2], "卡尔", null, message, 5, false)
	//call SetUnitFacing(MovieDummyUnit[2], 241.32)
	call SetUnitLookAt(MovieDummyUnit[2], "bone_head", MovieDummyUnit[3], 0, 0, 80.)

	// 光靠近卡尔
	call IssuePointOrder(MovieDummyUnit[6], "Move", - 22606, - 25601)
	call TriggerSleepAction(0.3)


	// 偷税师靠近卡尔
	call IssuePointOrder(MovieDummyUnit[4], "Move", - 22719, - 26101)
	call TriggerSleepAction(0.2)
	call SetUnitFacing(MovieDummyUnit[1], 16)
	// 仓鼠靠近卡尔
	call IssuePointOrder(MovieDummyUnit[7], "Move", - 22586, - 25711)

	call TriggerSleepAction(2.5)
	call SetUnitFacing(MovieDummyUnit[6], 206.72)

	call TriggerSleepAction(1.0)
	call SetUnitFacing(MovieDummyUnit[1], 334.86)
	call TriggerSleepAction(1.0)

	set message = "这些人是谁，你的手下员工？"
	call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_GREEN, MovieDummyUnit[1], "菊花", null, message, 3., false)

	call TriggerSleepAction(1.)
	call SetUnitLookAt(MovieDummyUnit[2], "bone_head", MovieDummyUnit[1], 0, 0, 80.)

	call TriggerSleepAction(2.)
	set message = "不是，他们是和你一样“击败”了9D的人。"
	call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_PURPLE, MovieDummyUnit[2], "卡尔", null, message, 4., false)
	call TriggerSleepAction(0.5)
	call SetUnitFacingTimed(MovieDummyUnit[2], 355.76, 1.2)

	call ResetUnitLookAt(MovieDummyUnit[2])
	
	call TriggerSleepAction(3.5)
	set message = "你好，通道修理者，我叫零重祈愿。我早就听说你的名号了。"
	call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_BLUE, MovieDummyUnit[3], "零重祈愿", null, message, 5.5, false)
	call TriggerSleepAction(0.4)
	call SetUnitFacing(MovieDummyUnit[1], 359.72)
	call TriggerSleepAction(4.5)

	// 滤镜再来！
	call CinematicFadeCommonBJ(255, 255, 255, 2, cinematicFilterPath, 100, 0)


	// 鱼人碰瓷 然后工人250移速开挂跑
	call TriggerSleepAction(0.5)
	call DisplayTextToPlayer(LocalPlayer, 0, 0, "众人自我介绍后...")
	call IssuePointOrder(MovieDummyUnit[105], "attack", - 22820, - 26000)
	call IssuePointOrder(MovieDummyUnit[106], "attack", - 22820, - 26000)
	call IssuePointOrder(MovieDummyUnit[107], "attack", - 22820, - 26000)
	call TriggerSleepAction(1.5)
	call ResetToGameCamera(0)
	call SetCameraTargetController(MovieDummyUnit[104], 0, 0, true)
	call IssuePointOrder(MovieDummyUnit[104], "Move", - 22820, - 26000)
	// 瞬间跑的飞起
	call CinematicFadeCommonBJ(255, 255, 255, 5, cinematicFilterPath, 0, 100)
	call SetUnitMoveSpeed(MovieDummyUnit[104], 250)
	call TriggerSleepAction(5.0)
	// 关闭滤镜
	call DisplayCineFilter(false)

	set message = "大爷们，帮帮我。"
	call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_PURPLE, MovieDummyUnit[104], "工人", null, message, 3.5, false)
	call TriggerSleepAction(3.5)
	
	set message = "这都是从哪里冒出来的？"
	call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_GREEN, MovieDummyUnit[1], "菊花", null, message, 4, false)

	call PanCameraToTimed(GetUnitX(TavernUnit[1]), GetUnitY(TavernUnit[1]), 1.3)
	call TriggerSleepAction(2.0)
	// 工人3继续砍树 正常移速
	call IssueTargetOrder(MovieDummyUnit[104], "harvest", GetNearestDestructable(MovieDummyUnit[104], 600))
	call SetUnitMoveSpeed(MovieDummyUnit[104], 190)
	call TriggerSleepAction(2.0)

	set message = "鱼人在附近有个营地，在你昏迷时我们就被袭击多次了，我们需要摧毁它，不然会一直受到骚扰。"
	call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_BLUE, MovieDummyUnit[7], "牧师", null, message, 7, false)
	call TriggerSleepAction(7.)
	
	call ResetToGameCamera(0)


	// 电影结束
	call CinematicFadeCommonBJ(255, 255, 255, 2, cinematicFilterPath, 100, 0)
	call TriggerSleepAction(2.)

	call ShowUnit(MovieDummyUnit[1], false)
	call ShowUnit(MovieDummyUnit[2], false)
	call ShowUnit(MovieDummyUnit[3], false)
	call ShowUnit(MovieDummyUnit[4], false)
	call ShowUnit(MovieDummyUnit[5], false)
	call ShowUnit(MovieDummyUnit[7], false)
	call ShowUnit(MovieDummyUnit[6], false)


	call CinematicFadeCommonBJ(255, 255, 255, 3, cinematicFilterPath, 0, 100)
	call TriggerSleepAction(3.)
	call DisplayCineFilter(false)

	// 关闭电影模式
	call SuspendTimeOfDay(false)
	call CinematicModeBJ(false, bj_FORCE_ALL_PLAYERS)
	call SelectUnit(TavernUnit[1], true)

	//电影结束
	//call ShowUnit(TavernUnit[1], false)
	call TriggerSleepAction(bj_QUEUE_DELAY_QUEST)
    call QuestMessageBJ(bj_FORCE_ALL_PLAYERS, bj_QUESTMESSAGE_DISCOVERED, "|cffffcc00主要任务|r
	探索岛屿")

	call ClearTrigger(GetTriggeringTrigger())
	return false
endfunction

//***************************************************************************
//*
//*  Sounds
//*
//***************************************************************************

function InitSounds takes nothing returns nothing
	set gg_snd_OgreYesAttack3 = CreateSound("Units\\Creeps\\Ogre\\OgreYesAttack3.wav", false, false, false, 10, 10, "DefaultEAXON")
	call SetSoundParamsFromLabel(gg_snd_OgreYesAttack3, "OgreYesAttack")
	call SetSoundDuration(gg_snd_OgreYesAttack3, 1094)
	call SetSoundChannel(gg_snd_OgreYesAttack3, 0)
	call SetSoundVolume(gg_snd_OgreYesAttack3, 120)

	set gg_snd_ShouSiJuHua = CreateSound("war3mapImported\\ShouSiJuHua.wav", false, false, false, 10, 10, "")
	call SetSoundDuration(gg_snd_ShouSiJuHua, 1498)
	call SetSoundChannel(gg_snd_ShouSiJuHua, 0)
	call SetSoundVolume(gg_snd_ShouSiJuHua, 127)
	call SetSoundPitch(gg_snd_ShouSiJuHua, 1.0)
	set gg_snd_FootmanYes1 = CreateSound("Units\\Human\\Footman\\FootmanYes1.wav", false, true, true, 10, 10, "DefaultEAXON")
	call SetSoundParamsFromLabel(gg_snd_FootmanYes1, "FootmanYes")
	call SetSoundDuration(gg_snd_FootmanYes1, 883)
	set gg_snd_PeasantPissed3 = CreateSound("Units\\Human\\Peasant\\PeasantPissed3.wav", false, true, true, 10, 10, "DefaultEAXON")
	call SetSoundParamsFromLabel(gg_snd_PeasantPissed3, "PeasantPissed")
	call SetSoundDuration(gg_snd_PeasantPissed3, 2601)
	set gg_snd_SkeletonYes1 = CreateSound("Units\\Undead\\Skeleton\\SkeletonYes1.wav", false, true, true, 10, 10, "DefaultEAXON")
	call SetSoundParamsFromLabel(gg_snd_SkeletonYes1, "SkeletonYes")
	call SetSoundDuration(gg_snd_SkeletonYes1, 2785)
	set gg_snd_ForestTrollYesAttack2 = CreateSound("Units\\Creeps\\ForestTroll\\ForestTrollYesAttack2.wav", false, true, true, 10, 10, "DefaultEAXON")
	call SetSoundParamsFromLabel(gg_snd_ForestTrollYesAttack2, "ForestTrollYesAttack")
	call SetSoundDuration(gg_snd_ForestTrollYesAttack2, 914)
	set gg_snd_ForestTrollWarcry1 = CreateSound("Units\\Creeps\\ForestTroll\\ForestTrollWarcry1.wav", false, true, true, 10, 10, "DefaultEAXON")
	call SetSoundParamsFromLabel(gg_snd_ForestTrollWarcry1, "ForestTrollWarcry")
	call SetSoundDuration(gg_snd_ForestTrollWarcry1, 1532)
	set gg_snd_PriestYesAttack1 = CreateSound("Units\\Human\\Priest\\PriestYesAttack1.wav", false, true, true, 10, 10, "DefaultEAXON")
	call SetSoundParamsFromLabel(gg_snd_PriestYesAttack1, "PriestYesAttack")
	call SetSoundDuration(gg_snd_PriestYesAttack1, 1863)
	set gg_snd_ArthasPissed4 = CreateSound("Units\\Human\\Arthas\\ArthasPissed4.wav", false, true, true, 10, 10, "HeroAcksEAX")
	call SetSoundParamsFromLabel(gg_snd_ArthasPissed4, "ArthasPissed")
	call SetSoundDuration(gg_snd_ArthasPissed4, 2000)
	set gg_snd_NecromancerPissed4 = CreateSound("Units\\Undead\\Necromancer\\NecromancerPissed4.wav", false, true, true, 10, 10, "DefaultEAXON")
	call SetSoundParamsFromLabel(gg_snd_NecromancerPissed4, "NecromancerPissed")
	call SetSoundDuration(gg_snd_NecromancerPissed4, 3413)
	set gg_snd_NecromancerWhat1 = CreateSound("Units\\Undead\\Necromancer\\NecromancerWhat1.wav", false, true, true, 10, 10, "DefaultEAXON")
	call SetSoundParamsFromLabel(gg_snd_NecromancerWhat1, "NecromancerWhat")
	call SetSoundDuration(gg_snd_NecromancerWhat1, 1727)
	set gg_snd_pl_impact_stun = CreateSound("war3mapImported\\pl_impact_stun.mp3", false, false, false, 10, 10, "")
	call SetSoundDuration(gg_snd_pl_impact_stun, 1340)
	call SetSoundChannel(gg_snd_pl_impact_stun, 0)
	call SetSoundVolume(gg_snd_pl_impact_stun, 127)
	call SetSoundPitch(gg_snd_pl_impact_stun, 1.0)
	set gg_snd_JuHuaXiao = CreateSound("war3mapImported\\JuHuaXiao.wav", false, false, false, 10, 10, "DefaultEAXON")
	call SetSoundDuration(gg_snd_JuHuaXiao, 1661)
	call SetSoundChannel(gg_snd_JuHuaXiao, 0)
	call SetSoundVolume(gg_snd_JuHuaXiao, 127)
	call SetSoundPitch(gg_snd_JuHuaXiao, 1.0)
	set gg_snd_HeroLichReady1 = CreateSound("Units\\Undead\\HeroLich\\HeroLichReady1.wav", false, true, true, 10, 10, "HeroAcksEAX")
	call SetSoundParamsFromLabel(gg_snd_HeroLichReady1, "HeroLichReady")
	call SetSoundDuration(gg_snd_HeroLichReady1, 3233)
	set gg_snd_S03Illidan45 = CreateSound("Sound\\Dialogue\\NightElfExpCamp\\NightElf03x\\S03Illidan45.mp3", false, false, false, 10, 10, "")
	call SetSoundParamsFromLabel(gg_snd_S03Illidan45, "S03Illidan45")
	call SetSoundDuration(gg_snd_S03Illidan45, 10448)
	set gg_snd_JuHuaWuGu = CreateSound("war3mapImported\\JuHuaWuGu.wav", false, false, false, 10, 10, "")
	call SetSoundDuration(gg_snd_JuHuaWuGu, 3720)
	call SetSoundChannel(gg_snd_JuHuaWuGu, 0)
	call SetSoundVolume(gg_snd_JuHuaWuGu, 127)
	call SetSoundPitch(gg_snd_JuHuaWuGu, 1.0)
	set gg_snd_FlashBack1Second = CreateSound("Sound\\Ambient\\DoodadEffects\\FlashBack1Second.wav", false, false, false, 10, 10, "DefaultEAXON")
	call SetSoundParamsFromLabel(gg_snd_FlashBack1Second, "FlashBack1Second")
	call SetSoundDuration(gg_snd_FlashBack1Second, 2178)
	set gg_snd_BigSven_u = CreateSound("war3mapImported\\BigSven!.wav", false, false, false, 10, 10, "DefaultEAXON")
	call SetSoundDuration(gg_snd_BigSven_u, 2281)
	call SetSoundChannel(gg_snd_BigSven_u, 0)
	call SetSoundVolume(gg_snd_BigSven_u, 127)
	call SetSoundPitch(gg_snd_BigSven_u, 1.0)
	set gg_snd_Sven_sevn_u = CreateSound("war3mapImported\\Sven!sevn!.wav", false, false, false, 10, 10, "")
	call SetSoundDuration(gg_snd_Sven_sevn_u, 10000)
	call SetSoundChannel(gg_snd_Sven_sevn_u, 0)
	call SetSoundVolume(gg_snd_Sven_sevn_u, 127)
	call SetSoundPitch(gg_snd_Sven_sevn_u, 1.0)
	set gg_snd_LongZhu_u = CreateSound("war3mapImported\\LongZhu!.wav", false, false, false, 10, 10, "DefaultEAXON")
	call SetSoundDuration(gg_snd_LongZhu_u, 4276)
	call SetSoundChannel(gg_snd_LongZhu_u, 0)
	call SetSoundVolume(gg_snd_LongZhu_u, 100)
	call SetSoundPitch(gg_snd_LongZhu_u, 1.0)
	set gg_snd_WoKaoJuQingSha = CreateSound("war3mapImported\\WoKaoJuQingSha.wav", false, false, false, 10, 10, "")
	call SetSoundDuration(gg_snd_WoKaoJuQingSha, 2086)
	call SetSoundChannel(gg_snd_WoKaoJuQingSha, 0)
	call SetSoundVolume(gg_snd_WoKaoJuQingSha, 127)
	call SetSoundPitch(gg_snd_WoKaoJuQingSha, 1.0)
	set gg_snd_Ai_o_u = CreateSound("war3mapImported\\Ai~o~.wav", false, false, false, 10, 10, "DefaultEAXON")
	call SetSoundDuration(gg_snd_Ai_o_u, 2090)
	call SetSoundChannel(gg_snd_Ai_o_u, 0)
	call SetSoundVolume(gg_snd_Ai_o_u, 127)
	call SetSoundPitch(gg_snd_Ai_o_u, 1.0)
	set gg_snd_LZGL = CreateSound("war3mapImported\\LZGL.wav", false, false, false, 10, 10, "")
	call SetSoundDuration(gg_snd_LZGL, 2541)
	call SetSoundChannel(gg_snd_LZGL, 0)
	call SetSoundVolume(gg_snd_LZGL, 127)
	call SetSoundPitch(gg_snd_LZGL, 1.0)
	set gg_snd_PursuitTheme = "Sound\\Music\\mp3Music\\PursuitTheme.mp3"
	set gg_snd_LJDTtth = CreateSound("war3mapImported\\LJDTtth.wav", false, false, false, 10, 10, "")
	call SetSoundDuration(gg_snd_LJDTtth, 1736)
	call SetSoundChannel(gg_snd_LJDTtth, 0)
	call SetSoundVolume(gg_snd_LJDTtth, 127)
	call SetSoundPitch(gg_snd_LJDTtth, 1.0)
	set gg_snd_MaLiuDXiu = CreateSound("war3mapImported\\MaLiuDXiu.wav", false, false, false, 10, 10, "")
	call SetSoundDuration(gg_snd_MaLiuDXiu, 1325)
	call SetSoundChannel(gg_snd_MaLiuDXiu, 0)
	call SetSoundVolume(gg_snd_MaLiuDXiu, 127)
	call SetSoundPitch(gg_snd_MaLiuDXiu, 1.0)
endfunction
//***************************************************************************
//*
//*  Items
//*
//***************************************************************************
function CreateAllItems takes nothing returns nothing
	local integer itemID
	//
	return
	call EXCreateItem('tcas', - 25046.8, - 24059.8)
	call EXCreateItem('IP01', - 25046.8, - 24059.8)
	call EXCreateItem('IP05', - 177.1, - 2007.2)
	call EXCreateItem('IP09', - 25302.5, - 25075.7)
	call EXCreateItem('IP01', - 25045.5, - 24233.3)
	call EXCreateItem('IP02', - 24946.6, - 24950.2)
	call EXCreateItem('cnob', - 24548.7, - 24271.0)
	call EXCreateItem('cnob', - 24681.3, - 24124.8)
	call EXCreateItem('cnob', - 24855.9, - 24284.7)
	call EXCreateItem('cnob', - 24801.0, - 24297.8)
	call EXCreateItem('tkno', 332.8, - 2236.8)
	call EXCreateItem('tkno', 393.0, - 2354.3)
	call EXCreateItem('tkno', 396.8, - 2421.0)
	call EXCreateItem('tkno', 447.0, - 2432.0)
	call EXCreateItem('tkno', 367.5, - 2323.8)
	call EXCreateItem('tkno', 279.0, - 2319.5)
	call EXCreateItem('tkno', 317.1, - 2289.7)
	call EXCreateItem('tkno', 255.9, - 2549.3)
	call EXCreateItem('tkno', 168.7, - 2494.4)
	call EXCreateItem('tkno', 487.3, - 2643.3)
	call EXCreateItem('tkno', 414.4, - 2632.9)
	call EXCreateItem('tkno', 277.3, - 2460.6)
	call EXCreateItem('tkno', 374.3, - 2269.2)
	call EXCreateItem('tkno', 431.5, - 2359.3)
	call EXCreateItem('tkno', 348.2, - 2364.0)
	call EXCreateItem('tkno', - 24826.3, - 24444.4)
	call EXCreateItem('tkno', - 24800.2, - 24529.6)
	call EXCreateItem('tkno', - 24744.3, - 24649.9)
	call EXCreateItem('tkno', - 24711.4, - 24715.9)
	call EXCreateItem('tkno', - 24666.6, - 24768.7)
	call EXCreateItem('tkno', - 24639.7, - 24801.3)
	call EXCreateItem('tkno', - 24586.5, - 24791.5)
	call EXCreateItem('tkno', - 24558.0, - 24732.3)
	call EXCreateItem('tkno', - 24573.5, - 24656.1)
	call EXCreateItem('tkno', - 24618.0, - 24609.9)
	call EXCreateItem('tkno', - 24676.9, - 24543.3)
	call EXCreateItem('tkno', - 24743.3, - 24480.6)
	call EXCreateItem('tkno', - 24775.2, - 24438.9)
	call EXCreateItem('tkno', - 24687.9, - 24587.0)
	call EXCreateItem('tkno', - 24670.6, - 24618.0)
	call EXCreateItem('tkno', - 24649.7, - 24665.5)
	call EXCreateItem('tkno', 323.8, - 2399.6)
	call EXCreateItem('tkno', - 24627.6, - 24720.4)
	call EXCreateItem('tkno', 352.5, - 2455.5)
endfunction
//***************************************************************************
//*
//*  Unit Creation
//*
//***************************************************************************//===========================================================================
function CreateBuildingsForPlayer0 takes nothing returns nothing
	local player p = Player(0)
	local unit u
	local integer unitID
	local trigger t
	local real life
	set u = CreateUnit(p, 'ndfl', - 24704.0, - 19264.0, 270.000)
endfunction
//===========================================================================
function CreateUnitsForPlayer0 takes nothing returns nothing
	local player p = Player(0)
	local unit u
	local integer unitID
	local trigger t
	local real life
	set u = CreateUnit(p, 'nvdg', - 17014.4, - 17618.1, 171.623)
endfunction
//===========================================================================
function CreateUnitsForPlayer8 takes nothing returns nothing
	local player p = Player(8)
	local unit u
	local integer unitID
	local trigger t
	local real life
	set u = CreateUnit(p, 'nmed', - 8199.6, - 9148.2, 187.880)
endfunction
//===========================================================================
function CreateUnitsForPlayer10 takes nothing returns nothing
	local player p = Player(10)
	local unit u
	local integer unitID
	local trigger t
	local real life
	set u = CreateUnit(p, 'uskw', - 18254.5, - 26769.6, 87.564)
	set u = CreateUnit(p, 'nvde', - 13747.5, - 18059.0, 290.147)
	call SetUnitState(u, UNIT_STATE_MANA, 0)
	set u = CreateUnit(p, 'nvdg', - 14126.1, - 17415.0, 236.026)
	call SetUnitState(u, UNIT_STATE_MANA, 0)
	set u = CreateUnit(p, 'nvdg', - 14639.9, - 17611.8, 153.857)
	call SetUnitState(u, UNIT_STATE_MANA, 0)
	set u = CreateUnit(p, 'npfl', - 11869.7, - 15096.0, 203.572)
	set u = CreateUnit(p, 'npfl', - 11379.3, - 15523.9, 212.427)
	set u = CreateUnit(p, 'nvdl', - 11651.4, - 14759.9, 121.260)
	set u = CreateUnit(p, 'nvdl', - 11355.8, - 14976.9, 160.636)
	set u = CreateUnit(p, 'nvdl', - 10492.3, - 14954.5, 261.966)
	set u = CreateUnit(p, 'nvdw', - 10890.9, - 14668.3, 63.756)
	call SetUnitState(u, UNIT_STATE_MANA, 0)
	set u = CreateUnit(p, 'uabo', - 8889.3, - 12436.4, 243.486)
	set u = CreateUnit(p, 'uabo', - 9007.4, - 12809.5, 317.723)
	set u = CreateUnit(p, 'ugho', - 9462.7, - 12408.3, 167.832)
	set u = CreateUnit(p, 'ugho', - 9692.7, - 12727.0, 338.851)
	set u = CreateUnit(p, 'ugho', - 9777.7, - 13229.9, 44.946)
	set u = CreateUnit(p, 'uabo', - 9726.9, - 17207.1, 17.689)
	set u = CreateUnit(p, 'uabo', - 10156.0, - 17776.9, 17.282)
	set u = CreateUnit(p, 'nvde', - 9857.6, - 17594.6, 317.756)
	call SetUnitState(u, UNIT_STATE_MANA, 0)
	set u = CreateUnit(p, 'nvdg', - 13523.6, - 17604.4, 40.991)
	call SetUnitState(u, UNIT_STATE_MANA, 0)
	set u = CreateUnit(p, 'nvdl', - 13829.1, - 14859.9, 106.329)
	set u = CreateUnit(p, 'nvdl', - 13472.8, - 14795.4, 261.944)
	set u = CreateUnit(p, 'nvdw', - 13927.4, - 15368.0, 63.283)
	call SetUnitState(u, UNIT_STATE_MANA, 0)
	set u = CreateUnit(p, 'uskw', - 17301.5, - 27300.7, 165.031)
	set u = CreateUnit(p, 'uslm', - 16917.9, - 26850.9, 302.155)
	set u = CreateUnit(p, 'uslm', - 16953.9, - 27257.5, 182.390)
	set u = CreateUnit(p, 'slAc', - 16642.4, - 27019.8, 75.489)
	set u = CreateUnit(p, 'uskw', - 18461.0, - 26720.3, 9.163)
	set u = CreateUnit(p, 'ugho', - 16484.2, - 25536.6, 80.367)
	set u = CreateUnit(p, 'ugho', - 16242.9, - 25587.4, 211.032)
	set u = CreateUnit(p, 'ugho', - 17121.3, - 25837.3, 192.530)
	set u = CreateUnit(p, 'ugho', - 17836.8, - 26125.4, 12.085)
	set u = CreateUnit(p, 'ugho', - 15865.4, - 26692.8, 60.734)
	set u = CreateUnit(p, 'ugho', - 15837.1, - 26931.1, 122.260)
	set u = CreateUnit(p, 'ugho', - 15368.6, - 26602.6, 62.239)
	set u = CreateUnit(p, 'uslm', - 15527.3, - 26562.7, 260.065)
	set u = CreateUnit(p, 'uslm', - 15582.4, - 26785.6, 163.932)
	set u = CreateUnit(p, 'slAc', - 15387.1, - 26871.3, 190.860)
	set u = CreateUnit(p, 'slAc', - 15345.3, - 26460.0, 343.828)
	set u = CreateUnit(p, 'slAc', - 16313.3, - 26746.9, 357.154)
	set u = CreateUnit(p, 'slAc', - 17536.7, - 25820.9, 166.415)
	set u = CreateUnit(p, 'uskw', - 17395.6, - 26163.6, 182.258)
	set u = CreateUnit(p, 'uskw', - 16908.8, - 25895.4, 212.823)
	set u = CreateUnit(p, 'nvdg', - 16767.3, - 16524.1, 103.769)
	call SetUnitState(u, UNIT_STATE_MANA, 0)
	set u = CreateUnit(p, 'nvdg', - 16202.2, - 15650.2, 122.227)
	call SetUnitState(u, UNIT_STATE_MANA, 0)
	set u = CreateUnit(p, 'nvdl', - 16947.7, - 18689.2, 152.308)
	set u = CreateUnit(p, 'nvdl', - 16728.1, - 18698.7, 118.964)
	set u = CreateUnit(p, 'nvdl', - 16713.7, - 18989.1, 168.942)
	set u = CreateUnit(p, 'nvdl', - 16832.2, - 19354.9, 34.201)
endfunction
//===========================================================================
function CreateNeutralHostileBuildings takes nothing returns nothing
	local player p = Player(PLAYER_NEUTRAL_AGGRESSIVE)
	local unit u
	local integer unitID
	local trigger t
	local real life
	set u = CreateUnit(p, 'nnsg', - 16960.0, - 23424.0, 270.000)
	set u = CreateUnit(p, 'nnfm', - 16480.0, - 22944.0, 270.000)
	set u = CreateUnit(p, 'nnfm', - 17632.0, - 23072.0, 270.000)
	set u = CreateUnit(p, 'nnfm', - 17184.0, - 24096.0, 270.000)
endfunction
//===========================================================================
function CreateNeutralHostile takes nothing returns nothing
	local player p = Player(PLAYER_NEUTRAL_AGGRESSIVE)
	local unit u
	local integer unitID
	local trigger t
	local real life
	set u = CreateUnit(p, 'nmsn', - 24827.7, - 19072.1, 280.582)
	set u = CreateUnit(p, 'nmtw', - 23281.0, - 21093.4, 272.766)
	set u = CreateUnit(p, 'nmrv', - 24671.6, - 19597.2, 287.600)
	set u = CreateUnit(p, 'nmsn', - 24424.0, - 19241.5, 280.313)
	set u = CreateUnit(p, 'nmsn', - 25227.2, - 19630.9, 256.967)
	set u = CreateUnit(p, 'nmsn', - 24252.4, - 18896.9, 6.240)
	set u = CreateUnit(p, 'nmbg', - 24337.8, - 19106.3, 280.812)
	set u = CreateUnit(p, 'nmbg', - 25012.2, - 19286.9, 306.513)
	set u = CreateUnit(p, 'nmtw', - 22803.2, - 21141.7, 213.680)
	set u = CreateUnit(p, 'nmsn', - 23099.5, - 20825.9, 200.781)
	set u = CreateUnit(p, 'nmbg', - 22928.2, - 20928.8, 227.204)
	set u = CreateUnit(p, 'nmbg', - 25695.7, - 21170.7, 299.970)
	set u = CreateUnit(p, 'nmsn', - 25935.1, - 21073.8, 290.950)
	set u = CreateUnit(p, 'nnmg', - 17137.8, - 23009.4, 315.869)
	set u = CreateUnit(p, 'nnmg', - 17466.7, - 23428.0, 322.395)
	set u = CreateUnit(p, 'nnmg', - 16688.0, - 23275.1, 288.828)
	set u = CreateUnit(p, 'nmcf', - 25099.2, - 21480.8, 315.188)
	set u = CreateUnit(p, 'nmcf', - 23593.8, - 21068.5, 254.713)
	set u = CreateUnit(p, 'nmcf', - 23354.6, - 21403.2, 251.462)
	set u = CreateUnit(p, 'nmcf', - 25243.2, - 21764.7, 302.427)
	set u = CreateUnit(p, 'nmcf', - 23038.7, - 21447.3, 256.580)
	set u = CreateUnit(p, 'nmcf', - 24939.7, - 21262.0, 310.274)
	set u = CreateUnit(p, 'ntrt', - 20923.4, - 25682.0, 171.923)
	set u = CreateUnit(p, 'nmsc', - 18696.3, - 19446.5, 185.353)
	call SetUnitState(u, UNIT_STATE_MANA, 0)
	set u = CreateUnit(p, 'nvde', - 12364.6, - 12768.4, 35.380)
	set u = CreateUnit(p, 'nvde', - 12800.7, - 12253.1, 148.551)
	call SetUnitState(u, UNIT_STATE_MANA, 0)
	set u = CreateUnit(p, 'nvdw', - 12555.2, - 11962.1, 33.070)
	call SetUnitState(u, UNIT_STATE_MANA, 0)
	set u = CreateUnit(p, 'nfov', - 12375.9, - 11880.3, 24.621)
	call SetUnitState(u, UNIT_STATE_MANA, 0)
	set u = CreateUnit(p, 'nmsn', - 19056.0, - 19564.3, 132.532)
	call SetUnitState(u, UNIT_STATE_MANA, 0)
	set u = CreateUnit(p, 'nmsn', - 18956.5, - 19185.7, 328.776)
	call SetUnitState(u, UNIT_STATE_MANA, 0)
	set u = CreateUnit(p, 'ntrs', - 20751.6, - 25514.6, 183.652)
	set u = CreateUnit(p, 'nmyr', - 16781.6, - 24061.9, 299.540)
	set u = CreateUnit(p, 'nmsn', - 25473.9, - 20981.6, 293.383)
	set u = CreateUnit(p, 'nmtw', - 25560.5, - 21398.7, 281.602)
	set u = CreateUnit(p, 'nmtw', - 25372.2, - 21201.0, 236.224)
	set u = CreateUnit(p, 'nmtw', - 25890.8, - 21427.5, 195.310)
	set u = CreateUnit(p, 'ntrs', - 20719.3, - 25826.0, 161.646)
	set u = CreateUnit(p, 'nsoc', - 18564.4, - 24896.6, 351.590)
	call SetUnitState(u, UNIT_STATE_MANA, 0)
	set u = CreateUnit(p, 'ngrk', - 21518.9, - 27026.3, 37.410)
	set u = CreateUnit(p, 'ngrk', - 21258.8, - 27070.1, 108.658)
	set u = CreateUnit(p, 'ngst', - 21442.4, - 27246.6, 87.688)
	set u = CreateUnit(p, 'nsbs', - 17217.3, - 23884.2, 307.357)
	set u = CreateUnit(p, 'nsbs', - 16587.0, - 23612.2, 278.701)
endfunction
//===========================================================================
function CreateNeutralPassiveBuildings takes nothing returns nothing
	local player p = Player(PLAYER_NEUTRAL_PASSIVE)
	local unit u
	local integer unitID
	local trigger t
	local real life
	set u = CreateUnit(p, 'nmg0', - 23392.0, - 20704.0, 270.000)
	set u = CreateUnit(p, 'nmg1', - 22752.0, - 20832.0, 270.000)
	set u = CreateUnit(p, 'nmg0', - 25632.0, - 20000.0, 270.000)
	set u = CreateUnit(p, 'nmg1', - 23712.0, - 18848.0, 270.000)
	set u = CreateUnit(p, 'nmg1', - 25696.0, - 20960.0, 270.000)
	set u = CreateUnit(p, 'nmg0', - 24288.0, - 20576.0, 270.000)
	set u = CreateUnit(p, 'osld', - 15680.0, - 27968.0, 270.000)
	set u = CreateUnit(p, 'eaoe', - 27200.0, - 17856.0, 270.000)
	set u = CreateUnit(p, 'nmg1', - 19744.0, - 19744.0, 270.000)
	set u = CreateUnit(p, 'nmg0', - 20384.0, - 18912.0, 270.000)
endfunction
//===========================================================================
function CreateNeutralPassive takes nothing returns nothing
	local player p = Player(PLAYER_NEUTRAL_PASSIVE)
	local unit u
	local integer unitID
	local trigger t
	local real life
	set u = CreateUnit(p, 'ospw', - 15905.3, - 27875.1, 178.289)
	set u = CreateUnit(p, 'hbew', - 16056.8, - 28023.8, 357.160)
endfunction
//===========================================================================
function CreatePlayerBuildings takes nothing returns nothing
	call CreateBuildingsForPlayer0()
endfunction
//===========================================================================
function CreatePlayerUnits takes nothing returns nothing
	call CreateUnitsForPlayer0()
	call CreateUnitsForPlayer8()
	call CreateUnitsForPlayer10()
endfunction
//===========================================================================
function CreateAllUnits takes nothing returns nothing
	call CreateNeutralHostileBuildings()
	call CreateNeutralPassiveBuildings()
	call CreatePlayerBuildings()
	call CreateNeutralHostile()
	call CreateNeutralPassive()
	call CreatePlayerUnits()
endfunction


//***************************************************************************
//*
//*  Quest
//*
//***************************************************************************

function CreateAllQuest takes nothing returns nothing
	local string qusetTitle
	local string qusetDescription
	local string questIconPath
	//主线
	set qusetTitle = "探索岛屿"
	set qusetDescription = "探索岛屿并找到9D。"
	set questIconPath = "ReplaceableTextures\\CommandButtons\\BTNCoralBed.blp"
	set MainQuest[1] = CreateQuestBJ(true, true, qusetTitle, qusetDescription, questIconPath)

	set qusetTitle = "鱼人营地"
	set qusetDescription = "附近有个鱼人营地，摧毁它，否则会一直受到骚扰。"
	set questIconPath = "ReplaceableTextures\\CommandButtons\\BTNMurgulTideWarrior.blp"
	set MainQuest[2] = CreateQuestBJ(true, true, qusetTitle, qusetDescription, questIconPath)

	//支线
	set qusetTitle = "被污染的生命之泉"
	set qusetDescription = "在营地上方发现了被污染了的生命之泉，想办法净化它，这样就有了稳定的补给来源。"
	set questIconPath = "ReplaceableTextures\\CommandButtons\\BTNFountainOfLifeDefiled.blp"
	set SideQuest[1] = CreateQuestBJ(false, false, qusetTitle, qusetDescription, questIconPath)

	set qusetTitle = "落难的蟹皇"
	set qusetDescription = "海滩附近发现蟹皇，现在他奄奄一息。"
	set questIconPath = "ReplaceableTextures\\CommandButtons\\BTNSpiderCrab.blp"
	set SideQuest[2] = CreateQuestBJ(false, false, qusetTitle, qusetDescription, questIconPath)

endfunction




//***************************************************************************
//*
//*  Regions
//*
//***************************************************************************
function CreateRegions takes nothing returns nothing
	local weathereffect we
	set gg_rct_TriggerTiny = Rect(- 13248.0, - 14208.0, - 12896.0, - 13920.0)
	set gg_rct_1_0_Movie_OgreMagi1 = Rect(- 24896.0, - 24512.0, - 24800.0, - 24416.0)
	set gg_rct_1_0_Movie_InitSt = Rect(- 24544.0, - 25248.0, - 24384.0, - 25088.0)
	set gg_rct_1_0_Movie_Portal1 = Rect(- 24896.0, - 25536.0, - 24768.0, - 25408.0)
	set gg_rct_1_0_Movie_Portal2 = Rect(- 25344.0, - 25184.0, - 25216.0, - 25056.0)
	set gg_rct_1_0_Movie_OgreMagi2 = Rect(- 24512.0, - 24384.0, - 24416.0, - 24288.0)
	set gg_rct_1_0_Movie_TrollWarlord1 = Rect(- 24864.0, - 25216.0, - 24768.0, - 25120.0)
	set gg_rct_1_0_Movie_LCQY1 = Rect(- 25152.0, - 25024.0, - 25056.0, - 24928.0)
	set gg_rct_1_0_Movie_PAL1 = Rect(- 24640.0, - 24800.0, - 24544.0, - 24704.0)
	set gg_rct_1_0_Movie_Portal3 = Rect(- 25472.0, - 24512.0, - 25376.0, - 24416.0)
	set gg_rct_1_0_Movie_Portal4 = Rect(- 23968.0, - 24992.0, - 23872.0, - 24896.0)
	set gg_rct_1_0_Movie_Portal5 = Rect(- 24288.0, - 25600.0, - 24192.0, - 25504.0)
	set gg_rct_1_0_Movie_Portal6 = Rect(- 25472.0, - 26048.0, - 25376.0, - 25952.0)
	set gg_rct_1_0_Movie_Init = Rect(- 22752.0, - 25472.0, - 22560.0, - 25344.0)
	set gg_rct_1_0_Movie_injoker1 = Rect(- 22720.0, - 25952.0, - 22592.0, - 25824.0)
	set gg_rct_1_0_Movie_injoker2 = Rect(- 23488.0, - 25216.0, - 23360.0, - 25088.0)
	set gg_rct_SB = Rect(- 16640.0, - 27584.0, - 16128.0, - 27392.0)
endfunction
//***************************************************************************
//*
//*  Cameras
//*
//***************************************************************************
function CreateCameras takes nothing returns nothing
	set gg_cam_OrgeInitialPoint = CreateCameraSetup()
	call CameraSetupSetField(gg_cam_OrgeInitialPoint, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
	call CameraSetupSetField(gg_cam_OrgeInitialPoint, CAMERA_FIELD_ROTATION, 89.1, 0.0)
	call CameraSetupSetField(gg_cam_OrgeInitialPoint, CAMERA_FIELD_ANGLE_OF_ATTACK, 309.0, 0.0)
	call CameraSetupSetField(gg_cam_OrgeInitialPoint, CAMERA_FIELD_TARGET_DISTANCE, 1650.0, 0.0)
	call CameraSetupSetField(gg_cam_OrgeInitialPoint, CAMERA_FIELD_ROLL, 0.0, 0.0)
	call CameraSetupSetField(gg_cam_OrgeInitialPoint, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
	call CameraSetupSetField(gg_cam_OrgeInitialPoint, CAMERA_FIELD_FARZ, 5000.0, 0.0)
	call CameraSetupSetDestPosition(gg_cam_OrgeInitialPoint, - 24726.6, - 25375.9, 0.0)
endfunction
//***************************************************************************
//*
//*  Custom Script Code
//*
//***************************************************************************
//TESH.scrollpos=0
//TESH.alwaysfold=0










//吸血
function GetUnitLifestealValue takes unit stealUnit returns real
	if EffectIsEnabled[2] then
		if GetUnitAbilityLevel(stealUnit, 'Acs0') == 1 then
			return 0.10
		endif
	endif
	return 0.
endfunction

function SetUnitLifesteal takes nothing returns nothing
	local real value
	set value = GetUnitLifestealValue(Tmp_DamageSource)
	if value == 0. then
		return
	endif
	if not IsUnitIllusion(Tmp_DamageSource) and not IsUnitIllusion(Tmp_DamageInjured) then
		call UnitRestoreLife(Tmp_DamageSource, Tmp_DamageValue * value)
	endif
	call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Undead\\VampiricAura\\VampiricAuraTarget.mdl", Tmp_DamageSource, "origin"))
endfunction

//使得单位本次攻击 暴击
function SetUnitCriticalStrike takes real c, boolean isAttackTarget returns nothing
	set Tmp_DamageValue = Tmp_DamageValue + Tmp_DamageValue * c //设置这个全局值为暴击后的伤害
	call EXSetEventDamage(Tmp_DamageValue) //设置伤害值
	if isAttackTarget then
		call CriticalStrikeTextTag(Tmp_DamageSource , Tmp_DamageValue)
	endif
endfunction

//任意单位受伤动作
function TraversalDamagedEvent takes integer id returns nothing
	local integer i = id * 200
	loop //遍历其他攻击特效
		exitwhen i >= DamageEventNumber[id]
		if DamageEventQueue[i] != null and IsTriggerEnabled(DamageEventQueue[i]) then
			call TriggerEvaluate(DamageEventQueue[i])
		endif
		set i = i + 1  
	endloop
endfunction

//
function DamageReduction takes nothing returns nothing
	local integer level
	if EffectIsEnabled[3] then
		set level = GetUnitAbilityLevel(Tmp_DamageInjured, 'Acs3')
		if level > 0 then
			if IsPointBlighted(GetUnitX(Tmp_DamageInjured), GetUnitY(Tmp_DamageInjured)) then
				//call Debug("log", "减少"+R2S( Tmp_DamageValue * 0.05 * level))
				set Tmp_DamageValue = Tmp_DamageValue - Tmp_DamageValue * 0.05 * level
				call EXSetEventDamage(Tmp_DamageValue) //设置伤害值
			endif
		endif
	endif
endfunction

function YDWEAnyUnitDamagedTriggerAction takes nothing returns boolean
	local integer i
	local real c
	local boolean isAttackTarget
	set Tmp_DamageValue = GetEventDamage()	//伤害值
	if Tmp_DamageValue > 0 then
		set Tmp_DamageSource = GetEventDamageSource()	//伤害来源
		set Tmp_DamageInjured = GetTriggerUnit()	//受伤单位
		set i = GetHandleId(Tmp_DamageSource)
		//伤害减免
		call DamageReduction()
		if EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_ATTACK) != 0 then //如果是物理伤害则运行此部分
			//伤害减免后运行暴击
			set isAttackTarget = LoadUnitHandle(UnitKeyBuff, i, AttackTarget) == Tmp_DamageInjured
			set c = LoadReal(UnitKeyBuff, i, CriticalStrikeDamage)
			if c != .0 then
				call SetUnitCriticalStrike(c, isAttackTarget)//先一步把暴击运行了 因为这会改变伤害值
			endif
			//这里是判断一下该单位是否是普通攻击的目标(排除溅射伤害)
			if isAttackTarget then
				if CommonAttackEffectFilter(Tmp_DamageSource, Tmp_DamageInjured) then
					call TraversalDamagedEvent(1)
					call SetUnitLifesteal()
				endif
			endif
		endif
	endif
	return false
endfunction


function RestoreAura_Filter takes nothing returns boolean
	return IsMechanical_Ally_Alive_NoStructure(GetFilterUnit())
endfunction



function levelup_actions takes nothing returns boolean //英雄升级事件
	local unit u = GetTriggerUnit()
	call RefreshUnitState(u) //刷新单位状态
	call RefreshAbilityCost(u) //刷新某些单位技能的魔法消耗
	set u = null
	return false
endfunction

function CreateLevelUpEvent takes nothing returns nothing
	set LevelUpTrigger = CreateTrigger()
	call TriggerAddCondition(LevelUpTrigger, Condition( function levelup_actions ))
endfunction





function damageevent_EnchantEquipment takes nothing returns nothing
	local integer addedDamage
	local integer buffLevel
	if true then//GetUnitBuff(Tmp_DamageSource, 'Blc2') != 0 then
		set buffLevel = 0//GetUnitBuffLevel(Tmp_DamageSource, 'Blc2') 
		set addedDamage = buffLevel * 5 + 20
		call CommonTextTag("+" + I2S(addedDamage), 5, Tmp_DamageSource, .024, 100, 200, 255, 255, 64)
		call DamageUnit(Tmp_DamageSource, Tmp_DamageInjured, 1, addedDamage)
	endif
endfunction

//注册零重2技能的伤害触发
function EnchantEquipment_Learn1 takes nothing returns nothing
	local trigger t = CreateTrigger()
	call TriggerAddCondition(t, Condition( function damageevent_EnchantEquipment))
	call TriggerRegisterAnyUnitDamagedEvent(t, 1) //

	set t = null
endfunction

function CriticalStrikeAura_Learn1 takes nothing returns nothing
	call EnabledAttackEffect(1, 0.) //永久激活
endfunction



//防御光环选取条件
function defense_aura_filter takes nothing returns boolean
	//call Debug("log", "filter" + GetUnitName(GetFilterUnit()))
	return Ally_Alive_NoStructure(GetFilterUnit())
endfunction


//光环类型
//共存模式 取最高值
function defense_aura_actions takes nothing returns boolean
	local trigger t = GetTriggeringTrigger()
	local integer h = GetHandleId(t)
	local integer firstUnitH
	local unit sourceUnit = LoadUnitHandle(HT, h, 200)
	local real value = LoadReal(HT, h, 200)
	local real maxValue = 0.
	local integer iBuff
	local integer buffCount
	local unit firstUnit = null
	local group g1 = null
	local group g2 = null
	local group g3 = LoadGroupHandle(HT, h, 201)
	local integer buffId = LoadInteger(HT, h, 202)
	local integer level = GetUnitAbilityLevel(sourceUnit, LoadInteger(HT, h, 203))
	if not UnitAlive(sourceUnit) then
		call Debug("log", "ClearTrigger")
		call FlushChildHashtable(HT, h)
		call ClearTrigger(t)
		loop
			set firstUnit = FirstOfGroup(g3)
			exitwhen firstUnit == null
			call GroupRemoveUnit(g3, firstUnit)
			call UnitReduceArmorBonus(firstUnit, value)
		endloop
		call LogoutGroup(g3)
	else
		set g1 = LoginGroup()
		set P2 = GetOwningPlayer(sourceUnit) //Real 201为光环范围
		call GroupEnumUnitsInRange(g1, GetUnitX(sourceUnit), GetUnitY(sourceUnit), LoadReal(HT, h, 201), LoadBooleanExprHandle(HT, h, 205))
		set g2 = LoginGroup()
		call GroupAddGroup(g3, g2)
		loop
			set firstUnit = FirstOfGroup(g2)
			exitwhen firstUnit == null
			if not IsUnitInGroup(firstUnit, g1) then
				set firstUnitH = GetHandleId(firstUnit)
				set iBuff = 0//GetUnitBuff(firstUnit, buffId)
				set maxValue = 0//GetBuffMaxData(iBuff, 1)
				//call UnitRemoveBuffByCount(firstUnit, buffId, LoadInteger(HT, h, firstUnitH))
				//删之前查buff 有没有次一级的buff
				if value == maxValue then
					set maxValue = 0//GetBuffMaxData(iBuff, 1)
					set value = value - maxValue
					call UnitReduceArmorBonus(firstUnit, value)
				endif
				call GroupRemoveUnit(g3, firstUnit)
			endif
			call GroupRemoveUnit(g2, firstUnit)
		endloop
		call LogoutGroup(g2)
		loop
			set firstUnit = FirstOfGroup(g1)
			exitwhen firstUnit == null
			if not IsUnitInGroup(firstUnit, g3) then
				//set BuffDataA = value
				set iBuff = 0//GetUnitBuff(firstUnit, buffId)
				set maxValue = 0//GetBuffMaxData(iBuff, 1)
				set buffCount = 0//EXUnitAddAbilityTimed(firstUnit, buffId, BuffAddType_Positive + BuffAddType_Aura, level)
				set firstUnitH = GetHandleId(firstUnit)
				if iBuff == 0 then
					set iBuff = 0//GetUnitBuff(firstUnit, buffId)
				endif
				call SaveInteger(HT, h, firstUnitH, buffCount)
				if value > maxValue then
					call UnitAddArmorBonus(firstUnit, value - maxValue)
				endif
			endif
			call GroupRemoveUnit(g1, firstUnit)
			call GroupAddUnit(g3, firstUnit)
		endloop
		call LogoutGroup(g1)
	endif
	set t = null
	set sourceUnit = null
	set firstUnit = null
	set g1 = null
	set g2 = null
	set g3 = null
	return false
endfunction

//防御光环
function DefenseAura takes unit whichUnit, real value, real range, integer abilityId, integer buffId, code filter returns nothing
	local trigger trig = CreateTrigger()
	local integer h = GetHandleId(trig)
	call TriggerRegisterTimerEvent(trig, AuraFrame, true)
	call TriggerAddCondition(trig, Condition(function defense_aura_actions))
	call SaveBooleanExprHandle(HT, h, 205, Condition(filter))
	call SaveReal(HT, h, 200, value)
	call SaveReal(HT, h, 201, range)
	call SaveInteger(HT, h, 202, buffId)
	call SaveInteger(HT, h, 203, abilityId)
	call SaveUnitHandle(HT, h, 200, whichUnit)
	call SaveGroupHandle(HT, h, 201, LoginGroup() )
	set trig = null
endfunction

//光环类型
//独立,暂时不考虑叠加,仅用作生命之泉的百分比回血
function restore_aura_actions takes nothing returns boolean
	local trigger t = GetTriggeringTrigger()
	local integer h = GetHandleId(t)
	local integer firstUnitH
	local unit sourceUnit = LoadUnitHandle(HT, h, 200)
	local real value = LoadReal(HT, h, 200)
	local real oldRestoreLife
	local real restoreLife
	local unit firstUnit = null
	local group g1 = null
	local group g2 = null
	local group g3 = LoadGroupHandle(HT, h, 201)
	local integer buffId = LoadInteger(HT, h, 202)
	if not UnitAlive(sourceUnit) then
		call Debug("log", "ClearTrigger")
		call FlushChildHashtable(HT, h)
		call ClearTrigger(t)
		call UnitRemoveAbility(sourceUnit, LoadInteger(HT, h, 203))
		loop
			set firstUnit = FirstOfGroup(g3)
			exitwhen firstUnit == null
			call GroupRemoveUnit(g3, firstUnit)
			call UnitRemoveAbility(firstUnit, buffId)
			call UnitReduceLifeRestore(firstUnit, value)
		endloop
		call LogoutGroup(g3)
	else
		set g1 = LoginGroup()
		set P2 = GetOwningPlayer(sourceUnit) //Real 201为光环范围
		call GroupEnumUnitsInRange(g1, GetUnitX(sourceUnit), GetUnitY(sourceUnit), LoadReal(HT, h, 201), LoadBooleanExprHandle(HT, h, 205))
		set g2 = LoginGroup()
		call GroupAddGroup(g3, g2)
		loop
			set firstUnit = FirstOfGroup(g2)
			exitwhen firstUnit == null
			if not IsUnitInGroup(firstUnit, g1) then
				set firstUnitH = GetHandleId(firstUnit)
				set oldRestoreLife = LoadReal(HT, h, firstUnitH)
				call UnitReduceLifeRestore(firstUnit, oldRestoreLife)
				call RemoveSavedReal(HT, h, firstUnitH)
				call UnitRemoveAbility(firstUnit, buffId)
				call GroupRemoveUnit(g3, firstUnit)
				//call Debug("log", "4减少" + R2S(oldRestoreLife))
			endif
			call GroupRemoveUnit(g2, firstUnit)
		endloop
		call LogoutGroup(g2)
		loop
			set firstUnit = FirstOfGroup(g1)
			exitwhen firstUnit == null
			set firstUnitH = GetHandleId(firstUnit)
			set restoreLife = GetUnitState(firstUnit, UNIT_STATE_MAX_LIFE) * value
			if IsUnitInGroup(firstUnit, g3) then
				set oldRestoreLife = LoadReal(HT, h, firstUnitH)
	
				if restoreLife > oldRestoreLife then
					call SaveReal(HT, h, firstUnitH, restoreLife)
					//call Debug("log", "2添加" + R2S(restoreLife - oldRestoreLife))
					set restoreLife = restoreLife - oldRestoreLife
					call UnitAddLifeRestore(firstUnit, restoreLife)
				elseif oldRestoreLife > restoreLife then
					call SaveReal(HT, h, firstUnitH, restoreLife)
					//call Debug("log", "3减少" + R2S(oldRestoreLife - restoreLife))
					set restoreLife = oldRestoreLife - restoreLife
					call UnitReduceLifeRestore(firstUnit, restoreLife)
				endif
			else
				call UnitAddLifeRestore(firstUnit, restoreLife)
				call SaveReal(HT, h, firstUnitH, restoreLife)
				//call Debug("log", "1添加" + R2S(restoreLife))
			endif
			call GroupRemoveUnit(g1, firstUnit)
			call GroupAddUnit(g3, firstUnit)
		endloop
		call LogoutGroup(g1)
	endif
	set t = null
	set sourceUnit = null
	set firstUnit = null
	set g1 = null
	set g2 = null
	set g3 = null
	return false
endfunction

//百分比 回复光环
function PercentRestoreAura takes unit whichUnit, real value, real range, integer abilityId, integer buffId, code filter returns nothing
	local integer h = CreateTimerEventTrigger(AuraFrame, true, function restore_aura_actions)
	call SaveBooleanExprHandle(HT, h, 205, Condition(filter))
	call SaveReal(HT, h, 200, value)
	call SaveReal(HT, h, 201, range)
	call SaveInteger(HT, h, 202, buffId)
	call SaveInteger(HT, h, 203, abilityId)
	call SaveUnitHandle(HT, h, 200, whichUnit)
	call SaveGroupHandle(HT, h, 201, LoginGroup() )
endfunction











//任意单位腐烂
function UnitDecayEvnetActions takes nothing returns boolean
	local unit decayUnit = GetDecayingUnit()


	set decayUnit = null
	return false
endfunction

function InitBoss takes nothing returns nothing
	local trigger trig = CreateTrigger()
	local integer iHandleId = GetHandleId(trig)
	local unit whichBoss
	
	//屠夫 9级
	set whichBoss = CreateUnit(Player(9), 'U001', - 13853.3, - 27003.7, 89.893)
	call SetHeroLevel(whichBoss, 9, false)
	call TriggerRegisterUnitInRange(trig, whichBoss, 600, null)
	call TriggerAddCondition(trig, Condition( function StartPedugAI))
	call SaveUnitHandle(HT, iHandleId, 0, whichBoss)

	//死灵法师 10级
	set whichBoss = CreateUnit(Player(9), 'U002', - 8341.3, - 18597.8, 165.143)
	call SetHeroLevel(whichBoss, 10, false)

	set whichBoss = null
	set trig = null
endfunction

//***************************************************************************
//*
//*  Main Initialization
//*
//***************************************************************************
//===========================================================================


//初始化单位属性
function InitUnitBonus takes unit whichUnit returns nothing
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
endfunction

function EnterMapFilter takes nothing returns boolean
	local unit u = GetFilterUnit()
	local integer typeId = GetUnitTypeId(u)
	if GetUnitAbilityLevel(GetFilterUnit(), 'Aloc') <= 0 then //受伤事件
		call TriggerRegisterUnitEvent(DamageEventTrigger, u, EVENT_UNIT_DAMAGED)
		call InitUnitBonus(u)
	endif
	if IsUnitType(u, UNIT_TYPE_HERO) then
		call QueuedUnitRestoreAdd(u)
		call RefreshUnitState(u)
		call TriggerRegisterUnitEvent(UnitSpellEffectTrigger, u, EVENT_UNIT_SPELL_EFFECT)//给单位注册发动技能事件
		call TriggerRegisterUnitEvent(AbilityEventTrigger, u, EVENT_UNIT_SPELL_CHANNEL)
		call TriggerRegisterUnitEvent(AbilityEventTrigger, u, EVENT_UNIT_HERO_SKILL)//学习技能事件
		call TriggerRegisterUnitEvent(LevelUpTrigger, u, EVENT_UNIT_HERO_LEVEL)//英雄升级事件
	endif
	if typeId == 'ndum' then
		call ShowUnit(u, false)
		call SetUnitPathing(u, false)
		call SetUnitInvulnerable(u, true)
		call UnitApplyTimedLife(u,'BTLF', 20.)
	elseif typeId == 'HI02' then
		call RefreshAbilityCost(u)
	elseif typeId == 'nfoh' then
		call PercentRestoreAura(u, 0.02, 650, 'Ab18', 'B018', function RestoreAura_Filter)
	endif
	set u = null
	return false
endfunction

function SetWorldRegion takes nothing returns nothing
	local rect world = GetWorldBounds()
	set WorldRegion = CreateRegion()
	call RegionAddRect(WorldRegion, world)
	call RemoveRect(world)
	set world = null
	set EnterMapTrigger = CreateTrigger()
	call TriggerRegisterEnterRegion(EnterMapTrigger, WorldRegion, Condition(function EnterMapFilter))
endfunction

function funcTestSpeed takes nothing returns nothing
	local integer i = 0
	loop
		exitwhen i == 1000
		call GetDetectedUnit()
		set i = i + 1
	endloop
endfunction

function TestEsc takes nothing returns boolean

	local integer i = 0
	local real time 

	call ClearTextMessages()

	if false then
		set time = S2R(EXExecuteScript( "os.clock()" ))
		loop
			exitwhen i == 100
			call ExecuteFunc("funcTestSpeed")
			set i = i + 1
		endloop

		//call ClearTextMessages()

		call DisplayTextToPlayer(GetLocalPlayer(),0,0, "运行时间" + R2S( S2R(EXExecuteScript( "os.clock()" )) - time  ) )
		call BJDebugMsg(R2S(GetUnitState(LocalPlayerSelectUnit, UNIT_STATE_RATE_OF_FIRE)))
	endif
	call SetUnitAnimation(GetDetectedUnit(), "spin")
	call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\BattleSpiral\\SpinFX3.mdx", GetDetectedUnit(), "origin"))

	//call GetLocalizedHotkey("yd_leak_monitor::create_report")
	//call EnableNewUnitStateUI(not NewUnitStateUIIsEnable)
	return false
endfunction



//! inject main

    //一些函数调用可能会在这里
	local trigger trig

	//lua入口
	call Cheat("exec-lua:lua.base")

	call SetCameraBounds(- 28416.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 28544.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 18176.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 18048.0 - GetCameraMargin(CAMERA_MARGIN_TOP), - 28416.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 18048.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 18176.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 28544.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
	// 光照
	call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
	call NewSoundEnvironment("Default")
	// 天明鸡叫
	call SetAmbientDaySound("SunkenRuinsDay")
	// 入夜狼嚎
	call SetAmbientNightSound("SunkenRuinsNight")
	// 强制时间为12点
	call SetFloatGameState(GAME_STATE_TIME_OF_DAY, 12)
	call SetMapMusic("Music", true, 0)

	call InitSounds()
	call CreateRegions()
	call CreateCameras()
	call CreateAllItems()


 

    //其他的调用可能会在这里

 

    //也许您想使用WorldEditor的该功能…

	
	//要在bj初始化前使用
	set DamageEventCondition = Condition(function YDWEAnyUnitDamagedTriggerAction)
	
	call InitBlizzard()



	if M_OnlinePlayerAmount == 1 then
		set PlayerMaxHeroAmount = 4
	elseif M_OnlinePlayerAmount == 2 then
		set PlayerMaxHeroAmount = 2
	endif

	//单机测试
	if bj_isSinglePlayer then
		call SetPlayerState(Player(0), PLAYER_STATE_RESOURCE_GOLD, 99999)
		//测试时Esc清屏
		set IsMirage = true
		call FogEnable(false)
		call FogMaskEnable(false)
		set trig = CreateTrigger()
		call TriggerRegisterPlayerEvent(trig, Player(0), EVENT_PLAYER_END_CINEMATIC)
		call TriggerAddCondition(trig, Condition( function TestEsc))
	endif


	//预先创建马甲单位,防止被设置生命周期
	set BonusDummy = CreateUnit(Player(bj_PLAYER_NEUTRAL_VICTIM), 'ndum', 0, 0, 0)
	//攻击
	call UnitAddAbility(BonusDummy, 'AIat')
	//防御
	call UnitAddAbility(BonusDummy, 'AId1')
	//攻速
	call UnitAddAbility(BonusDummy, 'AIsx')
	//移速
	call UnitAddAbility(BonusDummy, 'AIms')
	//三围
	call UnitAddAbility(BonusDummy, 'Aamk')
	//给马甲单位添加这些会被改变数据的技能

	//事先创建电影马甲单位
	call CreateMovieDummyUnit()

	//将vJass初始化放置在此处，注意，结构优先被初始化，然后是库初始化 
	//! dovjassinit

	//创建单位进入地图事件 早于任意单位受伤事件之前
	call SetWorldRegion() 
	//单位升级事件
	call CreateLevelUpEvent() 
	//任意单位受伤事件
	call YDWESyStemAnyUnitDamagedRegistTrigger()
	//创建单位
	call CreateAllUnits()
	//创建所有任务
	call CreateAllQuest()
	set IsInitUnit = false
	call InitBoss()








	//set trig = CreateTrigger() 
	//call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_DECAY)
	//call TriggerAddCondition(trig, Condition(function UnitDecayEvnetActions))



	//初始化UI
	call CreateTimerEventTrigger(.0, false, function InitUIFrame)
	//设置英雄变量

	//set trig = CreateTrigger()
	//call TriggerRegisterPlayerUnitEvent(trig, Player(0), EVENT_PLAYER_UNIT_SELECTED, null)
	//call TriggerAddAction(trig, function DebugBuffHanleId)

	set trig = CreateTrigger()
	call TriggerAddAction(trig, function Intro_Cinematic)
	//call TriggerExecute(trig)

	set trig = null

//! endinject

function main takes nothing returns nothing
endfunction

//***************************************************************************
//*
//*  Map Configuration
//*
//***************************************************************************

//***************************************************************************
//*
//*  Players
//*
//***************************************************************************
function InitCustomPlayerSlots takes nothing returns nothing
	local player whichPlayer
	local integer loop_index = 0
	loop
		set whichPlayer = Player(loop_index)
		call SetPlayerStartLocation(whichPlayer, loop_index)
		call ForcePlayerStartLocation(whichPlayer, loop_index)
		call SetPlayerColor(whichPlayer, ConvertPlayerColor(loop_index))
		call SetPlayerRacePreference(whichPlayer, RACE_PREF_ORC)
		call SetPlayerRaceSelectable(whichPlayer, false)
		call SetPlayerController(whichPlayer, MAP_CONTROL_USER)
		exitwhen loop_index == MaxUserAmount
		set loop_index = loop_index + 1
	endloop
	// Player 7
	call SetPlayerStartLocation(Player(6), 6)
	call ForcePlayerStartLocation(Player(6), 6)
	call SetPlayerColor(Player(6), ConvertPlayerColor(6))
	call SetPlayerRacePreference(Player(6), RACE_PREF_HUMAN)
	call SetPlayerRaceSelectable(Player(6), false)
	call SetPlayerController(Player(6), MAP_CONTROL_COMPUTER)
	// Player 7
	call SetPlayerStartLocation(Player(7), 7)
	call ForcePlayerStartLocation(Player(7), 7)
	call SetPlayerColor(Player(7), ConvertPlayerColor(7))
	call SetPlayerRacePreference(Player(7), RACE_PREF_HUMAN)
	call SetPlayerRaceSelectable(Player(7), false)
	call SetPlayerController(Player(7), MAP_CONTROL_COMPUTER)
	// Player 8
	call SetPlayerStartLocation(Player(8), 8)
	call SetPlayerColor(Player(8), ConvertPlayerColor(8))
	call SetPlayerRacePreference(Player(8), RACE_PREF_UNDEAD)
	call SetPlayerRaceSelectable(Player(8), false)
	call SetPlayerController(Player(8), MAP_CONTROL_COMPUTER)
	// Player 10
	call SetPlayerStartLocation(Player(10), 9)
	call ForcePlayerStartLocation(Player(10), 9)
	call SetPlayerColor(Player(10), ConvertPlayerColor(10))
	call SetPlayerRacePreference(Player(10), RACE_PREF_UNDEAD)
	call SetPlayerRaceSelectable(Player(10), false)
	call SetPlayerController(Player(10), MAP_CONTROL_COMPUTER)
endfunction
function InitCustomTeams takes nothing returns nothing
	local player whichPlayer
	local integer loopAIndex = 0
	local integer loopBIndex
	// Force: Gays
	// 这样写目的是为了减少代码量
	loop
		set whichPlayer = Player(loopAIndex)
		call SetPlayerTeam(whichPlayer, 0)
		call SetPlayerState(whichPlayer, PLAYER_STATE_ALLIED_VICTORY, 1)
		set loopBIndex = 0
		loop
			//   Allied
			call SetPlayerAllianceStateAllyBJ(whichPlayer, Player(loopBIndex), true)
			//   Shared Vision
			exitwhen loopBIndex == MaxUserAmount
			set loopBIndex = loopBIndex + 1
		endloop
		exitwhen loopAIndex == MaxUserAmount
		set loopAIndex = loopAIndex + 1
	endloop
	// Force: God Xi
	call SetPlayerTeam(Player(7), 1)
	call SetPlayerState(Player(7), PLAYER_STATE_ALLIED_VICTORY, 1)
	call SetPlayerTeam(Player(8), 1)
	call SetPlayerState(Player(8), PLAYER_STATE_ALLIED_VICTORY, 1)
	call SetPlayerTeam(Player(10), 1)
	call SetPlayerState(Player(10), PLAYER_STATE_ALLIED_VICTORY, 1)
	//   Allied
	call SetPlayerAllianceStateAllyBJ(Player(7), Player(8), true)
	call SetPlayerAllianceStateAllyBJ(Player(7), Player(10), true)
	call SetPlayerAllianceStateAllyBJ(Player(8), Player(7), true)
	call SetPlayerAllianceStateAllyBJ(Player(8), Player(10), true)
	call SetPlayerAllianceStateAllyBJ(Player(10), Player(7), true)
	call SetPlayerAllianceStateAllyBJ(Player(10), Player(8), true)
endfunction

function config takes nothing returns nothing
	local integer i = 0
	call SetMapName("基佬之岛v1.15")
	call SetMapDescription("不简易小地图，菊花系列第二部。")
	call SetPlayers(10)
	call SetTeams(2)
	call SetGamePlacement(MAP_PLACEMENT_FIXED)
	loop
		call DefineStartLocation(i, 0.0, 0.0)
		exitwhen i == 9
		set i = i + 1
	endloop
	// Player setup
	call InitCustomPlayerSlots()
	call InitCustomTeams()
	//不需要联盟优先权
	//call InitAllyPriorities()
endfunction




//Struct method generated initializers/callers:
