globals
//globals from InitSetUp:
constant boolean LIBRARY_InitSetUp=true
        //-----------------------------------------------------------------------
        // Constants
        //
        //新的变量
player LocalPlayer= null
real CorrectionMinX
real CorrectionMaxX
real CorrectionMinY
real CorrectionMaxY
        //prd算法的哈希表
hashtable Prd= InitHashtable()
        //常用哈希表
hashtable HT= InitHashtable()
        //类型转换需要用到的哈希表,可以在同继承关系下转换
hashtable TypeConversion= InitHashtable()
        //单位组线性表 实际上比直接Create和Destroy效率差了2.5倍左右
constant integer MaxGroupAmount= 200
integer OverflowValue= 0
integer GroupIdleValue= 0
group array MainGroup
boolean array GroupInUse
integer MaxGroupHandle= 0
        //定期清除Trigger
integer DestroyQueueNumber= 0
trigger array DestroyQueue
real array ElapsedTime
        //捕获物品死亡
trigger ItemDeathEventTrigger= CreateTrigger()
        //中心计时器，游戏运行时间
constant timer GameTimer= CreateTimer()
        //YDWE的伤害事件 1.33带排泄事件
trigger DamageEventTrigger= null
conditionfunc DamageEventCondition= null
constant integer DAMAGE_EVENT_SWAP_TIMEOUT= 600
constant boolean DAMAGE_EVENT_SWAP_ENABLE= true

//endglobals from InitSetUp
//globals from UITips:
constant boolean LIBRARY_UITips=true
integer TipsFrameMaxAmount= 0
integer array TipsBackDrop
integer array TipsText
integer array UberTipsText
//endglobals from UITips
//globals from YDTriggerSaveLoadSystem:
constant boolean LIBRARY_YDTriggerSaveLoadSystem=true
hashtable YDHT
hashtable YDLOC
//endglobals from YDTriggerSaveLoadSystem
//globals from YDWEBase:
constant boolean LIBRARY_YDWEBase=true
//ȫ�ֹ�ϣ�� 
string bj_AllString=".................................!.#$%&'()*+,-./0123456789:;<=>.@ABCDEFGHIJKLMNOPQRSTUVWXYZ[.]^_`abcdefghijklmnopqrstuvwxyz{|}~................................................................................................................................"
//全局系统变量
unit bj_lastAbilityCastingUnit=null
unit bj_lastAbilityTargetUnit=null
unit bj_lastPoolAbstractedUnit=null
unitpool bj_lastCreatedUnitPool=null
item bj_lastPoolAbstractedItem=null
itempool bj_lastCreatedItemPool=null
attacktype bj_lastSetAttackType= ATTACK_TYPE_NORMAL
damagetype bj_lastSetDamageType= DAMAGE_TYPE_NORMAL
weapontype bj_lastSetWeaponType= WEAPON_TYPE_WHOKNOWS
real yd_MapMaxX= 0
real yd_MapMinX= 0
real yd_MapMaxY= 0
real yd_MapMinY= 0
string array YDWEBase__yd_PlayerColor
trigger array YDWEBase__AbilityCastingOverEventQueue
integer array YDWEBase__AbilityCastingOverEventType
integer YDWEBase__AbilityCastingOverEventNumber= 0
//endglobals from YDWEBase
//globals from YDWEPlaySoundNull:
constant boolean LIBRARY_YDWEPlaySoundNull=true
//endglobals from YDWEPlaySoundNull
//globals from YDWEPolledWaitNull:
constant boolean LIBRARY_YDWEPolledWaitNull=true
//endglobals from YDWEPolledWaitNull
//globals from YDWESetUnitFacingToFaceLocTimedNull:
constant boolean LIBRARY_YDWESetUnitFacingToFaceLocTimedNull=true
//endglobals from YDWESetUnitFacingToFaceLocTimedNull
//globals from Common:
constant boolean LIBRARY_Common=true
        //JAPI常量 - 技能
constant integer ABILITY_STATE_COOLDOWN= 1
	
constant integer ABILITY_DATA_TARGS= 100
constant integer ABILITY_DATA_CAST= 101
constant integer ABILITY_DATA_DUR= 102
constant integer ABILITY_DATA_HERODUR= 103
constant integer ABILITY_DATA_COST= 104
constant integer ABILITY_DATA_COOL= 105
constant integer ABILITY_DATA_AREA= 106
constant integer ABILITY_DATA_RNG= 107
constant integer ABILITY_DATA_DATA_A= 108
constant integer ABILITY_DATA_DATA_B= 109
constant integer ABILITY_DATA_DATA_C= 110
constant integer ABILITY_DATA_DATA_D= 111
constant integer ABILITY_DATA_DATA_E= 112
constant integer ABILITY_DATA_DATA_F= 113
constant integer ABILITY_DATA_DATA_G= 114
constant integer ABILITY_DATA_DATA_H= 115
constant integer ABILITY_DATA_DATA_I= 116
constant integer ABILITY_DATA_UNITID= 117

constant integer ABILITY_DATA_HOTKET= 200
constant integer ABILITY_DATA_UNHOTKET= 201
constant integer ABILITY_DATA_RESEARCH_HOTKEY= 202
constant integer ABILITY_DATA_NAME= 203
constant integer ABILITY_DATA_ART= 204
constant integer ABILITY_DATA_TARGET_ART= 205
constant integer ABILITY_DATA_CASTER_ART= 206
constant integer ABILITY_DATA_EFFECT_ART= 207
constant integer ABILITY_DATA_AREAEFFECT_ART= 208
constant integer ABILITY_DATA_MISSILE_ART= 209
constant integer ABILITY_DATA_SPECIAL_ART= 210
constant integer ABILITY_DATA_LIGHTNING_EFFECT= 211
constant integer ABILITY_DATA_BUFF_TIP= 212
constant integer ABILITY_DATA_BUFF_UBERTIP= 213
constant integer ABILITY_DATA_RESEARCH_TIP= 214
constant integer ABILITY_DATA_TIP= 215
constant integer ABILITY_DATA_UNTIP= 216
constant integer ABILITY_DATA_RESEARCH_UBERTIP= 217
constant integer ABILITY_DATA_UBERTIP= 218
constant integer ABILITY_DATA_UNUBERTIP= 219
constant integer ABILITY_DATA_UNART= 220

        //JAPI常量 - UnitState 单位状态
        //攻击1 伤害骰子数量
constant unitstate UNIT_STATE_ATTACK1_DAMAGE_DICE= ConvertUnitState(0x10)
        //攻击1 伤害骰子面数
constant unitstate UNIT_STATE_ATTACK1_DAMAGE_SIDE= ConvertUnitState(0x11)
        //攻击1 基础伤害
constant unitstate UNIT_STATE_ATTACK1_DAMAGE_BASE= ConvertUnitState(0x12)
        //攻击1 全伤害范围
constant unitstate UNIT_STATE_ATTACK1_RANGE= ConvertUnitState(0x16)
        //装甲
constant unitstate UNIT_STATE_ARMOR= ConvertUnitState(0x20)
        //攻击1 攻击类型
constant unitstate UNIT_STATE_ATTACK1_ATTACK_TYPE= ConvertUnitState(0x23)
        //攻击1 攻击间隔
constant unitstate UNIT_STATE_ATTACK1_INTERVAL= ConvertUnitState(0x25)
        //攻击1 弹射弧度
constant unitstate UNIT_STATE_ATTACK1_BACK_SWING= ConvertUnitState(0x28)
        //攻击2 攻击类型
constant unitstate UNIT_STATE_ATTACK2_ATTACK_TYPE= ConvertUnitState(0x36)
        //攻击2 攻击间隔
constant unitstate UNIT_STATE_ATTACK2_INTERVAL= ConvertUnitState(0x38)
        //装甲类型
constant unitstate UNIT_STATE_ARMOR_TYPE= ConvertUnitState(0x50)
        //攻击速度 对两种攻击模式都有效
constant unitstate UNIT_STATE_RATE_OF_FIRE= ConvertUnitState(0x51)
        //攻击1 武器类型
constant unitstate UNIT_STATE_ATTACK1_WEAPON_TYPE= ConvertUnitState(0x58)
        //攻击2 武器类型
constant unitstate UNIT_STATE_ATTACK2_WEAPON_TYPE= ConvertUnitState(0x59)
	
        // 伤害事件
constant integer EVENT_DAMAGE_DATA_VAILD= 0
        //物理伤害
constant integer EVENT_DAMAGE_DATA_IS_PHYSICAL= 1
        //攻击伤害
constant integer EVENT_DAMAGE_DATA_IS_ATTACK= 2
        //远程伤害
constant integer EVENT_DAMAGE_DATA_IS_RANGED= 3
        //伤害类型
constant integer EVENT_DAMAGE_DATA_DAMAGE_TYPE= 4
        //武器类型
constant integer EVENT_DAMAGE_DATA_WEAPON_TYPE= 5
        //攻击类型
constant integer EVENT_DAMAGE_DATA_ATTACK_TYPE= 6
        // Last
trigger bj_lastCreatedTrigger= null
        //是否要DeBug
boolean IsMirage= false
        
        // 魔法
constant integer DAMAGE_TYPE_MAGICAL= 1
        // 物理
constant integer DAMAGE_TYPE_PHYSICAL= 2
        // 纯粹
constant integer DAMAGE_TYPE_PURE= 3
        
unit LastGetMasterUnit= null
unit LastSummonedUnit= null
constant integer KEY_MASTERUNIT=6
constant integer UnitDelayedStandingKey=8
hashtable UnitAbilityTrigger= InitHashtable()
//endglobals from Common
//globals from YDWESetUnitFacingToFaceUnitTimedNull:
constant boolean LIBRARY_YDWESetUnitFacingToFaceUnitTimedNull=true
//endglobals from YDWESetUnitFacingToFaceUnitTimedNull
//globals from UnitStateRefresh:
constant boolean LIBRARY_UnitStateRefresh=true
//endglobals from UnitStateRefresh
    // User-defined
boolean udg_IsSkipCinematic= false
boolean udg_InCinematic= false
unit udg_OgreMagi= null
unit udg_Kael= null
destructable udg_IntroCinePortal= null
unit array udg_TempArryUnit
unit array udg_Elevators
quest array udg_MainQuest
quest array udg_SideQuest
unit array udg_Tavern
group udg_CinematicUnitsGroup= null
    // Generated
rect gg_rct_Elevators_01= null
rect gg_rct_Intro__Build1= null
rect gg_rct_Intro__Build2= null
rect gg_rct_Intro__Build3= null
rect gg_rct_Intro__Build4= null
rect gg_rct_Intro__KaelBirth1= null
rect gg_rct_Intro__KaelBirth2= null
rect gg_rct_Intro__KaelMove1= null
rect gg_rct_Intro__KaelMove2= null
rect gg_rct_Intro__OrgeBirth1= null
rect gg_rct_Intro__OrgeBirth2= null
rect gg_rct_Intro__OrgeLookPos1= null
rect gg_rct_Intro__OrgeLookPos2= null
rect gg_rct_Intro__OrgeMove1= null
rect gg_rct_Intro__OrgeMove2= null
rect gg_rct_Intro__PortalBirth= null
rect gg_rct_Intro__LieutenantMove1= null
rect gg_rct_Intro__TrollMove1= null
rect gg_rct_Intro__DeterminedExterminatorMove1= null
camerasetup gg_cam_Intro__GameStart= null
camerasetup gg_cam_Intro__OrgeCloseUp= null
camerasetup gg_cam_Intro__OrgeInitialPoint= null
camerasetup gg_cam_Intro__PortalCloseUp= null
camerasetup gg_cam_Intro__Talk1= null
camerasetup gg_cam_Intro__Talk2= null
camerasetup gg_cam_Intro__Talk3= null
camerasetup gg_cam_Intro__Talk4= null
camerasetup gg_cam_Intro__Talk5= null
camerasetup gg_cam_Intro__Talk6= null
camerasetup gg_cam_Intro__Talk7= null
sound gg_snd_ShouSiJuHua= null
sound gg_snd_FootmanYes1= null
sound gg_snd_PeasantPissed3= null
sound gg_snd_SkeletonYes1= null
sound gg_snd_ForestTrollYesAttack2= null
sound gg_snd_ForestTrollWarcry1= null
sound gg_snd_PriestYesAttack1= null
sound gg_snd_ArthasPissed4= null
sound gg_snd_NecromancerPissed4= null
sound gg_snd_NecromancerWhat1= null
sound gg_snd_pl_impact_stun= null
sound gg_snd_JuHuaXiao= null
sound gg_snd_HeroLichReady1= null
sound gg_snd_S03Illidan45= null
sound gg_snd_JuHuaWuGu= null
sound gg_snd_FlashBack1Second= null
sound gg_snd_BigSven_u= null
sound gg_snd_Sven_sevn_u= null
sound gg_snd_LongZhu_u= null
sound gg_snd_WoKaoJuQingSha= null
sound gg_snd_Ai_o_u= null
sound gg_snd_LZGL= null
string gg_snd_PursuitTheme
sound gg_snd_LJDTtth= null
sound gg_snd_MaLiuDXiu= null
sound gg_snd_OgrePissed5= null
sound gg_snd_OgreYesAttack3= null
sound gg_snd_ShimmeringPortalBirth= null
sound gg_snd_ShimmeringPortalDeath= null
sound gg_snd_ShimmeringPortalEntrance= null
sound gg_snd_CityScapeMagicRunesLoop1= null
trigger gg_trg_Intro_Start= null
trigger gg_trg_Init_IntroCine= null
trigger gg_trg_Intro_Skipped= null
trigger gg_trg_Intro_Cleanup= null
trigger gg_trg_GameStart= null
trigger gg_trg_InitQuest= null
unit gg_unit_nhew_0088= null
unit gg_unit_nhew_0010= null
unit gg_unit_nhew_0013= null
unit gg_unit_nbee_0014= null
unit gg_unit_nhew_0015= null
unit gg_unit_hlum_0017= null
unit gg_unit_nhew_0018= null
unit gg_unit_nm03_0022= null
unit gg_unit_nm05_0023= null
unit gg_unit_nm06_0024= null
destructable gg_dest_ZTtw_2470= null
unit gg_unit_nhew_0025= null
destructable gg_dest_ZTtw_1356= null
unit gg_unit_n001_0016= null
player P2= null
        //单位状态恢复 生命/魔法
        //计时器RestoreFrame秒回调一次
        //timer UnitRestoreTimer = null 
        //恢复队列
unit array UnitLifeRestoreQueue
unit array UnitManaRestoreQueue
real array LifeRestoreValue
real array ManaRestoreValue
        //恢复队列最大值
integer UnitLifeRestoreNumber= 0
integer UnitManaRestoreNumber= 0
        //ObjectData
constant integer BONUS_DAMAGE=10
constant integer BONUS_ARMOR=12
constant integer BONUS_ATTACK=14
constant integer BONUS_LIFE=16
constant integer BONUS_MANA=18
constant integer BONUS_STR=20
constant integer BONUS_AGI=22
constant integer BONUS_INT=24
constant integer BONUS_MOVESPEED=26
constant integer Image___ImageAbility= 'AIil'
constant integer UnitIsSummoningIllusions=28
        //===========================================
        //物品系统
integer ItemStack_Number= 0
integer array ItemStack_PowerUp
integer array ItemStack_Real
integer array ItemStack_SellUnit
integer array ItemStack_Disabled
        
integer S_ItemStack_Number= 0
        
integer array Item1
integer array Item2
integer array Item3
integer array Item4
integer array Item5
integer array Item6
        //物品属性
trigger ItemAttrTrig= null
        //物品索引
        //秘法鞋
integer ITEM_ArcaneBoots
        //速度之鞋
integer ITEM_SpeedBoots
        //强袭装甲
integer ITEM_AssaultCuirass
integer ITEM_Satanic
integer ITEM_MoonShard
        //技能
trigger AbilityEventTrigger= null
trigger UnitSpellEffectTrigger= null
trigger EnterMapTrigger= CreateTrigger()
trigger HeroLevelUpTrigger= CreateTrigger()
constant integer IllusionUnitDataB=30
constant integer IllusionUnitDataC=32
	
	//TaxStealer Gold UI
integer TaxStealerGoldAmount= 0
integer TaxStealerResourceBarFrame
integer TaxStealerGoldFrameText
integer TaxStealerGoldTipBoxedFrame
integer TaxStealerGoldTipTextTitle
constant integer StormSpirit___HaveOverload=34
constant integer StormSpirit___OverloadEffectRight=36
constant integer StormSpirit___OverloadEffectLeft=38
	//ui的frame
integer GameUI
	//控制台UI
integer ConsoleUI
unit LocalPlayerSelectUnit= null
integer UpdateCallbackCount= 0
	//移动速度的Frame
integer SimpleInfoPanelIconArmor2
integer MoveSpeedFrame
integer MoveSpeedTextValue
	
integer AttackSpeed1Frame
integer AttackSpeed1TextValue
	
integer AttackSpeed2Frame
integer AttackSpeed2TextValue
	
	//这些布尔是异步使用的，不要在会同步的地方使用。
boolean NewUnitStateUIIsEnable= false
boolean MoveSpeedUIVisible= false
boolean AttackSpeed1UIVisible= false
boolean AttackSpeed2UIVisible= false
	//选英雄的背景
integer PickHeroFrame
integer PickHeroReturnFrame
integer PickHeroBackDrop
	
integer array HeroButton
integer array HeroBackDrop
boolean array HeroIsSelected
	
integer array PlayerHeroAmount
integer PlayerMaxHeroAmount= 1
	
region WorldRegion= null
unit W2= null
	
	
	
	
trigger array DamageEventQueue
integer array DamageEventNumber
	
hashtable ObjectData= InitHashtable()
	
	//Frame
	//光环刷新间隔
constant real AuraFrame= 0.5
	//单位恢复间隔
constant real RestoreFrame= 0.2
	//枷锁闪电效果移动间隔
constant real LeashFrame= 0.05
	//单位类型 数据
	
	
	//单位哈希表
hashtable UnitData= InitHashtable()
	//===========================================
constant integer BuffAddType_Positive= 1
constant integer BuffAddType_Negative= 2
constant integer BuffAddType_Magic= 8
constant integer BuffAddType_Physical= 16
constant integer BuffAddType_Aura= 32
constant integer BuffAddType_AutoDispel= 64

	//===========================================
	//主要任务
quest array MainQuest
	//支线任务
quest array SideQuest
	
	//中转全局变量
unit Tmp_SpellAbilityUnit= null
unit Tmp_SpellTargetUnit= null
integer Tmp_SpellAbilityLevel
real Tmp_SpellTargetX
real Tmp_SpellTargetY
	// 数组
integer array Tmp__ArrayInt
real array Tmp__ArrayReal
	//中转用的变量
unit TmpUnit2= null
integer Tmp_DummyAmount= 0
	//伤害事件
	//伤害来源
unit Tmp_DamageSource= null
//受伤者
unit Tmp_DamageInjured= null
	//伤害值
real Tmp_DamageValue
boolean array EffectIsEnabled
timer array EffectEnabledTimer
	//哈希表的Key
	//UnitData
constant integer UNIT_BASE_ARMOR= 101
constant integer UNIT_BASE_DAMAGE= 102
constant integer UNIT_LIFERESTORE= 103
constant integer UNIT_MANARESTORE= 104
	
	//技能事件的哈希表key
	//准备释放技能
constant integer SPELL_CHANNEL= 10
	//发动技能效果
constant integer SPELL_EFFECT= 11
	//学习技能
constant integer LEARN_SKILL= 14
	//学习技能1级
constant integer LEARN_FIRST_LEVEL_SKILL= 15
	//UnitBuff
hashtable UnitBuff= InitHashtable()
hashtable UnitKeyBuff= InitHashtable()
constant integer AttackTarget= - 100
constant integer AttackReadyTrg= - 101
constant integer AttackReadyTimer= - 102
constant integer CriticalStrikeDamage= - 99

constant integer Leash= - 1
constant integer UNITBUFF_STUN= 0
constant integer ZeroCast= 1
constant integer BallLightningCount= 7

constant integer MagicImmunity= 11
	// 一些命令Id
	// 攻击
constant integer Order_Attack= 851983
	// 右键
constant integer Order_Smart= 851971
	// 移动
constant integer Order_Move= 851986
	// 照明弹
constant integer Order_Flare= 852060
	// 魔法枷锁
constant integer Order_MagicLeash= 852480
	// 闪电链
constant integer Order_Chainlightning= 852119
	// 嘲讽
constant integer Order_Taunt= 852520
	// 采集
constant integer Order_Harvest= 852018
	//是否是初始化单位
boolean IsInitUnit= true
	//Dummy 马甲
rect RectDummy= Rect(0, 0, 0, 0)
	//获取最近的可破坏物
destructable Tmp_Destructable= null
real Tmp_NearestDestructableDistance= 0.
real Tmp_GetNearestDestructableUnitX= 0.
real Tmp_GetNearestDestructableUnitY= 0.
	//额外属性马甲
unit BonusDummy= null
	//和lua交互数据的全局变量
string SlkdataType= ""
string SlkType= ""
integer array StrHeroTypeId
integer array IntHeroTypeId
integer array AgiHeroTypeId
integer array AllHeroTypeId
constant integer MaxUserAmount= 5
	//
unit array TavernUnit
unit array MovieDummyUnit
unit array PlayerHeroUnit
	//===================================
	//
	//	QuestUnit
	//
	//===================================
unit Romantic= null

trigger l__library_init

//JASSHelper struct globals:

endglobals
    native UnitAlive takes unit id returns boolean
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
    native EXGetEventDamageData takes integer edd_type returns integer
    native EXSetEventDamage takes real amount returns boolean
    native EXPauseUnit takes unit u, boolean flag returns nothing
    native EXExecuteScript takes string script returns string
    native EXSetAbilityAEmeDataA takes ability abil, integer unitid returns boolean
    native EXGetUnitString takes integer unitcode, integer Type returns string
    native EXSetUnitString takes integer unitcode,integer Type,string value returns boolean
    native EXGetItemDataString takes integer itemcode, integer data_type returns string
    native EXSetItemDataString takes integer itemcode, integer data_type, string value returns boolean
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
    native EXGetBuffDataString takes integer buffcode, integer data_type returns string
    native EXSetBuffDataString takes integer buffcode, integer data_type, string value returns boolean
native DzGetMouseTerrainX takes nothing returns real
native DzGetMouseTerrainY takes nothing returns real
native DzGetMouseTerrainZ takes nothing returns real
native DzIsMouseOverUI takes nothing returns boolean
native DzGetMouseX takes nothing returns integer
native DzGetMouseY takes nothing returns integer
native DzGetMouseXRelative takes nothing returns integer
native DzGetMouseYRelative takes nothing returns integer
native DzSetMousePos takes integer x, integer y returns nothing
native DzTriggerRegisterMouseEvent takes trigger trig, integer btn, integer status, boolean sync, string func returns nothing
native DzTriggerRegisterMouseEventByCode takes trigger trig, integer btn, integer status, boolean sync, code funcHandle returns nothing
native DzTriggerRegisterKeyEvent takes trigger trig, integer key, integer status, boolean sync, string func returns nothing
native DzTriggerRegisterKeyEventByCode takes trigger trig, integer key, integer status, boolean sync, code funcHandle returns nothing
native DzTriggerRegisterMouseWheelEvent takes trigger trig, boolean sync, string func returns nothing
native DzTriggerRegisterMouseWheelEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
native DzTriggerRegisterMouseMoveEvent takes trigger trig, boolean sync, string func returns nothing
native DzTriggerRegisterMouseMoveEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
native DzGetTriggerKey takes nothing returns integer
native DzGetWheelDelta takes nothing returns integer
native DzIsKeyDown takes integer iKey returns boolean
native DzGetTriggerKeyPlayer takes nothing returns player
native DzGetWindowWidth takes nothing returns integer
native DzGetWindowHeight takes nothing returns integer
native DzGetWindowX takes nothing returns integer
native DzGetWindowY takes nothing returns integer
native DzTriggerRegisterWindowResizeEvent takes trigger trig, boolean sync, string func returns nothing
native DzTriggerRegisterWindowResizeEventByCode takes trigger trig, boolean sync, code funcHandle returns nothing
native DzIsWindowActive takes nothing returns boolean
native DzDestructablePosition takes destructable d, real x, real y returns nothing
native DzSetUnitPosition takes unit whichUnit, real x, real y returns nothing
native DzExecuteFunc takes string funcName returns nothing
native DzGetUnitUnderMouse takes nothing returns unit
native DzSetUnitTexture takes unit whichUnit, string path, integer texId returns nothing
native DzSetMemory takes integer address, real value returns nothing
native DzSetUnitID takes unit whichUnit, integer id returns nothing
native DzSetUnitModel takes unit whichUnit, string path returns nothing
native DzSetWar3MapMap takes string map returns nothing
native DzTriggerRegisterSyncData takes trigger trig, string prefix, boolean server returns nothing
native DzSyncData takes string prefix, string data returns nothing
native DzGetTriggerSyncData takes nothing returns string
native DzGetTriggerSyncPlayer takes nothing returns player
native DzFrameHideInterface takes nothing returns nothing
native DzFrameEditBlackBorders takes real upperHeight, real bottomHeight returns nothing
native DzFrameGetPortrait takes nothing returns integer
native DzFrameGetMinimap takes nothing returns integer
native DzFrameGetCommandBarButton takes integer row, integer column returns integer
native DzFrameGetHeroBarButton takes integer buttonId returns integer
native DzFrameGetHeroHPBar takes integer buttonId returns integer
native DzFrameGetHeroManaBar takes integer buttonId returns integer
native DzFrameGetItemBarButton takes integer buttonId returns integer
native DzFrameGetMinimapButton takes integer buttonId returns integer
native DzFrameGetUpperButtonBarButton takes integer buttonId returns integer
native DzFrameGetTooltip takes nothing returns integer
native DzFrameGetChatMessage takes nothing returns integer
native DzFrameGetUnitMessage takes nothing returns integer
native DzFrameGetTopMessage takes nothing returns integer
native DzGetColor takes integer r, integer g, integer b, integer a returns integer
native DzFrameSetUpdateCallback takes string func returns nothing
native DzFrameSetUpdateCallbackByCode takes code funcHandle returns nothing
native DzFrameShow takes integer frame, boolean enable returns nothing
native DzCreateFrame takes string frame, integer parent, integer id returns integer
native DzCreateSimpleFrame takes string frame, integer parent, integer id returns integer
native DzDestroyFrame takes integer frame returns nothing
native DzLoadToc takes string fileName returns nothing
native DzFrameSetPoint takes integer frame, integer point, integer relativeFrame, integer relativePoint, real x, real y returns nothing
native DzFrameSetAbsolutePoint takes integer frame, integer point, real x, real y returns nothing
native DzFrameClearAllPoints takes integer frame returns nothing
native DzFrameSetEnable takes integer name, boolean enable returns nothing
native DzFrameSetScript takes integer frame, integer eventId, string func, boolean sync returns nothing
native DzFrameSetScriptByCode takes integer frame, integer eventId, code funcHandle, boolean sync returns nothing
native DzGetTriggerUIEventPlayer takes nothing returns player
native DzGetTriggerUIEventFrame takes nothing returns integer
native DzFrameFindByName takes string name, integer id returns integer
native DzSimpleFrameFindByName takes string name, integer id returns integer
native DzSimpleFontStringFindByName takes string name, integer id returns integer
native DzSimpleTextureFindByName takes string name, integer id returns integer
native DzGetGameUI takes nothing returns integer
native DzClickFrame takes integer frame returns nothing
native DzSetCustomFovFix takes real value returns nothing
native DzEnableWideScreen takes boolean enable returns nothing
native DzFrameSetText takes integer frame, string text returns nothing
native DzFrameGetText takes integer frame returns string
native DzFrameSetTextSizeLimit takes integer frame, integer size returns nothing
native DzFrameGetTextSizeLimit takes integer frame returns integer
native DzFrameSetTextColor takes integer frame, integer color returns nothing
native DzGetMouseFocus takes nothing returns integer
native DzFrameSetAllPoints takes integer frame, integer relativeFrame returns boolean
native DzFrameSetFocus takes integer frame, boolean enable returns boolean
native DzFrameSetModel takes integer frame, string modelFile, integer modelType, integer flag returns nothing
native DzFrameGetEnable takes integer frame returns boolean
native DzFrameSetAlpha takes integer frame, integer alpha returns nothing
native DzFrameGetAlpha takes integer frame returns integer
native DzFrameSetAnimate takes integer frame, integer animId, boolean autocast returns nothing
native DzFrameSetAnimateOffset takes integer frame, real offset returns nothing
native DzFrameSetTexture takes integer frame, string texture, integer flag returns nothing
native DzFrameSetScale takes integer frame, real scale returns nothing
native DzFrameSetTooltip takes integer frame, integer tooltip returns nothing
native DzFrameCageMouse takes integer frame, boolean enable returns nothing
native DzFrameGetValue takes integer frame returns real
native DzFrameSetMinMaxValue takes integer frame, real minValue, real maxValue returns nothing
native DzFrameSetStepValue takes integer frame, real step returns nothing
native DzFrameSetValue takes integer frame, real value returns nothing
native DzFrameSetSize takes integer frame, real w, real h returns nothing
native DzCreateFrameByTagName takes string frameType, string name, integer parent, string template, integer id returns integer
native DzFrameSetVertexColor takes integer frame, integer color returns nothing
native DzOriginalUIAutoResetPoint takes boolean enable returns nothing
native DzFrameSetPriority takes integer frame, integer priority returns nothing
native DzFrameSetParent takes integer frame, integer parent returns nothing
native DzFrameSetFont takes integer frame, string fileName, real height, integer flag returns nothing
native DzFrameGetHeight takes integer frame returns real
native DzFrameSetTextAlignment takes integer frame, integer align returns nothing
native DzFrameGetParent takes integer frame returns integer


//library InitSetUp:
    
    //单位存活





















            













    //Buff的Japi在1.27a不可用 直到最新的YDWE修复，但官方平台上似乎不可用。


            
    //YDWE封装
                
    function YDWEGetUnitAbilityState takes unit u,integer abilcode,integer state_type returns real
        return EXGetAbilityState(EXGetUnitAbility(u, abilcode), state_type)
    endfunction
            
    function YDWEGetUnitAbilityDataInteger takes unit u,integer abilcode,integer level,integer data_type returns integer
        return EXGetAbilityDataInteger(EXGetUnitAbility(u, abilcode), level, data_type)
    endfunction
            
    function YDWEGetUnitAbilityDataReal takes unit u,integer abilcode,integer level,integer data_type returns real
        return EXGetAbilityDataReal(EXGetUnitAbility(u, abilcode), level, data_type)
    endfunction
            
    function YDWEGetUnitAbilityDataString takes unit u,integer abilcode,integer level,integer data_type returns string
        return EXGetAbilityDataString(EXGetUnitAbility(u, abilcode), level, data_type)
    endfunction
            
    function YDWESetUnitAbilityState takes unit u,integer abilcode,integer state_type,real value returns boolean
        return EXSetAbilityState(EXGetUnitAbility(u, abilcode), state_type, value)
    endfunction
            
    function YDWESetUnitAbilityDataInteger takes unit u,integer abilcode,integer level,integer data_type,integer value returns boolean
        return EXSetAbilityDataInteger(EXGetUnitAbility(u, abilcode), level, data_type, value)
    endfunction
            
    function YDWESetUnitAbilityDataReal takes unit u,integer abilcode,integer level,integer data_type,real value returns boolean
        return EXSetAbilityDataReal(EXGetUnitAbility(u, abilcode), level, data_type, value)
    endfunction
            
    function YDWESetUnitAbilityDataString takes unit u,integer abilcode,integer level,integer data_type,string value returns boolean
        return EXSetAbilityDataString(EXGetUnitAbility(u, abilcode), level, data_type, value)
    endfunction
    //初始化prd的值
    function InitPrd takes nothing returns nothing
        call SaveReal(Prd, - 1, 0, .0038)
        call SaveReal(Prd, - 1, 1, .0147)
        call SaveReal(Prd, - 1, 2, .0322)
        call SaveReal(Prd, - 1, 3, .0557)
        call SaveReal(Prd, - 1, 4, .0847)
        call SaveReal(Prd, - 1, 5, .1189)
        call SaveReal(Prd, - 1, 6, .1579)
        call SaveReal(Prd, - 1, 7, .2015)
        call SaveReal(Prd, - 1, 8, .2493)
        call SaveReal(Prd, - 1, 9, .3021)
        call SaveReal(Prd, - 1, 10, .3604)
        call SaveReal(Prd, - 1, 11, .4226)
        call SaveReal(Prd, - 1, 12, .4811)
        call SaveReal(Prd, - 1, 13, .5714)
        call SaveReal(Prd, - 1, 14, .6666)
        call SaveReal(Prd, - 1, 15, .75)
        call SaveReal(Prd, - 1, 16, .8235)
        call SaveReal(Prd, - 1, 17, .8888)
        call SaveReal(Prd, - 1, 18, .9473)
        call SaveReal(Prd, - 1, 19, 1.)
    endfunction
    //========================================================
    //Group
    //========================================================
    //实际上比直接Create和Destroy效率差了2.5倍左右
    //好处是不需要set g = null 因为这些预先创建的单位组不会被销毁
    function LogoutGroup takes group g returns nothing
        local integer i= GetHandleId(g) - MaxGroupHandle
        if i < 0 or i > MaxGroupAmount then
        else
            call GroupClear(g)
            set GroupInUse[i]=false
            set GroupIdleValue=i
        endif
    endfunction
    function LoginGroup takes nothing returns group
        local integer i= GroupIdleValue
        loop
            exitwhen i == GroupIdleValue - 1
            if not GroupInUse[i] then
                set GroupIdleValue=i + 1
                if GroupIdleValue == MaxGroupAmount then
                    set GroupIdleValue=1
                endif
                set GroupInUse[i]=true
                return MainGroup[i]
            endif
            set i=i + 1
            if i == MaxGroupAmount then
                set i=0
            endif
        endloop
        call DisplayTimedTextToPlayer(LocalPlayer, 0, 0, 20, "|c00ff0303严重错误: 找不到可用的单位组。|r")
        return CreateGroup()
    endfunction
    function CreateMainGroup takes nothing returns nothing
        local integer i= 0
        set MainGroup[i]=CreateGroup()
        set i=i + 1
        set MaxGroupHandle=GetHandleId(MainGroup[0])
        loop
            exitwhen i == MaxGroupAmount
            set MainGroup[i]=CreateGroup()
            set i=i + 1
        endloop
    endfunction
    //========================================================
    //TriggerClear
    //========================================================
    function destroy_error takes string s returns nothing
        //if bj_isSinglePlayer then
		call DisplayTimedTextToPlayer(LocalPlayer, 0, 0, 120, "|c00ff0303内部检验失败|r")
		call DisplayTimedTextToPlayer(LocalPlayer, 0, 0, 120, "|c00ff0303这可能不是一个严重的故障，但对我来说这个信息十分重要|r")
		call DisplayTimedTextToPlayer(LocalPlayer, 0, 0, 120, "|c00ff0303错误代码: " + s + "|r")
        //endif
    endfunction
    function ClearTrigger takes trigger t returns nothing
        call DisableTrigger(t)
        set DestroyQueueNumber=DestroyQueueNumber + 1
        set DestroyQueue[DestroyQueueNumber]=t
        set ElapsedTime[DestroyQueueNumber]=( TimerGetElapsed(GameTimer) ) + 60
        if DestroyQueueNumber > 8000 then
            call destroy_error("8k")
        endif
    endfunction
    function setnil takes integer i returns nothing
        if i != DestroyQueueNumber then
            set DestroyQueue[i]=DestroyQueue[DestroyQueueNumber]
            set ElapsedTime[i]=ElapsedTime[DestroyQueueNumber]
        endif
        set DestroyQueue[DestroyQueueNumber]=null
        set ElapsedTime[DestroyQueueNumber]=0
        set DestroyQueueNumber=DestroyQueueNumber - 1
    endfunction
    function TimedCleanupTrigger takes nothing returns boolean
        local real r= TimerGetElapsed(GameTimer)
        local integer i
        set i=1
        loop
            exitwhen i > DestroyQueueNumber
            if ElapsedTime[i] < r then
                if DestroyQueue[i] == null then
                    call destroy_error("nil")
                elseif IsTriggerEnabled(DestroyQueue[i]) then
                    call destroy_error(I2S(GetHandleId(DestroyQueue[i])))
                else
                    call DestroyTrigger(DestroyQueue[i])
                endif
                call setnil(i)
            else
                set i=i + 1
            endif
        endloop
        return false
    endfunction
    //创建一个计时器事件触发器，返回值是触发器的整数地址，需要手动销毁。注意func为触发器的条件Condition而不是动作Action。
    function CreateTimerEventTrigger takes real timeout,boolean periodic,code func returns integer
        local trigger trig= CreateTrigger()
        local integer iHandleId= GetHandleId(trig)
        call TriggerAddCondition(trig, Condition(func))
        call TriggerRegisterTimerEvent(trig, timeout, periodic)
        set trig=null
        return iHandleId
    endfunction
    //将物件转成物品
    function Widget2Item takes widget whichWidget returns item
        call SaveFogStateHandle(TypeConversion, 0, 0, ConvertFogState(GetHandleId(whichWidget)))
        return LoadItemHandle(TypeConversion, 0, 0)
    endfunction
    function ItemDelayRemove takes nothing returns boolean
        local trigger trig= GetTriggeringTrigger()
        local integer iHandleId= GetHandleId(trig)
        local item deathItem= LoadItemHandle(HT, iHandleId, 0)
   
        if GetHandleId(deathItem) > 0 then
            call SetWidgetLife(deathItem, 1)
            call RemoveItem(deathItem)
        endif
        call FlushChildHashtable(HT, iHandleId)
        call ClearTrigger(trig)
        set trig=null
        set deathItem=null
        return false
    endfunction
    function ItemDeathEventTriggerCallBack takes nothing returns boolean
        local item deathItem= Widget2Item(GetTriggerWidget())
        local integer iHandleId
        //call SetWidgetLife(deathItem, 1)
        //等待,让物品播放完死亡动画,3.633秒是大部分书的死亡时间,似乎物品模型里死亡动画没有比这个更高的.
        //注意 普通物品死亡时间为0.5,书虽然3.633,但后面很大一部分时间都是播放最小化的书
        set iHandleId=CreateTimerEventTrigger(1. , false , function ItemDelayRemove)
        call SaveItemHandle(HT, iHandleId, 0, deathItem)
        set deathItem=null
        return false
    endfunction
    //封装的创建物品,因为物品被a掉后会永久存在于地图之中,所以要特殊操作一下.
    function EXCreateItem takes integer itemid,real x,real y returns item
        set bj_lastCreatedItem=CreateItem(itemid, x, y)
        call TriggerRegisterDeathEvent(ItemDeathEventTrigger, bj_lastCreatedItem)
        return bj_lastCreatedItem
    endfunction
    //得到XY之间的角度
    function AngleBetweenXY takes real x1,real y1,real x2,real y2 returns real
        return bj_RADTODEG * Atan2(y2 - y1, x2 - x1)
    endfunction
    //单位之间的角度
    function AngleBetweenUnit takes unit u1,unit u2 returns real
        return bj_RADTODEG * Atan2(GetUnitY(u2) - GetUnitY(u1), GetUnitX(u2) - GetUnitX(u1))
    endfunction
    //xy距离
    function GetDistanceBetween takes real x1,real y1,real x2,real y2 returns real
        return SquareRoot(( x1 - x2 ) * ( x1 - x2 ) + ( y1 - y2 ) * ( y1 - y2 ))
    endfunction
    //单位之间的距离
    function GetDistanceBetweenUnits takes unit u1,unit u2 returns real
        return SquareRoot(( GetUnitX(u1) - GetUnitX(u2) ) * ( GetUnitX(u1) - GetUnitX(u2) ) + ( GetUnitY(u1) - GetUnitY(u2) ) * ( GetUnitY(u1) - GetUnitY(u2) ))
    endfunction
    //添加技能并且设置永久性
    function UnitAddPermanentAbility takes unit u,integer id returns boolean
        return UnitAddAbility(u, id) and UnitMakeAbilityPermanent(u, true, id)
    endfunction
    //添加技能并且设置永久性和技能等级
    function UnitAddPermanentAbilitySetlevel takes unit u,integer id,integer lv returns nothing
        if GetUnitAbilityLevel(u, id) == 0 then
            call UnitAddPermanentAbility(u , id)
        endif
        call SetUnitAbilityLevel(u, id, lv)
    endfunction
    //Prd随机数 取5的整数
    function PrdRandom takes unit u,integer abId,real value returns boolean
        local integer h= GetHandleId(u)
        local real newValue
        if not IsUnitType(u, UNIT_TYPE_HERO) then
            return GetRandomInt(1, 100) < value //如果不是英雄 则直接返回随机数
endif
        set newValue=LoadReal(Prd, - 1, R2I(R2I(value * .2) * 5. * .2) - 1) + LoadReal(Prd, h, abId)
        //call Debug("log","几率: " + R2S(newValue) )
        if GetRandomReal(.0, 1.) < newValue then
            call SaveReal(Prd, h, abId, .0)
            return true
        else
            call SaveReal(Prd, h, abId, newValue)
            return false
        endif
    endfunction
    //修正坐标X 防止SetUnitX超出地图
    function CoordinateX takes real x returns real
        if x < CorrectionMinX then
            return CorrectionMinX
        endif
        if x > CorrectionMaxX then
            return CorrectionMaxX
        endif
        return x
    endfunction
    //修正坐标Y 防止SetUnitY超出地图
    function CoordinateY takes real y returns real
        if y < CorrectionMinY then
            return CorrectionMinY
        endif
        if y > CorrectionMaxY then
            return CorrectionMaxY
        endif
        return y
    endfunction
    //========================================================
    //从单位组以某个条件获取单位
    //========================================================
    //Nearest Farthest
    //得到单位组距离xy最远的单位
    function GetFarthestUnitByGroup takes group whichGroup,real x,real y returns unit
        local group dummyGroup= LoginGroup()
        local real rFarthestDistance= 0
        local unit dummyUnit
        local unit farthestUnit= null
        local real rDistance= .0
        call GroupAddGroup(whichGroup, dummyGroup)
        loop
            set dummyUnit=FirstOfGroup(dummyGroup)
            exitwhen dummyUnit == null
            set rDistance=GetDistanceBetween(GetUnitX(dummyUnit) , GetUnitY(dummyUnit) , x , y)
            if rDistance > rFarthestDistance then
                set farthestUnit=dummyUnit
                set rFarthestDistance=rDistance
            endif
            call GroupRemoveUnit(dummyGroup, dummyUnit)
        endloop
        set TmpUnit2=farthestUnit
        call LogoutGroup(dummyGroup)
        set dummyUnit=null
        set farthestUnit=null
        set dummyGroup=null
        return TmpUnit2
    endfunction
    //得到单位组距离xy最近的单位
    function GetNearestUnitByGroup takes group whichGroup,real x,real y returns unit
        local group dummyGroup= LoginGroup()
        local real rNearestDistance= 99999
        local unit dummyUnit
        local unit neareststUnit= null
        local real rDistance= 0.
        call GroupAddGroup(whichGroup, dummyGroup)
        loop
            set dummyUnit=FirstOfGroup(dummyGroup)
            exitwhen dummyUnit == null
            set rDistance=GetDistanceBetween(GetUnitX(dummyUnit) , GetUnitY(dummyUnit) , x , y)
            if rDistance < rNearestDistance then
                set neareststUnit=dummyUnit
                set rNearestDistance=rDistance
            endif
            call GroupRemoveUnit(dummyGroup, dummyUnit)
        endloop
        set TmpUnit2=neareststUnit
        call LogoutGroup(dummyGroup)
        set dummyUnit=null
        set neareststUnit=null
        set dummyGroup=null
        return TmpUnit2
    endfunction
    //得到单位组中生命值百分比最小的单位
    function GetMinPercentLifeUnitByGroup takes group whichGroup returns unit
        local group dummyGroup= LoginGroup()
        local real rMinPercentLife= 101
        local unit dummyUnit
        local unit minPercentLifeUnit= null
        local real rPercentLife= 0.
        call GroupAddGroup(whichGroup, dummyGroup)
        loop
            set dummyUnit=FirstOfGroup(dummyGroup)
            exitwhen dummyUnit == null
            set rPercentLife=GetUnitStatePercent(dummyUnit, UNIT_STATE_LIFE, UNIT_STATE_MAX_LIFE)
            if rPercentLife < rMinPercentLife then
                set minPercentLifeUnit=dummyUnit
                set rMinPercentLife=rPercentLife
            endif
            call GroupRemoveUnit(dummyGroup, dummyUnit)
        endloop
        call LogoutGroup(dummyGroup)
        set dummyGroup=null
        set dummyUnit=null
        set TmpUnit2=minPercentLifeUnit
        set minPercentLifeUnit=null
        return TmpUnit2
    endfunction
    //得到单位组中生命值最小的单位
    function GetMinLifeUnitByGroup takes group whichGroup returns unit
        local group dummyGroup= LoginGroup()
        local real rMinLife= 999999
        local unit dummyUnit
        local unit minLifeUnit= null
        local real rLife= 0.
        call GroupAddGroup(whichGroup, dummyGroup)
        loop
            set dummyUnit=FirstOfGroup(dummyGroup)
            exitwhen dummyUnit == null
            set rLife=GetWidgetLife(dummyUnit)
            if rLife < rMinLife then
                set minLifeUnit=dummyUnit
                set rMinLife=rLife
            endif
            call GroupRemoveUnit(dummyGroup, dummyUnit)
        endloop
        call LogoutGroup(dummyGroup)
        set dummyGroup=null
        set dummyUnit=null
        set TmpUnit2=minLifeUnit
        set minLifeUnit=null
        return TmpUnit2
    endfunction
    function YDWEAnyUnitDamagedFilter takes nothing returns boolean
        if GetUnitAbilityLevel(GetFilterUnit(), 'Aloc') <= 0 then
            call TriggerRegisterUnitEvent(DamageEventTrigger, GetFilterUnit(), EVENT_UNIT_DAMAGED)
        endif
        return false
    endfunction
    function AnyItemDeathFilter takes nothing returns boolean
        local item it= GetFilterItem()
        if GetWidgetLife(it) > 0 then
            call TriggerRegisterDeathEvent(ItemDeathEventTrigger, it)
        endif
        set it=null
        return false
    endfunction
    function YDWEAnyUnitDamagedEnumUnit takes nothing returns nothing
        local group g= LoginGroup()
        local integer i= 0
        loop
            call GroupEnumUnitsOfPlayer(g, Player(i), Condition(function YDWEAnyUnitDamagedFilter))
            set i=i + 1
            exitwhen i == bj_MAX_PLAYER_SLOTS
        endloop
        call LogoutGroup(g)
        set g=null
    endfunction
    //重建物品死亡事件
    function M_AnyItemDeathEnumItem takes nothing returns nothing
        local rect world= GetWorldBounds()
        call EnumItemsInRect(world, Condition(function AnyItemDeathFilter), null)
        call RemoveRect(world)
        set world=null
    endfunction
    // 将 DamageEventTrigger 移入销毁队列, 从而排泄触发器事件
    function YDWESyStemAnyUnitDamagedSwap takes nothing returns nothing
        local boolean isEnabled= IsTriggerEnabled(DamageEventTrigger)
        call ClearTrigger(DamageEventTrigger)
        set DamageEventTrigger=CreateTrigger()
        if not isEnabled then
            call DisableTrigger(DamageEventTrigger)
        endif
        set isEnabled=IsTriggerEnabled(ItemDeathEventTrigger)
        call ClearTrigger(ItemDeathEventTrigger)
        set ItemDeathEventTrigger=CreateTrigger()
        if not isEnabled then
            call DisableTrigger(ItemDeathEventTrigger)
        endif
        call TriggerAddCondition(DamageEventTrigger, DamageEventCondition)
        call TriggerAddCondition(ItemDeathEventTrigger, Condition(function ItemDeathEventTriggerCallBack))
        call YDWEAnyUnitDamagedEnumUnit()
        call M_AnyItemDeathEnumItem()
    endfunction
    //改装了一下YDWE的任意单位受伤。
    function YDWESyStemAnyUnitDamagedRegistTrigger takes nothing returns nothing
        set DamageEventTrigger=CreateTrigger()
        call TriggerAddCondition(DamageEventTrigger, DamageEventCondition)
        if DAMAGE_EVENT_SWAP_ENABLE then
            // 每隔 DAMAGE_EVENT_SWAP_TIMEOUT 秒, 将正在使用的 DamageEventTrigger 和 ItemDeathEventTrigger 移入销毁队列
            call TimerStart(CreateTimer(), DAMAGE_EVENT_SWAP_TIMEOUT, true, function YDWESyStemAnyUnitDamagedSwap)
        endif
    endfunction
    //给所有玩家共享此单位的视野
    function UnitShareVisionToAllPlayer takes unit whichUnit,boolean share returns nothing
        local integer i= 0
        loop
            call UnitShareVision(whichUnit, Player(i), share)
            set i=i + 1
            exitwhen i == bj_MAX_PLAYER_SLOTS
        endloop
    endfunction
    function InitSetUp___Init takes nothing returns nothing
        call InitPrd()
        set LocalPlayer=GetLocalPlayer()
        // 使用 TimerGetElapsed(GameTimer) 获取游戏逝去时间
        call TimerStart(GameTimer, 99999., false, null)
        // 定期清触发器
        call CreateTimerEventTrigger(15 , true , function TimedCleanupTrigger)
        // 物品被a掉
        call TriggerAddCondition(ItemDeathEventTrigger, Condition(function ItemDeathEventTriggerCallBack))
        call M_AnyItemDeathEnumItem()
        // 初始化单位组线性表
        call CreateMainGroup()
        //用于修正坐标
        set CorrectionMinX=GetRectMinX(bj_mapInitialPlayableArea) + 75
        set CorrectionMaxX=GetRectMaxX(bj_mapInitialPlayableArea) - 75
        set CorrectionMinY=GetRectMinY(bj_mapInitialPlayableArea) + 75
        set CorrectionMaxY=GetRectMaxY(bj_mapInitialPlayableArea) - 75
    
    endfunction

//library InitSetUp ends
//library UITips:
	
	//创建提示信息
 function CreateFrameTooltip takes integer frame,string tip,string ubertip returns integer
		set TipsFrameMaxAmount=TipsFrameMaxAmount + 1
		set TipsBackDrop[TipsFrameMaxAmount]=DzCreateFrameByTagName("BACKDROP", null, GameUI, "TooltipBackDrop", 0)
		set TipsText[TipsFrameMaxAmount]=DzCreateFrameByTagName("TEXT", null, TipsBackDrop[TipsFrameMaxAmount], "TipText", 0)
		set UberTipsText[TipsFrameMaxAmount]=DzCreateFrameByTagName("TEXT", null, TipsBackDrop[TipsFrameMaxAmount], "TipText", 0)
		//设置tip和ubertip
		call DzFrameSetText(TipsText[TipsFrameMaxAmount], tip)
		call DzFrameSetText(UberTipsText[TipsFrameMaxAmount], ubertip)
		if frame != 0 then
			call DzFrameSetTooltip(frame, TipsBackDrop[TipsFrameMaxAmount])
		endif
		call DzFrameSetSize(TipsBackDrop[TipsFrameMaxAmount], 0.209, 0)
		call DzFrameSetSize(TipsText[TipsFrameMaxAmount], 0.209, 0)
		call DzFrameSetSize(UberTipsText[TipsFrameMaxAmount], 0.209, 0)
		//设置"提示背景"的左上为"提示"的左上
		call DzFrameSetPoint(TipsBackDrop[TipsFrameMaxAmount], 0, TipsText[TipsFrameMaxAmount], 0, - 0.005, 0.005)
		//设置"提示"的底部为"扩展提示"的顶部
		call DzFrameSetPoint(TipsText[TipsFrameMaxAmount], 6, UberTipsText[TipsFrameMaxAmount], 0, 0, 0.005)
		//设置"提示背景"的右下为"扩展提示"的右下
		call DzFrameSetPoint(TipsBackDrop[TipsFrameMaxAmount], 8, UberTipsText[TipsFrameMaxAmount], 8, 0.005, - 0.005)
		call DzFrameSetAbsolutePoint(UberTipsText[TipsFrameMaxAmount], 8, 0.7935, 0.168)
		return TipsFrameMaxAmount
	endfunction

//library UITips ends
//library YDTriggerSaveLoadSystem:
    function YDTriggerSaveLoadSystem___Init takes nothing returns nothing
            set YDHT=InitHashtable()
        set YDLOC=InitHashtable()
    endfunction

//library YDTriggerSaveLoadSystem ends
//library YDWEBase:
//===========================================================================
//HashTable
//===========================================================================
//===========================================================================
//Return bug
//===========================================================================
function YDWEH2I takes handle h returns integer
    return GetHandleId(h)
endfunction
//����
function YDWEFlushAllData takes nothing returns nothing
    call FlushParentHashtable(YDHT)
endfunction
function YDWEFlushMissionByInteger takes integer i returns nothing
    call FlushChildHashtable(YDHT, i)
endfunction
function YDWEFlushMissionByString takes string s returns nothing
    call FlushChildHashtable(YDHT, StringHash(s))
endfunction
function YDWEFlushStoredIntegerByInteger takes integer i,integer j returns nothing
    call RemoveSavedInteger(YDHT, i, j)
endfunction
function YDWEFlushStoredIntegerByString takes string s1,string s2 returns nothing
    call RemoveSavedInteger(YDHT, StringHash(s1), StringHash(s2))
endfunction
function YDWEHaveSavedIntegerByInteger takes integer i,integer j returns boolean
    return HaveSavedInteger(YDHT, i, j)
endfunction
function YDWEHaveSavedIntegerByString takes string s1,string s2 returns boolean
    return HaveSavedInteger(YDHT, StringHash(s1), StringHash(s2))
endfunction
//store and get integer
function YDWESaveIntegerByInteger takes integer pTable,integer pKey,integer i returns nothing
    call SaveInteger(YDHT, pTable, pKey, i)
endfunction
function YDWESaveIntegerByString takes string pTable,string pKey,integer i returns nothing
    call SaveInteger(YDHT, StringHash(pTable), StringHash(pKey), i)
endfunction
function YDWEGetIntegerByInteger takes integer pTable,integer pKey returns integer
    return LoadInteger(YDHT, pTable, pKey)
endfunction
function YDWEGetIntegerByString takes string pTable,string pKey returns integer
    return LoadInteger(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//store and get real
function YDWESaveRealByInteger takes integer pTable,integer pKey,real r returns nothing
    call SaveReal(YDHT, pTable, pKey, r)
endfunction
function YDWESaveRealByString takes string pTable,string pKey,real r returns nothing
    call SaveReal(YDHT, StringHash(pTable), StringHash(pKey), r)
endfunction
function YDWEGetRealByInteger takes integer pTable,integer pKey returns real
    return LoadReal(YDHT, pTable, pKey)
endfunction
function YDWEGetRealByString takes string pTable,string pKey returns real
    return LoadReal(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//store and get string
function YDWESaveStringByInteger takes integer pTable,integer pKey,string s returns nothing
    call SaveStr(YDHT, pTable, pKey, s)
endfunction
function YDWESaveStringByString takes string pTable,string pKey,string s returns nothing
    call SaveStr(YDHT, StringHash(pTable), StringHash(pKey), s)
endfunction
function YDWEGetStringByInteger takes integer pTable,integer pKey returns string
    return LoadStr(YDHT, pTable, pKey)
endfunction
function YDWEGetStringByString takes string pTable,string pKey returns string
    return LoadStr(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//store and get boolean
function YDWESaveBooleanByInteger takes integer pTable,integer pKey,boolean b returns nothing
    call SaveBoolean(YDHT, pTable, pKey, b)
endfunction
function YDWESaveBooleanByString takes string pTable,string pKey,boolean b returns nothing
    call SaveBoolean(YDHT, StringHash(pTable), StringHash(pKey), b)
endfunction
function YDWEGetBooleanByInteger takes integer pTable,integer pKey returns boolean
    return LoadBoolean(YDHT, pTable, pKey)
endfunction
function YDWEGetBooleanByString takes string pTable,string pKey returns boolean
    return LoadBoolean(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Unit
function YDWESaveUnitByInteger takes integer pTable,integer pKey,unit u returns nothing
    call SaveUnitHandle(YDHT, pTable, pKey, u)
endfunction
function YDWESaveUnitByString takes string pTable,string pKey,unit u returns nothing
    call SaveUnitHandle(YDHT, StringHash(pTable), StringHash(pKey), u)
endfunction
function YDWEGetUnitByInteger takes integer pTable,integer pKey returns unit
    return LoadUnitHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetUnitByString takes string pTable,string pKey returns unit
    return LoadUnitHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert UnitID
function YDWESaveUnitIDByInteger takes integer pTable,integer pKey,integer uid returns nothing
    call SaveInteger(YDHT, pTable, pKey, uid)
endfunction
function YDWESaveUnitIDByString takes string pTable,string pKey,integer uid returns nothing
    call SaveInteger(YDHT, StringHash(pTable), StringHash(pKey), uid)
endfunction
function YDWEGetUnitIDByInteger takes integer pTable,integer pKey returns integer
    return LoadInteger(YDHT, pTable, pKey)
endfunction
function YDWEGetUnitIDByString takes string pTable,string pKey returns integer
    return LoadInteger(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert AbilityID
function YDWESaveAbilityIDByInteger takes integer pTable,integer pKey,integer abid returns nothing
    call SaveInteger(YDHT, pTable, pKey, abid)
endfunction
function YDWESaveAbilityIDByString takes string pTable,string pKey,integer abid returns nothing
    call SaveInteger(YDHT, StringHash(pTable), StringHash(pKey), abid)
endfunction
function YDWEGetAbilityIDByInteger takes integer pTable,integer pKey returns integer
    return LoadInteger(YDHT, pTable, pKey)
endfunction
function YDWEGetAbilityIDByString takes string pTable,string pKey returns integer
    return LoadInteger(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Player
function YDWESavePlayerByInteger takes integer pTable,integer pKey,player p returns nothing
    call SavePlayerHandle(YDHT, pTable, pKey, p)
endfunction
function YDWESavePlayerByString takes string pTable,string pKey,player p returns nothing
    call SavePlayerHandle(YDHT, StringHash(pTable), StringHash(pKey), p)
endfunction
function YDWEGetPlayerByInteger takes integer pTable,integer pKey returns player
    return LoadPlayerHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetPlayerByString takes string pTable,string pKey returns player
    return LoadPlayerHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Item
function YDWESaveItemByInteger takes integer pTable,integer pKey,item it returns nothing
    call SaveItemHandle(YDHT, pTable, pKey, it)
endfunction
function YDWESaveItemByString takes string pTable,string pKey,item it returns nothing
    call SaveItemHandle(YDHT, StringHash(pTable), StringHash(pKey), it)
endfunction
function YDWEGetItemByInteger takes integer pTable,integer pKey returns item
    return LoadItemHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetItemByString takes string pTable,string pKey returns item
    return LoadItemHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert ItemID
function YDWESaveItemIDByInteger takes integer pTable,integer pKey,integer itid returns nothing
    call SaveInteger(YDHT, pTable, pKey, itid)
endfunction
function YDWESaveItemIDByString takes string pTable,string pKey,integer itid returns nothing
    call SaveInteger(YDHT, StringHash(pTable), StringHash(pKey), itid)
endfunction
function YDWEGetItemIDByInteger takes integer pTable,integer pKey returns integer
    return LoadInteger(YDHT, pTable, pKey)
endfunction
function YDWEGetItemIDByString takes string pTable,string pKey returns integer
    return LoadInteger(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Timer
function YDWESaveTimerByInteger takes integer pTable,integer pKey,timer t returns nothing
    call SaveTimerHandle(YDHT, pTable, pKey, t)
endfunction
function YDWESaveTimerByString takes string pTable,string pKey,timer t returns nothing
    call SaveTimerHandle(YDHT, StringHash(pTable), StringHash(pKey), t)
endfunction
function YDWEGetTimerByInteger takes integer pTable,integer pKey returns timer
    return LoadTimerHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTimerByString takes string pTable,string pKey returns timer
    return LoadTimerHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Trigger
function YDWESaveTriggerByInteger takes integer pTable,integer pKey,trigger trg returns nothing
    call SaveTriggerHandle(YDHT, pTable, pKey, trg)
endfunction
function YDWESaveTriggerByString takes string pTable,string pKey,trigger trg returns nothing
    call SaveTriggerHandle(YDHT, StringHash(pTable), StringHash(pKey), trg)
endfunction
function YDWEGetTriggerByInteger takes integer pTable,integer pKey returns trigger
    return LoadTriggerHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTriggerByString takes string pTable,string pKey returns trigger
    return LoadTriggerHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Location
function YDWESaveLocationByInteger takes integer pTable,integer pKey,location pt returns nothing
    call SaveLocationHandle(YDHT, pTable, pKey, pt)
endfunction
function YDWESaveLocationByString takes string pTable,string pKey,location pt returns nothing
    call SaveLocationHandle(YDHT, StringHash(pTable), StringHash(pKey), pt)
endfunction
function YDWEGetLocationByInteger takes integer pTable,integer pKey returns location
    return LoadLocationHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetLocationByString takes string pTable,string pKey returns location
    return LoadLocationHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Group
function YDWESaveGroupByInteger takes integer pTable,integer pKey,group g returns nothing
    call SaveGroupHandle(YDHT, pTable, pKey, g)
endfunction
function YDWESaveGroupByString takes string pTable,string pKey,group g returns nothing
    call SaveGroupHandle(YDHT, StringHash(pTable), StringHash(pKey), g)
endfunction
function YDWEGetGroupByInteger takes integer pTable,integer pKey returns group
    return LoadGroupHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetGroupByString takes string pTable,string pKey returns group
    return LoadGroupHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Multiboard
function YDWESaveMultiboardByInteger takes integer pTable,integer pKey,multiboard m returns nothing
    call SaveMultiboardHandle(YDHT, pTable, pKey, m)
endfunction
function YDWESaveMultiboardByString takes string pTable,string pKey,multiboard m returns nothing
    call SaveMultiboardHandle(YDHT, StringHash(pTable), StringHash(pKey), m)
endfunction
function YDWEGetMultiboardByInteger takes integer pTable,integer pKey returns multiboard
    return LoadMultiboardHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetMultiboardByString takes string pTable,string pKey returns multiboard
    return LoadMultiboardHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert MultiboardItem
function YDWESaveMultiboardItemByInteger takes integer pTable,integer pKey,multiboarditem mt returns nothing
    call SaveMultiboardItemHandle(YDHT, pTable, pKey, mt)
endfunction
function YDWESaveMultiboardItemByString takes string pTable,string pKey,multiboarditem mt returns nothing
    call SaveMultiboardItemHandle(YDHT, StringHash(pTable), StringHash(pKey), mt)
endfunction
function YDWEGetMultiboardItemByInteger takes integer pTable,integer pKey returns multiboarditem
    return LoadMultiboardItemHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetMultiboardItemByString takes string pTable,string pKey returns multiboarditem
    return LoadMultiboardItemHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert TextTag
function YDWESaveTextTagByInteger takes integer pTable,integer pKey,texttag tt returns nothing
    call SaveTextTagHandle(YDHT, pTable, pKey, tt)
endfunction
function YDWESaveTextTagByString takes string pTable,string pKey,texttag tt returns nothing
    call SaveTextTagHandle(YDHT, StringHash(pTable), StringHash(pKey), tt)
endfunction
function YDWEGetTextTagByInteger takes integer pTable,integer pKey returns texttag
    return LoadTextTagHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTextTagByString takes string pTable,string pKey returns texttag
    return LoadTextTagHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Lightning
function YDWESaveLightningByInteger takes integer pTable,integer pKey,lightning ln returns nothing
    call SaveLightningHandle(YDHT, pTable, pKey, ln)
endfunction
function YDWESaveLightningByString takes string pTable,string pKey,lightning ln returns nothing
    call SaveLightningHandle(YDHT, StringHash(pTable), StringHash(pKey), ln)
endfunction
function YDWEGetLightningByInteger takes integer pTable,integer pKey returns lightning
    return LoadLightningHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetLightningByString takes string pTable,string pKey returns lightning
    return LoadLightningHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Region
function YDWESaveRegionByInteger takes integer pTable,integer pKey,region rn returns nothing
    call SaveRegionHandle(YDHT, pTable, pKey, rn)
endfunction
function YDWESaveRegionByString takes string pTable,string pKey,region rt returns nothing
    call SaveRegionHandle(YDHT, StringHash(pTable), StringHash(pKey), rt)
endfunction
function YDWEGetRegionByInteger takes integer pTable,integer pKey returns region
    return LoadRegionHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetRegionByString takes string pTable,string pKey returns region
    return LoadRegionHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Rect
function YDWESaveRectByInteger takes integer pTable,integer pKey,rect rn returns nothing
    call SaveRectHandle(YDHT, pTable, pKey, rn)
endfunction
function YDWESaveRectByString takes string pTable,string pKey,rect rt returns nothing
    call SaveRectHandle(YDHT, StringHash(pTable), StringHash(pKey), rt)
endfunction
function YDWEGetRectByInteger takes integer pTable,integer pKey returns rect
    return LoadRectHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetRectByString takes string pTable,string pKey returns rect
    return LoadRectHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Leaderboard
function YDWESaveLeaderboardByInteger takes integer pTable,integer pKey,leaderboard lb returns nothing
    call SaveLeaderboardHandle(YDHT, pTable, pKey, lb)
endfunction
function YDWESaveLeaderboardByString takes string pTable,string pKey,leaderboard lb returns nothing
    call SaveLeaderboardHandle(YDHT, StringHash(pTable), StringHash(pKey), lb)
endfunction
function YDWEGetLeaderboardByInteger takes integer pTable,integer pKey returns leaderboard
    return LoadLeaderboardHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetLeaderboardByString takes string pTable,string pKey returns leaderboard
    return LoadLeaderboardHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Effect
function YDWESaveEffectByInteger takes integer pTable,integer pKey,effect e returns nothing
    call SaveEffectHandle(YDHT, pTable, pKey, e)
endfunction
function YDWESaveEffectByString takes string pTable,string pKey,effect e returns nothing
    call SaveEffectHandle(YDHT, StringHash(pTable), StringHash(pKey), e)
endfunction
function YDWEGetEffectByInteger takes integer pTable,integer pKey returns effect
    return LoadEffectHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetEffectByString takes string pTable,string pKey returns effect
    return LoadEffectHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert Destructable
function YDWESaveDestructableByInteger takes integer pTable,integer pKey,destructable da returns nothing
    call SaveDestructableHandle(YDHT, pTable, pKey, da)
endfunction
function YDWESaveDestructableByString takes string pTable,string pKey,destructable da returns nothing
    call SaveDestructableHandle(YDHT, StringHash(pTable), StringHash(pKey), da)
endfunction
function YDWEGetDestructableByInteger takes integer pTable,integer pKey returns destructable
    return LoadDestructableHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetDestructableByString takes string pTable,string pKey returns destructable
    return LoadDestructableHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert triggercondition
function YDWESaveTriggerConditionByInteger takes integer pTable,integer pKey,triggercondition tc returns nothing
    call SaveTriggerConditionHandle(YDHT, pTable, pKey, tc)
endfunction
function YDWESaveTriggerConditionByString takes string pTable,string pKey,triggercondition tc returns nothing
    call SaveTriggerConditionHandle(YDHT, StringHash(pTable), StringHash(pKey), tc)
endfunction
function YDWEGetTriggerConditionByInteger takes integer pTable,integer pKey returns triggercondition
    return LoadTriggerConditionHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTriggerConditionByString takes string pTable,string pKey returns triggercondition
    return LoadTriggerConditionHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert triggeraction
function YDWESaveTriggerActionByInteger takes integer pTable,integer pKey,triggeraction ta returns nothing
    call SaveTriggerActionHandle(YDHT, pTable, pKey, ta)
endfunction
function YDWESaveTriggerActionByString takes string pTable,string pKey,triggeraction ta returns nothing
    call SaveTriggerActionHandle(YDHT, StringHash(pTable), StringHash(pKey), ta)
endfunction
function YDWEGetTriggerActionByInteger takes integer pTable,integer pKey returns triggeraction
    return LoadTriggerActionHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTriggerActionByString takes string pTable,string pKey returns triggeraction
    return LoadTriggerActionHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert event
function YDWESaveTriggerEventByInteger takes integer pTable,integer pKey,event et returns nothing
    call SaveTriggerEventHandle(YDHT, pTable, pKey, et)
endfunction
function YDWESaveTriggerEventByString takes string pTable,string pKey,event et returns nothing
    call SaveTriggerEventHandle(YDHT, StringHash(pTable), StringHash(pKey), et)
endfunction
function YDWEGetTriggerEventByInteger takes integer pTable,integer pKey returns event
    return LoadTriggerEventHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTriggerEventByString takes string pTable,string pKey returns event
    return LoadTriggerEventHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert force
function YDWESaveForceByInteger takes integer pTable,integer pKey,force fc returns nothing
    call SaveForceHandle(YDHT, pTable, pKey, fc)
endfunction
function YDWESaveForceByString takes string pTable,string pKey,force fc returns nothing
    call SaveForceHandle(YDHT, StringHash(pTable), StringHash(pKey), fc)
endfunction
function YDWEGetForceByInteger takes integer pTable,integer pKey returns force
    return LoadForceHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetForceByString takes string pTable,string pKey returns force
    return LoadForceHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert boolexpr
function YDWESaveBoolexprByInteger takes integer pTable,integer pKey,boolexpr be returns nothing
    call SaveBooleanExprHandle(YDHT, pTable, pKey, be)
endfunction
function YDWESaveBoolexprByString takes string pTable,string pKey,boolexpr be returns nothing
    call SaveBooleanExprHandle(YDHT, StringHash(pTable), StringHash(pKey), be)
endfunction
function YDWEGetBoolexprByInteger takes integer pTable,integer pKey returns boolexpr
    return LoadBooleanExprHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetBoolexprByString takes string pTable,string pKey returns boolexpr
    return LoadBooleanExprHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert sound
function YDWESaveSoundByInteger takes integer pTable,integer pKey,sound sd returns nothing
    call SaveSoundHandle(YDHT, pTable, pKey, sd)
endfunction
function YDWESaveSoundByString takes string pTable,string pKey,sound sd returns nothing
    call SaveSoundHandle(YDHT, StringHash(pTable), StringHash(pKey), sd)
endfunction
function YDWEGetSoundByInteger takes integer pTable,integer pKey returns sound
    return LoadSoundHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetSoundByString takes string pTable,string pKey returns sound
    return LoadSoundHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert timerdialog
function YDWESaveTimerDialogByInteger takes integer pTable,integer pKey,timerdialog td returns nothing
    call SaveTimerDialogHandle(YDHT, pTable, pKey, td)
endfunction
function YDWESaveTimerDialogByString takes string pTable,string pKey,timerdialog td returns nothing
    call SaveTimerDialogHandle(YDHT, StringHash(pTable), StringHash(pKey), td)
endfunction
function YDWEGetTimerDialogByInteger takes integer pTable,integer pKey returns timerdialog
    return LoadTimerDialogHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTimerDialogByString takes string pTable,string pKey returns timerdialog
    return LoadTimerDialogHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert trackable
function YDWESaveTrackableByInteger takes integer pTable,integer pKey,trackable ta returns nothing
    call SaveTrackableHandle(YDHT, pTable, pKey, ta)
endfunction
function YDWESaveTrackableByString takes string pTable,string pKey,trackable ta returns nothing
    call SaveTrackableHandle(YDHT, StringHash(pTable), StringHash(pKey), ta)
endfunction
function YDWEGetTrackableByInteger takes integer pTable,integer pKey returns trackable
    return LoadTrackableHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetTrackableByString takes string pTable,string pKey returns trackable
    return LoadTrackableHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert dialog
function YDWESaveDialogByInteger takes integer pTable,integer pKey,dialog d returns nothing
    call SaveDialogHandle(YDHT, pTable, pKey, d)
endfunction
function YDWESaveDialogByString takes string pTable,string pKey,dialog d returns nothing
    call SaveDialogHandle(YDHT, StringHash(pTable), StringHash(pKey), d)
endfunction
function YDWEGetDialogByInteger takes integer pTable,integer pKey returns dialog
    return LoadDialogHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetDialogByString takes string pTable,string pKey returns dialog
    return LoadDialogHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert button
function YDWESaveButtonByInteger takes integer pTable,integer pKey,button bt returns nothing
    call SaveButtonHandle(YDHT, pTable, pKey, bt)
endfunction
function YDWESaveButtonByString takes string pTable,string pKey,button bt returns nothing
    call SaveButtonHandle(YDHT, StringHash(pTable), StringHash(pKey), bt)
endfunction
function YDWEGetButtonByInteger takes integer pTable,integer pKey returns button
    return LoadButtonHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetButtonByString takes string pTable,string pKey returns button
    return LoadButtonHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert quest
function YDWESaveQuestByInteger takes integer pTable,integer pKey,quest qt returns nothing
    call SaveQuestHandle(YDHT, pTable, pKey, qt)
endfunction
function YDWESaveQuestByString takes string pTable,string pKey,quest qt returns nothing
    call SaveQuestHandle(YDHT, StringHash(pTable), StringHash(pKey), qt)
endfunction
function YDWEGetQuestByInteger takes integer pTable,integer pKey returns quest
    return LoadQuestHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetQuestByString takes string pTable,string pKey returns quest
    return LoadQuestHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
//Covert questitem
function YDWESaveQuestItemByInteger takes integer pTable,integer pKey,questitem qi returns nothing
    call SaveQuestItemHandle(YDHT, pTable, pKey, qi)
endfunction
function YDWESaveQuestItemByString takes string pTable,string pKey,questitem qi returns nothing
    call SaveQuestItemHandle(YDHT, StringHash(pTable), StringHash(pKey), qi)
endfunction
function YDWEGetQuestItemByInteger takes integer pTable,integer pKey returns questitem
    return LoadQuestItemHandle(YDHT, pTable, pKey)
endfunction
function YDWEGetQuestItemByString takes string pTable,string pKey returns questitem
    return LoadQuestItemHandle(YDHT, StringHash(pTable), StringHash(pKey))
endfunction
function YDWES2I takes string s returns integer
    return StringHash(s)
endfunction
function YDWESaveAbilityHandleBJ takes integer AbilityID,integer key,integer missionKey,hashtable table returns nothing
    call SaveInteger(table, missionKey, key, AbilityID)
endfunction
function YDWESaveAbilityHandle takes hashtable table,integer parentKey,integer childKey,integer AbilityID returns nothing
    call SaveInteger(table, parentKey, childKey, AbilityID)
endfunction
function YDWELoadAbilityHandleBJ takes integer key,integer missionKey,hashtable table returns integer
    return LoadInteger(table, missionKey, key)
endfunction
function YDWELoadAbilityHandle takes hashtable table,integer parentKey,integer childKey returns integer
    return LoadInteger(table, parentKey, childKey)
endfunction
//===========================================================================
//返回参数
//===========================================================================
//地图边界判断
function YDWECoordinateX takes real x returns real
    return RMinBJ(RMaxBJ(x, yd_MapMinX), yd_MapMaxX)
endfunction
function YDWECoordinateY takes real y returns real
    return RMinBJ(RMaxBJ(y, yd_MapMinY), yd_MapMaxY)
endfunction
function YDWEDistanceBetweenUnitAndPoint takes unit a,location b returns real
    local real x= GetUnitX(a) - GetLocationX(b)
    local real y= GetUnitY(a) - GetLocationY(b)
    return SquareRoot(x * x + y * y)
endfunction
function YDWEAngleBetweenUnitAndPoint takes unit a,location b returns real
    return bj_RADTODEG * Atan2(GetLocationY(b) - GetUnitY(a), GetLocationX(b) - GetUnitX(a))
endfunction
function YDWEDistanceBetweenUnits takes unit a,unit b returns real
    local real x= GetUnitX(a) - GetUnitX(b)
    local real y= GetUnitY(a) - GetUnitY(b)
    return SquareRoot(x * x + y * y)
endfunction
function YDWEAngleBetweenUnits takes unit a,unit b returns real
    return bj_RADTODEG * Atan2(GetUnitY(b) - GetUnitY(a), GetUnitX(b) - GetUnitX(a))
endfunction
//生成区域
function YDWEGetRect takes real x,real y,real width,real height returns rect
    return Rect(x - width * 0.5, y - height * 0.5, x + width * 0.5, y + height * 0.5)
endfunction
//===========================================================================
//设置单位可以飞行
//===========================================================================
function YDWEFlyEnable takes unit u returns nothing
    call UnitAddAbility(u, 'Amrf')
    call UnitRemoveAbility(u, 'Amrf')
endfunction
//===========================================================================
//字符窜与ID转换
//===========================================================================
function YDWEId2S takes integer value returns string
    local string charMap=bj_AllString
    local string result= ""
    local integer remainingValue= value
    local integer charValue
    local integer byteno
    set byteno=0
    loop
        set charValue=ModuloInteger(remainingValue, 256)
        set remainingValue=remainingValue / 256
        set result=SubString(charMap, charValue, charValue + 1) + result
        set byteno=byteno + 1
        exitwhen byteno == 4
    endloop
    return result
endfunction
function YDWES2Id takes string targetstr returns integer
    local string originstr=bj_AllString
    local integer strlength=StringLength(targetstr)
    local integer a=0
local integer b=0
local integer numx=1
local integer result=0
    loop
    exitwhen b > strlength - 1
        set numx=R2I(Pow(256, strlength - 1 - b))
        set a=1
        loop
            exitwhen a > 255
            if SubString(targetstr, b, b + 1) == SubString(originstr, a, a + 1) then
                set result=result + a * numx
                set a=256
            endif
            set a=a + 1
        endloop
        set b=b + 1
    endloop
    return result
endfunction
function YDWES2UnitId takes string targetstr returns integer
    return YDWES2Id(targetstr)
endfunction
function YDWES2ItemId takes string targetstr returns integer
    return YDWES2Id(targetstr)
endfunction
function GetLastAbilityCastingUnit takes nothing returns unit
    return bj_lastAbilityCastingUnit
endfunction
function GetLastAbilityTargetUnit takes nothing returns unit
    return bj_lastAbilityTargetUnit
endfunction
function YDWESetMapLimitCoordinate takes real MinX,real MaxX,real MinY,real MaxY returns nothing
    set yd_MapMaxX=MaxX
    set yd_MapMinX=MinX
    set yd_MapMaxY=MaxY
    set yd_MapMinY=MinY
endfunction
//===========================================================================
//===========================================================================
//地图初始化
//===========================================================================
//YDWE特殊技能结束事件 
function YDWESyStemAbilityCastingOverTriggerAction takes unit hero,integer index returns nothing
 local integer i= 0
    loop
        exitwhen i >= YDWEBase__AbilityCastingOverEventNumber
        if YDWEBase__AbilityCastingOverEventType[i] == index then
            set bj_lastAbilityCastingUnit=hero
			if YDWEBase__AbilityCastingOverEventQueue[i] != null and TriggerEvaluate(YDWEBase__AbilityCastingOverEventQueue[i]) and IsTriggerEnabled(YDWEBase__AbilityCastingOverEventQueue[i]) then
				call TriggerExecute(YDWEBase__AbilityCastingOverEventQueue[i])
			endif
		endif
        set i=i + 1
    endloop
endfunction
//===========================================================================  
//YDWE技能捕捉事件 
//===========================================================================  
function YDWESyStemAbilityCastingOverRegistTrigger takes trigger trg,integer index returns nothing
	set YDWEBase__AbilityCastingOverEventQueue[YDWEBase__AbilityCastingOverEventNumber]=trg
	set YDWEBase__AbilityCastingOverEventType[YDWEBase__AbilityCastingOverEventNumber]=index
	set YDWEBase__AbilityCastingOverEventNumber=YDWEBase__AbilityCastingOverEventNumber + 1
endfunction 
//===========================================================================
//系统函数完善
//===========================================================================
function YDWECreateUnitPool takes nothing returns nothing
    set bj_lastCreatedUnitPool=CreateUnitPool()
endfunction
function YDWEPlaceRandomUnit takes unitpool up,player p,real x,real y,real face returns nothing
set bj_lastPoolAbstractedUnit=PlaceRandomUnit(up, p, x, y, face)
endfunction
function YDWEGetLastUnitPool takes nothing returns unitpool
    return bj_lastCreatedUnitPool
endfunction
function YDWEGetLastPoolAbstractedUnit takes nothing returns unit
    return bj_lastPoolAbstractedUnit
endfunction
function YDWECreateItemPool takes nothing returns nothing
    set bj_lastCreatedItemPool=CreateItemPool()
endfunction
function YDWEPlaceRandomItem takes itempool ip,real x,real y returns nothing
set bj_lastPoolAbstractedItem=PlaceRandomItem(ip, x, y)
endfunction
function YDWEGetLastItemPool takes nothing returns itempool
    return bj_lastCreatedItemPool
endfunction
function YDWEGetLastPoolAbstractedItem takes nothing returns item
    return bj_lastPoolAbstractedItem
endfunction
function YDWESetAttackDamageWeaponType takes attacktype at,damagetype dt,weapontype wt returns nothing
    set bj_lastSetAttackType=at
    set bj_lastSetDamageType=dt
    set bj_lastSetWeaponType=wt
endfunction
//unitpool bj_lastCreatedPool=null
//unit bj_lastPoolAbstractedUnit=null
function YDWEGetPlayerColorString takes player p,string s returns string
    return YDWEBase__yd_PlayerColor[GetHandleId(GetPlayerColor(p))] + s + "|r"
endfunction
//===========================================================================
//===========================================================================
//系统函数补充
//===========================================================================
//===========================================================================
function YDWEGetUnitItemSoftId takes unit hero,item it returns integer
    local integer i= 0
    loop
         exitwhen i > 5
         if UnitItemInSlot(hero, i) == it then
            return i + 1
         endif
         set i=i + 1
    endloop
    return 0
endfunction
//===========================================================================
//===========================================================================
//地图初始化
//===========================================================================
//===========================================================================
//显示版本
function YDWEVersion_Display takes nothing returns boolean
    call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 30, "|cFF1E90FF当前编辑器版本为： |r|cFF00FF00YDWE 1.32.12.200106")
    return false
endfunction
function YDWEVersion_Init takes nothing returns nothing
    local trigger t= CreateTrigger()
    local integer i= 0
    loop
        exitwhen i == 12
        call TriggerRegisterPlayerChatEvent(t, Player(i), "YDWE Version", true)
        set i=i + 1
    endloop
    call TriggerAddCondition(t, Condition(function YDWEVersion_Display))
    set t=null
endfunction
function InitializeYD takes nothing returns nothing
     set YDHT=InitHashtable()
	//=================设置变量=====================
	set yd_MapMinX=GetCameraBoundMinX() - GetCameraMargin(CAMERA_MARGIN_LEFT)
	set yd_MapMinY=GetCameraBoundMinY() - GetCameraMargin(CAMERA_MARGIN_BOTTOM)
	set yd_MapMaxX=GetCameraBoundMaxX() + GetCameraMargin(CAMERA_MARGIN_RIGHT)
	set yd_MapMaxY=GetCameraBoundMaxY() + GetCameraMargin(CAMERA_MARGIN_TOP)
	
    set YDWEBase__yd_PlayerColor[0]="|cFFFF0303"
    set YDWEBase__yd_PlayerColor[1]="|cFF0042FF"
    set YDWEBase__yd_PlayerColor[2]="|cFF1CE6B9"
    set YDWEBase__yd_PlayerColor[3]="|cFF540081"
    set YDWEBase__yd_PlayerColor[4]="|cFFFFFC01"
    set YDWEBase__yd_PlayerColor[5]="|cFFFE8A0E"
    set YDWEBase__yd_PlayerColor[6]="|cFF20C000"
    set YDWEBase__yd_PlayerColor[7]="|cFFE55BB0"
    set YDWEBase__yd_PlayerColor[8]="|cFF959697"
    set YDWEBase__yd_PlayerColor[9]="|cFF7EBFF1"
    set YDWEBase__yd_PlayerColor[10]="|cFF106246"
    set YDWEBase__yd_PlayerColor[11]="|cFF4E2A04"
    set YDWEBase__yd_PlayerColor[12]="|cFF282828"
    set YDWEBase__yd_PlayerColor[13]="|cFF282828"
    set YDWEBase__yd_PlayerColor[14]="|cFF282828"
    set YDWEBase__yd_PlayerColor[15]="|cFF282828"
    //=================显示版本=====================
    call YDWEVersion_Init()
endfunction

//library YDWEBase ends
//library YDWEPlaySoundNull:
function YDWEPlaySoundNull takes string soundName returns nothing
    local sound soundHandle= CreateSound(soundName, false, false, true, 12700, 12700, "")
    call StartSound(soundHandle)
    call KillSoundWhenDone(soundHandle)
    set soundHandle=null
endfunction

//library YDWEPlaySoundNull ends
//library YDWEPolledWaitNull:
function YDWEPolledWaitNull takes real duration returns nothing
    local timer t
    local real timeRemaining
    if ( duration > 0 ) then
        set t=CreateTimer()
        call TimerStart(t, duration, false, null)
        loop
            set timeRemaining=TimerGetRemaining(t)
            exitwhen timeRemaining <= 0
            // If we have a bit of time left, skip past 10% of the remaining
            // duration instead of checking every interval, to minimize the
            // polling on long waits.
            if ( timeRemaining > bj_POLLED_WAIT_SKIP_THRESHOLD ) then
                call TriggerSleepAction(0.1 * timeRemaining)
            else
                call TriggerSleepAction(bj_POLLED_WAIT_INTERVAL)
            endif
        endloop
        call DestroyTimer(t)
    endif
    set t=null
endfunction

//library YDWEPolledWaitNull ends
//library YDWESetUnitFacingToFaceLocTimedNull:
function YDWESetUnitFacingToFaceLocTimedNull takes unit whichUnit,location target,real duration returns nothing
    local location unitLoc= GetUnitLoc(whichUnit)
    call SetUnitFacingTimed(whichUnit, AngleBetweenPoints(unitLoc, target), duration)
    call RemoveLocation(unitLoc)
    set unitLoc=null
endfunction

//library YDWESetUnitFacingToFaceLocTimedNull ends
//library Common:
    //常量
    function Debug takes string debugtype,string msg returns nothing
        if IsMirage then
            call DisplayTimedTextToPlayer(LocalPlayer, 0, 0, 60, msg)
        endif
    endfunction
    function GetBuffSlkData takes integer Id,string data returns string
        set SlkType="buff"
        set SlkdataType=data
        return AbilityId2String(Id)
    endfunction
    
    //与lua交互获得Slk数据
    function GetUnitSlkData takes integer Id,string data returns string
        set SlkType="unit"
        set SlkdataType=data
        return AbilityId2String(Id)
    endfunction
    //获取英雄单位的主属性 primary: 1 == str  2 == int  3 = agi 
    function GetUnitPrimaryById takes integer whichType returns string
        return GetUnitSlkData(whichType , "Primary")
    endfunction
    function GetUnitPrimary takes unit whichUnit returns string
        local integer i= GetUnitTypeId(whichUnit)
        return GetUnitSlkData(i , "Primary")
    endfunction
    function GetUnitPrimaryValue takes unit whichUnit returns integer
        local string data= GetUnitPrimary(whichUnit)
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
        local trigger trig= GetTriggeringTrigger()
        local integer iHandleId= GetHandleId(trig)
        local unit whichUnit= LoadUnitHandle(HT, iHandleId, 17)
        local integer abilityId= LoadInteger(HT, iHandleId, 59)
        local integer buffId= LoadInteger(HT, iHandleId, 60)
        local timer durTimer= LoadTimerHandle(HT, iHandleId, 10)
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
        set whichUnit=null
        set trig=null
        set durTimer=null
        return false
    endfunction
    function UnitAddAbilityTimed takes unit whichUnit,integer abilityId,integer level,real duration,integer buffId,integer i returns nothing
        local trigger trig
        local integer iHandleId
        local real remaining
        local timer durTimer
        if not UnitAlive(whichUnit) then
            return
        endif
        if HaveSavedHandle(HT, GetHandleId(whichUnit), 0 - abilityId) then
            set trig=LoadTriggerHandle(HT, GetHandleId(whichUnit), 0 - abilityId)
            set iHandleId=GetHandleId(trig)
            set durTimer=LoadTimerHandle(HT, iHandleId, 10)
        else
            set trig=CreateTrigger()
            set iHandleId=GetHandleId(trig)
            set durTimer=CreateTimer()
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
        set remaining=TimerGetRemaining(durTimer)
        if remaining < duration then
            call TimerStart(durTimer, duration, false, null)
        endif
        call UnitAddPermanentAbilitySetlevel(whichUnit , abilityId , level)
        set trig=null
        set durTimer=null
    endfunction
    //造成伤害 脚本中除了普攻以外的伤害都由此造成
    function DamageUnit takes unit whichUnit,unit target,integer Type,real amount returns nothing
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
        local integer uh= GetHandleId(u)
        local timer t= null
        if HaveSavedHandle(UnitKeyBuff, uh, UNITBUFF_STUN) then
            set t=LoadTimerHandle(UnitKeyBuff, uh, UNITBUFF_STUN)
            set h=GetHandleId(t)
            call RemoveSavedHandle(UnitKeyBuff, uh, UNITBUFF_STUN)
            call RemoveSavedHandle(HT, h, 0)
            call DestroyTimer(t)
            call EXPauseUnit(u, false) //此函数内部自带计数
call UnitRemoveAbility(u, 'Aasl')
            call UnitRemoveAbility(u, 'BPSE')
            set t=null
            return true
        endif
        return false
    endfunction
    function UnitStun_Actions takes nothing returns nothing
        local timer t= GetExpiredTimer()
        local integer h= GetHandleId(t)
        local unit u= LoadUnitHandle(HT, h, 0)
        local integer uh= GetHandleId(u)
        //call SaveInteger(UnitKeyBuff, uh, UNITBUFF_STUN,  LoadInteger(UnitKeyBuff, uh, UNITBUFF_STUN) - 1 )
        call RemoveSavedHandle(UnitKeyBuff, uh, UNITBUFF_STUN)
        call RemoveSavedHandle(HT, h, 0)
        call DestroyTimer(t)
        call EXPauseUnit(u, false) //此函数内部自带计数
call UnitRemoveAbility(u, 'Aasl')
        call UnitRemoveAbility(u, 'BPSE')
        set t=null
        set u=null
    endfunction
    //单位、持续时间、是否无视魔免
    function UnitSetStun takes unit u,real dur returns boolean
        local timer t
        local integer h= GetHandleId(u)
        local real time= 0
        if HaveSavedHandle(UnitKeyBuff, h, UNITBUFF_STUN) then
            set t=LoadTimerHandle(UnitKeyBuff, h, UNITBUFF_STUN)
            set time=TimerGetRemaining(t)
        else
            set t=CreateTimer()
            call EXPauseUnit(u, true)
            //call SaveInteger(UnitKeyBuff, h, UNITBUFF_STUN, LoadInteger(UnitKeyBuff, h, UNITBUFF_STUN) + 1)
            call UnitAddAbility(u, 'Aasl')
            call UnitMakeAbilityPermanent(u, true, 'Aasl')
            call SaveTimerHandle(UnitKeyBuff, h, UNITBUFF_STUN, t)
            call SaveUnitHandle(HT, GetHandleId(t), 0, u)
        endif
        if time < dur then
            set time=dur
        endif
        if time != 0 then
            call TimerStart(t, time, false, function UnitStun_Actions)
        endif
        set t=null
        return true
    endfunction
    //封装了一层本质上是使用UnitSetStun 参数b为是否无视魔法免疫
    function M_UnitSetStun takes unit u,real dur,real herodur,boolean b returns boolean
        if IsUnitType(u, UNIT_TYPE_MAGIC_IMMUNE) and not b then //检查是否魔免
            return false
        endif
        if GetUnitAbilityLevel(u, 'AHer') == 1 then //如果单位为英雄 那么就会有此技能
set dur=herodur
        endif
        return UnitSetStun(u , dur)
    endfunction
    
    //移除单位枷锁
    function UnitRemoveLeash takes unit u,integer abid,integer buffId returns nothing
	
    endfunction
    //GetTriggerEventId() == EVENT_UNIT_SPELL_ENDCAST and GetSpellAbilityId() == LoadInteger(HT, h, 50)//
    //似乎不需要记录技能Id
    function UnitSetLeash_Actions takes nothing returns boolean
        local trigger t= GetTriggeringTrigger()
        local integer h= GetHandleId(t)
        local unit u= LoadUnitHandle(HT, h, 1)
        local unit target= LoadUnitHandle(HT, h, 0)
        local integer c= GetTriggerEvalCount(t)
        local real damage
        local eventid trigEventId= GetTriggerEventId()
        //时间到期 或 Buff等级为0 或 单位死亡
        if c == LoadInteger(HT, h, 30) or GetUnitAbilityLevel(target, LoadInteger(HT, h, 2)) == 0 or trigEventId == EVENT_WIDGET_DEATH or ( trigEventId == EVENT_UNIT_SPELL_ENDCAST and GetSpellAbilityId() == LoadInteger(HT, h, 55) ) then
            call DestroyLightning(LoadLightningHandle(HT, h, 10))
            call EXPauseUnit(target, false)
            call UnitRemoveAbility(target, LoadInteger(HT, h, 1))
            call UnitRemoveAbility(target, LoadInteger(HT, h, 2))
            call FlushChildHashtable(HT, h)
            call ClearTrigger(t)
        else
            if HaveSavedHandle(HT, h, 10) then
                call MoveLightning(LoadLightningHandle(HT, h, 10), true, GetUnitX(u), GetUnitY(u), GetUnitX(target), GetUnitY(target))
                if ModuloInteger(c, 20) == 1 then //伤害单位
set damage=LoadReal(HT, h, 30)
                    if damage != 0 then
                        call DamageUnit(u , target , 1 , damage) //枷锁只会造成法术攻击 魔法伤害
endif
                endif
            else
                set damage=LoadReal(HT, h, 30)
                if damage != 0 then
                    call DamageUnit(u , target , 1 , damage) //如果没存闪电效果则每次回调造成一次伤害
endif
            endif
        endif
        set trigEventId=null
        set t=null
        set target=null
        set u=null
        return false
    endfunction
    //关于单位枷锁，Buff的叠加类型为 同类型Buff重复释放刷新持续时间。
    //codeName填 "_" 则不会有闪电效果 如果需要单位持续施法，使用UnitSetLeashByAbility。
    function UnitSetLeash takes unit spellUnit,unit targetUnit,string codeName,integer spellAbility,integer abilityId,integer buffId,real dur,real herodur,real damage,boolean ignoreMagicImmunes returns boolean
        local integer h
        local trigger t
        local real time= 0.
        if IsUnitType(targetUnit, UNIT_TYPE_MAGIC_IMMUNE) and not ignoreMagicImmunes then
            return false
        endif
        set h=GetHandleId(targetUnit)
        if GetUnitAbilityLevel(targetUnit, 'AHer') == 1 then
            set dur=herodur
        endif
        if GetUnitAbilityLevel(targetUnit, buffId) == 1 then
            set t=LoadTriggerHandle(UnitKeyBuff, h, Leash + buffId) //防止buff的key冲突所以加一下
        else
            call EXPauseUnit(targetUnit, true)
            call SaveInteger(UnitKeyBuff, h, UNITBUFF_STUN, LoadInteger(UnitKeyBuff, h, UNITBUFF_STUN) + 1)
            set t=CreateTrigger()
            call TriggerAddCondition(t, Condition(function UnitSetLeash_Actions))
            call SaveTriggerHandle(UnitKeyBuff, h, Leash + buffId, t)
            set h=GetHandleId(t)
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
            call SaveInteger(HT, h, 30, R2I(dur / LeashFrame)) //此项为最大赋值次数(持续时间)  dur / (LeashFrame)
endif
        if time < dur then
            set time=dur
        endif
        if time != 0 then
            call TriggerRegisterDeathEvent(t, spellUnit)
            call TriggerRegisterDeathEvent(t, targetUnit)
        endif
        set t=null
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
        local trigger trig= GetTriggeringTrigger()
        local integer iHandleId= GetHandleId(trig)
        local unit whichUnit= LoadUnitHandle(HT, iHandleId, 0)
        call UnitRemoveAbility(whichUnit, 'Amai')
        set trig=null
        return false
    endfunction
    function UnitSetMagicImmunity takes unit whichUnit,real time returns nothing
        local integer iHandleId= GetHandleId(whichUnit)
        local trigger trig= LoadTriggerHandle(UnitKeyBuff, iHandleId, MagicImmunity)
        local real elapsed
        if trig == null then
            set trig=CreateTrigger()
            set iHandleId=GetHandleId(trig)
            call UnitAddPermanentAbility(whichUnit , 'Amai')
            call UnitMakeAbilityPermanent(whichUnit, true, 'Amim')
            call TriggerRegisterTimerEvent(trig, time, false)
            call TriggerAddCondition(trig, Condition(function UnitSetMagicImmunityRemove))
            call SaveUnitHandle(HT, iHandleId, 0, whichUnit)
            call SaveReal(HT, iHandleId, 0, time + TimerGetElapsed(GameTimer))
        else
            set iHandleId=GetHandleId(trig)
            set elapsed=TimerGetElapsed(GameTimer) - LoadReal(HT, iHandleId, 0)
            if elapsed < time then
                call FlushChildHashtable(HT, iHandleId)
                call ClearTrigger(trig)
                call RemoveSavedHandle(UnitKeyBuff, GetHandleId(whichUnit), MagicImmunity)
                call UnitSetMagicImmunity(whichUnit , time)
            endif
        endif
        set trig=null
    endfunction
    //注意filterId的值不宜过高,Jass的数值最大值为8191
    //每个filterId可以注册200个事件,通常不会用那么多
    //给触发器注册任意单位受伤事件
    //通常一个攻击特效filterId用1, (敌对,非建筑)CommonAttackEffectFilter
    function TriggerRegisterAnyUnitDamagedEvent takes trigger trig,integer filterId returns nothing
        local integer id= filterId * 200
        if trig == null then
            return
        endif
        set DamageEventQueue[id + DamageEventNumber[filterId]]=trig
        set DamageEventNumber[filterId]=id + DamageEventNumber[filterId] + 1
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
        set EffectIsEnabled[LoadInteger(HT, GetHandleId(GetExpiredTimer()), 0)]=false
    endfunction
    //在一定时间内激活暴击 key的值不能为0  time为0则是永久激活
    function EnabledAttackEffect takes integer key,real time returns nothing
        if not EffectIsEnabled[0] then
            set EffectIsEnabled[0]=true
        endif
        set EffectIsEnabled[key]=true
        if time == 0 then
            return
        elseif EffectEnabledTimer[key] == null then
            set EffectEnabledTimer[key]=CreateTimer()
            call SaveInteger(HT, GetHandleId(EffectEnabledTimer[key]), 0, key)
        endif
        if TimerGetRemaining(EffectEnabledTimer[key]) < time then
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
    function KillDestructablesInCircle takes real x,real y,real d returns nothing
        call SetRect(RectDummy, x - d, y - d, x + d, y + d)
        call EnumDestructablesInRect(RectDummy, null, function KillDestructablesInCircle_Actions)
    endfunction
    function GetDestructablesAmountInCircle_Actions takes nothing returns nothing
        if GetDestructableLife(GetEnumDestructable()) > 0.00 then
            set Tmp_DummyAmount=Tmp_DummyAmount + 1
        endif
    endfunction
    function GetDestructablesAmountInCircle takes real x,real y,real d returns integer
        call SetRect(RectDummy, x - d, y - d, x + d, y + d)
        set Tmp_DummyAmount=0
        call EnumDestructablesInRect(RectDummy, null, function GetDestructablesAmountInCircle_Actions)
        return Tmp_DummyAmount
    endfunction
    function FindNearestDestructable takes nothing returns nothing
        local destructable enumDestructable= GetEnumDestructable()
        local real x= GetWidgetX(enumDestructable)
        local real y= GetWidgetY(enumDestructable)
        local real dis= GetDistanceBetween(Tmp_GetNearestDestructableUnitX , Tmp_GetNearestDestructableUnitY , x , y)
	
        if dis > Tmp_NearestDestructableDistance then
            set Tmp_NearestDestructableDistance=dis
            set Tmp_Destructable=enumDestructable
        endif
        set Tmp_Destructable=enumDestructable
        set enumDestructable=null
    endfunction
    // 获取单位范围内的最近可破坏物
    function GetNearestDestructable takes unit whichUnit,real radius returns destructable
        local real x= GetUnitX(whichUnit)
        local real y= GetUnitY(whichUnit)
        set Tmp_GetNearestDestructableUnitX=x
        set Tmp_GetNearestDestructableUnitY=y
        call SetRect(RectDummy, x - radius, y - radius, x + radius, y + radius)
        set Tmp_Destructable=null
        set Tmp_NearestDestructableDistance=0.
        call EnumDestructablesInRect(RectDummy, null, function FindNearestDestructable)
        return Tmp_Destructable
    endfunction
    //逆变身 使用后需要刷新一下单位的基础攻击力
    function YDWEUnitTransform takes unit u,integer targetid returns nothing
        local integer i= GetUnitTypeId(u)
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
    function IssueImmediateAbilityById takes unit whichUnit,integer abilityId returns nothing
        if HaveSavedString(ObjectData, SPELL_EFFECT, abilityId) then
            set Tmp_SpellAbilityUnit=whichUnit
            call DzExecuteFunc(LoadStr(ObjectData, SPELL_EFFECT, abilityId))
        endif
    endfunction
    function IssueTargetOrderByIdWait0S_CallBack takes nothing returns boolean
        local trigger trig= CreateTrigger()
        local integer iHandleId= GetHandleId(trig)
        local integer order= LoadInteger(HT, iHandleId, 0)
        local unit whichUnit= LoadUnitHandle(HT, iHandleId, 0)
        local widget targetWidget= LoadWidgetHandle(HT, iHandleId, 1)
        call IssueTargetOrderById(whichUnit, order, targetWidget)
        call FlushChildHashtable(HT, iHandleId)
        call ClearTrigger(trig)
        set trig=null
        set whichUnit=null
        set targetWidget=null
        return false
    endfunction
    //延迟0秒后再发布技能,单位事件中直接发动可能会卡住
    function IssueTargetOrderByIdWait0S takes unit whichUnit,integer order,widget targetWidget returns nothing
        local trigger trig= CreateTrigger()
        local integer iHandleId= GetHandleId(trig)
        call TriggerRegisterTimerEvent(trig, 0., false)
        call TriggerAddCondition(trig, Condition(function IssueTargetOrderByIdWait0S_CallBack))
        call SaveInteger(HT, iHandleId, 0, order)
        call SaveUnitHandle(HT, iHandleId, 0, whichUnit)
        call SaveWidgetHandle(HT, iHandleId, 1, targetWidget)
        set trig=null
    endfunction
    
    //不推荐使用
    //本质上只是使用两次逆变身来刷新，whichType则是刷新后的状态
    function RefreshUnitModelById takes unit whichUnit,integer whichType returns nothing
        call YDWEUnitTransform(whichUnit , 'Uwar')
        call YDWEUnitTransform(whichUnit , whichType)
    endfunction
    //与上面不同的是，此函数不会改变单位类别，始终会变回原来的类别
    function RefreshUnitModel takes unit whichUnit returns nothing
        local integer unitType= GetUnitTypeId(whichUnit)
        call YDWEUnitTransform(whichUnit , 'Uwar')
        call YDWEUnitTransform(whichUnit , unitType)
    endfunction
    //设置单位阴影，参数可填 Shadow 或 _ ,会进行一次逆变身
    function SetUnitShadow takes unit whichUnit,string modelName returns nothing
        call EXSetUnitString(GetUnitTypeId(whichUnit), 0x13, modelName)
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
    function SummonUnit takes unit whichUnit,integer iUnitTypeId,real x,real y,real face,integer iBuffId,real dur returns unit
        local unit hSummonedUnit= CreateUnit(GetOwningPlayer(whichUnit), iUnitTypeId, x, y, face)
        call UnitAddType(hSummonedUnit, UNIT_TYPE_SUMMONED)
        call SaveUnitHandle(HT, GetHandleId(hSummonedUnit), KEY_MASTERUNIT, whichUnit)
        if dur > 0 then
            if iBuffId == 0 then
                call Debug("Error" , "错误的BuffId，召唤单位" + GetObjectName(iUnitTypeId) + "时没有正确的生命周期BuffId。")
            else
                call UnitApplyTimedLife(hSummonedUnit, iBuffId, dur)
            endif
        endif
        set LastSummonedUnit=hSummonedUnit
        set hSummonedUnit=null
        return LastSummonedUnit
    endfunction
    // 一般对蝗虫马甲单位或召唤单位使用 获取召唤他的单位之类
    function GetMasterUnit takes unit whichUnit returns unit
        set LastGetMasterUnit=LoadUnitHandle(HT, GetHandleId(whichUnit), KEY_MASTERUNIT)
        if LastGetMasterUnit == null then
            return null
        endif
        return LastGetMasterUnit
    endfunction
    function UnitDelayStandActions takes nothing returns nothing
        local timer hTimer= GetExpiredTimer()
        local integer iHandleId= GetHandleId(hTimer)
        local unit whichUnit= LoadUnitHandle(HT, iHandleId, 0)
        if UnitAlive(whichUnit) then
            call SetUnitAnimation(whichUnit, "Stand")
        endif
        call RemoveSavedHandle(UnitKeyBuff, GetHandleId(whichUnit), UnitDelayedStandingKey)
        call DestroyTimer(hTimer)
        set hTimer=null
        set whichUnit=null
    endfunction
    // 让单位在等待一段时间后播放Stand动作 重复使用会覆盖
    function UnitDelayedStanding takes unit whichUnit,real dur returns nothing
        local integer iHandleId= GetHandleId(whichUnit)
        local timer hTimer= LoadTimerHandle(UnitKeyBuff, iHandleId, UnitDelayedStandingKey)
        if hTimer == null then
            set hTimer=CreateTimer()
            call SaveUnitHandle(HT, GetHandleId(hTimer), 0, whichUnit)
            call SaveTimerHandle(UnitKeyBuff, iHandleId, UnitDelayedStandingKey, hTimer)
        endif
        call TimerStart(hTimer, dur, false, function UnitDelayStandActions)
        set hTimer=null
    endfunction
    // 创建一个绑定单位技能的触发器(使用重修之书后将删除此触发器) 多用于某些给单一单位注册的触发器
    function CreateUnitAbilityTrigger takes unit whichUnit,integer iAbilityId returns trigger
        local integer iHandleId= GetHandleId(whichUnit)
        set bj_lastCreatedTrigger=CreateTrigger()
        call SaveTriggerHandle(UnitAbilityTrigger, iHandleId, iAbilityId, bj_lastCreatedTrigger)
        return bj_lastCreatedTrigger
    endfunction
    
    //检查玩家对单位的可见性
    function UnitVisibleToPlayer takes unit whichUnit,player whichPlayer returns boolean
return IsUnitVisible(whichUnit, whichPlayer) or ( IsUnitAlly(whichUnit, whichPlayer) )
    endfunction
    //***************************************************************************
    //*
    //*  Text Tag Utility Functions
    //*
    //***************************************************************************
    //暴击漂浮文字 只会出现一次
    function CriticalStrikeTextTag takes unit whichUnit,real damage returns nothing
        local texttag t= CreateTextTag()
        call SetTextTagText(t, I2S(R2I(damage)) + "!", 0.025) //文字 字体大小
call SetTextTagPos(t, GetUnitX(whichUnit), GetUnitY(whichUnit), .0) //高度偏移
call SetTextTagColor(t, 255, 0, 0, 255)
        call SetTextTagVelocity(t, 0, .04)
        call SetTextTagFadepoint(t, 2) //淡入时间
call SetTextTagPermanent(t, false) //永久性
call SetTextTagLifespan(t, 5) //生命周期
call SetTextTagVisibility(t, UnitVisibleToPlayer(whichUnit , LocalPlayer))
        set t=null
    endfunction
    //通用漂浮文字
    function CommonTextTag takes string msg,real lifespan,unit whichUnit,real height,integer r,integer g,integer b,integer a,integer heightOffset returns nothing
        local texttag t= CreateTextTag()
        call SetTextTagText(t, msg, height) //文字 字体大小
call SetTextTagPosUnit(t, whichUnit, heightOffset) //高度偏移
call SetTextTagColor(t, r, g, b, a)
        call SetTextTagVelocity(t, 0, .0355)
        call SetTextTagFadepoint(t, 2) //淡入时间
call SetTextTagPermanent(t, false) //永久性
call SetTextTagLifespan(t, lifespan) //生命周期
//call SetTextTagVisibility(tt,TYV(U,GetLocalPlayer())or RBX(GetLocalPlayer()))
set t=null
    endfunction
    //黄金漂浮文字
    function GoldTextTag takes player sourcePlayer,unit whichUnit,integer goldAmount returns nothing
        local texttag tag
        local string effectPath= ""
        local boolean islocalPlayer= LocalPlayer == sourcePlayer
        set tag=CreateTextTag()
        if GetHandleId(tag) > 0 then
            call SetTextTagText(tag, "+" + I2S(goldAmount), .025)
            call SetTextTagPosUnit(tag, whichUnit, - 0.4)
            if islocalPlayer then
                call SetTextTagColor(tag, 255, 220, 0, 255)
            endif
            call SetTextTagVelocity(tag, 0, .03)
            call SetTextTagVisibility(tag, islocalPlayer)
            call SetTextTagFadepoint(tag, 2)
            call SetTextTagLifespan(tag, 3)
            call SetTextTagPermanent(tag, false)
        else
            call DestroyTextTag(tag)
        endif
        if islocalPlayer then
            set effectPath="UI\\Feedback\\GoldCredit\\GoldCredit.mdl"
        endif
        call DestroyEffect(AddSpecialEffectTarget(effectPath, whichUnit, "overhead"))
        set tag=null
    endfunction

//library Common ends
//library YDWESetUnitFacingToFaceUnitTimedNull:
function YDWESetUnitFacingToFaceUnitTimedNull takes unit whichUnit,unit target,real duration returns nothing
    local location unitLoc= GetUnitLoc(target)
    call YDWESetUnitFacingToFaceLocTimedNull(whichUnit , unitLoc , duration)
    call RemoveLocation(unitLoc)
    set unitLoc=null
endfunction

//library YDWESetUnitFacingToFaceUnitTimedNull ends
//library UnitStateRefresh:
    //UNIT_LIFERESTORE
    //UNIT_MANARESTORE
    //风暴之灵
    //刷新球状闪电施法需要的耗蓝
    //30 + 6%最大魔法值 作为初始耗蓝
    function RefreshAbilityCost takes unit u returns nothing
        local ability abil
        local integer i= 1
        local integer cost= 0
        if GetUnitAbilityLevel(u, 'Ast0') > 0 then //球状闪电
set abil=EXGetUnitAbility(u, 'Ast0')
            set cost=R2I(30 + .06 * GetUnitState(u, UNIT_STATE_MAX_MANA)) //30 + 6%最大魔法值
loop
                call EXSetAbilityDataInteger(abil, i, ABILITY_DATA_COST, cost)
                set i=i + 1
                exitwhen i > 3
            endloop
        endif
        set abil=null
    endfunction
    function RefreshLifeUnitRestore takes unit u returns nothing
        local integer h= GetHandleId(u)
        local integer index= LoadInteger(UnitData, h, UNIT_LIFERESTORE)
        set LifeRestoreValue[index]=( LoadReal(UnitData, h, UNIT_LIFERESTORE) + ( GetHeroStr(u, true) * 0.04 ) ) * RestoreFrame
    endfunction
    function RefreshManaUnitRestore takes unit u returns nothing
        local integer h= GetHandleId(u)
        local integer index= LoadInteger(UnitData, h, UNIT_MANARESTORE)
        set ManaRestoreValue[index]=( LoadReal(UnitData, h, UNIT_MANARESTORE) + ( GetHeroInt(u, true) * 0.03 ) ) * RestoreFrame
    endfunction
    function RefreshUnitRestore takes unit u returns nothing
        local integer h= GetHandleId(u)
        set LifeRestoreValue[LoadInteger(UnitData, h, UNIT_LIFERESTORE)]=( LoadReal(UnitData, h, UNIT_LIFERESTORE) + ( GetHeroStr(u, true) * 0.04 ) ) * RestoreFrame
        set ManaRestoreValue[LoadInteger(UnitData, h, UNIT_MANARESTORE)]=( LoadReal(UnitData, h, UNIT_MANARESTORE) + ( GetHeroInt(u, true) * 0.03 ) ) * RestoreFrame
    endfunction
    //刷新单位属性
    //call RefreshUnitArmor(u)		//刷新护甲
    //call RefreshUnitBaseAttack(u)	//刷新基础攻击力
    //call RefreshUnitRestor(u)		//刷新状态恢复
    function RefreshUnitState takes unit u returns nothing
        local integer h= GetHandleId(u)
local real value= LoadReal(UnitData, h, BONUS_ARMOR) + LoadReal(UnitData, UNIT_BASE_ARMOR, h)
        local real newValue= ( GetHeroAgi(u, true) / 6.00 ) * 1. + value
        local integer i
        call SetUnitState(u, UNIT_STATE_ARMOR, newValue)
        //刷新基础攻击力
        set value=GetUnitPrimaryValue(u)
        set newValue=value + LoadInteger(UnitData, h, UNIT_BASE_DAMAGE)
        call SetUnitState(u, UNIT_STATE_ATTACK1_DAMAGE_BASE, newValue)
        //刷新 生命/魔法恢复速度
        call RefreshUnitRestore(u)
        if IsMirage then
            call Debug("log" , GetUnitName(u) + "生命/魔法 恢复：" + R2S(LoadReal(UnitData, h, UNIT_LIFERESTORE) + GetHeroStr(u, true) * 0.04) + "/" + R2S(LoadReal(UnitData, h, UNIT_MANARESTORE) + GetHeroInt(u, true) * 0.03))
        endif
        //同时刷新面板
        //call UnitStateUpdateCallback()
    endfunction

//library UnitStateRefresh ends
//===========================================================================
// 
// 基佬之岛测试版v0.003
// 
//   Warcraft III map script
//   Generated by the Warcraft III World Editor
//   Date: Thu Nov 25 12:12:59 2021
//   Map Author: 未知
// 
//===========================================================================
//***************************************************************************
//*
//*  Global Variables
//*
//***************************************************************************
function InitGlobals takes nothing returns nothing
    local integer i= 0
    set udg_IsSkipCinematic=false
    set udg_InCinematic=false
    set udg_CinematicUnitsGroup=CreateGroup()
endfunction
//***************************************************************************
//*
//*  Sounds
//*
//***************************************************************************
function InitSounds takes nothing returns nothing
    set gg_snd_ShouSiJuHua=CreateSound("war3mapImported\\ShouSiJuHua.wav", false, false, false, 10, 10, "")
    call SetSoundDuration(gg_snd_ShouSiJuHua, 1498)
    call SetSoundChannel(gg_snd_ShouSiJuHua, 0)
    call SetSoundVolume(gg_snd_ShouSiJuHua, 127)
    call SetSoundPitch(gg_snd_ShouSiJuHua, 1.0)
    set gg_snd_FootmanYes1=CreateSound("Units\\Human\\Footman\\FootmanYes1.wav", false, true, true, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_FootmanYes1, "FootmanYes")
    call SetSoundDuration(gg_snd_FootmanYes1, 883)
    set gg_snd_PeasantPissed3=CreateSound("Units\\Human\\Peasant\\PeasantPissed3.wav", false, true, true, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_PeasantPissed3, "PeasantPissed")
    call SetSoundDuration(gg_snd_PeasantPissed3, 2601)
    set gg_snd_SkeletonYes1=CreateSound("Units\\Undead\\Skeleton\\SkeletonYes1.wav", false, true, true, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_SkeletonYes1, "SkeletonYes")
    call SetSoundDuration(gg_snd_SkeletonYes1, 2785)
    set gg_snd_ForestTrollYesAttack2=CreateSound("Units\\Creeps\\ForestTroll\\ForestTrollYesAttack2.wav", false, true, true, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_ForestTrollYesAttack2, "ForestTrollYesAttack")
    call SetSoundDuration(gg_snd_ForestTrollYesAttack2, 914)
    set gg_snd_ForestTrollWarcry1=CreateSound("Units\\Creeps\\ForestTroll\\ForestTrollWarcry1.wav", false, true, true, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_ForestTrollWarcry1, "ForestTrollWarcry")
    call SetSoundDuration(gg_snd_ForestTrollWarcry1, 1532)
    set gg_snd_PriestYesAttack1=CreateSound("Units\\Human\\Priest\\PriestYesAttack1.wav", false, true, true, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_PriestYesAttack1, "PriestYesAttack")
    call SetSoundDuration(gg_snd_PriestYesAttack1, 1863)
    set gg_snd_ArthasPissed4=CreateSound("Units\\Human\\Arthas\\ArthasPissed4.wav", false, true, true, 10, 10, "HeroAcksEAX")
    call SetSoundParamsFromLabel(gg_snd_ArthasPissed4, "ArthasPissed")
    call SetSoundDuration(gg_snd_ArthasPissed4, 2000)
    set gg_snd_NecromancerPissed4=CreateSound("Units\\Undead\\Necromancer\\NecromancerPissed4.wav", false, true, true, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_NecromancerPissed4, "NecromancerPissed")
    call SetSoundDuration(gg_snd_NecromancerPissed4, 3413)
    set gg_snd_NecromancerWhat1=CreateSound("Units\\Undead\\Necromancer\\NecromancerWhat1.wav", false, true, true, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_NecromancerWhat1, "NecromancerWhat")
    call SetSoundDuration(gg_snd_NecromancerWhat1, 1727)
    set gg_snd_pl_impact_stun=CreateSound("war3mapImported\\pl_impact_stun.mp3", false, false, false, 10, 10, "")
    call SetSoundDuration(gg_snd_pl_impact_stun, 1340)
    call SetSoundChannel(gg_snd_pl_impact_stun, 0)
    call SetSoundVolume(gg_snd_pl_impact_stun, 127)
    call SetSoundPitch(gg_snd_pl_impact_stun, 1.0)
    set gg_snd_JuHuaXiao=CreateSound("war3mapImported\\JuHuaXiao.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundDuration(gg_snd_JuHuaXiao, 1661)
    call SetSoundChannel(gg_snd_JuHuaXiao, 0)
    call SetSoundVolume(gg_snd_JuHuaXiao, 127)
    call SetSoundPitch(gg_snd_JuHuaXiao, 1.0)
    set gg_snd_HeroLichReady1=CreateSound("Units\\Undead\\HeroLich\\HeroLichReady1.wav", false, true, true, 10, 10, "HeroAcksEAX")
    call SetSoundParamsFromLabel(gg_snd_HeroLichReady1, "HeroLichReady")
    call SetSoundDuration(gg_snd_HeroLichReady1, 3233)
    set gg_snd_S03Illidan45=CreateSound("Sound\\Dialogue\\NightElfExpCamp\\NightElf03x\\S03Illidan45.mp3", false, false, false, 10, 10, "")
    call SetSoundParamsFromLabel(gg_snd_S03Illidan45, "S03Illidan45")
    call SetSoundDuration(gg_snd_S03Illidan45, 10448)
    set gg_snd_JuHuaWuGu=CreateSound("war3mapImported\\JuHuaWuGu.wav", false, false, false, 10, 10, "")
    call SetSoundDuration(gg_snd_JuHuaWuGu, 3720)
    call SetSoundChannel(gg_snd_JuHuaWuGu, 0)
    call SetSoundVolume(gg_snd_JuHuaWuGu, 127)
    call SetSoundPitch(gg_snd_JuHuaWuGu, 1.0)
    set gg_snd_FlashBack1Second=CreateSound("Sound\\Ambient\\DoodadEffects\\FlashBack1Second.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_FlashBack1Second, "FlashBack1Second")
    call SetSoundDuration(gg_snd_FlashBack1Second, 2178)
    set gg_snd_BigSven_u=CreateSound("war3mapImported\\BigSven!.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundDuration(gg_snd_BigSven_u, 2281)
    call SetSoundChannel(gg_snd_BigSven_u, 0)
    call SetSoundVolume(gg_snd_BigSven_u, 127)
    call SetSoundPitch(gg_snd_BigSven_u, 1.0)
    set gg_snd_Sven_sevn_u=CreateSound("war3mapImported\\Sven!sevn!.wav", false, false, false, 10, 10, "")
    call SetSoundDuration(gg_snd_Sven_sevn_u, 10000)
    call SetSoundChannel(gg_snd_Sven_sevn_u, 0)
    call SetSoundVolume(gg_snd_Sven_sevn_u, 127)
    call SetSoundPitch(gg_snd_Sven_sevn_u, 1.0)
    set gg_snd_LongZhu_u=CreateSound("war3mapImported\\LongZhu!.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundDuration(gg_snd_LongZhu_u, 4276)
    call SetSoundChannel(gg_snd_LongZhu_u, 0)
    call SetSoundVolume(gg_snd_LongZhu_u, 100)
    call SetSoundPitch(gg_snd_LongZhu_u, 1.0)
    set gg_snd_WoKaoJuQingSha=CreateSound("war3mapImported\\WoKaoJuQingSha.wav", false, false, false, 10, 10, "")
    call SetSoundDuration(gg_snd_WoKaoJuQingSha, 2086)
    call SetSoundChannel(gg_snd_WoKaoJuQingSha, 0)
    call SetSoundVolume(gg_snd_WoKaoJuQingSha, 127)
    call SetSoundPitch(gg_snd_WoKaoJuQingSha, 1.0)
    set gg_snd_Ai_o_u=CreateSound("war3mapImported\\Ai~o~.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundDuration(gg_snd_Ai_o_u, 2090)
    call SetSoundChannel(gg_snd_Ai_o_u, 0)
    call SetSoundVolume(gg_snd_Ai_o_u, 127)
    call SetSoundPitch(gg_snd_Ai_o_u, 1.0)
    set gg_snd_LZGL=CreateSound("war3mapImported\\LZGL.wav", false, false, false, 10, 10, "")
    call SetSoundDuration(gg_snd_LZGL, 2541)
    call SetSoundChannel(gg_snd_LZGL, 0)
    call SetSoundVolume(gg_snd_LZGL, 127)
    call SetSoundPitch(gg_snd_LZGL, 1.0)
    set gg_snd_PursuitTheme="Sound\\Music\\mp3Music\\PursuitTheme.mp3"
    set gg_snd_LJDTtth=CreateSound("war3mapImported\\LJDTtth.wav", false, false, false, 10, 10, "")
    call SetSoundDuration(gg_snd_LJDTtth, 1736)
    call SetSoundChannel(gg_snd_LJDTtth, 0)
    call SetSoundVolume(gg_snd_LJDTtth, 127)
    call SetSoundPitch(gg_snd_LJDTtth, 1.0)
    set gg_snd_MaLiuDXiu=CreateSound("war3mapImported\\MaLiuDXiu.wav", false, false, false, 10, 10, "")
    call SetSoundDuration(gg_snd_MaLiuDXiu, 1325)
    call SetSoundChannel(gg_snd_MaLiuDXiu, 0)
    call SetSoundVolume(gg_snd_MaLiuDXiu, 127)
    call SetSoundPitch(gg_snd_MaLiuDXiu, 1.0)
    set gg_snd_OgrePissed5=CreateSound("Units\\Creeps\\Ogre\\OgrePissed5.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_OgrePissed5, "OgrePissed")
    call SetSoundDuration(gg_snd_OgrePissed5, 2897)
    call SetSoundChannel(gg_snd_OgrePissed5, 0)
    call SetSoundVolume(gg_snd_OgrePissed5, 120)
    set gg_snd_OgreYesAttack3=CreateSound("Units\\Creeps\\Ogre\\OgreYesAttack3.wav", false, false, false, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_OgreYesAttack3, "OgreYesAttack")
    call SetSoundDuration(gg_snd_OgreYesAttack3, 1094)
    call SetSoundChannel(gg_snd_OgreYesAttack3, 0)
    call SetSoundVolume(gg_snd_OgreYesAttack3, 120)
    set gg_snd_ShimmeringPortalBirth=CreateSound("Sound\\Ambient\\DoodadEffects\\ShimmeringPortalBirth.wav", false, false, true, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_ShimmeringPortalBirth, "ShimmeringPortalBirth")
    call SetSoundDuration(gg_snd_ShimmeringPortalBirth, 8529)
    call SetSoundChannel(gg_snd_ShimmeringPortalBirth, 3)
    set gg_snd_ShimmeringPortalDeath=CreateSound("Sound\\Ambient\\DoodadEffects\\ShimmeringPortalDeath.wav", false, false, true, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_ShimmeringPortalDeath, "ShimmeringPortalDeath")
    call SetSoundDuration(gg_snd_ShimmeringPortalDeath, 4783)
    call SetSoundChannel(gg_snd_ShimmeringPortalDeath, 3)
    set gg_snd_ShimmeringPortalEntrance=CreateSound("Sound\\Ambient\\DoodadEffects\\ShimmeringPortalEntrance.wav", false, true, true, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_ShimmeringPortalEntrance, "EnterShimmeringPortal")
    call SetSoundDuration(gg_snd_ShimmeringPortalEntrance, 1829)
    call SetSoundChannel(gg_snd_ShimmeringPortalEntrance, 3)
    set gg_snd_CityScapeMagicRunesLoop1=CreateSound("Sound\\Ambient\\DoodadEffects\\CityScapeMagicRunesLoop1.wav", true, false, true, 10, 10, "DoodadsEAX")
    call SetSoundParamsFromLabel(gg_snd_CityScapeMagicRunesLoop1, "MagicRunesLoop")
    call SetSoundDuration(gg_snd_CityScapeMagicRunesLoop1, 1149)
    call SetSoundChannel(gg_snd_CityScapeMagicRunesLoop1, 3)
endfunction
//***************************************************************************
//*
//*  Destructable Objects
//*
//***************************************************************************
function CreateAllDestructables takes nothing returns nothing
    local destructable d
    local trigger t
    local real life
    set gg_dest_ZTtw_1356=CreateDestructable('ZTtw', - 21952.0, - 25792.0, 270.000, 0.981, 0)
endfunction
//***************************************************************************
//*
//*  Items
//*
//***************************************************************************
function CreateAllItems takes nothing returns nothing
    local integer itemID
    call CreateItem('tkno', - 24554.3, - 23579.1)
    call CreateItem('tkno', - 24590.3, - 23580.7)
    call CreateItem('tkno', - 24616.0, - 23560.6)
    call CreateItem('tkno', - 24587.6, - 23542.5)
    call CreateItem('tkno', - 24542.3, - 23540.4)
endfunction
//***************************************************************************
//*
//*  Unit Creation
//*
//***************************************************************************
//===========================================================================
function CreateBuildingsForPlayer0 takes nothing returns nothing
    local player p= Player(0)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'ndfl', - 24704.0, - 19264.0, 270.000)
endfunction
//===========================================================================
function CreateUnitsForPlayer0 takes nothing returns nothing
    local player p= Player(0)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set gg_unit_nm05_0023=CreateUnit(p, 'nm05', - 22479.3, - 24456.1, 271.432)
    set u=CreateUnit(p, 'nvdg', - 17014.4, - 17618.1, 171.623)
endfunction
//===========================================================================
function CreateUnitsForPlayer1 takes nothing returns nothing
    local player p= Player(1)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set gg_unit_nm03_0022=CreateUnit(p, 'nm03', - 23059.7, - 24485.4, 312.026)
endfunction
//===========================================================================
function CreateBuildingsForPlayer3 takes nothing returns nothing
    local player p= Player(3)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set gg_unit_hlum_0017=CreateUnit(p, 'hlum', - 23200.0, - 26464.0, 270.000)
endfunction
//===========================================================================
function CreateUnitsForPlayer3 takes nothing returns nothing
    local player p= Player(3)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set gg_unit_nhew_0010=CreateUnit(p, 'nhew', - 23274.3, - 25012.8, 173.555)
    set gg_unit_nhew_0013=CreateUnit(p, 'nhew', - 23256.7, - 26261.7, 259.958)
    set gg_unit_nbee_0014=CreateUnit(p, 'nbee', - 23309.9, - 23964.0, 173.144)
    set gg_unit_nhew_0015=CreateUnit(p, 'nhew', - 23373.9, - 25872.5, 197.290)
    set gg_unit_nhew_0018=CreateUnit(p, 'nhew', - 23038.8, - 26283.7, 230.581)
    set gg_unit_nhew_0025=CreateUnit(p, 'nhew', - 22138.7, - 25769.4, 0.437)
    set gg_unit_nhew_0088=CreateUnit(p, 'nhew', - 23368.6, - 25619.8, 2.981)
    set u=CreateUnit(p, 'hcth', - 23511.7, - 24834.3, 171.491)
    set u=CreateUnit(p, 'hcth', - 23685.9, - 25321.1, 146.360)
    set u=CreateUnit(p, 'hcth', - 23039.6, - 24782.3, 80.260)
    set u=CreateUnit(p, 'nhea', - 23179.2, - 25223.7, 149.710)
    set u=CreateUnit(p, 'nhea', - 23065.0, - 25887.5, 143.121)
    set u=CreateUnit(p, 'hcth', - 22178.5, - 24723.1, 108.368)
endfunction
//===========================================================================
function CreateUnitsForPlayer8 takes nothing returns nothing
    local player p= Player(8)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'nmed', - 8199.6, - 9148.2, 187.880)
endfunction
//===========================================================================
function CreateUnitsForPlayer10 takes nothing returns nothing
    local player p= Player(10)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'uskw', - 18254.5, - 26769.6, 87.564)
    set u=CreateUnit(p, 'nvde', - 13747.5, - 18059.0, 290.147)
    call SetUnitState(u, UNIT_STATE_MANA, 0)
    set u=CreateUnit(p, 'nvdg', - 14126.1, - 17415.0, 236.026)
    call SetUnitState(u, UNIT_STATE_MANA, 0)
    set u=CreateUnit(p, 'nvdg', - 14639.9, - 17611.8, 153.857)
    call SetUnitState(u, UNIT_STATE_MANA, 0)
    set u=CreateUnit(p, 'npfl', - 11869.7, - 15096.0, 203.572)
    set u=CreateUnit(p, 'npfl', - 11379.3, - 15523.9, 212.427)
    set u=CreateUnit(p, 'nvdl', - 11651.4, - 14759.9, 121.260)
    set u=CreateUnit(p, 'nvdl', - 11355.8, - 14976.9, 160.636)
    set u=CreateUnit(p, 'nvdl', - 10492.3, - 14954.5, 261.966)
    set u=CreateUnit(p, 'nvdw', - 10890.9, - 14668.3, 63.756)
    call SetUnitState(u, UNIT_STATE_MANA, 0)
    set u=CreateUnit(p, 'uabo', - 8889.3, - 12436.4, 243.486)
    set u=CreateUnit(p, 'uabo', - 9007.4, - 12809.5, 317.723)
    set u=CreateUnit(p, 'ugho', - 9462.7, - 12408.3, 167.832)
    set u=CreateUnit(p, 'ugho', - 9692.7, - 12727.0, 338.851)
    set u=CreateUnit(p, 'ugho', - 9777.7, - 13229.9, 44.946)
    set u=CreateUnit(p, 'uabo', - 9726.9, - 17207.1, 17.689)
    set u=CreateUnit(p, 'uabo', - 10156.0, - 17776.9, 17.282)
    set u=CreateUnit(p, 'nvde', - 9857.6, - 17594.6, 317.756)
    call SetUnitState(u, UNIT_STATE_MANA, 0)
    set u=CreateUnit(p, 'nvdg', - 13523.6, - 17604.4, 40.991)
    call SetUnitState(u, UNIT_STATE_MANA, 0)
    set u=CreateUnit(p, 'nvdl', - 13829.1, - 14859.9, 106.329)
    set u=CreateUnit(p, 'nvdl', - 13472.8, - 14795.4, 261.944)
    set u=CreateUnit(p, 'nvdw', - 13927.4, - 15368.0, 63.283)
    call SetUnitState(u, UNIT_STATE_MANA, 0)
    set u=CreateUnit(p, 'uskw', - 17301.5, - 27300.7, 165.031)
    set u=CreateUnit(p, 'uslm', - 16917.9, - 26850.9, 302.155)
    set u=CreateUnit(p, 'uslm', - 16953.9, - 27257.5, 182.390)
    set u=CreateUnit(p, 'slAc', - 16642.4, - 27019.8, 75.489)
    set u=CreateUnit(p, 'uskw', - 18461.0, - 26720.3, 9.163)
    set u=CreateUnit(p, 'ugho', - 16484.2, - 25536.6, 80.367)
    set u=CreateUnit(p, 'ugho', - 16242.9, - 25587.4, 211.032)
    set u=CreateUnit(p, 'ugho', - 17121.3, - 25837.3, 192.530)
    set u=CreateUnit(p, 'ugho', - 17836.8, - 26125.4, 12.085)
    set u=CreateUnit(p, 'ugho', - 15865.4, - 26692.8, 60.734)
    set u=CreateUnit(p, 'ugho', - 15837.1, - 26931.1, 122.260)
    set u=CreateUnit(p, 'ugho', - 15368.6, - 26602.6, 62.239)
    set u=CreateUnit(p, 'uslm', - 15527.3, - 26562.7, 260.065)
    set u=CreateUnit(p, 'uslm', - 15582.4, - 26785.6, 163.932)
    set u=CreateUnit(p, 'slAc', - 15387.1, - 26871.3, 190.860)
    set u=CreateUnit(p, 'slAc', - 15345.3, - 26460.0, 343.828)
    set u=CreateUnit(p, 'slAc', - 16313.3, - 26746.9, 357.154)
    set u=CreateUnit(p, 'slAc', - 17536.7, - 25820.9, 166.415)
    set u=CreateUnit(p, 'uskw', - 17395.6, - 26163.6, 182.258)
    set u=CreateUnit(p, 'uskw', - 16908.8, - 25895.4, 212.823)
    set u=CreateUnit(p, 'nvdg', - 16767.3, - 16524.1, 103.769)
    call SetUnitState(u, UNIT_STATE_MANA, 0)
    set u=CreateUnit(p, 'nvdg', - 16202.2, - 15650.2, 122.227)
    call SetUnitState(u, UNIT_STATE_MANA, 0)
    set u=CreateUnit(p, 'nvdl', - 16947.7, - 18689.2, 152.308)
    set u=CreateUnit(p, 'nvdl', - 16728.1, - 18698.7, 118.964)
    set u=CreateUnit(p, 'nvdl', - 16713.7, - 18989.1, 168.942)
    set u=CreateUnit(p, 'nvdl', - 16832.2, - 19354.9, 34.201)
endfunction
//===========================================================================
function CreateUnitsForPlayer11 takes nothing returns nothing
    local player p= Player(11)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set gg_unit_nm06_0024=CreateUnit(p, 'nm06', - 22277.4, - 25002.6, 205.260)
endfunction
//===========================================================================
function CreateNeutralHostileBuildings takes nothing returns nothing
    local player p= Player(PLAYER_NEUTRAL_AGGRESSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set gg_unit_n001_0016=CreateUnit(p, 'n001', - 22432.0, - 25440.0, 270.000)
    set u=CreateUnit(p, 'nnsg', - 16960.0, - 23424.0, 270.000)
    set u=CreateUnit(p, 'nnfm', - 16480.0, - 22944.0, 270.000)
    set u=CreateUnit(p, 'nnfm', - 17632.0, - 23072.0, 270.000)
    set u=CreateUnit(p, 'nnfm', - 17184.0, - 24096.0, 270.000)
endfunction
//===========================================================================
function CreateNeutralHostile takes nothing returns nothing
    local player p= Player(PLAYER_NEUTRAL_AGGRESSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'nmsn', - 24827.7, - 19072.1, 280.582)
    set u=CreateUnit(p, 'nmtw', - 23281.0, - 21093.4, 272.766)
    set u=CreateUnit(p, 'nmrv', - 24671.6, - 19597.2, 287.600)
    set u=CreateUnit(p, 'nmsn', - 24424.0, - 19241.5, 280.313)
    set u=CreateUnit(p, 'nmsn', - 25227.2, - 19630.9, 256.967)
    set u=CreateUnit(p, 'nmsn', - 24252.4, - 18896.9, 6.240)
    set u=CreateUnit(p, 'nmbg', - 24337.8, - 19106.3, 280.812)
    set u=CreateUnit(p, 'nmbg', - 25012.2, - 19286.9, 306.513)
    set u=CreateUnit(p, 'nmtw', - 22803.2, - 21141.7, 213.680)
    set u=CreateUnit(p, 'nmsn', - 23099.5, - 20825.9, 200.781)
    set u=CreateUnit(p, 'nmbg', - 22928.2, - 20928.8, 227.204)
    set u=CreateUnit(p, 'nmbg', - 25695.7, - 21170.7, 299.970)
    set u=CreateUnit(p, 'nmsn', - 25935.1, - 21073.8, 290.950)
    set u=CreateUnit(p, 'nnmg', - 17137.8, - 23009.4, 315.869)
    set u=CreateUnit(p, 'nnmg', - 17466.7, - 23428.0, 322.395)
    set u=CreateUnit(p, 'nnmg', - 16688.0, - 23275.1, 288.828)
    set u=CreateUnit(p, 'nmcf', - 25099.2, - 21480.8, 315.188)
    set u=CreateUnit(p, 'nmcf', - 23593.8, - 21068.5, 254.713)
    set u=CreateUnit(p, 'nmcf', - 23354.6, - 21403.2, 251.462)
    set u=CreateUnit(p, 'nmcf', - 25243.2, - 21764.7, 302.427)
    set u=CreateUnit(p, 'nmcf', - 23038.7, - 21447.3, 256.580)
    set u=CreateUnit(p, 'nmcf', - 24939.7, - 21262.0, 310.274)
    set u=CreateUnit(p, 'ntrt', - 20923.4, - 25682.0, 171.923)
    set u=CreateUnit(p, 'nmsc', - 18696.3, - 19446.5, 185.353)
    call SetUnitState(u, UNIT_STATE_MANA, 0)
    set u=CreateUnit(p, 'nvde', - 12364.6, - 12768.4, 35.380)
    set u=CreateUnit(p, 'nvde', - 12800.7, - 12253.1, 148.551)
    call SetUnitState(u, UNIT_STATE_MANA, 0)
    set u=CreateUnit(p, 'nvdw', - 12555.2, - 11962.1, 33.070)
    call SetUnitState(u, UNIT_STATE_MANA, 0)
    set u=CreateUnit(p, 'nfov', - 12375.9, - 11880.3, 24.621)
    call SetUnitState(u, UNIT_STATE_MANA, 0)
    set u=CreateUnit(p, 'nmsn', - 19056.0, - 19564.3, 132.532)
    call SetUnitState(u, UNIT_STATE_MANA, 0)
    set u=CreateUnit(p, 'nmsn', - 18956.5, - 19185.7, 328.776)
    call SetUnitState(u, UNIT_STATE_MANA, 0)
    set u=CreateUnit(p, 'ntrs', - 20751.6, - 25514.6, 183.652)
    set u=CreateUnit(p, 'nmyr', - 16781.6, - 24061.9, 299.540)
    set u=CreateUnit(p, 'nmsn', - 25473.9, - 20981.6, 293.383)
    set u=CreateUnit(p, 'nmtw', - 25560.5, - 21398.7, 281.602)
    set u=CreateUnit(p, 'nmtw', - 25372.2, - 21201.0, 236.224)
    set u=CreateUnit(p, 'nmtw', - 25890.8, - 21427.5, 195.310)
    set u=CreateUnit(p, 'ntrs', - 20719.3, - 25826.0, 161.646)
    set u=CreateUnit(p, 'nsoc', - 18564.4, - 24896.6, 351.590)
    call SetUnitState(u, UNIT_STATE_MANA, 0)
    set u=CreateUnit(p, 'ngrk', - 21518.9, - 27026.3, 37.410)
    set u=CreateUnit(p, 'ngrk', - 21258.8, - 27070.1, 108.658)
    set u=CreateUnit(p, 'ngst', - 21442.4, - 27246.6, 87.688)
    set u=CreateUnit(p, 'nsbs', - 17217.3, - 23884.2, 307.357)
    set u=CreateUnit(p, 'nsbs', - 16587.0, - 23612.2, 278.701)
endfunction
//===========================================================================
function CreateNeutralPassiveBuildings takes nothing returns nothing
    local player p= Player(PLAYER_NEUTRAL_PASSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'nmg0', - 23392.0, - 20704.0, 270.000)
    set u=CreateUnit(p, 'nmg1', - 22752.0, - 20832.0, 270.000)
    set u=CreateUnit(p, 'nmg0', - 25632.0, - 20000.0, 270.000)
    set u=CreateUnit(p, 'nmg1', - 23712.0, - 18848.0, 270.000)
    set u=CreateUnit(p, 'nmg1', - 25696.0, - 20960.0, 270.000)
    set u=CreateUnit(p, 'nmg0', - 24288.0, - 20576.0, 270.000)
    set u=CreateUnit(p, 'osld', - 15680.0, - 27968.0, 270.000)
    set u=CreateUnit(p, 'eaoe', - 27200.0, - 17856.0, 270.000)
    set u=CreateUnit(p, 'nmg1', - 19744.0, - 19744.0, 270.000)
    set u=CreateUnit(p, 'nmg0', - 20384.0, - 18912.0, 270.000)
endfunction
//===========================================================================
function CreateNeutralPassive takes nothing returns nothing
    local player p= Player(PLAYER_NEUTRAL_PASSIVE)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'ospw', - 15905.3, - 27875.1, 178.289)
    set u=CreateUnit(p, 'hbew', - 16056.8, - 28023.8, 357.160)
endfunction
//===========================================================================
function CreatePlayerBuildings takes nothing returns nothing
    call CreateBuildingsForPlayer0()
    call CreateBuildingsForPlayer3()
endfunction
//===========================================================================
function CreatePlayerUnits takes nothing returns nothing
    call CreateUnitsForPlayer0()
    call CreateUnitsForPlayer1()
    call CreateUnitsForPlayer3()
    call CreateUnitsForPlayer8()
    call CreateUnitsForPlayer10()
    call CreateUnitsForPlayer11()
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
//*  Regions
//*
//***************************************************************************
function CreateRegions takes nothing returns nothing
    local weathereffect we
    set gg_rct_Elevators_01=Rect(- 22784.0, - 25984.0, - 22688.0, - 25888.0)
    set gg_rct_Intro__Build1=Rect(- 23424.0, - 25056.0, - 23328.0, - 24960.0)
    set gg_rct_Intro__Build2=Rect(- 23488.0, - 24000.0, - 23392.0, - 23904.0)
    set gg_rct_Intro__Build3=Rect(- 23552.0, - 25920.0, - 23456.0, - 25824.0)
    set gg_rct_Intro__Build4=Rect(- 23296.0, - 25664.0, - 23200.0, - 25568.0)
    set gg_rct_Intro__KaelBirth1=Rect(- 23360.0, - 25344.0, - 23264.0, - 25248.0)
    set gg_rct_Intro__KaelBirth2=Rect(- 22784.0, - 24960.0, - 22688.0, - 24864.0)
    set gg_rct_Intro__KaelMove1=Rect(- 24192.0, - 25344.0, - 24096.0, - 25248.0)
    set gg_rct_Intro__KaelMove2=Rect(- 22816.0, - 25408.0, - 22720.0, - 25312.0)
    set gg_rct_Intro__OrgeBirth1=Rect(- 24864.0, - 25536.0, - 24768.0, - 25440.0)
    set gg_rct_Intro__OrgeBirth2=Rect(- 23072.0, - 24992.0, - 22976.0, - 24896.0)
    set gg_rct_Intro__OrgeLookPos1=Rect(- 24416.0, - 25696.0, - 24320.0, - 25600.0)
    set gg_rct_Intro__OrgeLookPos2=Rect(- 24992.0, - 25088.0, - 24896.0, - 24992.0)
    set gg_rct_Intro__OrgeMove1=Rect(- 24640.0, - 25280.0, - 24544.0, - 25184.0)
    set gg_rct_Intro__OrgeMove2=Rect(- 23072.0, - 25376.0, - 22976.0, - 25280.0)
    set gg_rct_Intro__PortalBirth=Rect(- 24992.0, - 25696.0, - 24896.0, - 25600.0)
    set gg_rct_Intro__LieutenantMove1=Rect(- 22944.0, - 24672.0, - 22848.0, - 24576.0)
    set gg_rct_Intro__TrollMove1=Rect(- 22624.0, - 24736.0, - 22528.0, - 24640.0)
    set gg_rct_Intro__DeterminedExterminatorMove1=Rect(- 22528.0, - 25024.0, - 22432.0, - 24928.0)
endfunction
//***************************************************************************
//*
//*  Cameras
//*
//***************************************************************************
function CreateCameras takes nothing returns nothing
    set gg_cam_Intro__GameStart=CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Intro__GameStart, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__GameStart, CAMERA_FIELD_ROTATION, 90.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__GameStart, CAMERA_FIELD_ANGLE_OF_ATTACK, 304.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__GameStart, CAMERA_FIELD_TARGET_DISTANCE, 1650.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__GameStart, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__GameStart, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__GameStart, CAMERA_FIELD_FARZ, 5000.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Intro__GameStart, - 22752.4, - 25371.6, 0.0)
    set gg_cam_Intro__OrgeCloseUp=CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Intro__OrgeCloseUp, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__OrgeCloseUp, CAMERA_FIELD_ROTATION, 229.4, 0.0)
    call CameraSetupSetField(gg_cam_Intro__OrgeCloseUp, CAMERA_FIELD_ANGLE_OF_ATTACK, 315.1, 0.0)
    call CameraSetupSetField(gg_cam_Intro__OrgeCloseUp, CAMERA_FIELD_TARGET_DISTANCE, 1500.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__OrgeCloseUp, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__OrgeCloseUp, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__OrgeCloseUp, CAMERA_FIELD_FARZ, 5500.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Intro__OrgeCloseUp, - 24608.2, - 25158.5, 0.0)
    set gg_cam_Intro__OrgeInitialPoint=CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Intro__OrgeInitialPoint, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__OrgeInitialPoint, CAMERA_FIELD_ROTATION, 224.6, 0.0)
    call CameraSetupSetField(gg_cam_Intro__OrgeInitialPoint, CAMERA_FIELD_ANGLE_OF_ATTACK, 311.9, 0.0)
    call CameraSetupSetField(gg_cam_Intro__OrgeInitialPoint, CAMERA_FIELD_TARGET_DISTANCE, 1815.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__OrgeInitialPoint, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__OrgeInitialPoint, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__OrgeInitialPoint, CAMERA_FIELD_FARZ, 5000.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Intro__OrgeInitialPoint, - 24969.2, - 25587.9, 0.0)
    set gg_cam_Intro__PortalCloseUp=CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Intro__PortalCloseUp, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__PortalCloseUp, CAMERA_FIELD_ROTATION, 223.4, 0.0)
    call CameraSetupSetField(gg_cam_Intro__PortalCloseUp, CAMERA_FIELD_ANGLE_OF_ATTACK, 329.7, 0.0)
    call CameraSetupSetField(gg_cam_Intro__PortalCloseUp, CAMERA_FIELD_TARGET_DISTANCE, 1996.5, 0.0)
    call CameraSetupSetField(gg_cam_Intro__PortalCloseUp, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__PortalCloseUp, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__PortalCloseUp, CAMERA_FIELD_FARZ, 5500.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Intro__PortalCloseUp, - 25121.5, - 25675.6, 0.0)
    set gg_cam_Intro__Talk1=CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Intro__Talk1, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk1, CAMERA_FIELD_ROTATION, 177.2, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk1, CAMERA_FIELD_ANGLE_OF_ATTACK, 300.6, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk1, CAMERA_FIELD_TARGET_DISTANCE, 1363.6, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk1, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk1, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk1, CAMERA_FIELD_FARZ, 5000.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Intro__Talk1, - 24392.2, - 25168.6, 0.0)
    set gg_cam_Intro__Talk2=CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Intro__Talk2, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk2, CAMERA_FIELD_ROTATION, 178.8, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk2, CAMERA_FIELD_ANGLE_OF_ATTACK, 301.5, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk2, CAMERA_FIELD_TARGET_DISTANCE, 1363.6, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk2, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk2, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk2, CAMERA_FIELD_FARZ, 5000.0, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Intro__Talk2, - 24291.2, - 25193.5, 0.0)
    set gg_cam_Intro__Talk3=CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Intro__Talk3, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk3, CAMERA_FIELD_ROTATION, 95.1, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk3, CAMERA_FIELD_ANGLE_OF_ATTACK, 314.8, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk3, CAMERA_FIELD_TARGET_DISTANCE, 2196.2, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk3, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk3, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk3, CAMERA_FIELD_FARZ, 4545.5, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Intro__Talk3, - 22890.7, - 25026.9, 0.0)
    set gg_cam_Intro__Talk4=CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Intro__Talk4, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk4, CAMERA_FIELD_ROTATION, 91.6, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk4, CAMERA_FIELD_ANGLE_OF_ATTACK, 310.8, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk4, CAMERA_FIELD_TARGET_DISTANCE, 1815.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk4, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk4, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk4, CAMERA_FIELD_FARZ, 4545.5, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Intro__Talk4, - 22687.0, - 25811.7, 0.0)
    set gg_cam_Intro__Talk5=CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Intro__Talk5, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk5, CAMERA_FIELD_ROTATION, 88.2, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk5, CAMERA_FIELD_ANGLE_OF_ATTACK, 311.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk5, CAMERA_FIELD_TARGET_DISTANCE, 1239.7, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk5, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk5, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk5, CAMERA_FIELD_FARZ, 4545.5, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Intro__Talk5, - 22747.4, - 25465.9, 0.0)
    set gg_cam_Intro__Talk6=CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Intro__Talk6, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk6, CAMERA_FIELD_ROTATION, 88.2, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk6, CAMERA_FIELD_ANGLE_OF_ATTACK, 311.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk6, CAMERA_FIELD_TARGET_DISTANCE, 1024.5, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk6, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk6, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk6, CAMERA_FIELD_FARZ, 4545.5, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Intro__Talk6, - 22710.2, - 25360.2, 0.0)
    set gg_cam_Intro__Talk7=CreateCameraSetup()
    call CameraSetupSetField(gg_cam_Intro__Talk7, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk7, CAMERA_FIELD_ROTATION, 92.4, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk7, CAMERA_FIELD_ANGLE_OF_ATTACK, 309.8, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk7, CAMERA_FIELD_TARGET_DISTANCE, 1363.6, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk7, CAMERA_FIELD_ROLL, 0.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk7, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
    call CameraSetupSetField(gg_cam_Intro__Talk7, CAMERA_FIELD_FARZ, 4545.5, 0.0)
    call CameraSetupSetDestPosition(gg_cam_Intro__Talk7, - 22615.2, - 24944.1, 0.0)
endfunction
//***************************************************************************
//*
//*  Custom Script Code
//*
//***************************************************************************
//TESH.scrollpos=0
//TESH.alwaysfold=0
// 初始化的函数
// 大部分的常用函数
// 单位选取的过滤条件
//获取是否拥有法术护盾
function HaveSpellShield takes unit u returns boolean
	return false
endfunction
//filter 条件
//敌对 非建筑
//大部分物理攻击特效的筛选
function CommonAttackEffectFilter takes unit whichUnit,unit targetUnit returns boolean
	return IsUnitEnemy(whichUnit, GetOwningPlayer(targetUnit)) and not IsUnitType(targetUnit, UNIT_TYPE_STRUCTURE)
endfunction
//联盟 存活 非建筑
function Ally_Alive_NoStructure takes unit u returns boolean
	return IsUnitAlly(u, P2) and UnitAlive(u) and not IsUnitType(u, UNIT_TYPE_STRUCTURE)
endfunction
//联盟 存活
function Ally_Alive takes unit u returns boolean
	return IsUnitAlly(u, P2) and UnitAlive(u)
endfunction
	
//敌对 存活
function Enemy_Alive takes unit u returns boolean
	return IsUnitEnemy(u, P2) and UnitAlive(u)
endfunction
//敌对 存活
function Enemy_Alive_NotFly takes unit u returns boolean
	return IsUnitEnemy(u, P2) and UnitAlive(u) and not IsUnitType(u, UNIT_TYPE_FLYING)
endfunction
//敌对 存活 非建筑
function Enemy_Alive_NoStructure takes unit u returns boolean
	return IsUnitEnemy(u, P2) and UnitAlive(u) and not IsUnitType(u, UNIT_TYPE_STRUCTURE)
endfunction
	
//敌对 存活 非建筑 非魔免
function Enemy_Alive_NoStructure_NoImmune takes unit u returns boolean
	return Enemy_Alive_NoStructure(u) and not IsUnitType(u, UNIT_TYPE_MAGIC_IMMUNE)
endfunction
//存活 非建筑
function Alive_NoStructure takes unit u returns boolean
	return UnitAlive(u) and not IsUnitType(u, UNIT_TYPE_STRUCTURE)
endfunction
//非空军 非机械 存活 非建筑 敌军
function IsGround_NotMechanical_Enemy_Alive_NoStructure takes unit u returns boolean
	return not IsUnitType(u, UNIT_TYPE_FLYING) and not IsUnitType(u, UNIT_TYPE_MECHANICAL) and Enemy_Alive_NoStructure(u)
endfunction
//非机械 存活 非建筑 友军
function IsMechanical_Ally_Alive_NoStructure takes unit u returns boolean
	return not IsUnitType(u, UNIT_TYPE_MECHANICAL) and Ally_Alive_NoStructure(u)
endfunction
// #include "Vjass\Cinematic.j"
// scope UnitRestore begins
    
    function UnitCanRestoreLife takes unit whichUnit returns boolean
        return HaveSavedInteger(UnitData, GetHandleId(whichUnit), UNIT_LIFERESTORE)
    endfunction
    function UnitCanRestoreMana takes unit whichUnit returns boolean
        return HaveSavedInteger(UnitData, GetHandleId(whichUnit), UNIT_MANARESTORE)
    endfunction
    //生命恢复,所有生命恢复都以这条函数来进行	/*不包括生命移除*/
    function UnitRestoreLife takes unit u,real r returns nothing
        if r != 0 then
            if IsUnitType(u, UNIT_TYPE_UNDEAD) then //不死族单位在荒芜地表享受两倍生命恢复效果
if IsPointBlighted(GetUnitX(u), GetUnitY(u)) then
                    set r=r * 2.00
                endif
            endif
            call SetWidgetLife(u, GetWidgetLife(u) + r)
        endif
    endfunction
    //魔法恢复,所有魔法恢复都以这条函数来进行  /*不包括魔法移除*/
    function UnitRestoreMana takes unit u,real r returns nothing
        if r != 0 then
            call SetUnitState(u, UNIT_STATE_MANA, GetUnitState(u, UNIT_STATE_MANA) + r)
        endif
    endfunction
    //使单位加入恢复队列,允许其恢复 生命/魔法
    function QueuedUnitLifeRestoreAdd takes unit whichUnit returns nothing
        set UnitLifeRestoreNumber=UnitLifeRestoreNumber + 1
        set UnitLifeRestoreQueue[UnitLifeRestoreNumber]=whichUnit
        set LifeRestoreValue[UnitLifeRestoreNumber]=0. //可能不需要set 0
call SaveInteger(UnitData, GetHandleId(whichUnit), UNIT_LIFERESTORE, UnitLifeRestoreNumber)
    endfunction
    //使单位加入恢复队列,允许其恢复 生命/魔法
    function QueuedUnitManaRestoreAdd takes unit whichUnit returns nothing
        set UnitManaRestoreNumber=UnitManaRestoreNumber + 1
        set UnitManaRestoreQueue[UnitManaRestoreNumber]=whichUnit
        set ManaRestoreValue[UnitManaRestoreNumber]=0.
        call SaveInteger(UnitData, GetHandleId(whichUnit), UNIT_MANARESTORE, UnitManaRestoreNumber)
    endfunction
    //使单位加入恢复队列,允许其恢复 生命/魔法
    function QueuedUnitRestoreAdd takes unit whichUnit returns nothing
        call QueuedUnitLifeRestoreAdd(whichUnit)
        call QueuedUnitManaRestoreAdd(whichUnit)
    endfunction
    //将单位移出恢复队列,禁用其恢复 生命
    function QueuedUnitLifeRestoreRemove takes unit whichUnit returns nothing
        local integer iHandleId= GetHandleId(whichUnit)
        local integer index= LoadInteger(UnitData, iHandleId, UNIT_LIFERESTORE)
        if index != UnitLifeRestoreNumber then
            set UnitLifeRestoreQueue[index]=UnitLifeRestoreQueue[UnitLifeRestoreNumber]
            set LifeRestoreValue[index]=LifeRestoreValue[UnitLifeRestoreNumber]
            call SaveInteger(UnitData, iHandleId, UNIT_LIFERESTORE, 0)
            set iHandleId=GetHandleId(UnitLifeRestoreQueue[UnitLifeRestoreNumber])
            call SaveInteger(UnitData, iHandleId, UNIT_LIFERESTORE, index)
        endif
        set UnitLifeRestoreQueue[UnitLifeRestoreNumber]=null
        set LifeRestoreValue[UnitLifeRestoreNumber]=0.
        set UnitLifeRestoreNumber=UnitLifeRestoreNumber - 1
    endfunction
    //将单位移出恢复队列,禁用其恢复 魔法
    function QueuedUnitManaRestoreRemove takes unit whichUnit returns nothing
        local integer iHandleId= GetHandleId(whichUnit)
        local integer index= LoadInteger(UnitData, iHandleId, UNIT_MANARESTORE)
        if index != UnitManaRestoreNumber then
            set UnitManaRestoreQueue[index]=UnitManaRestoreQueue[UnitManaRestoreNumber]
            set ManaRestoreValue[index]=ManaRestoreValue[UnitManaRestoreNumber]
            call SaveInteger(UnitData, iHandleId, UNIT_MANARESTORE, 0)
	
            set iHandleId=GetHandleId(UnitManaRestoreQueue[UnitManaRestoreNumber])
            call SaveInteger(UnitData, iHandleId, UNIT_MANARESTORE, index)
        endif
        set UnitManaRestoreQueue[UnitManaRestoreNumber]=null
        set ManaRestoreValue[UnitManaRestoreNumber]=0.
        set UnitManaRestoreNumber=UnitManaRestoreNumber - 1
    endfunction
    //将单位移出恢复队列,禁用其恢复 生命/魔法
    function QueuedUnitRestoreRemove takes unit whichUnit returns nothing
        call QueuedUnitLifeRestoreRemove(whichUnit)
        call QueuedUnitManaRestoreRemove(whichUnit)
    endfunction
    //RestoreFrame秒回调一次,恢复单位 生命/魔法
    function RestoreAllUnitLife takes nothing returns boolean
        local integer i= 1
        loop
            exitwhen i > UnitLifeRestoreNumber
            if UnitAlive(UnitLifeRestoreQueue[i]) then
                call UnitRestoreLife(UnitLifeRestoreQueue[i] , LifeRestoreValue[i])
                //call UnitRestoreMana(UnitRestoreQueue[i], ManaRestoreValue[i])
            endif
            set i=i + 1
        endloop
        return false
    endfunction
    function RestoreAllUnitMana takes nothing returns boolean
        local integer i= 1
        loop
            exitwhen i > UnitManaRestoreNumber
            if UnitAlive(UnitManaRestoreQueue[i]) then
                call UnitRestoreMana(UnitManaRestoreQueue[i] , ManaRestoreValue[i])
            endif
            set i=i + 1
        endloop
        return false
    endfunction
    function InitUnitRestore takes nothing returns nothing
        local trigger trig= CreateTrigger()
        call TriggerRegisterTimerEvent(trig, RestoreFrame, true)
        call TriggerAddCondition(trig, Condition(function RestoreAllUnitLife))
        set trig=CreateTrigger()
        call TriggerRegisterTimerEvent(trig, RestoreFrame, true)
        call TriggerAddCondition(trig, Condition(function RestoreAllUnitMana))
    endfunction
// scope UnitRestore ends
// scope UnitBonusSystem begins
    //设置单位生命恢复速度 这里GetHandleId用了三次 待优化
    function UnitSetLifeRestore takes unit whichUnit,real newValue returns nothing
        local integer h= GetHandleId(whichUnit)
        local integer index= LoadInteger(UnitData, h, UNIT_LIFERESTORE)
        if index == 0 then
            call QueuedUnitLifeRestoreAdd(whichUnit)
        endif
        call SaveReal(UnitData, h, UNIT_LIFERESTORE, newValue)
        call RefreshLifeUnitRestore(whichUnit)
    endfunction
    function UnitAddLifeRestore takes unit whichUnit,real value returns nothing
        call UnitSetLifeRestore(whichUnit , LoadReal(UnitData, GetHandleId(whichUnit), UNIT_LIFERESTORE) + value)
    endfunction
    function UnitReduceLifeRestore takes unit whichUnit,real value returns nothing
        call UnitSetLifeRestore(whichUnit , LoadReal(UnitData, GetHandleId(whichUnit), UNIT_LIFERESTORE) - value)
    endfunction
    //设置单位魔法恢复速度
    function UnitSetManaRestore takes unit whichUnit,real newValue returns nothing
        local integer h= GetHandleId(whichUnit)
        local integer index= LoadInteger(UnitData, h, UNIT_MANARESTORE)
        if index == 0 then
            call QueuedUnitManaRestoreAdd(whichUnit)
        endif
        call SaveReal(UnitData, h, UNIT_MANARESTORE, newValue)
        call RefreshManaUnitRestore(whichUnit)
    endfunction
    function UnitAddManaRestore takes unit whichUnit,real value returns nothing
        call UnitSetManaRestore(whichUnit , LoadReal(UnitData, GetHandleId(whichUnit), UNIT_MANARESTORE) + value)
    endfunction
    function UnitReduceManaRestore takes unit whichUnit,real value returns nothing
        call UnitSetManaRestore(whichUnit , LoadReal(UnitData, GetHandleId(whichUnit), UNIT_MANARESTORE) - value)
    endfunction
    //JAPI修改技能数据，并且刷新。
    //*额外 攻击 防御 攻速*/
    //升级并降低技能等级以此达到刷新属性的目的
    function UnitAddAttackSpeedBonus takes unit whichUnit,real value returns nothing
        local integer h= GetHandleId(whichUnit)
        if GetUnitAbilityLevel(whichUnit, 'AIsx') <= 0 then
            call UnitAddPermanentAbility(whichUnit , 'AIsx')
        endif
        set value=LoadReal(UnitData, h, BONUS_ATTACK) + value
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIsx'), 1, ABILITY_DATA_DATA_A, value)
        call IncUnitAbilityLevel(whichUnit, 'AIsx')
        call DecUnitAbilityLevel(whichUnit, 'AIsx')
        call SaveReal(UnitData, h, BONUS_ATTACK, value)
    endfunction
    function UnitReduceAttackSpeedBonus takes unit whichUnit,real value returns nothing
        local integer h= GetHandleId(whichUnit)
        if GetUnitAbilityLevel(whichUnit, 'AIsx') <= 0 then
            call UnitAddPermanentAbility(whichUnit , 'AIsx')
        endif
        set value=LoadReal(UnitData, h, BONUS_ATTACK) - value
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIsx'), 1, ABILITY_DATA_DATA_A, value)
        call IncUnitAbilityLevel(whichUnit, 'AIsx')
        call DecUnitAbilityLevel(whichUnit, 'AIsx')
        call SaveReal(UnitData, h, BONUS_ATTACK, value)
    endfunction
    function UnitSetAttackSpeedBonus takes unit whichUnit,real newValue returns nothing
        if GetUnitAbilityLevel(whichUnit, 'AIsx') <= 0 then
            call UnitAddPermanentAbility(whichUnit , 'AIsx')
        endif
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIsx'), 1, ABILITY_DATA_DATA_A, newValue)
        call IncUnitAbilityLevel(whichUnit, 'AIsx')
        call DecUnitAbilityLevel(whichUnit, 'AIsx')
        call SaveReal(UnitData, GetHandleId(whichUnit), BONUS_ATTACK, newValue)
    endfunction
    function UnitAddArmorBonus takes unit whichUnit,real value returns nothing
        local integer h= GetHandleId(whichUnit)
        if GetUnitAbilityLevel(whichUnit, 'AId1') <= 0 then
            call UnitAddPermanentAbility(whichUnit , 'AId1')
        endif
        set value=LoadReal(UnitData, h, BONUS_ARMOR) + value
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AId1'), 1, ABILITY_DATA_DATA_A, value)
        call IncUnitAbilityLevel(whichUnit, 'AId1')
        call DecUnitAbilityLevel(whichUnit, 'AId1')
        call SaveReal(UnitData, h, BONUS_ARMOR, value)
    endfunction
    function UnitReduceArmorBonus takes unit whichUnit,real value returns nothing
        local integer h= GetHandleId(whichUnit)
        if GetUnitAbilityLevel(whichUnit, 'AId1') <= 0 then
            call UnitAddPermanentAbility(whichUnit , 'AId1')
        endif
        set value=LoadReal(UnitData, h, BONUS_ARMOR) - value
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AId1'), 1, ABILITY_DATA_DATA_A, value)
        call IncUnitAbilityLevel(whichUnit, 'AId1')
        call DecUnitAbilityLevel(whichUnit, 'AId1')
        call SaveReal(UnitData, h, BONUS_ARMOR, value)
    endfunction
    function UnitSetArmorBonus takes unit whichUnit,real newValue returns nothing
        if GetUnitAbilityLevel(whichUnit, 'AId1') <= 0 then
            call UnitAddPermanentAbility(whichUnit , 'AId1')
        endif
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AId1'), 1, ABILITY_DATA_DATA_A, newValue)
        call IncUnitAbilityLevel(whichUnit, 'AId1')
        call DecUnitAbilityLevel(whichUnit, 'AId1')
        call SaveReal(UnitData, GetHandleId(whichUnit), BONUS_ARMOR, newValue)
    endfunction
    //增加单位移动速度
    function UnitAddMoveSpeedBonus takes unit whichUnit,real value returns nothing
        local integer h= GetHandleId(whichUnit)
        if GetUnitAbilityLevel(whichUnit, 'AIms') <= 0 then
            call UnitAddPermanentAbility(whichUnit , 'AIms')
        endif
        set value=LoadReal(UnitData, h, BONUS_MOVESPEED) + value
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIms'), 1, ABILITY_DATA_DATA_A, value)
        call IncUnitAbilityLevel(whichUnit, 'AIms')
        call DecUnitAbilityLevel(whichUnit, 'AIms')
        call SaveReal(UnitData, h, BONUS_MOVESPEED, value)
    endfunction
    //减少单位移动速度
    function UnitReduceMoveSpeedBonus takes unit whichUnit,real value returns nothing
        local integer h= GetHandleId(whichUnit)
        if GetUnitAbilityLevel(whichUnit, 'AIms') <= 0 then
            call UnitAddPermanentAbility(whichUnit , 'AIms')
        endif
        set value=LoadReal(UnitData, h, BONUS_MOVESPEED) - value
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIms'), 1, ABILITY_DATA_DATA_A, value)
        call IncUnitAbilityLevel(whichUnit, 'AIms')
        call DecUnitAbilityLevel(whichUnit, 'AIms')
        call SaveReal(UnitData, h, BONUS_MOVESPEED, value)
    endfunction
    //设置单位移动速度
    function UnitSetMoveSpeedBonus takes unit whichUnit,real newValue returns nothing
        if GetUnitAbilityLevel(whichUnit, 'AIms') <= 0 then
            call UnitAddPermanentAbility(whichUnit , 'AIms')
        endif
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIms'), 1, ABILITY_DATA_DATA_A, newValue)
        call IncUnitAbilityLevel(whichUnit, 'AIms')
        call DecUnitAbilityLevel(whichUnit, 'AIms')
        call SaveReal(UnitData, GetHandleId(whichUnit), BONUS_MOVESPEED, newValue)
    endfunction
    function UnitAddDamageBonus takes unit whichUnit,real value returns nothing
        local integer h= GetHandleId(whichUnit)
        if GetUnitAbilityLevel(whichUnit, 'AIat') <= 0 then
            call UnitAddPermanentAbility(whichUnit , 'AIat')
        endif
        set value=LoadReal(UnitData, h, BONUS_DAMAGE) + value
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIat'), 1, ABILITY_DATA_DATA_A, value)
        call IncUnitAbilityLevel(whichUnit, 'AIat')
        call DecUnitAbilityLevel(whichUnit, 'AIat')
        call SaveReal(UnitData, h, BONUS_DAMAGE, value)
    endfunction
    function UnitReduceDamageBonus takes unit whichUnit,real value returns nothing
        local integer h= GetHandleId(whichUnit)
        if GetUnitAbilityLevel(whichUnit, 'AIat') <= 0 then
            call UnitAddPermanentAbility(whichUnit , 'AIat')
        endif
        set value=LoadReal(UnitData, h, BONUS_DAMAGE) - value
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIat'), 1, ABILITY_DATA_DATA_A, value)
        call IncUnitAbilityLevel(whichUnit, 'AIat')
        call DecUnitAbilityLevel(whichUnit, 'AIat')
        call SaveReal(UnitData, h, BONUS_DAMAGE, value)
    endfunction
    function UnitSetDamageBonus takes unit whichUnit,real newValue returns nothing
        if GetUnitAbilityLevel(whichUnit, 'AIat') <= 0 then
            call UnitAddPermanentAbility(whichUnit , 'AIat')
        endif
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIat'), 1, ABILITY_DATA_DATA_A, newValue)
        call IncUnitAbilityLevel(whichUnit, 'AIat')
        call DecUnitAbilityLevel(whichUnit, 'AIat')
        call SaveReal(UnitData, GetHandleId(whichUnit), BONUS_DAMAGE, newValue)
    endfunction
    function UnitAddStrBonus takes unit whichUnit,integer value returns nothing
        local integer h= GetHandleId(whichUnit)
        local ability abAamk= EXGetUnitAbility(whichUnit, 'Aamk')
        if GetUnitAbilityLevel(whichUnit, 'Aamk') <= 0 then
            call UnitAddPermanentAbility(whichUnit , 'Aamk')
        endif
        set value=LoadInteger(UnitData, h, BONUS_STR) + value
        call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_C, value)
        call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_B, LoadInteger(UnitData, h, BONUS_INT))
        call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_A, LoadInteger(UnitData, h, BONUS_AGI))
        call IncUnitAbilityLevel(whichUnit, 'Aamk')
        call DecUnitAbilityLevel(whichUnit, 'Aamk')
        call SaveInteger(UnitData, h, BONUS_STR, value)
        set abAamk=null
    endfunction
    function UnitReduceStrBonus takes unit whichUnit,integer value returns nothing
        local integer h= GetHandleId(whichUnit)
        local ability abAamk= EXGetUnitAbility(whichUnit, 'Aamk')
        if GetUnitAbilityLevel(whichUnit, 'Aamk') <= 0 then
            call UnitAddPermanentAbility(whichUnit , 'Aamk')
        endif
        set value=LoadInteger(UnitData, h, BONUS_STR) - value
        call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_C, value)
        call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_B, LoadInteger(UnitData, h, BONUS_INT))
        call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_A, LoadInteger(UnitData, h, BONUS_AGI))
        call IncUnitAbilityLevel(whichUnit, 'Aamk')
        call DecUnitAbilityLevel(whichUnit, 'Aamk')
        call SaveInteger(UnitData, h, BONUS_STR, value)
        set abAamk=null
    endfunction
    function UnitSetStrBonus takes unit whichUnit,integer newValue returns nothing
        local integer h= GetHandleId(whichUnit)
        local ability abAamk= EXGetUnitAbility(whichUnit, 'Aamk')
        if GetUnitAbilityLevel(whichUnit, 'Aamk') <= 0 then
            call UnitAddPermanentAbility(whichUnit , 'Aamk')
        endif
        call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_C, newValue)
        call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_B, LoadInteger(UnitData, h, BONUS_INT))
        call EXSetAbilityDataReal(abAamk, 1, ABILITY_DATA_DATA_A, LoadInteger(UnitData, h, BONUS_AGI))
        call IncUnitAbilityLevel(whichUnit, 'Aamk')
        call DecUnitAbilityLevel(whichUnit, 'Aamk')
        call SaveInteger(UnitData, h, BONUS_STR, newValue)
        set abAamk=null
    endfunction
    //设置单位最大生命值 会按当前比例改变
    function UnitAddMaxLife takes unit whichUnit,real value returns nothing
        local real maxlife= GetUnitState(whichUnit, UNIT_STATE_MAX_LIFE)
        set value=maxlife + value
        call SetUnitState(whichUnit, UNIT_STATE_MAX_LIFE, value)
        if UnitAlive(whichUnit) then
            call SetWidgetLife(whichUnit, GetWidgetLife(whichUnit) * ( value / maxlife ))
        endif
    endfunction
    function UnitReduceMaxLife takes unit whichUnit,real value returns nothing
        local real maxlife= GetUnitState(whichUnit, UNIT_STATE_MAX_LIFE)
        local real life= GetWidgetLife(whichUnit)
        set value=maxlife - value
        call SetUnitState(whichUnit, UNIT_STATE_MAX_LIFE, value)
        if UnitAlive(whichUnit) and maxlife != life then
            call SetWidgetLife(whichUnit, life * ( value / maxlife ))
        endif
    endfunction
    function UnitSetMaxLife takes unit whichUnit,real newVal returns nothing
        local real maxlife= GetUnitState(whichUnit, UNIT_STATE_MAX_LIFE)
        call SetUnitState(whichUnit, UNIT_STATE_MAX_LIFE, newVal)
        if UnitAlive(whichUnit) then
            call SetWidgetLife(whichUnit, GetWidgetLife(whichUnit) * ( newVal / maxlife )) //按比例改变血量
endif
    endfunction
    //设置单位最大魔法值 会按当前比例改变
    function UnitAddMaxMana takes unit whichUnit,real value returns nothing
        local real maxmana= GetUnitState(whichUnit, UNIT_STATE_MAX_MANA)
        local real mana= GetUnitState(whichUnit, UNIT_STATE_MANA)
        set value=maxmana + value
        call SetUnitState(whichUnit, UNIT_STATE_MAX_MANA, value)
        if UnitAlive(whichUnit) then
            if maxmana == mana then
                call SetUnitState(whichUnit, UNIT_STATE_MANA, value)
            else
                call SetUnitState(whichUnit, UNIT_STATE_MANA, GetUnitState(whichUnit, UNIT_STATE_MANA) * ( value / maxmana ))
            endif
        endif
    endfunction
    function UnitReduceMaxMana takes unit whichUnit,real value returns nothing
        local real maxmana= GetUnitState(whichUnit, UNIT_STATE_MAX_MANA)
        local real mana= GetUnitState(whichUnit, UNIT_STATE_MANA)
        set value=maxmana - value
        call SetUnitState(whichUnit, UNIT_STATE_MAX_MANA, value)
        if UnitAlive(whichUnit) and maxmana != mana then
            call SetUnitState(whichUnit, UNIT_STATE_MANA, mana * ( value / maxmana ))
        endif
    endfunction
    function UnitSetMaxMana takes unit whichUnit,real newVal returns nothing
        local real maxmana= GetUnitState(whichUnit, UNIT_STATE_MAX_MANA)
        call SetUnitState(whichUnit, UNIT_STATE_MAX_MANA, newVal)
        if UnitAlive(whichUnit) then
            call SetUnitState(whichUnit, UNIT_STATE_MANA, GetUnitState(whichUnit, UNIT_STATE_MANA) * ( newVal / maxmana ))
        endif
    endfunction
    //仅用作物品刷新属性
    function UnitAddAttribute takes unit whichUnit,integer itemId returns nothing
        local integer h= GetHandleId(whichUnit)
        local integer str= LoadInteger(UnitData, h, BONUS_STR) + LoadInteger(ObjectData, itemId, BONUS_STR)
        local integer agi= LoadInteger(UnitData, h, BONUS_AGI) + LoadInteger(ObjectData, itemId, BONUS_AGI)
        local integer int= LoadInteger(UnitData, h, BONUS_INT) + LoadInteger(ObjectData, itemId, BONUS_INT)
        if GetUnitAbilityLevel(whichUnit, 'Aamk') <= 0 then
            call UnitAddPermanentAbility(whichUnit , 'Aamk')
        endif
        call SaveInteger(UnitData, h, BONUS_STR, str)
        call SaveInteger(UnitData, h, BONUS_AGI, agi)
        call SaveInteger(UnitData, h, BONUS_INT, int)
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'Aamk'), 1, ABILITY_DATA_DATA_C, str)
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'Aamk'), 1, ABILITY_DATA_DATA_B, int)
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'Aamk'), 1, ABILITY_DATA_DATA_A, agi)
        call IncUnitAbilityLevel(whichUnit, 'Aamk')
        call DecUnitAbilityLevel(whichUnit, 'Aamk')
    endfunction
    function UnitReduceAttribute takes unit whichUnit,integer itemId returns nothing
        local integer h= GetHandleId(whichUnit)
        local integer str= LoadInteger(UnitData, h, BONUS_STR) - LoadInteger(ObjectData, itemId, BONUS_STR)
        local integer agi= LoadInteger(UnitData, h, BONUS_AGI) - LoadInteger(ObjectData, itemId, BONUS_AGI)
        local integer int= LoadInteger(UnitData, h, BONUS_INT) - LoadInteger(ObjectData, itemId, BONUS_INT)
        if GetUnitAbilityLevel(whichUnit, 'Aamk') <= 0 then
            call UnitAddPermanentAbility(whichUnit , 'Aamk')
        endif
        call SaveInteger(UnitData, h, BONUS_STR, str)
        call SaveInteger(UnitData, h, BONUS_AGI, agi)
        call SaveInteger(UnitData, h, BONUS_INT, int)
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'Aamk'), 1, ABILITY_DATA_DATA_C, str)
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'Aamk'), 1, ABILITY_DATA_DATA_B, int)
        call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'Aamk'), 1, ABILITY_DATA_DATA_A, agi)
        call IncUnitAbilityLevel(whichUnit, 'Aamk')
        call DecUnitAbilityLevel(whichUnit, 'Aamk')
    endfunction
    function GetUnitStateBonus takes unit whichUnit,integer iBonusType returns real
        return LoadReal(UnitData, GetHandleId(whichUnit), iBonusType)
    endfunction
    // 通过句柄来查单位的额外属性加成 会被内联
    function GetUnitStateBonusByHandleId takes integer whichHandleId,integer iBonusType returns real
        return LoadReal(UnitData, whichHandleId, iBonusType)
    endfunction
    // 同步镜像与本体的属性
    function SyncIllusionUnitState takes unit hIllusionUnit,unit hMasterUnit returns nothing
        local real value= 0.
        local ability hAbilityAamk
        local integer iMasterUnitHandleId= GetHandleId(hMasterUnit)
        // 攻击力
        set value=GetUnitStateBonusByHandleId(iMasterUnitHandleId , BONUS_DAMAGE)
        call UnitSetDamageBonus(hIllusionUnit , value)
        // 护甲
        set value=GetUnitStateBonusByHandleId(iMasterUnitHandleId , BONUS_ARMOR)
        call UnitSetArmorBonus(hIllusionUnit , value)
        // 攻速
        set value=GetUnitStateBonusByHandleId(iMasterUnitHandleId , BONUS_ATTACK)
        call UnitAddAttackSpeedBonus(hIllusionUnit , value)
        // 如果AHer ＞ 0 就是英雄单位镜像
        if GetUnitAbilityLevel(hIllusionUnit, 'AHer') > 0 and GetUnitAbilityLevel(hMasterUnit, 'Aamk') > 0 then
            set hAbilityAamk=EXGetUnitAbility(hIllusionUnit, 'Aamk')
            call EXSetAbilityDataReal(hAbilityAamk, 1, ABILITY_DATA_DATA_C, GetUnitStateBonusByHandleId(iMasterUnitHandleId , BONUS_STR))
            call EXSetAbilityDataReal(hAbilityAamk, 1, ABILITY_DATA_DATA_B, GetUnitStateBonusByHandleId(iMasterUnitHandleId , BONUS_INT))
            call EXSetAbilityDataReal(hAbilityAamk, 1, ABILITY_DATA_DATA_A, GetUnitStateBonusByHandleId(iMasterUnitHandleId , BONUS_AGI))
            set hAbilityAamk=null
            call IncUnitAbilityLevel(hIllusionUnit, 'Aamk')
            call DecUnitAbilityLevel(hIllusionUnit, 'Aamk')
            // 生命值和魔法值默认同步 但如果修改了额外属性可能会导致不一致
            // 最大生命值
            set value=GetUnitState(hMasterUnit, UNIT_STATE_MAX_LIFE)
            call SetUnitState(hIllusionUnit, UNIT_STATE_MAX_LIFE, value)
            // 最大魔法值
            set value=GetUnitState(hMasterUnit, UNIT_STATE_MAX_MANA)
            call SetUnitState(hIllusionUnit, UNIT_STATE_MAX_MANA, value)
        endif
    endfunction
    //初始化单位属性 暂时弃用 (因为每个单位要加出生直接多4个技能太浪费了)
    
// scope UnitBonusSystem ends
// 一些通用技能模板
//
//===========================================================================
//冲击波类
function WaveDamageEnumUnit takes unit whichUnit,unit targetUnit,integer damageType,real damageAmount,string funcName,integer level returns nothing
	call DamageUnit(whichUnit , targetUnit , damageType , damageAmount)
	if funcName != null then
		//set Wave_U = whichUnit
		//set Wave_Sou = targetUnit
		//set Wave_LV = level
		call ExecuteFunc(funcName)
	endif
endfunction
function WaveRunningActions takes nothing returns nothing
 local trigger trig= GetTriggeringTrigger()
 local integer iHandleId= GetHandleId(trig)
 local effect missileEffect= LoadEffectHandle(HT, iHandleId, 0)
 local real damage= LoadReal(HT, iHandleId, 0)
 local real angle= LoadReal(HT, iHandleId, 3) * bj_DEGTORAD
 local real speed= LoadReal(HT, iHandleId, 4)
 local real area= LoadReal(HT, iHandleId, 8)
 local unit spellUnit
 local unit firstUnit
 local group injuredUnitGroup
 local group targetUnitGroup
 local boolean b= LoadBoolean(HT, iHandleId, 10)
 local boolean funcEnd= false
 local integer damageType= LoadInteger(HT, iHandleId, 1)
 local string funcstr= LoadStr(HT, iHandleId, 0)
 local integer level= LoadInteger(HT, iHandleId, 5)
 local boolean isTimeEvent= GetTriggerEventId() == EVENT_GAME_TIMER_EXPIRED
 local real effectX
 local real effectY
 local real radius
 local real UnitAngleBetween
	if isTimeEvent then
		call EXSetEffectXY(missileEffect, CoordinateX(EXGetEffectX(missileEffect) + speed * Cos(angle)), CoordinateY(EXGetEffectY(missileEffect) + speed * Sin(angle)))
		call SaveInteger(HT, iHandleId, 12, LoadInteger(HT, iHandleId, 12) + 1)
		if LoadInteger(HT, iHandleId, 12) > LoadInteger(HT, iHandleId, 13) then
			set funcEnd=true
			call EXSetEffectXY(missileEffect, LoadReal(HT, iHandleId, 5), LoadReal(HT, iHandleId, 6))
		endif
		//else
		//	set firstUnit = GetTriggerUnit()
	endif
	if b then
		set injuredUnitGroup=LoadGroupHandle(HT, iHandleId, 2)
		set targetUnitGroup=LoginGroup()
		set effectX=EXGetEffectX(missileEffect)
		set effectY=EXGetEffectY(missileEffect)
		set radius=area + LoadReal(HT, iHandleId, 9) * ( GetTriggerEvalCount(trig) - 1 ) + 100
		set spellUnit=LoadUnitHandle(HT, iHandleId, 5)
		set P2=GetOwningPlayer(spellUnit)
		call GroupEnumUnitsInRange(targetUnitGroup, effectX, effectY, radius, LoadBooleanExprHandle(HT, iHandleId, 15))
		call GroupRemoveGroup(injuredUnitGroup, targetUnitGroup)
		set radius=radius - 100
		loop
			set firstUnit=FirstOfGroup(targetUnitGroup)
			exitwhen firstUnit == null
			call GroupRemoveUnit(targetUnitGroup, firstUnit)
			if IsUnitInRangeXY(firstUnit, effectX, effectY, radius) then
				if GetTriggerEvalCount(trig) < 3 then
					set angle=LoadReal(HT, iHandleId, 3)
					set UnitAngleBetween=AngleBetweenXY(effectX , effectY , GetUnitX(firstUnit) , GetUnitY(firstUnit))
					if ( angle - UnitAngleBetween < - 180.00 ) then
						set angle=( angle - UnitAngleBetween + 360 )
					else
						if ( angle - UnitAngleBetween > 180.00 ) then
							set angle=angle - UnitAngleBetween - 360
						else
							set angle=angle - UnitAngleBetween
						endif
					endif
					set angle=RAbsBJ(angle)
					if angle <= 120 then
						call GroupAddUnit(injuredUnitGroup, firstUnit)
						call WaveDamageEnumUnit(spellUnit , firstUnit , damageType , damage , funcstr , level)
					endif
				else
					call GroupAddUnit(injuredUnitGroup, firstUnit)
					call WaveDamageEnumUnit(spellUnit , firstUnit , damageType , damage , funcstr , level)
				endif
			endif
		endloop
		call LogoutGroup(targetUnitGroup)
		if funcEnd then
			call LogoutGroup(injuredUnitGroup)
		endif
	elseif not isTimeEvent then
		call WaveDamageEnumUnit(LoadUnitHandle(HT, iHandleId, 5) , firstUnit , damageType , damage , funcstr , level)
	endif
	if funcEnd then
		call DestroyBoolExpr(LoadBooleanExprHandle(HT, iHandleId, 15))
		call FlushChildHashtable(HT, iHandleId)
		call ClearTrigger(trig)
		call DestroyEffect(missileEffect)
	endif
	set firstUnit=null
	set missileEffect=null
	set trig=null
	set injuredUnitGroup=null
	set targetUnitGroup=null
	set spellUnit=null
endfunction
//如果参数area和range的值一样，为矩形冲击波，每次选取的范围一样.range＞area则像食腐蜂群。
//单位释放冲击波 - 使用特效来作为投射物 (不建议过远)
//func可以填null,则没有特殊效果,filter如果null则是无差别伤害.
function UnitSpellWaveByEffect takes unit whichUnit,effect missileEffect,real damage,real maxDistance,real area,real range,real startX,real startY,real targetX,real targetY,real missileSpeed,integer damageType,string func,integer level,code filter returns nothing
 local trigger trig= CreateTrigger()
 local integer iHandleId= GetHandleId(trig)
 local real angle= AngleBetweenXY(startX , startY , targetX , targetY)
 local real interval= 0.02
 local real speed= missileSpeed * interval
 local integer maxEvalCount= R2I(maxDistance / speed) + 1
	call EXEffectMatRotateZ(missileEffect, angle)
	call SaveBooleanExprHandle(HT, iHandleId, 15, Condition(filter))
	call SaveEffectHandle(HT, iHandleId, 0, missileEffect)
	call SaveReal(HT, iHandleId, 0, damage)
	call SaveUnitHandle(HT, iHandleId, 5, whichUnit)
	call SaveReal(HT, iHandleId, 1, maxDistance)
	call SaveReal(HT, iHandleId, 2, range)
	call SaveReal(HT, iHandleId, 3, angle)
	call SaveReal(HT, iHandleId, 4, speed)
	call SaveInteger(HT, iHandleId, 13, maxEvalCount)
	call TriggerRegisterTimerEvent(trig, interval, true)
	call TriggerRegisterTimerEvent(trig, 0, false)
	call TriggerAddCondition(trig, Condition(function WaveRunningActions))
	call SaveReal(HT, iHandleId, 8, area)
	call SaveReal(HT, iHandleId, 9, ( range - area ) / I2R(maxEvalCount))
	call SaveGroupHandle(HT, iHandleId, 2, LoginGroup())
	call SaveBoolean(HT, iHandleId, 10, true)
	call EXSetEffectXY(missileEffect, CoordinateX(startX + area / 2. * Cos(angle * bj_DEGTORAD)), CoordinateY(startY + area / 2. * Sin(angle * bj_DEGTORAD)))
	call SaveReal(HT, iHandleId, 5, CoordinateX(EXGetEffectX(missileEffect) + maxDistance * Cos(angle * bj_DEGTORAD)))
	call SaveReal(HT, iHandleId, 6, CoordinateY(EXGetEffectY(missileEffect) + maxDistance * Sin(angle * bj_DEGTORAD)))
	call SaveInteger(HT, iHandleId, 1, damageType)
	//call SaveBoolean(HT, iHandleId, 0, b)
	if func != null then
		call SaveStr(HT, iHandleId, 0, func)
		call SaveInteger(HT, iHandleId, 5, level)
	endif
	set trig=null
endfunction
//战争践踏
//让单位释放一个践踏
//目标允许强制为 地面,非机械,非建筑,存活
function UnitSpellStmop takes unit whichUnit,real damage,integer damageType,real dur,real herodur,real area,boolean ignoreMagicImmunes,string effectPath returns nothing
 local group targetGroup= LoginGroup()
 local real unitX= GetUnitX(whichUnit)
 local real unitY= GetUnitY(whichUnit)
 local unit firstUnit
	call GroupEnumUnitsInRange(targetGroup, unitX, unitY, area, null)
	set P2=GetOwningPlayer(whichUnit)
	loop
		set firstUnit=FirstOfGroup(targetGroup)
		exitwhen firstUnit == null
		if IsGround_NotMechanical_Enemy_Alive_NoStructure(firstUnit) then
			call M_UnitSetStun(firstUnit , dur , herodur , ignoreMagicImmunes)
			call DamageUnit(whichUnit , firstUnit , damageType , damage)
		endif
		call GroupRemoveUnit(targetGroup, firstUnit)
	endloop
	call DestroyEffect(AddSpecialEffect(effectPath, unitX, unitY))
	//地形就不变化了,因为这可能会很卡
	set firstUnit=null
	call LogoutGroup(targetGroup)
	set targetGroup=null
endfunction
//光击阵
function UnitSpellLightStrikeArray takes unit whichUnit,real damage,integer damageType,real targetX,real targetY,real radius,real dur,real herodur,boolean ignoreMagicImmunes returns nothing
 local group targetUnitGroup= LoginGroup()
 local unit firstUnit
	call GroupEnumUnitsInRange(targetUnitGroup, targetX, targetY, radius, null)
	set P2=GetOwningPlayer(whichUnit)
	loop
		set firstUnit=FirstOfGroup(targetUnitGroup)
		exitwhen firstUnit == null
		if IsGround_NotMechanical_Enemy_Alive_NoStructure(firstUnit) then
			call M_UnitSetStun(firstUnit , dur , herodur , ignoreMagicImmunes)
			call DamageUnit(whichUnit , firstUnit , damageType , damage)
		endif
		call GroupRemoveUnit(targetUnitGroup, firstUnit)
	endloop
	call LogoutGroup(targetUnitGroup)
	set targetUnitGroup=null
	set firstUnit=null
endfunction
// scope Image begins
    // 设置单位高度来到达隐藏单位，并同时隐藏单位阴影(需要用逆变身来刷新)。
    function M_ShowUnit takes unit whichUnit,boolean bIsShow returns nothing
        if bIsShow then
            call SetUnitShadow(whichUnit , "Shadow")
            call SetUnitInvulnerable(whichUnit, false)
            call EXPauseUnit(whichUnit, false)
            call SetUnitFlyHeight(whichUnit, GetUnitDefaultFlyHeight(whichUnit), 0)
        else
            call SetUnitShadow(whichUnit , "_")
            call SetUnitInvulnerable(whichUnit, true)
            call EXPauseUnit(whichUnit, true)
            call UnitAddAbility(whichUnit, 'Arav')
            call UnitRemoveAbility(whichUnit, 'Arav')
            call SetUnitFlyHeight(whichUnit, 9999, 0)
        endif
    endfunction
    function Image___CreateIllusionUnit takes integer iHandleId,integer iMaxAmount returns nothing
        local trigger trig= LoadTriggerHandle(HT, iHandleId, 0)
        local integer iHandleId2= GetHandleId(trig)
        local unit whichUnit= LoadUnitHandle(HT, iHandleId2, 0)
        local unit dummyUnit= CreateUnit(GetOwningPlayer(whichUnit), 'ndum', GetUnitX(whichUnit), GetUnitY(whichUnit), 0)
        local integer realUnitIndex= GetRandomInt(1, iMaxAmount)
        local real dataB= LoadReal(HT, iHandleId2, 'B')
        local real dataC= LoadReal(HT, iHandleId2, 'C')
        local real rDur= LoadReal(HT, iHandleId2, 0)
        local integer loop__i= 1
        local effect eImageMissileEff
        local ability hAbilityAIil
        call SaveUnitHandle(HT, GetHandleId(dummyUnit), KEY_MASTERUNIT, whichUnit)
        call UnitAddAbility(dummyUnit, Image___ImageAbility)
        set hAbilityAIil=EXGetUnitAbility(dummyUnit, Image___ImageAbility)
        call EXSetAbilityDataReal(hAbilityAIil, 1, ABILITY_DATA_DUR, rDur)
        call EXSetAbilityDataReal(hAbilityAIil, 1, ABILITY_DATA_HERODUR, rDur)
        set hAbilityAIil=null
        // 给召唤者标识一下
        call SaveBoolean(UnitBuff, GetHandleId(whichUnit), UnitIsSummoningIllusions, true)
        set Tmp__ArrayReal['B']=dataB
        set Tmp__ArrayReal['C']=dataC
        call M_ShowUnit(whichUnit , true)
        loop
            set eImageMissileEff=LoadEffectHandle(HT, iHandleId, loop__i)
            if loop__i != realUnitIndex then
                set Tmp__ArrayReal['X']=EXGetEffectX(eImageMissileEff)
                set Tmp__ArrayReal['Y']=EXGetEffectY(eImageMissileEff)
                call IssueTargetOrderById(dummyUnit, 852274, whichUnit)
            else
                call SetUnitX(whichUnit, EXGetEffectX(eImageMissileEff))
                call SetUnitY(whichUnit, EXGetEffectY(eImageMissileEff))
            endif
            call DestroyEffect(eImageMissileEff)
            exitwhen loop__i == iMaxAmount
            set loop__i=loop__i + 1
        endloop
        call RemoveSavedBoolean(UnitBuff, GetHandleId(whichUnit), UnitIsSummoningIllusions)
        call DestroyFogModifier(LoadFogModifierHandle(HT, iHandleId2, 20))
        call ClearTrigger(trig)
        call FlushChildHashtable(HT, iHandleId2)
        set trig=null
        set eImageMissileEff=null
        set whichUnit=null
        set dummyUnit=null
    endfunction
    function Image___ImageMissileMovement takes nothing returns boolean
        local integer iHandleId= GetHandleId(GetTriggeringTrigger())
        local integer iMaxAmount= LoadInteger(HT, iHandleId, 'A')
        local real rMissileSpeed= LoadReal(HT, iHandleId, 'S')
        local effect eImageMissileEff
        local integer loop__i= 1
        local real angle
        local real rTargetX
        local real rTargetY
        local integer iCount= LoadInteger(HT, iHandleId, 'C')
        set iCount=iCount - 1
        if iCount > 0 then
            call SaveInteger(HT, iHandleId, 'C', iCount)
            loop
                set angle=( loop__i * 360 / iMaxAmount ) * bj_DEGTORAD
                set eImageMissileEff=LoadEffectHandle(HT, iHandleId, loop__i)
                set rTargetX=CoordinateX(EXGetEffectX(eImageMissileEff) + rMissileSpeed * Cos(angle))
                set rTargetY=CoordinateY(EXGetEffectY(eImageMissileEff) + rMissileSpeed * Sin(angle))
                call EXSetEffectXY(eImageMissileEff, rTargetX, rTargetY)
                exitwhen loop__i == iMaxAmount
                set loop__i=loop__i + 1
            endloop
        else
            call Image___CreateIllusionUnit(iHandleId , iMaxAmount)
            call ClearTrigger(GetTriggeringTrigger())
            call FlushChildHashtable(HT, iHandleId)
        endif
        set eImageMissileEff=null
        return false
    endfunction
    // 创建镜像的投射物
    function Image___CreateImageMissile takes nothing returns boolean
        // 镜像的机制 如果镜像数量＜2 则取随机±180角度
        local integer iHandleId= GetHandleId(GetTriggeringTrigger())
        local unit whichUnit= LoadUnitHandle(HT, iHandleId, 0)
        local real rStartX= GetUnitX(whichUnit)
        local real rStartY= GetUnitY(whichUnit)
        // 投射物数量 = 幻象数量 + 1 因为本体也要有一个投射物
        local integer iMaxAmount= LoadInteger(HT, iHandleId, 'A') + 1
        local real rRng= LoadReal(HT, iHandleId, 'R')
        local real rMissileSpeed= LoadReal(HT, iHandleId, 'S') * 0.03
        local string sMissileArt= LoadStr(HT, iHandleId, 10)
        local real rFace= GetUnitFacing(whichUnit)
        local effect eImageMissileEff
        local integer loop__i
        // 对于上个触发器的参数读取应该在这条注释上面
        call BJDebugMsg(I2S(iMaxAmount) + "iMaxAmount")
        set iHandleId=CreateTimerEventTrigger(0.03 , true , function Image___ImageMissileMovement)
        if HaveSavedHandle(HT, iHandleId, 100) then
            call DestroyEffect(LoadEffectHandle(HT, iHandleId, 100))
        endif
        // 继续传参
        call SaveInteger(HT, iHandleId, 'A', iMaxAmount)
        call SaveReal(HT, iHandleId, 'R', rRng)
        call SaveReal(HT, iHandleId, 'S', rMissileSpeed)
        // 触发器的最大运行次数
        call SaveInteger(HT, iHandleId, 'C', R2I(rRng / rMissileSpeed))
        set loop__i=1
        loop
            set eImageMissileEff=AddSpecialEffect(sMissileArt, rStartX, rStartY)
            call SaveEffectHandle(HT, iHandleId, loop__i, eImageMissileEff)
            exitwhen loop__i == iMaxAmount
            set loop__i=loop__i + 1
        endloop
        set eImageMissileEff=null
        call SaveTriggerHandle(HT, iHandleId, 0, GetTriggeringTrigger())
        //call TriggerRegisterTimerEvent(hTrig, 0.03, true)
        set whichUnit=null
        return false
    endfunction
    // 单位释放分身 (剑圣分身)
    // DataA分身数量,DataB伤害比例,DataC受伤比例,DataD技能延迟,Rng施法距离(位移距离),Area作用范围(施法时提供的视野)
    function UnitSpellImage takes unit whichUnit,real rDataA,real rDataB,real rDataC,real rDataD,real rDur,string sSpecialArt,string sMissileArt,real rMissileSpeed,real rRng,real rArea returns nothing
        local integer iHandleId= CreateTimerEventTrigger(rDataD , false , function Image___CreateImageMissile)
        local real rUnitX= GetUnitX(whichUnit)
        local real rUnitY= GetUnitY(whichUnit)
        local fogmodifier hImageFog= CreateFogModifierRadius(GetOwningPlayer(whichUnit), FOG_OF_WAR_VISIBLE, rUnitX, rUnitY, rArea, true, false)
        if sSpecialArt != null then
            call SaveEffectHandle(HT, iHandleId, 100, AddSpecialEffect(sSpecialArt, rUnitX, rUnitY))
        endif
        call M_ShowUnit(whichUnit , false)
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
        set hImageFog=null
    endfunction
// scope Image ends
// scope ItemSystem begins
    function GetPowerUpItemNumber takes item it returns integer
        local integer id
        local integer i= 1
        if it == null then
            return - 2
        endif
        set id=GetItemTypeId(it)
        loop
            if ItemStack_PowerUp[i] == id then
                return i
            endif
            set i=i + 1
            exitwhen i > ItemStack_Number
        endloop
        return - 1
    endfunction
    function GetPowerUpItemNumberById takes integer whichType returns integer
        local integer id
        local integer i= 1
        loop
            if ItemStack_PowerUp[i] == whichType then
                return i
            endif
            set i=i + 1
            exitwhen i > ItemStack_Number
        endloop
        return - 1
    endfunction
    function GetRealItemNumberById takes integer whichType returns integer
        local integer id
        local integer i= 1
        loop
            if ItemStack_Real[i] == whichType then
                return i
            endif
            set i=i + 1
            exitwhen i > ItemStack_Number
        endloop
        return - 1
    endfunction
    
    function AddUntiItemState takes unit whichUnit,integer itemId returns nothing
        local real data= 0
        call UnitAddAttribute(whichUnit , itemId)
        if HaveSavedReal(ObjectData, itemId, BONUS_DAMAGE) then
            set data=LoadReal(ObjectData, itemId, BONUS_DAMAGE)
            call UnitAddDamageBonus(whichUnit , data)
        endif
        if HaveSavedReal(ObjectData, itemId, BONUS_ARMOR) then
            set data=LoadReal(ObjectData, itemId, BONUS_ARMOR)
            call UnitAddArmorBonus(whichUnit , data)
        endif
        if HaveSavedReal(ObjectData, itemId, BONUS_ATTACK) then
            set data=LoadReal(ObjectData, itemId, BONUS_ATTACK)
            call UnitAddAttackSpeedBonus(whichUnit , data)
        endif
        if HaveSavedReal(ObjectData, itemId, BONUS_LIFE) then
            set data=LoadReal(ObjectData, itemId, BONUS_LIFE)
            call UnitAddMaxLife(whichUnit , data)
        endif
        if HaveSavedReal(ObjectData, itemId, BONUS_MANA) then
            set data=LoadReal(ObjectData, itemId, BONUS_MANA)
            call UnitAddMaxMana(whichUnit , data)
        endif
        if HaveSavedReal(ObjectData, itemId, BONUS_MOVESPEED) then
            set data=LoadReal(ObjectData, itemId, BONUS_MOVESPEED)
            call UnitAddMoveSpeedBonus(whichUnit , data)
        endif
    endfunction
    function ReduceUnitItemState takes unit whichUnit,integer itemId returns nothing
        local real data= 0
        call UnitReduceAttribute(whichUnit , itemId)
        if HaveSavedReal(ObjectData, itemId, BONUS_DAMAGE) then
            set data=LoadReal(ObjectData, itemId, BONUS_DAMAGE)
            call UnitReduceDamageBonus(whichUnit , data)
        endif
        if HaveSavedReal(ObjectData, itemId, BONUS_ARMOR) then
            set data=LoadReal(ObjectData, itemId, BONUS_ARMOR)
            call UnitReduceArmorBonus(whichUnit , data)
        endif
        if HaveSavedReal(ObjectData, itemId, BONUS_ATTACK) then
            set data=LoadReal(ObjectData, itemId, BONUS_ATTACK)
            call UnitReduceAttackSpeedBonus(whichUnit , data)
        endif
        if HaveSavedReal(ObjectData, itemId, BONUS_LIFE) then
            set data=LoadReal(ObjectData, itemId, BONUS_LIFE)
            call UnitReduceMaxLife(whichUnit , data)
        endif
        if HaveSavedReal(ObjectData, itemId, BONUS_MANA) then
            set data=LoadReal(ObjectData, itemId, BONUS_MANA)
            call UnitReduceMaxMana(whichUnit , data)
        endif
        if HaveSavedReal(ObjectData, itemId, BONUS_MOVESPEED) then
            set data=LoadReal(ObjectData, itemId, BONUS_MOVESPEED)
            call UnitReduceMoveSpeedBonus(whichUnit , data)
        endif
    endfunction
    function ItemSystem___create_powerupitem_actions takes nothing returns boolean
        local trigger t= GetTriggeringTrigger()
        local integer h= GetHandleId(t)
        call EXCreateItem(LoadInteger(HT, h, 100) , LoadReal(HT, h, 101) , LoadReal(HT, h, 102))
        call FlushChildHashtable(HT, h)
        call ClearTrigger(t)
        set t=null
        return false
    endfunction
    
    function ItemSystem___UnitPickPowerUpItem takes unit u,item it,integer itemId returns nothing
        local integer realId= GetPowerUpItemNumberById(itemId)
        local integer h
        local item newItem= null
        local real x
        local real y
        if realId == - 1 then
            call Debug("log" , GetObjectName(itemId) + " 没有Real物品")
            return
        endif
        set x=GetWidgetX(it)
        set y=GetWidgetY(it)
        set newItem=EXCreateItem(ItemStack_Real[realId] , x , y)
        call DisableTrigger(ItemAttrTrig)
        call RemoveItem(it)
        call EnableTrigger(ItemAttrTrig)
        if not UnitAddItem(u, newItem) then //如果给不了则创建PowerUp回去
call RemoveItem(newItem) //0.秒计时后创建物品,否则会被挤开
set h=CreateTimerEventTrigger(0. , false , function ItemSystem___create_powerupitem_actions)
            call SaveInteger(HT, h, 100, itemId)
            call SaveReal(HT, h, 101, x)
            call SaveReal(HT, h, 102, y)
        endif
        set newItem=null
    endfunction
    
    function ItemSystem___unitdropitem_actions takes nothing returns boolean
        local trigger t= GetTriggeringTrigger()
        local integer h= GetHandleId(t)
        local item it= LoadItemHandle(HT, h, 100)
        local integer powerupId= ItemStack_PowerUp[LoadInteger(HT, h, 100)]
        call FlushChildHashtable(HT, h)
        call ClearTrigger(t)
        //又是0.计时,为了物品位置正确
        if not IsItemOwned(it) then //判断一下是给人了还是丢地上了
//call Debug("log", "X/Y: "+ R2S(x) + "/" + R2S(y))
set h=CreateTimerEventTrigger(0. , false , function ItemSystem___create_powerupitem_actions)
            call SaveInteger(HT, h, 100, powerupId)
            call SaveReal(HT, h, 101, GetWidgetX(it))
            call SaveReal(HT, h, 102, GetWidgetY(it))
            //
            call RemoveItem(it)
        endif
        set t=null
        set it=null
        return false
    endfunction
    
    function ItemSystem___UnitDropRealItem takes unit u,item it,integer itemId returns nothing
        local trigger t= null
        local integer h
        local integer powerupId= GetRealItemNumberById(itemId)
        if powerupId == - 1 then
            call Debug("log" , GetObjectName(itemId) + " 没有PowerUp物品")
            return
        endif
        set t=CreateTrigger() //0.秒计时之后才能正确得到物品位置
set h=GetHandleId(t)
        call SaveInteger(HT, h, 100, powerupId)
        call SaveItemHandle(HT, h, 100, it)
        call TriggerAddCondition(t, Condition(function ItemSystem___unitdropitem_actions))
        call TriggerRegisterTimerEvent(t, 0., false)
        set t=null
    endfunction
    
    function ItemSystem___itemtrigger_actions takes nothing returns boolean
        local unit u= GetTriggerUnit()
        local item it= GetManipulatedItem()
        local integer itemId= GetItemTypeId(it)
        local real mana
        local eventid hTriggerEventId= GetTriggerEventId()
        //拾取能量提升物品时会同时相应丢弃事件,过滤一下
        if IsItemPowerup(it) then
            if hTriggerEventId == EVENT_PLAYER_UNIT_PICKUP_ITEM then
                call ItemSystem___UnitPickPowerUpItem(u , it , itemId)
            endif
        else
            set mana=GetUnitState(u, UNIT_STATE_MAX_MANA)
            if IsUnitType(u, UNIT_TYPE_HERO) then
                if hTriggerEventId == EVENT_PLAYER_UNIT_PICKUP_ITEM then //获得物品
call AddUntiItemState(u , itemId)
                elseif hTriggerEventId == EVENT_PLAYER_UNIT_DROP_ITEM then //丢弃物品
call ReduceUnitItemState(u , itemId)
                    call ItemSystem___UnitDropRealItem(u , it , itemId) //需要在这之前判断是给别人了还是丢地上了
elseif hTriggerEventId == EVENT_PLAYER_UNIT_PAWN_ITEM then //抵押物品
//	call Debug("log","抵押物品:" + GetObjectName(itemId))
endif
            endif
            call RefreshUnitState(u)
            if mana != GetUnitState(u, UNIT_STATE_MAX_MANA) then
                call Debug("log" , "最大魔法值变化")
                call RefreshAbilityCost(u)
            endif
        endif
        set u=null
        set it=null
        set hTriggerEventId=null
        return false
    endfunction
    
    function SetItemHeroAttribute takes integer whichType,integer str,integer agi,integer int returns nothing
        if str != 0 then
            call SaveInteger(ObjectData, whichType, BONUS_STR, str)
        endif
        if agi != 0 then
            call SaveInteger(ObjectData, whichType, BONUS_AGI, agi)
        endif
        if int != 0 then
            call SaveInteger(ObjectData, whichType, BONUS_INT, int)
        endif
    endfunction
    function SetItemAttribute takes integer whichType,integer damage,integer life,integer mana,real armor,real attack,integer speed returns nothing
        if damage != 0 then
            call SaveReal(ObjectData, whichType, BONUS_DAMAGE, damage)
        endif
        if life != 0 then
            call SaveReal(ObjectData, whichType, BONUS_LIFE, life)
        endif
        if mana != 0 then
            call SaveReal(ObjectData, whichType, BONUS_MANA, mana)
        endif
        if armor != 0 then
            call SaveReal(ObjectData, whichType, BONUS_ARMOR, armor)
        endif
        if attack != 0 then
            call SaveReal(ObjectData, whichType, BONUS_ATTACK, attack)
        endif
        if speed != 0 then
            call SaveReal(ObjectData, whichType, BONUS_MOVESPEED, speed)
        endif
    endfunction
    function ItemAddStateBonus takes integer whichType,integer bonusType,real value returns nothing
        if value != 0 then
            call SaveReal(ObjectData, whichType, bonusType, value)
        endif
    endfunction
    function registeritem takes integer powerup,integer i_real,integer i_disabled returns integer
        set ItemStack_Number=ItemStack_Number + 1
        set ItemStack_PowerUp[ItemStack_Number]=powerup
        set ItemStack_Real[ItemStack_Number]=i_real
        set ItemStack_Disabled[ItemStack_Number]=i_disabled
        return ItemStack_Number
    endfunction
    //注册物品
    function InitRegisterItem takes nothing returns nothing
        set ITEM_ArcaneBoots=registeritem('IP01' , 'IR01' , 'ID01')
        set ITEM_SpeedBoots=registeritem('IP02' , 'IR02' , 'ID02')
        set ITEM_AssaultCuirass=registeritem('IP03' , 'IR03' , 'ID03')
        set ITEM_Satanic=registeritem('IP04' , 'IR04' , 'ID04')
        set ITEM_MoonShard=registeritem('IP05' , 'IR05' , 'ID05')
    endfunction
    //初始化物品属性 - 英雄三围
    function InitItemHeroAttribute takes nothing returns nothing
        call SetItemHeroAttribute('cnob' , 5 , 5 , 5) //贵族圆环
//call SetItemHeroAttribute('Idms', 0, 0, 0) //幻影斧
endfunction
    //初始化物品属性 - 攻击防御生命魔法攻速
    function InitItemAttribute takes nothing returns nothing
        //call SetItemAttribute('cnob', 10, 200, 100 , 0 , 0.0)  //贵族圆环
        call ItemAddStateBonus('IR01' , BONUS_MANA , 250)
        call ItemAddStateBonus('IR01' , BONUS_MOVESPEED , 50)
        call ItemAddStateBonus('IR02' , BONUS_MOVESPEED , 50)
    endfunction
    //初始化物品
    function InitItemSystem takes nothing returns nothing
        set ItemAttrTrig=CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ(ItemAttrTrig, EVENT_PLAYER_UNIT_PICKUP_ITEM) //获得物品
call TriggerRegisterAnyUnitEventBJ(ItemAttrTrig, EVENT_PLAYER_UNIT_DROP_ITEM) //丢弃物品
call TriggerRegisterAnyUnitEventBJ(ItemAttrTrig, EVENT_PLAYER_UNIT_PAWN_ITEM) //抵押物品
call TriggerAddCondition(ItemAttrTrig, Condition(function ItemSystem___itemtrigger_actions))
	
        call InitRegisterItem() //注册物品
call InitItemHeroAttribute() //初始化物品英雄三围属性
call InitItemAttribute() //初始化物品属性
endfunction
// scope ItemSystem ends
// 物品相关事件包含在ItemSystem.j
// scope UnitAttackEvent begins
    //获取暴击光环等级 因为获取不了Buff等级 只能通过不同的魔法效果来判断等级
    function GetCriticalStrikeAuraLevel takes unit u returns integer
        if GetUnitAbilityLevel(u, 'Blc6') == 1 then
            return 4
        elseif GetUnitAbilityLevel(u, 'Blc5') == 1 then
            return 3
        elseif GetUnitAbilityLevel(u, 'Blc4') == 1 then
            return 2
        elseif GetUnitAbilityLevel(u, 'Blc3') == 1 then
            return 1
        endif
        return 0
    endfunction
    //得到单位的暴击伤害值(倍率) 无则为0.
    function GetCriticalStrikeDamage takes unit attacker returns real
        local real damage= 0.
        local integer lv
        if EffectIsEnabled[1] then
            set lv=GetCriticalStrikeAuraLevel(attacker)
            if lv > 0 then
                if PrdRandom(attacker , 'Alc3' , 15) then //概率
set damage=damage + ( lv * 0.1 + 0.1 ) //括号里的值为此暴击的倍率
endif
            endif
        endif
        if damage != 0. then
            call SetUnitAnimation(attacker, "Attack slam") //播放暴击动画
call QueueUnitAnimation(attacker, "Stand Ready") //不把Stand Ready加入队列的话 动作会很僵硬
endif
        return damage
    endfunction
    //模拟
    function UnitAttackEvent___UnitAttack takes unit whichUnit,unit target,boolean isAttack returns nothing
        local real amount= GetUnitState(whichUnit, UNIT_STATE_ATTACK1_DAMAGE_BASE) + GetUnitState(whichUnit, UNIT_STATE_ATTACK1_DAMAGE_DICE) * GetRandomInt(1, R2I(GetUnitState(whichUnit, UNIT_STATE_ATTACK1_DAMAGE_SIDE)))
        local integer weapon_type= R2I(GetUnitState(whichUnit, UNIT_STATE_ATTACK1_ATTACK_TYPE))
call UnitDamageTarget(whichUnit, target, amount, isAttack, false, ConvertAttackType(weapon_type), DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
    endfunction
    function GeminateAttackMissileForward takes nothing returns boolean
        local trigger t= GetTriggeringTrigger()
        local integer h= GetHandleId(t)
        local effect missile= LoadEffectHandle(HT, h, 13)
        local unit whichUnit= LoadUnitHandle(HT, h, 11)
        local unit target= LoadUnitHandle(HT, h, 12)
        local real speed= LoadReal(HT, h, 24)
        local real x1= EXGetEffectX(missile)
        local real y1= EXGetEffectY(missile)
        local real x2= GetUnitX(target)
        local real y2= GetUnitY(target)
        local real angle
local real distance
        local real z= EXGetEffectZ(missile)
        local integer count= GetTriggerEvalCount(t)
        local boolean b= LoadBoolean(HT, h, 20)
        local real centre
        if b then
            set angle=AngleBetweenXY(x1 , y1 , x2 , y2)
        else
            if x2 != LoadReal(HT, h, 20) or y2 != LoadReal(HT, h, 21) then
                call SaveBoolean(HT, h, 20, true)
                call EXSetEffectZ(missile, LoadReal(HT, h, 22))
            endif
            set angle=LoadReal(HT, h, 50)
            set centre=LoadReal(HT, h, 53)
            set z=LoadReal(HT, h, 54) - ( count - centre ) * ( count - centre )
            call EXSetEffectZ(missile, z)
            call EXEffectMatReset(missile)
            call EXEffectMatRotateY(missile, Atan2(z, angle))
        endif
        set x1=x1 + speed * Cos(angle * bj_DEGTORAD)
        set y1=y1 + speed * Sin(angle * bj_DEGTORAD)
        set distance=GetDistanceBetween(x1 , y1 , x2 , y2)
        call EXSetEffectXY(missile, x1, y1)
        if distance <= speed then
            call DestroyEffect(missile)
            call UnitAttackEvent___UnitAttack(whichUnit , target , LoadBoolean(HT, h, 10))
            call FlushChildHashtable(HT, h)
            call ClearTrigger(t)
        endif
        set t=null
        set missile=null
        set whichUnit=null
        set target=null
        return false
    endfunction
    function GeminateAttackLaunch takes nothing returns boolean
        local trigger t= GetTriggeringTrigger()
        local integer h= GetHandleId(t)
        local unit whichUnit= LoadUnitHandle(HT, h, 11)
local unit target= LoadUnitHandle(HT, h, 12)
local real x1= GetUnitX(whichUnit)
        local real y1= GetUnitY(whichUnit)
        local real x2= GetUnitX(target)
        local real y2= GetUnitY(target)
        local integer unitId= GetUnitTypeId(whichUnit)
        local boolean isAttack= LoadBoolean(HT, h, 10)
local string missileArt= GetUnitSlkData(unitId , "Missileart")
local effect missile= AddSpecialEffect(missileArt, x1, y1)
local real z= EXGetEffectZ(missile) + 70
local real missilespeed= S2R(GetUnitSlkData(unitId , "Missilespeed"))
        local real scale= S2R(GetUnitSlkData(unitId , "modelScale"))
local real arc= GetUnitState(whichUnit, UNIT_STATE_ATTACK1_BACK_SWING) + 1
local real angle= AngleBetweenXY(x1 , y1 , x2 , y2)
local real distance= GetDistanceBetween(x1 , y1 , x2 , y2)
local real maxheight= z * arc //* ( distance * 0.5 )  
local real maxcount= R2I(( distance / ( missilespeed * 0.04 ) ))
local real upheight= maxheight / maxcount
call FlushChildHashtable(HT, h)
        call ClearTrigger(t)
        set t=CreateTrigger()
        set h=GetHandleId(t)
        call TriggerRegisterTimerEvent(t, 0.04, true)
        call TriggerAddCondition(t, Condition(function GeminateAttackMissileForward))
        call EXSetEffectZ(missile, z)
        call EXSetEffectSize(missile, scale)
        call SaveBoolean(HT, h, 10, isAttack)
        call SaveUnitHandle(HT, h, 11, whichUnit)
        call SaveUnitHandle(HT, h, 12, target)
        call SaveEffectHandle(HT, h, 13, missile)
        call SaveReal(HT, h, 20, x2)
        call SaveReal(HT, h, 21, y2)
        call SaveReal(HT, h, 22, z)
        call SaveReal(HT, h, 23, arc)
        call SaveReal(HT, h, 24, missilespeed * 0.04) //每次前进的距离
call SaveReal(HT, h, 30, 0)
        call SaveReal(HT, h, 50, angle)
        call SaveReal(HT, h, 51, maxcount)
        call SaveReal(HT, h, 52, upheight)
        call SaveReal(HT, h, 53, maxcount * 0.5)
        call SaveReal(HT, h, 54, maxheight)
        call TriggerEvaluate(t)
	
        set t=null
        set whichUnit=null
        set target=null
        set missile=null
        return false
    endfunction
    // 模拟连击
    function GeminateAttack takes unit whichUnit,unit target,real time,boolean isAttack returns nothing
        local trigger t
        local integer h
        if time > 0 then
            set t=CreateTrigger()
            set h=GetHandleId(t)
            call TriggerAddCondition(t, Condition(function GeminateAttackLaunch))
            call TriggerRegisterTimerEvent(t, time, false)
            call SaveUnitHandle(HT, h, 11, whichUnit)
            call SaveUnitHandle(HT, h, 12, target)
            call SaveBoolean(HT, h, 10, isAttack)
            set t=null
        else
            call UnitAttackEvent___UnitAttack(whichUnit , target , isAttack)
        endif
    endfunction
    function AttackReadyToGoInitActions takes nothing returns boolean
        local trigger trig= GetTriggeringTrigger()
        local integer th= GetHandleId(trig)
        local timer t= LoadTimerHandle(HT, th, 10)
        local unit whichUnit= LoadUnitHandle(HT, th, 17)
        local unit target= LoadUnitHandle(HT, th, 18)
        if GetTriggerEventId() == EVENT_GAME_TIMER_EXPIRED then
            //call GeminateAttack(whichUnit, target, 1, true)
        endif
        //call FlushChildHashtable(HT, th)
        //call RemoveSavedHandle(UnitKeyBuff, GetHandleId(u), AttackReadyTrg)
        //--call ClearTrigger(trig)
        call PauseTimer(t)
        set trig=null
        set whichUnit=null
        set target=null
        set t=null
        return false
    endfunction
    function UnitAttackEvent___AttackReadyToGoInit takes unit u,unit target,integer h returns nothing
        local trigger trig
        local timer t
        local integer th
        if HaveSavedHandle(UnitKeyBuff, h, AttackReadyTrg) then
            set trig=LoadTriggerHandle(UnitKeyBuff, h, AttackReadyTrg)
            set th=GetHandleId(trig)
            set t=LoadTimerHandle(HT, th, 10)
        else
            set trig=CreateTrigger()
            set th=GetHandleId(trig)
            set t=CreateTimer()
            call FlushChildHashtable(HT, th)
            call SaveUnitHandle(HT, th, 17, u)
            call SaveTimerHandle(HT, th, 10, t)
            call TriggerRegisterDeathEvent(trig, u)
            call TriggerRegisterUnitEvent(trig, u, EVENT_UNIT_ISSUED_ORDER)
            call TriggerRegisterUnitEvent(trig, u, EVENT_UNIT_ISSUED_TARGET_ORDER)
            call TriggerRegisterUnitEvent(trig, u, EVENT_UNIT_ISSUED_POINT_ORDER)
            call TriggerRegisterTimerExpireEvent(trig, t)
            call TriggerAddCondition(trig, Condition(function AttackReadyToGoInitActions))
            call SaveTriggerHandle(UnitKeyBuff, h, AttackReadyTrg, trig)
        endif
        call SaveUnitHandle(HT, th, 18, target)
        call TimerStart(t, S2R(GetUnitSlkData(GetUnitTypeId(u) , "dmgpt1")) / RMinBJ(GetUnitState(u, UNIT_STATE_RATE_OF_FIRE), 5.), false, null)
        set trig=null
        set t=null
    endfunction
    //任意单位被攻击
    function UnitAttackEvent___UnitAttackedActions takes nothing returns boolean
        local unit targetUnit= GetTriggerUnit()
local unit attackerUnit= GetAttacker()
local integer h= GetHandleId(attackerUnit)
        call SaveUnitHandle(UnitKeyBuff, h, AttackTarget, targetUnit)
        if EffectIsEnabled[0] then //暴击运算
if CommonAttackEffectFilter(attackerUnit , targetUnit) then
                call SaveReal(UnitKeyBuff, h, CriticalStrikeDamage, GetCriticalStrikeDamage(attackerUnit))
            endif
        endif
        //捕捉弹道出手
        if IsUnitIdType(GetUnitTypeId(attackerUnit), UNIT_TYPE_RANGED_ATTACKER) then
            call UnitAttackEvent___AttackReadyToGoInit(attackerUnit , targetUnit , h)
        endif
        set attackerUnit=null
        set targetUnit=null
        return false
    endfunction
    function UnitAttackEvent___Init takes nothing returns nothing
        local trigger trig= CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_ATTACKED)
        call TriggerAddCondition(trig, Condition(function UnitAttackEvent___UnitAttackedActions))
        set trig=null
    endfunction
// scope UnitAttackEvent ends
// scope UnitDeathEvent begins
    //清空以单位handleId为父key的大部分数据
    function FlushUnitData takes unit whichUnit returns nothing
        local integer iHandleId= GetHandleId(whichUnit)
        local integer loop_index= 0
        //如果单位会恢复生命值或魔法值,那么将其移除恢复队列
        if HaveSavedInteger(UnitData, iHandleId, UNIT_LIFERESTORE) then
            call QueuedUnitLifeRestoreRemove(whichUnit)
        endif
        if HaveSavedInteger(UnitData, iHandleId, UNIT_MANARESTORE) then
            call QueuedUnitManaRestoreRemove(whichUnit)
        endif
        call FlushChildHashtable(HT, iHandleId)
        call FlushChildHashtable(UnitData, iHandleId)
        call FlushChildHashtable(UnitKeyBuff, iHandleId)
        call Debug("log" , GetUnitName(whichUnit) + " 数据已清空")
    endfunction
    //任意单位死亡
    function UnitDeathEvnetActions takes nothing returns boolean
        local unit dyingUnit= GetDyingUnit()
        local integer unitType= GetUnitTypeId(dyingUnit)
        local integer deathType
        if IsUnitType(dyingUnit, UNIT_TYPE_HERO) then
        else
            //非英雄单位死亡直接清空哈希表子目录
            call FlushUnitData(dyingUnit)
            //set deathType = S2I(GetUnitSlkData(unitType, "deathType"))
            //if deathType == 0 or deathType == 1 then
            //	call Debug("log", GetUnitName(dyingUnit)+ " 死亡，不会腐烂")
            //endif
        endif
        set dyingUnit=null
        return false
    endfunction
    function UnitDeathEvent___Init takes nothing returns nothing
        local trigger trig= CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_DEATH)
        call TriggerAddCondition(trig, Condition(function UnitDeathEvnetActions))
        set trig=null
    endfunction
// scope UnitDeathEvent ends
// scope UnitAbilityEvent begins
    function UnitAbilityEvent___InitAbilityFunctions takes nothing returns nothing
        //中尉 Lieutenant
        call SaveStr(ObjectData, SPELL_EFFECT, 'Alc1', "Crosskill")
        call SaveStr(ObjectData, SPELL_EFFECT, 'Alc2', "EnchantEquipment")
        call SaveStr(ObjectData, LEARN_FIRST_LEVEL_SKILL, 'Alc2', "EnchantEquipment_Learn1")
        call SaveStr(ObjectData, LEARN_FIRST_LEVEL_SKILL, 'Alc3', "CriticalStrikeAura_Learn1")
        call SaveStr(ObjectData, SPELL_EFFECT, 'Alc4', "Stomp")
        //火魔法师 FireMage
        call SaveStr(ObjectData, SPELL_EFFECT, 'Ahy0', "AbstinenceIsGoodMedicine")
        call SaveStr(ObjectData, SPELL_EFFECT, 'Ahy1', "DragonSlave")
        call SaveStr(ObjectData, SPELL_EFFECT, 'Ahy2', "LightStrikeArray")
        call SaveStr(ObjectData, LEARN_FIRST_LEVEL_SKILL, 'Ahy3', "FierySoul")
        call SaveStr(ObjectData, SPELL_EFFECT, 'Ahy4', "LagunaBlade")
        //铁心灭绝者 DeterminedExterminator
        call SaveStr(ObjectData, SPELL_EFFECT, 'Acs1', "Assassination")
        call SaveStr(ObjectData, SPELL_EFFECT, 'Acs2', "BlightPower")
        call SaveStr(ObjectData, LEARN_FIRST_LEVEL_SKILL, 'Acs3', "BlackEpidermis")
        call SaveStr(ObjectData, LEARN_FIRST_LEVEL_SKILL, 'Acs4', "LearnGhostShip")
        call SaveStr(ObjectData, SPELL_EFFECT, 'Acs4', "GhostShip")
        //模范公民 ModelCitizen / TaxStealer
        call SaveStr(ObjectData, SPELL_EFFECT, 'Ats0', "Shinyboy")
        call SaveStr(ObjectData, SPELL_EFFECT, 'Ats1', "Transmute")
        call SaveStr(ObjectData, SPELL_EFFECT, 'Ats2', "WeMedia")
        call SaveStr(ObjectData, SPELL_EFFECT, 'Ats4', "GrandNarrative")
        //风暴之灵 StormSpirit
        call SaveStr(ObjectData, SPELL_EFFECT, 'Ast1', "StaticRremnant")
        call SaveStr(ObjectData, SPELL_EFFECT, 'Ast2', "ElectricVortex")
        call SaveStr(ObjectData, SPELL_EFFECT, 'Ast0', "BallLightning")
        call SaveStr(ObjectData, LEARN_FIRST_LEVEL_SKILL, 'Ast3', "OverloadLearn1")
        //枪兵 PikeMan
        call SaveStr(ObjectData, SPELL_EFFECT, 'Apm1', "BattleImago")
        call SaveStr(ObjectData, LEARN_FIRST_LEVEL_SKILL, 'Apm2', "BattleSpiralLearn1")
        //屠夫 Pudge
        call SaveStr(ObjectData, SPELL_EFFECT, 'Apg1', "Pudge_MeatHook")
        call SaveStr(ObjectData, SPELL_EFFECT, 'A005', "Pudge_Rot")
        call SaveStr(ObjectData, SPELL_EFFECT, 'A006', "Pudge_Dismember")
    endfunction
    //发动技能效果 
    //单独触发器 运行的效率快一些 因为发动技能效果比较常见 后续可能合并
    function UnitSpellEffectActions takes nothing returns boolean
        local integer abId= GetSpellAbilityId()
if HaveSavedString(ObjectData, SPELL_EFFECT, abId) then
            set Tmp_SpellAbilityUnit=GetSpellAbilityUnit()
            set Tmp_SpellTargetUnit=GetSpellTargetUnit()
            set Tmp_SpellAbilityLevel=GetUnitAbilityLevel(Tmp_SpellAbilityUnit, abId)
            if Tmp_SpellTargetUnit == null then
                set Tmp_SpellTargetX=GetSpellTargetX()
                set Tmp_SpellTargetY=GetSpellTargetY()
            endif
            call DzExecuteFunc(LoadStr(ObjectData, SPELL_EFFECT, abId))
        endif
        return false
    endfunction
    //技能事件
    function AbilityEventActions takes nothing returns boolean
        local integer abId= GetSpellAbilityId()
        local eventid id= GetTriggerEventId()
        if id == EVENT_UNIT_SPELL_CHANNEL then
            if HaveSavedString(ObjectData, SPELL_CHANNEL, abId) then
                call ExecuteFunc(LoadStr(ObjectData, SPELL_CHANNEL, abId))
            endif
        endif
        if id == EVENT_UNIT_HERO_SKILL then
            set abId=GetLearnedSkill()
            if GetLearnedSkillLevel() == 1 then
                if HaveSavedString(ObjectData, LEARN_FIRST_LEVEL_SKILL, abId) then
                    call ExecuteFunc(LoadStr(ObjectData, LEARN_FIRST_LEVEL_SKILL, abId))
                endif
            endif
            if HaveSavedString(ObjectData, LEARN_SKILL, abId) then
                call ExecuteFunc(LoadStr(ObjectData, LEARN_SKILL, abId))
            endif
        endif
        set id=null
        return false
    endfunction
    //本来是想用触发器条件成立来运行技能发动效果事件对应的函数 但后来还是改用DzExecuteFunc
    //注册单位发动技能效果事件
    //function RegisterSpellEffectEvent takes integer id, code c returns nothing
    //	local trigger t //可以给单位添加技能然后获取技能等级来知道Id是否有效
    //	set t = CreateTrigger()
    //	set Spell_Effect_Number = Spell_Effect_Number + 1
    //	set Spell_Effect[Spell_Effect_Number] = t
    //	call SaveInteger(ObjectData, SPELL_EFFECT, id, Spell_Effect_Number)
    //	call TriggerAddCondition(t, Condition(c))
    //	set t = null
    //endfunction
    //英文名部分为机翻 因为英语实在渣
    //初始化技能事件
    function UnitAbilityEvent___Init takes nothing returns nothing
        set AbilityEventTrigger=CreateTrigger()
        set UnitSpellEffectTrigger=CreateTrigger()
        call TriggerAddCondition(UnitSpellEffectTrigger, Condition(function UnitSpellEffectActions))
        call TriggerAddCondition(AbilityEventTrigger, Condition(function AbilityEventActions))
	
        call UnitAbilityEvent___InitAbilityFunctions()
    endfunction
// scope UnitAbilityEvent ends
// scope UnitEnterMapEvent begins
    function UnitEnterMapAction takes nothing returns boolean
        local unit u= GetFilterUnit()
        local integer typeId= GetUnitTypeId(u)
        if GetUnitAbilityLevel(GetFilterUnit(), 'Aloc') <= 0 then //受伤事件
call TriggerRegisterUnitEvent(DamageEventTrigger, u, EVENT_UNIT_DAMAGED)
            // call InitUnitBonus(u)
        endif
        if IsUnitType(u, UNIT_TYPE_HERO) then
            call QueuedUnitRestoreAdd(u)
            call RefreshUnitState(u)
            call TriggerRegisterUnitEvent(UnitSpellEffectTrigger, u, EVENT_UNIT_SPELL_EFFECT) //给单位注册发动技能事件
            call TriggerRegisterUnitEvent(AbilityEventTrigger, u, EVENT_UNIT_SPELL_CHANNEL)
            call TriggerRegisterUnitEvent(AbilityEventTrigger, u, EVENT_UNIT_HERO_SKILL) //学习技能事件
            call TriggerRegisterUnitEvent(HeroLevelUpTrigger, u, EVENT_UNIT_HERO_LEVEL) //英雄升级事件
        endif
        if typeId == 'ndum' then
            call ShowUnit(u, false)
            call SetUnitPathing(u, false)
            call SetUnitInvulnerable(u, true)
            call UnitApplyTimedLife(u, 'BTLF', 20.)
        elseif typeId == 'HI02' then
            call RefreshAbilityCost(u)
        elseif typeId == 'nfoh' then
            //call PercentRestoreAura(u, 0.02, 650, 'Ab18', 'B018', function RestoreAura_Filter)
        endif
        set u=null
        return false
    endfunction
    function UnitEnterMapEvent___Init takes nothing returns nothing
        local rect world= GetWorldBounds()
        set WorldRegion=CreateRegion()
        call RegionAddRect(WorldRegion, world)
        call RemoveRect(world)
        set world=null
        call TriggerRegisterEnterRegion(EnterMapTrigger, WorldRegion, Condition(function UnitEnterMapAction))
    endfunction
// scope UnitEnterMapEvent ends
// scope HeroLevelUp begins
    function HeroLevelUpActions takes nothing returns boolean
local unit u= GetTriggerUnit()
        call RefreshUnitState(u) //刷新单位状态
call RefreshAbilityCost(u) //刷新某些单位技能的魔法消耗
set u=null
        return false
    endfunction
    
    function HeroLevelUp___Init takes nothing returns nothing
        call TriggerAddCondition(HeroLevelUpTrigger, Condition(function HeroLevelUpActions))
    endfunction
// scope HeroLevelUp ends
// scope UnitSummonEvent begins
    
    function SummonIllusionUnit takes unit hIllusionUnit,unit hMasterUnit returns nothing
        local integer iHandleId
        // 判断单位是否在施法镜像 如果是 则设置镜像的属性和位置
        if LoadBoolean(UnitBuff, GetHandleId(hMasterUnit), UnitIsSummoningIllusions) then
            set iHandleId=GetHandleId(hIllusionUnit)
            call SaveReal(UnitData, iHandleId, IllusionUnitDataB, Tmp__ArrayReal['B'])
            call SaveReal(UnitData, iHandleId, IllusionUnitDataC, Tmp__ArrayReal['C'])
            call SetUnitX(hIllusionUnit, Tmp__ArrayReal['X'])
            call SetUnitY(hIllusionUnit, Tmp__ArrayReal['Y'])
        endif
        call SyncIllusionUnitState(hIllusionUnit , hMasterUnit)
    endfunction
    function UnitSummonEventActions takes nothing returns boolean
        local unit hSummonedUnit= GetSummonedUnit()
        local unit hSnmmoingUnit= GetSummoningUnit()
        // 如果是马甲在召唤 则设置召唤者为真正的召唤者
        if GetUnitAbilityLevel(hSnmmoingUnit, 'Aloc') > 0 then
            set hSnmmoingUnit=GetMasterUnit(hSnmmoingUnit)
        endif
        if IsUnitIllusion(hSummonedUnit) then
            call SummonIllusionUnit(hSummonedUnit , hSnmmoingUnit)
        endif
        set hSummonedUnit=null
        set hSnmmoingUnit=null
        return false
    endfunction
    function UnitSummonEvent___Init takes nothing returns nothing
        local trigger trig= CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_SUMMON)
        call TriggerAddCondition(trig, Condition(function UnitSummonEventActions))
        set trig=null
    endfunction
// scope UnitSummonEvent ends
// 英雄尽量在后面加载
function Lcqy_ZeroCast takes unit u,boolean b returns nothing
 local integer uh= GetHandleId(u)
	if b then
		call CommonTextTag("|c0009d396 0x 施法！！|r" , 5 , u , .03 , 255 , 255 , 255 , 255 , 64)
		call YDWESetUnitAbilityDataString(u , 'Alc0' , 1 , 204 , "ReplaceableTextures\\CommandButtons\\BTNMagicalSentry.blp")
	else
		call YDWESetUnitAbilityDataString(u , 'Alc0' , 1 , 204 , "ReplaceableTextures\\PassiveButtons\\PASBTNMagicalSentry.blp")
	endif
	call SaveBoolean(UnitKeyBuff, GetHandleId(M_GetSpellAbilityUnit()), ZeroCast, b)
endfunction
function crosskill_actions takes integer unitId,integer buffId returns nothing
 local real x1
 local real y1
 local real x2
 local real y2
 local real a= 0
 local integer i= 0
 local unit ft= null
 local player p= GetOwningPlayer(M_GetSpellAbilityUnit())
 local unit target= M_GetSpellAbilityUnit()
 local boolean isAlly= IsUnitAlly(target, p)
	if target == null then
		set x1=M_GetSpellTargetX()
		set y1=M_GetSpellTargetY()
	else
		set x1=GetUnitX(target)
		set y1=GetUnitY(target)
	endif
	loop //
set a=90.00 * i * bj_DEGTORAD
		set x2=CoordinateX(x1 + 90 * Cos(a))
		set y2=CoordinateY(y1 + 90 * Sin(a))
		set ft=CreateUnit(p, unitId, x2, y2, AngleBetweenXY(x2 , y2 , x1 , y1))
		call UnitApplyTimedLife(ft, buffId, 30.)
		if not isAlly then
			call IssueTargetOrderById(ft, Order_Attack, target)
		endif
		call SetUnitX(ft, x2)
		call SetUnitY(ft, y2)
		call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\MassTeleport\\MassTeleportCaster.mdl", x2, y2))
		exitwhen i == 3
		set i=i + 1
	endloop
	set target=null
	set ft=null
endfunction
//十字围杀
function Crosskill takes nothing returns nothing
 local boolean b= LoadBoolean(UnitKeyBuff, GetHandleId(M_GetSpellAbilityUnit()), ZeroCast)
	if b then //成立则代表当前拥有零重施法状态
call crosskill_actions('hlc2' , 'Bft2')
		call Lcqy_ZeroCast(M_GetSpellAbilityUnit() , false) //移除零重施法状态
else
		if PrdRandom(M_GetSpellAbilityUnit() , 'Alc0' , 20) then
			call Lcqy_ZeroCast(M_GetSpellAbilityUnit() , true) //添加零重施法状态
return
		endif
		call crosskill_actions('hlc1' , 'Bft1')
	endif
endfunction
function enchant_equipment_actions takes nothing returns nothing
 local unit spellUnit= M_GetSpellAbilityUnit()
 local integer level= M_GetSpellAbilityLevel()
 local group buffGroup= LoginGroup()
 local unit firstUnit
 local real dur= 20 + level * 10
	call GroupEnumUnitsInRange(buffGroup, GetUnitX(spellUnit), GetUnitY(spellUnit), 625, null)
	set P2=GetOwningPlayer(spellUnit)
	loop
		set firstUnit=FirstOfGroup(buffGroup)
		exitwhen firstUnit == null
		if IsMechanical_Ally_Alive_NoStructure(firstUnit) then
			call UnitAddAbilityTimed(firstUnit , 'Alc5' , level , dur , 'Blc2' , 1)
		endif
		call GroupRemoveUnit(buffGroup, firstUnit)
	endloop
	call LogoutGroup(buffGroup)
	set buffGroup=null
	set spellUnit=null
	set firstUnit=null
endfunction
function EnchantEquipment takes nothing returns nothing
 local boolean b= LoadBoolean(UnitKeyBuff, GetHandleId(M_GetSpellAbilityUnit()), ZeroCast)
	if b then
		call enchant_equipment_actions()
		call Lcqy_ZeroCast(M_GetSpellAbilityUnit() , false) //移除零重施法状态
else
		if PrdRandom(M_GetSpellAbilityUnit() , 'Alc0' , 20) then
			call Lcqy_ZeroCast(M_GetSpellAbilityUnit() , true) //添加零重施法状态
return
		endif
		call enchant_equipment_actions()
	endif
endfunction
function LcqyStompSpell takes boolean haveZeroCast returns nothing
 local unit spellUnit= M_GetSpellAbilityUnit()
 local integer abilityLevel= M_GetSpellAbilityLevel()
 local real damage= 75
 local real dur= 3
 local real herodur= 2
 local real area= 325
 local group soldiersGroup
 local unit firstUnit
 local integer typeId
	call UnitSpellStmop(spellUnit , damage , 1 , dur , herodur , area , true , "Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl")
	if haveZeroCast then
		set soldiersGroup=LoginGroup()
		call GroupEnumUnitsInRange(soldiersGroup, GetUnitX(spellUnit), GetUnitY(spellUnit), 1000, null)
		set P2=GetOwningPlayer(spellUnit)
		loop
			set firstUnit=FirstOfGroup(soldiersGroup)
			exitwhen firstUnit == null
			set typeId=GetUnitTypeId(firstUnit)
			if typeId == 'hlc1' or typeId == 'hlc2' then
				if Ally_Alive(firstUnit) then
					call UnitSpellStmop(firstUnit , damage , 1 , dur , herodur , area , true , "Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl")
				endif
			endif
			call GroupRemoveUnit(soldiersGroup, firstUnit)
		endloop
		set firstUnit=null
		call LogoutGroup(soldiersGroup)
		set soldiersGroup=null
	endif
	set spellUnit=null
endfunction
function Stomp takes nothing returns nothing
 local boolean isZeroCast= LoadBoolean(UnitKeyBuff, GetHandleId(M_GetSpellAbilityUnit()), ZeroCast)
	if isZeroCast then
		call Lcqy_ZeroCast(M_GetSpellAbilityUnit() , false) //移除零重施法状态
call LcqyStompSpell(true)
	else
		if PrdRandom(M_GetSpellAbilityUnit() , 'Alc0' , 20) then
			call Lcqy_ZeroCast(M_GetSpellAbilityUnit() , true) //添加零重施法状态
return
		endif
		call LcqyStompSpell(false)
	endif
endfunction
function AbstinenceIsGoodMedicineEffect takes nothing returns boolean
 local trigger trig= GetTriggeringTrigger()
 local integer iHandleId= GetHandleId(trig)
 local unit whichUnit= LoadUnitHandle(HT, iHandleId, 0)
 local real data= 0.04
 local real addValue
	if GetTriggerEventId() == EVENT_GAME_TIMER_EXPIRED then
		set addValue=GetUnitState(whichUnit, UNIT_STATE_MAX_LIFE) * data
		call UnitRestoreLife(whichUnit , addValue)
		set addValue=GetUnitState(whichUnit, UNIT_STATE_MAX_MANA) * data
		call UnitRestoreMana(whichUnit , addValue)
	elseif GetSpellAbilityId() == LoadInteger(HT, iHandleId, 0) then
		call UnitRemoveAbility(whichUnit, 'Ab09')
		call UnitRemoveAbility(whichUnit, 'B009')
		call UnitAddPermanentAbility(whichUnit , 'Ab08')
		call FlushChildHashtable(HT, iHandleId)
		call ClearTrigger(trig)
	endif
	set whichUnit=null
	set trig=null
	return false
endfunction
// scope CopperAlchemist begins
	//黑羽
	//戒色
	//施法时每秒恢复5%
 function AbstinenceIsGoodMedicine takes nothing returns nothing
  local trigger trig= CreateTrigger()
  local integer iHandleId= GetHandleId(trig)
  local unit hSpellUnit= M_GetSpellAbilityUnit()
		call TriggerRegisterTimerEvent(trig, 1.0, true)
		call TriggerRegisterUnitEvent(trig, hSpellUnit, EVENT_UNIT_SPELL_ENDCAST)
		call TriggerAddCondition(trig, Condition(function AbstinenceIsGoodMedicineEffect))
		call UnitRemoveAbility(hSpellUnit, 'Ab08')
		call UnitRemoveAbility(hSpellUnit, 'B008')
		call UnitAddPermanentAbility(hSpellUnit , 'Ab09')
		call SaveUnitHandle(HT, iHandleId, 0, hSpellUnit)
		call SaveInteger(HT, iHandleId, 0, GetSpellAbilityId())
		set hSpellUnit=null
		set trig=null
	endfunction
 function LolitaComplexEffect takes nothing returns boolean
  local trigger trig= GetTriggeringTrigger()
  local integer iHandleId= GetHandleId(trig)
  local unit whichUnit= LoadUnitHandle(HT, iHandleId, 0)
  local real value
  local real reduceState
		if UnitAlive(whichUnit) and GetUnitAbilityLevel(whichUnit, 'Ab09') == 0 then
			set value=GetWidgetLife(whichUnit)
			set reduceState=value - GetUnitState(whichUnit, UNIT_STATE_MAX_LIFE) * 0.01
			call SetWidgetLife(whichUnit, RMaxBJ(reduceState, 1))
			set value=GetUnitState(whichUnit, UNIT_STATE_MANA)
			set reduceState=value - GetUnitState(whichUnit, UNIT_STATE_MAX_MANA) * 0.01
			call SetUnitState(whichUnit, UNIT_STATE_MANA, RMaxBJ(reduceState, 1))
		endif
		set whichUnit=null
		set trig=null
		return false
	endfunction
 function LolitaComplex takes unit whichUnit returns nothing
  local trigger trig= CreateTrigger()
  local integer iHandleId= GetHandleId(trig)
		call TriggerRegisterTimerEvent(trig, 1.0, true)
		call TriggerAddCondition(trig, Condition(function LolitaComplexEffect))
		call SaveUnitHandle(HT, iHandleId, 0, whichUnit)
		set trig=null
	endfunction
 function DragonSlave_Filter takes nothing returns boolean
		return Enemy_Alive_NoStructure_NoImmune(GetFilterUnit())
	endfunction
	// 龙破斩
 function DragonSlave takes nothing returns nothing
  local unit hSpellUnit= M_GetSpellAbilityUnit()
  local unit hTargetUnitt= M_GetSpellTargetUnit()
  local real startX= GetUnitX(hSpellUnit)
  local real startY= GetUnitY(hSpellUnit)
  local real targetX
  local real targetY
  local string effectPath= "Abilities\\Spells\\Human\\DragonSlave\\DragonSlave.mdx"
  local real damage= 80 + M_GetSpellAbilityLevel() * 70
  local integer level= M_GetSpellAbilityLevel()
  local effect missileEffect
		if hTargetUnitt == null then
			set targetX=M_GetSpellTargetX()
			set targetY=M_GetSpellTargetY()
		else
			set targetX=GetUnitX(hTargetUnitt)
			set targetY=GetUnitY(hTargetUnitt)
		endif
		set missileEffect=AddSpecialEffect(effectPath, targetX, targetY)
		call UnitSpellWaveByEffect(hSpellUnit , missileEffect , damage , 800 , 275 , 200 , startX , startY , targetX , targetY , 1200 , 1 , null , level , function DragonSlave_Filter)
		set hSpellUnit=null
		set hTargetUnitt=null
		set missileEffect=null
	endfunction
	// 光击阵等待
 function LightStrikeArrayWait05 takes nothing returns boolean
  local trigger trig= GetTriggeringTrigger()
  local integer iHanleId= GetHandleId(trig)
  local unit hSpellUnit= LoadUnitHandle(HT, iHanleId, 9)
  local real damage= LoadReal(HT, iHanleId, 5)
  local real targetX= LoadReal(HT, iHanleId, 6)
  local real targetY= LoadReal(HT, iHanleId, 7)
		call UnitSpellLightStrikeArray(hSpellUnit , damage , 1 , targetX , targetY , 225 , 1.6 , 1.6 , false)
		call KillDestructablesInCircle(targetX , targetY , 225)
		call FlushChildHashtable(HT, iHanleId)
		call ClearTrigger(trig)
		set trig=null
		set hSpellUnit=null
		return false
	endfunction
	// 光击阵
 function LightStrikeArray takes nothing returns nothing
  local unit hSpellUnit= M_GetSpellAbilityUnit()
  local real targetX= M_GetSpellTargetX()
  local real targetY= M_GetSpellTargetY()
  local trigger trig= CreateTrigger()
  local integer iHandleId= GetHandleId(trig)
  local integer level= M_GetSpellAbilityLevel()
  local real damage= 40 + level * 40
		call TriggerRegisterTimerEvent(trig, 0.5, false)
		call TriggerAddCondition(trig, Condition(function LightStrikeArrayWait05))
		call SaveReal(HT, iHandleId, 5, damage)
		call SaveReal(HT, iHandleId, 6, targetX)
		call SaveReal(HT, iHandleId, 7, targetY)
		call SaveUnitHandle(HT, iHandleId, 9, hSpellUnit)
		set hSpellUnit=null
		set trig=null
	endfunction
	// 炽魂 移除
 function FierySoulRemove takes nothing returns boolean
  local trigger trig= GetTriggeringTrigger()
  local integer iHandleId= GetHandleId(trig)
  local unit whichUnit
  local integer fierySoulCount
		if TimerGetElapsed(GameTimer) > LoadReal(HT, iHandleId, 0) then
			call RemoveSavedHandle(HT, GetHandleId(LoadTriggerHandle(HT, iHandleId, 1)), 0)
			set whichUnit=LoadUnitHandle(HT, iHandleId, 0)
			call UnitReduceAttackSpeedBonus(whichUnit , LoadReal(HT, iHandleId, 1))
			call UnitReduceMoveSpeedBonus(whichUnit , LoadReal(HT, iHandleId, 2))
			set fierySoulCount=LoadInteger(HT, iHandleId, 0)
			call DestroyEffect(LoadEffectHandle(HT, iHandleId, 10 + 1))
			call DestroyEffect(LoadEffectHandle(HT, iHandleId, 20 + 1))
			if fierySoulCount >= 2 then
				call DestroyEffect(LoadEffectHandle(HT, iHandleId, 10 + 2))
				call DestroyEffect(LoadEffectHandle(HT, iHandleId, 20 + 2))
			endif
			if fierySoulCount >= 3 then
				call DestroyEffect(LoadEffectHandle(HT, iHandleId, 10 + 3))
				call DestroyEffect(LoadEffectHandle(HT, iHandleId, 20 + 3))
			endif
			call UnitRemoveAbility(whichUnit, 'Ab07')
			call UnitRemoveAbility(whichUnit, 'B007')
			call FlushChildHashtable(HT, iHandleId)
			call ClearTrigger(trig)
			set whichUnit=null
		endif
		set trig=null
		return false
	endfunction
	// 炽魂
 function FierySoulEffect takes unit whichUnit returns nothing
  local trigger trig= GetTriggeringTrigger()
  local integer iHandleId= GetHandleId(trig)
  local trigger newTrig
  local integer fierySoulCount
  local integer abilityLevel= GetUnitAbilityLevel(whichUnit, 'Ahy3')
  local real bonusAttackSpeed= ( 20 + 10 * abilityLevel ) * 0.01
  local real bonusMoveSpeed= 4 + 1 * abilityLevel
		set newTrig=LoadTriggerHandle(HT, iHandleId, 0)
		if newTrig == null then
			set newTrig=CreateTrigger()
			call SaveTriggerHandle(HT, iHandleId, 0, newTrig)
			set iHandleId=GetHandleId(newTrig)
			call TriggerRegisterTimerEvent(newTrig, .5, true)
			call TriggerAddCondition(newTrig, Condition(function FierySoulRemove))
			call SaveUnitHandle(HT, iHandleId, 0, whichUnit)
			call SaveTriggerHandle(HT, iHandleId, 1, trig)
			call UnitAddPermanentAbility(whichUnit , 'Ab07')
		else
			set iHandleId=GetHandleId(newTrig)
		endif
		call SaveReal(HT, iHandleId, 0, TimerGetElapsed(GameTimer) + 9)
		set fierySoulCount=LoadInteger(HT, iHandleId, 0)
		if fierySoulCount < 3 then
			call SaveInteger(HT, iHandleId, 0, fierySoulCount + 1)
			call UnitAddAttackSpeedBonus(whichUnit , bonusAttackSpeed)
			call UnitAddMoveSpeedBonus(whichUnit , bonusMoveSpeed)
			call SaveReal(HT, iHandleId, 1, LoadReal(HT, iHandleId, 1) + bonusAttackSpeed)
			call SaveReal(HT, iHandleId, 2, LoadReal(HT, iHandleId, 2) + bonusMoveSpeed)
			call SaveEffectHandle(HT, iHandleId, 10 + fierySoulCount + 1, AddSpecialEffectTarget("Abilities\\Spells\\Human\\DarkSoul\\DarkSoul.mdx", whichUnit, "head"))
			call SaveEffectHandle(HT, iHandleId, 20 + fierySoulCount + 1, AddSpecialEffectTarget("Abilities\\Spells\\Human\\DarkSoul\\DarkSoul.mdx", whichUnit, "chest"))
		endif
		set trig=null
	endfunction
 function FierySoulFilter takes nothing returns boolean
  local integer abilityId= GetSpellAbilityId()
		call FierySoulEffect(GetSpellAbilityUnit())
		return false
	endfunction
 function FierySoul takes nothing returns nothing
  local unit learnUnit= GetLearningUnit()
  local trigger trig= CreateTrigger()
		call TriggerRegisterUnitEvent(trig, learnUnit, EVENT_UNIT_SPELL_EFFECT)
		call TriggerAddCondition(trig, Condition(function FierySoulFilter))
		set trig=null
		set learnUnit=null
	endfunction
	
	// 偷懒直接在筛选里面加特效
 function CopperAlchemist___DragonSlave_Filter takes nothing returns boolean
  local unit hFilterUnit= GetFilterUnit()
		if Enemy_Alive_NoStructure(hFilterUnit) then
			call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Human\\LagunaBlade\\LagunaBlade_hit.mdx", hFilterUnit, "origin"))
			return true
		endif
		set hFilterUnit=null
		return false
	endfunction
	//神灭斩
 function CopperAlchemist___LagunaBlade takes nothing returns nothing
  local unit hSpellUnit= M_GetSpellAbilityUnit()
  local unit hTargetUnitt= M_GetSpellTargetUnit()
  local integer level= M_GetSpellAbilityLevel()
  local real startX= GetUnitX(hSpellUnit)
  local real startY= GetUnitY(hSpellUnit)
  local real targetX
  local real targetY
  local real damage= 250 + level * 200
  local string effectPath= "Abilities\\Spells\\Human\\LagunaBlade\\LagunaBlade.mdx"
  local effect missileEffect
		if hTargetUnitt == null then
			set targetX=M_GetSpellTargetX()
			set targetY=M_GetSpellTargetY()
		else
			set targetX=GetUnitX(hTargetUnitt)
			set targetY=GetUnitY(hTargetUnitt)
		endif
		set missileEffect=AddSpecialEffect(effectPath, targetX, targetY)
		call UnitSpellWaveByEffect(hSpellUnit , missileEffect , damage , 800 , 275 , 200 , startX , startY , targetX , targetY , 1200 , 1 , null , level , function CopperAlchemist___DragonSlave_Filter)
		set missileEffect=null
		set hSpellUnit=null
		set hTargetUnitt=null
	endfunction
// scope CopperAlchemist ends
function DeterminedExterminatorEffectWait10 takes nothing returns boolean
 local trigger trig= GetTriggeringTrigger()
 local integer iHandleId= GetHandleId(trig)
 local integer heroStr= LoadInteger(HT, iHandleId, 0)
 local unit whichUnit= LoadUnitHandle(HT, iHandleId, 0)
	call UnitReduceStrBonus(whichUnit , heroStr)
	call FlushChildHashtable(HT, iHandleId)
	call ClearTrigger(trig)
	set whichUnit=null
	set trig=null
	return false
endfunction
function DeterminedExterminatorEffect takes unit whichUnit,boolean isHero returns nothing
 local integer addHeroStr= R2I(GetHeroStr(whichUnit, false) * 0.1)
 local integer iHandleId= CreateTimerEventTrigger(10. , false , function DeterminedExterminatorEffectWait10)
	if isHero then
		set addHeroStr=addHeroStr * 2
	endif
	call SaveUnitHandle(HT, iHandleId, 0, whichUnit)
	call SaveInteger(HT, iHandleId, 0, addHeroStr)
	call UnitAddStrBonus(whichUnit , addHeroStr)
endfunction
function DeterminedExterminatorFilter takes nothing returns nothing
 local trigger trig= GetTriggeringTrigger()
 local integer iHandleId= GetHandleId(trig)
 local unit whichUnit= LoadUnitHandle(HT, iHandleId, 0)
 local unit dyingUnit= GetDyingUnit()
 local real distance= GetDistanceBetweenUnits(whichUnit , dyingUnit)
	if distance < 500 then
		call DeterminedExterminatorEffect(whichUnit , IsUnitType(dyingUnit, UNIT_TYPE_HERO))
	endif
	set whichUnit=null
	set dyingUnit=null
	set trig=null
endfunction
//仓鼠天赋
function DeterminedExterminator takes unit whichUnit returns nothing
 local trigger trig= CreateTrigger()
 local integer iHandleId= GetHandleId(trig)
	call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_DEATH)
	call TriggerAddCondition(trig, Condition(function DeterminedExterminatorFilter))
	call SaveUnitHandle(HT, iHandleId, 0, whichUnit)
	set trig=null
endfunction
//暗杀
function Assassination takes nothing returns nothing
 local unit spellUnit= M_GetSpellAbilityUnit()
 local unit targetUnit= M_GetSpellAbilityUnit()
 local unit firstUnit
 local group targetGroup= LoginGroup()
 local integer abilityLevel= M_GetSpellAbilityLevel()
 local real damage= 60 + abilityLevel * 20
 local integer heroStr= GetHeroStr(spellUnit, true)
	set damage=damage + ( damage * heroStr * 0.01 )
	call GroupEnumUnitsInRange(targetGroup, GetUnitX(targetUnit), GetUnitY(targetUnit), 325, null)
	set P2=GetOwningPlayer(spellUnit)
	loop
		set firstUnit=FirstOfGroup(targetGroup)
		exitwhen firstUnit == null
		if IsGround_NotMechanical_Enemy_Alive_NoStructure(firstUnit) then
			call DamageUnit(spellUnit , firstUnit , 2 , damage)
			call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl", firstUnit, "origin"))
		endif
		call GroupRemoveUnit(targetGroup, firstUnit)
	endloop
	call LogoutGroup(targetGroup)
	set targetUnit=null
	set firstUnit=null
	set targetGroup=null
	set spellUnit=null
endfunction
function BlightPower takes nothing returns nothing
 local unit spellUnit= M_GetSpellAbilityUnit()
 local integer abilityLevel= M_GetSpellAbilityLevel()
 local real dur= 3 + abilityLevel * 1
	call UnitSetMagicImmunity(spellUnit , dur)
	call UnitAddAbilityTimed(spellUnit , 'Ab10' , 1 , dur , 'B010' , 1)
	call SetBlight(GetOwningPlayer(spellUnit), GetUnitX(spellUnit), GetUnitY(spellUnit), 225, true)
	
	set spellUnit=null
endfunction
function BlackEpidermis takes nothing returns nothing
	call EnabledAttackEffect(3 , 0.)
endfunction
function JumpShipRun takes nothing returns nothing
 local trigger trig= GetTriggeringTrigger()
 local integer iHandleId= GetHandleId(trig)
 local unit smallBear= LoadUnitHandle(HT, iHandleId, 0)
 local unit shipUnit= LoadUnitHandle(HT, iHandleId, 1)
	//local unit targetUnit = LoadUnitHandle(HT, iHandleId, 2)
 local real angle= LoadReal(HT, iHandleId, 0)
 local integer evalCount= GetTriggerEvalCount(trig)
 local real flyHeight
 local real targetX
 local real targetY
 local boolean close= LoadBoolean(HT, iHandleId, 180)
	//if evalCount> 80 then
	//	call Debug("log", "	Bigbug")
	//endif
	if not UnitAlive(shipUnit) and evalCount < 30 then
		call SaveBoolean(HT, iHandleId, 180, true)
	endif
	if ( UnitAlive(shipUnit) or GetUnitFlyHeight(smallBear) != 312.5 ) and not close then
		if evalCount < 30 then
			call SetUnitX(smallBear, GetUnitX(shipUnit) + 130 * Cos(angle))
			call SetUnitY(smallBear, GetUnitY(shipUnit) + 130 * Cos(angle))
		elseif evalCount < 80 then
			set evalCount=evalCount - 30
			set flyHeight=0.5 * ( evalCount - 25 ) * ( evalCount - 25 )
			call SetUnitFlyHeight(smallBear, 312.5 - flyHeight, 0)
			set targetX=CoordinateX(GetUnitX(smallBear) + 10.33 * Cos(angle))
			set targetY=CoordinateY(GetUnitY(smallBear) + 10.33 * Sin(angle))
			call SetUnitX(smallBear, targetX)
			call SetUnitY(smallBear, targetY)
		else
			set close=true
			call SaveBoolean(HT, iHandleId, 180, true)
		endif
	else
		call SetUnitFlyHeight(smallBear, GetUnitDefaultFlyHeight(smallBear), 0)
		call PauseUnit(smallBear, false)
		//call Debug("log", "	call SetUnitFlyHeight(smallBear, 0, 0)")
		call SetUnitTimeScale(smallBear, 1.0)
		call UnitRemoveAbility(smallBear, 'Abun')
		call SetUnitPathing(smallBear, true)
		//call Debug("log", "	SetUnitPathing(smallBear, true)")
		call SetUnitAnimation(smallBear, "stand")
		if not UnitAlive(shipUnit) and evalCount < 30 then
			call KillUnit(smallBear)
		else
			call RemoveUnit(smallBear)
			set smallBear=SummonUnit(LoadUnitHandle(HT, iHandleId, 3) , 'nfrl' , GetUnitX(smallBear) , GetUnitY(smallBear) , angle , 'BTLF' , 20.)
			call SetUnitVertexColor(smallBear, 255, 255, 255, 100)
		endif
		call FlushChildHashtable(HT, iHandleId)
		call ClearTrigger(trig)
	endif
	set trig=null
	set smallBear=null
	set shipUnit=null
	//set targetUnit = null
endfunction
function JumpShip takes unit targetUnit,unit shipUnit,unit spellUnit returns nothing
 local real shipX= GetUnitX(shipUnit)
 local real shipY= GetUnitY(shipUnit)
 local real targetX= GetUnitX(targetUnit)
 local real targetY= GetUnitY(targetUnit)
 local real face= AngleBetweenXY(shipX , shipY , targetX , targetY)
 local real startX= CoordinateX(shipX + 130 * Cos(face))
 local real startY= CoordinateY(shipY + 130 * Sin(face))
 local unit smallBear= CreateUnit(GetOwningPlayer(shipUnit), 'nfrl', startX, startY, face)
 local integer iHandleId= CreateTimerEventTrigger(0.2 , true , function JumpShipRun)
	call PauseUnit(smallBear, true)
	call UnitAddAbility(smallBear, 'Arav')
	call UnitRemoveAbility(smallBear, 'Arav')
	call UnitAddAbility(smallBear, 'Aloc')
	call SetUnitPathing(smallBear, false)
	call SetUnitFlyHeight(smallBear, 312.5, 0)
	//
	call SetUnitVertexColor(smallBear, 255, 255, 255, 100)
	call SetUnitAnimation(smallBear, "Attack spell")
	call QueueUnitAnimation(smallBear, "StandHit")
	call SetUnitTimeScale(smallBear, 3)
	
	call SaveUnitHandle(HT, iHandleId, 0, smallBear)
	call SaveUnitHandle(HT, iHandleId, 1, shipUnit)
	call SaveUnitHandle(HT, iHandleId, 2, targetUnit)
	call SaveUnitHandle(HT, iHandleId, 3, spellUnit)
	call SaveReal(HT, iHandleId, 0, face)
	set smallBear=null
endfunction
function ShipSail takes nothing returns boolean
 local trigger trig= GetTriggeringTrigger()
 local integer iHandleId= GetHandleId(trig)
 local unit dummyShip= LoadUnitHandle(HT, iHandleId, 170)
 local unit firstUnit
 local unit spellUnit
 local group targetGroup
 local group injuredGroup
 local integer evalCount= GetTriggerEvalCount(trig)
 local real amount
 local real startX= LoadReal(HT, iHandleId, 150)
 local real startY= LoadReal(HT, iHandleId, 151)
 local real angle= LoadReal(HT, iHandleId, 152)
 local real shipX= CoordinateX(startX + 13.33 * evalCount * Cos(angle))
 local real shipY= CoordinateY(startY + 13.33 * evalCount * Sin(angle))
	if evalCount < 19 then
		call SetUnitVertexColor(dummyShip, 255, 255, 255, 5 + evalCount * 10)
	elseif evalCount < 125 then
		call SetUnitVertexColor(dummyShip, 255, 255, 255, 190)
	endif
	if evalCount >= 110 then
		set injuredGroup=LoadGroupHandle(HT, iHandleId, 187)
		set targetGroup=LoginGroup()
		set spellUnit=LoadUnitHandle(HT, iHandleId, 171)
		call GroupEnumUnitsInRange(targetGroup, shipX, shipY, 550, null)
		set P2=GetOwningPlayer(dummyShip)
		loop
			set firstUnit=FirstOfGroup(targetGroup)
			exitwhen firstUnit == null
			//非空军 非机械 存活 非建筑 敌军 可见
			if UnitVisibleToPlayer(firstUnit , P2) and IsGround_NotMechanical_Enemy_Alive_NoStructure(firstUnit) and not IsUnitInGroup(firstUnit, injuredGroup) then
				call JumpShip(firstUnit , dummyShip , spellUnit)
				call GroupAddUnit(injuredGroup, firstUnit)
			endif
			call GroupRemoveUnit(targetGroup, firstUnit)
		endloop
		call LogoutGroup(targetGroup)
		set targetGroup=null
		set injuredGroup=null
		set spellUnit=null
	endif
	call SetUnitX(dummyShip, shipX)
	call SetUnitY(dummyShip, shipY)
	if ModuloInteger(evalCount, 25) == 0 then
		call KillDestructablesInCircle(shipX , shipY , 325)
	endif
	if evalCount == LoadInteger(HT, iHandleId, 161) then
		call KillDestructablesInCircle(shipX , shipY , 325)
		set targetGroup=LoginGroup()
		set spellUnit=LoadUnitHandle(HT, iHandleId, 171)
		set amount=LoadReal(HT, iHandleId, 153)
		call GroupEnumUnitsInRange(targetGroup, shipX, shipY, 425, null)
		set P2=GetOwningPlayer(spellUnit)
		loop
			set firstUnit=FirstOfGroup(targetGroup)
			exitwhen firstUnit == null
			if Enemy_Alive_NoStructure(firstUnit) then
				call M_UnitSetStun(firstUnit , 2 , 1.4 , false)
				call DamageUnit(spellUnit , firstUnit , 1 , amount)
			endif
			call GroupRemoveUnit(targetGroup, firstUnit)
		endloop
		set firstUnit=null
		set spellUnit=null
		call LogoutGroup(targetGroup)
		set targetGroup=null
		call LogoutGroup(LoadGroupHandle(HT, iHandleId, 187))
		call KillUnit(dummyShip)
		call FlushChildHashtable(HT, iHandleId)
		call ClearTrigger(trig)
	endif
	set dummyShip=null
	set trig=null
	return false
endfunction
function SmallBearAttackEffect takes nothing returns nothing
 local unit soureUnit
	if GetUnitTypeId(Tmp_DamageSource) == 'nfrl' then
		set soureUnit=GetMasterUnit(Tmp_DamageSource)
		call UnitRestoreMana(soureUnit , 10)
		call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Undead\\ReplenishMana\\SpiritTouchTarget.mdl", soureUnit, "origin"))
		set soureUnit=null
	endif
endfunction
//学习幽灵船
function LearnGhostShip takes nothing returns nothing
 local trigger trig= CreateTrigger()
	call TriggerAddCondition(trig, Condition(function SmallBearAttackEffect))
	call TriggerRegisterAnyUnitDamagedEvent(trig , 1)
	set trig=null
endfunction
function GhostShip takes nothing returns nothing
 local unit spellUnit= M_GetSpellAbilityUnit()
 local unit dummyShip
 local real spellX= M_GetSpellTargetX()
 local real spellY= M_GetSpellTargetY()
 local real unitX= GetUnitX(spellUnit)
 local real unitY= GetUnitY(spellUnit)
 local real startX
 local real startY
 local real targetX
 local real targetY
 local real angle
 local integer level= M_GetSpellAbilityLevel()
 local real damage= 100 + level * 50
 local integer maxCount= 150
 local integer iHandleId= CreateTimerEventTrigger(.02 , true , function ShipSail)
	
	set startX=unitX
	set startY=unitY
	if spellX == startX and spellY == startY then
		set angle=GetUnitFacing(spellUnit)
		set spellX=spellX + 50 * Cos(angle * bj_DEGTORAD)
		set spellY=spellY + 50 * Sin(angle * bj_DEGTORAD)
	endif
	set angle=Atan2(spellY - startY, spellX - startX)
	set startX=unitX - 1000 * Cos(angle)
	set startY=unitY - 1000 * Sin(angle)
	set targetX=unitX + 1000 * Cos(angle)
	set targetY=unitY + 1000 * Sin(angle)
	call SaveReal(HT, iHandleId, 152, angle)
	set angle=AngleBetweenXY(startX , startY , spellX , spellY)
	call DestroyEffect(AddSpecialEffect("war3mapImported\\Whirlpool.mdx", targetX, targetY))
	set dummyShip=CreateUnit(GetOwningPlayer(spellUnit), 'ndsp', startX, startY, angle)
	call SetUnitVertexColor(dummyShip, 255, 255, 255, 0)
	call SetUnitPathing(dummyShip, false)
	call SaveInteger(HT, iHandleId, 160, level)
	call SaveInteger(HT, iHandleId, 161, maxCount)
	call SaveReal(HT, iHandleId, 150, startX)
	call SaveReal(HT, iHandleId, 151, startY)
	call SaveReal(HT, iHandleId, 153, damage)
	call SaveGroupHandle(HT, iHandleId, 187, LoginGroup())
	call SaveUnitHandle(HT, iHandleId, 170, dummyShip)
	//存入施法者,伤害理应由施法者打出
	call SaveUnitHandle(HT, iHandleId, 171, spellUnit)
	
	set dummyShip=null
	set spellUnit=null
endfunction
function TaxStealerAddGold takes unit taxStealer,integer addGold returns nothing
 local string gold
	set TaxStealerGoldAmount=TaxStealerGoldAmount + addGold
	set gold=I2S(TaxStealerGoldAmount)
	call DzFrameSetText(TaxStealerGoldFrameText, gold)
	call DzFrameSetText(TaxStealerGoldTipTextTitle, "黄金： " + gold)
	if TaxStealerGoldAmount < 0 then
		call UnitAddPermanentAbility(taxStealer , 'Ab11')
		call UnitRemoveAbility(taxStealer, 'Ats5')
		call UnitRemoveAbility(taxStealer, 'Ats0')
	elseif GetUnitAbilityLevel(taxStealer, 'Ab11') == 1 then
		call UnitAddPermanentAbility(taxStealer , 'Ats5')
		call UnitAddPermanentAbility(taxStealer , 'Ats0')
		call UnitRemoveAbility(taxStealer, 'Ab11')
		call UnitRemoveAbility(taxStealer, 'B011')
	endif
endfunction
function Shinyboy takes nothing returns nothing
 local integer gold= IMinBJ(TaxStealerGoldAmount, 300)
 local unit spellUnit= M_GetSpellAbilityUnit()
	
	call TaxStealerAddGold(spellUnit , - gold)
	call DamageUnit(spellUnit , M_GetSpellAbilityUnit() , 1 , gold)
	set spellUnit=null
endfunction
function Transmute takes nothing returns nothing
 local unit spellUnit= M_GetSpellAbilityUnit()
 local unit targetUnit= M_GetSpellAbilityUnit()
 local integer level= M_GetSpellAbilityLevel()
 local integer addGold= 40 + level * 20
	if TaxStealerGoldAmount >= 0 then
		if GetUnitAbilityLevel(targetUnit, 'AHer') == 0 then
			call DamageUnit(spellUnit , targetUnit , 3 , 99999)
		else
			call M_UnitSetStun(targetUnit , 2. , 2. , false)
		endif
	endif
	call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Other\\Transmute\\PileofGold.mdl", GetUnitX(targetUnit), GetUnitY(targetUnit)))
	call TaxStealerAddGold(spellUnit , addGold)
	call GoldTextTag(GetOwningPlayer(spellUnit) , targetUnit , addGold)
	set targetUnit=null
	set spellUnit=null
endfunction
function WeMediaDeath takes nothing returns nothing
 local trigger trig= GetTriggeringTrigger()
 local integer iHandleId= GetHandleId(trig)
 local unit boomUnit= LoadUnitHandle(HT, iHandleId, 0)
 local integer level= LoadInteger(HT, iHandleId, 0)
 local group targetGroup= LoginGroup()
 local unit firstUnit
 local real damage= 100 + 50 * level
 local real unitX= GetUnitX(boomUnit)
 local real unitY= GetUnitY(boomUnit)
 local string effectPath= "Objects\\Spawnmodels\\Other\\NeutralBuildingExplosion\\NeutralBuildingExplosion.mdl"
	call DestroyEffect(AddSpecialEffect(effectPath, unitX, unitY))
	call KillDestructablesInCircle(unitX , unitY , 350)
	call GroupEnumUnitsInRange(targetGroup, unitX, unitY, 350, null)
	set P2=GetOwningPlayer(boomUnit)
	loop
		set firstUnit=FirstOfGroup(targetGroup)
		exitwhen firstUnit == null
		if Enemy_Alive_NotFly(firstUnit) then
			call DamageUnit(boomUnit , firstUnit , 3 , damage)
		endif
		call GroupRemoveUnit(targetGroup, firstUnit)
	endloop
	//call RemoveUnit(boomUnit)
	set firstUnit=null
	call LogoutGroup(targetGroup)
	set targetGroup=null
	call FlushChildHashtable(HT, iHandleId)
	call ClearTrigger(trig)
	set boomUnit=null
	set trig=null
endfunction
function WeMedia takes nothing returns nothing
 local unit spellUnit= M_GetSpellAbilityUnit()
 local integer level= M_GetSpellAbilityLevel()
 local real face= GetUnitFacing(spellUnit)
 local real unitX= GetUnitX(spellUnit) + 150 * Cos(face * bj_DEGTORAD)
 local real unitY= GetUnitY(spellUnit) + 150 * Sin(face * bj_DEGTORAD)
 local unit media= CreateUnit(GetOwningPlayer(spellUnit), 'nvil', unitX, unitY, face)
 local trigger trig= CreateTrigger()
 local integer iHandleId= GetHandleId(trig)
	call TaxStealerAddGold(spellUnit , - 100)
	call SetUnitExploded(media, true)
	call IssueImmediateOrderById(media, Order_Taunt)
	call UnitApplyTimedLife(media, 'BTLF', 5)
	call TriggerRegisterDeathEvent(trig, media)
	call TriggerAddCondition(trig, Condition(function WeMediaDeath))
	call SaveUnitHandle(HT, iHandleId, 0, media)
	call SaveInteger(HT, iHandleId, 0, level)
	set trig=null
	set media=null
	set spellUnit=null
endfunction
//宏大叙事
function GrandNarrative takes nothing returns nothing
 local unit spellUnit= M_GetSpellAbilityUnit()
 local integer addGold= 100 + M_GetSpellAbilityLevel() * 100
	call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\Transmute\\PileofGold.mdl", spellUnit, "origin"))
	call TaxStealerAddGold(spellUnit , addGold)
	call GoldTextTag(GetOwningPlayer(spellUnit) , spellUnit , addGold)
	set spellUnit=null
endfunction
function CreateTaxStealerGoldBarUI takes unit taxStealerUnit returns nothing
 local integer taxStealerGoldTipFrameId
 local integer taxStealerGoldFrameIcon
 local integer taxStealerGoldTipTextValue
	set TaxStealerResourceBarFrame=DzCreateSimpleFrame("TaxStealerResourceBarFrame", ConsoleUI, 0)
	
	call DzFrameSetAbsolutePoint(TaxStealerResourceBarFrame, 4, 0.18, 0.18)
	//很奇怪 这里需要这样操作才能隐藏
	call DzFrameShow(TaxStealerResourceBarFrame, false)
	if GetOwningPlayer(taxStealerUnit) != LocalPlayer then
		call DzFrameShow(TaxStealerResourceBarFrame, true)
	endif
	
	set TaxStealerGoldFrameText=DzSimpleFontStringFindByName("TaxStealerResourceBarGoldText", 0)
	set taxStealerGoldFrameIcon=DzSimpleTextureFindByName("TaxStealerResourceBarIcon", 0)
	set TaxStealerGoldTipBoxedFrame=DzCreateFrameByTagName("BUTTON", null, GameUI, null, 0)
	call DzFrameSetPoint(TaxStealerGoldTipBoxedFrame, 6, taxStealerGoldFrameIcon, 6, 0, 0)
	call DzFrameSetPoint(TaxStealerGoldTipBoxedFrame, 2, TaxStealerGoldFrameText, 2, 0, 0)
	set taxStealerGoldTipFrameId=CreateFrameTooltip(TaxStealerGoldTipBoxedFrame , "黄金： 0" , "特殊的资源类型，模范公民大部分技能与此相关。")
	set TaxStealerGoldTipTextTitle=TipsText[taxStealerGoldTipFrameId]
	set taxStealerGoldTipTextValue=UberTipsText[taxStealerGoldTipFrameId]
	call TaxStealerAddGold(taxStealerUnit , 500)
endfunction
// scope StormSpirit begins
    function StormSpirit___BallLightningMove takes nothing returns nothing
        local trigger t= GetTriggeringTrigger()
        local integer h= GetHandleId(t)
        local real distance= LoadReal(HT, h, 0)
local unit u= LoadUnitHandle(HT, h, 10)
local unit d1= LoadUnitHandle(HT, h, 11)
local unit d2= LoadUnitHandle(HT, h, 12)
        local lightning light= LoadLightningHandle(HT, h, 21)
local real x1= GetUnitX(u)
        local real y1= GetUnitY(u)
        //前进方向 需要动态计算 因为可能会因为多次释放导致过头
        local real a= Atan2(LoadReal(HT, h, 9) - y1, LoadReal(HT, h, 8) - x1)
        local real x2= x1 + ( distance ) * Cos(a)
        local real y2= y1 + ( distance ) * Sin(a)
        local real mana= GetUnitState(u, UNIT_STATE_MANA)
        local real cost= ( distance ) * ( 12 + .007 * GetUnitState(u, UNIT_STATE_MAX_MANA) ) * 0.01
        local integer count= LoadInteger(HT, h, 30)
        set count=count - 1
        if count == 0 or GetUnitState(u, UNIT_STATE_MANA) < 1 or not UnitAlive(u) then
            call SetUnitFlyHeight(u, 0, 0)
            call SetUnitPathing(u, true)
            //call SetUnitPosition(u, x2, y2)
            call DestroyLightning(light)
            call DestroyEffect(LoadEffectHandle(HT, h, 32))
            call RemoveUnit(d1)
            call RemoveUnit(d2)
            call FlushChildHashtable(HT, h)
            call ClearTrigger(t)
            //逆变身 暂时不用 会导致单位特效丢失
            //set h = GetHandleId(u)
            //set count = LoadInteger(UnitKeyBuff, BallLightningCount, h) - 1
            //call SaveInteger(UnitKeyBuff, BallLightningCount, h, count)
            //if count == 0 then //计数为0则逆变身回正常状态
            //	call YDWEUnitTransform(u, 'HI02')
            //endif
        else //开始移动	
call SetUnitX(u, x2)
            call SetUnitY(u, y2)
            call SetUnitX(d1, x2)
            call SetUnitY(d1, y2)
            call SetUnitX(d2, x2)
            call SetUnitY(d2, y2)
            if GetTriggerEvalCount(t) > 25 then //移动闪电
set x1=LoadReal(HT, h, 6) + distance * Cos(a)
                set y1=LoadReal(HT, h, 7) + distance * Sin(a)
                call SaveReal(HT, h, 6, x1 * 1.)
                call SaveReal(HT, h, 7, y1 * 1.)
            else
                set x1=LoadReal(HT, h, 6)
                set y1=LoadReal(HT, h, 7)
            endif
            call MoveLightning(light, true, x1, y1, x2, y2)
            call SetUnitState(u, UNIT_STATE_MANA, RMaxBJ(mana - cost, 0))
            call SaveInteger(HT, h, 30, count)
        endif
        call KillDestructablesInCircle(x2 , y2 , 75) //会破坏75码范围内的可破坏物
set light=null
        set u=null
        set d1=null
        set d2=null
        set t=null
    endfunction
    function BallLightning takes nothing returns nothing
        local real x1= GetUnitX(M_GetSpellAbilityUnit())
        local real y1= GetUnitY(M_GetSpellAbilityUnit())
        local real x2
        local real y2
        local lightning light
        local real distance
        local unit d1
        local unit d2
        local trigger t
        local integer h
        local integer lv= M_GetSpellAbilityLevel()
        local player p= GetOwningPlayer(M_GetSpellAbilityUnit())
        //local real mana = GetUnitState(u, UNIT_STATE_MANA)
        //local real cost = 30 + .06 * GetUnitState(u, UNIT_STATE_MAX_MANA)
        //call SetUnitState(u, UNIT_STATE_MANA, RMaxBJ(mana -cost, 0))
        set t=CreateTrigger()
        //set h = GetHandleId(M_GetSpellAbilityUnit()) //计数 + 1
        //call SaveInteger(UnitKeyBuff, BallLightningCount, h, LoadInteger(UnitKeyBuff, BallLightningCount, h) + 1 )
        //call YDWEUnitTransform(M_GetSpellAbilityUnit(), 'HIM2')
        set h=GetHandleId(t)
        set d1=CreateUnit(p, 'nsbl', x1, y1, 0) //滚动风暴之灵
set d2=CreateUnit(p, 'npn5', x1, y1, 0) //似乎是用来发出声音的

        call SetUnitVertexColor(d2, 255, 255, 255, 0)
        set p=null
        //set MNR = CreateUnit(GetOwningPlayer(u),'npn5', ux, uy, 0)
        set light=AddLightning("FORK", true, x1, y1, x1, y1)
        if M_GetSpellAbilityUnit() == null then
            set x2=M_GetSpellTargetX()
            set y2=M_GetSpellTargetY()
        else
            set x2=GetUnitX(M_GetSpellAbilityUnit())
            set y2=GetUnitY(M_GetSpellAbilityUnit())
        endif
        //
        call UnitAddAbility(M_GetSpellAbilityUnit(), 'Amrf')
        call UnitRemoveAbility(M_GetSpellAbilityUnit(), 'Amrf')
        call SetUnitFlyHeight(M_GetSpellAbilityUnit(), 9999, 0)
        //
        call SetUnitPathing(M_GetSpellAbilityUnit(), false)
        call SetUnitPathing(d1, false)
        set distance=GetDistanceBetween(x2 , y2 , x1 , y1)
        if distance < ( 25 + 25 * lv ) then
            call SaveReal(HT, h, 0, distance)
        else
            call SaveReal(HT, h, 0, 25 + 25 * lv)
        endif
        //call SaveReal(HT, h, 5, Atan2(y2 -y1, x2 -x1))
        call SaveReal(HT, h, 6, x1 * 1.)
        call SaveReal(HT, h, 7, y1 * 1.)
        call SaveReal(HT, h, 8, x2 * 1.) //似乎没有必要储存技能释放点 但需要动态计算朝向
call SaveReal(HT, h, 9, y2 * 1.) //已经预存了前进次数和前进方向
call SaveUnitHandle(HT, h, 10, M_GetSpellAbilityUnit())
        call SaveUnitHandle(HT, h, 11, d1)
        call SaveUnitHandle(HT, h, 12, d2)
        call SaveLightningHandle(HT, h, 21, light)
        //call SaveInteger(HT, h, 40, lv) //不需要存技能等级
        call SaveInteger(HT, h, 30, ( IMaxBJ(R2I(SquareRoot(( x2 - x1 ) * ( x2 - x1 ) + ( y2 - y1 ) * ( y2 - y1 )) / ( 25 + 25 * lv )), 1) ))
        call SaveEffectHandle(HT, h, 32, ( AddSpecialEffectTarget("effects\\Lightning_Ball_Tail_FX.mdx", d2, "origin") ))
        call TriggerRegisterTimerEvent(t, .04, true)
        call TriggerAddCondition(t, Condition(function StormSpirit___BallLightningMove))
        set light=null
        set t=null
        set d1=null
        set d2=null
    endfunction
    function StormSpirit___ElectricVortexTow takes nothing returns boolean
        local trigger t= GetTriggeringTrigger()
        local integer h= GetHandleId(t)
        local unit target= LoadUnitHandle(HT, h, 17)
        local real a= LoadReal(HT, h, 11)
        local real tx= GetUnitX(target) - 5 * Cos(a)
        local real ty= GetUnitY(target) - 5 * Sin(a)
        local real x= LoadReal(HT, h, 6)
        local real y= LoadReal(HT, h, 7)
        if ( x - tx ) * ( x - tx ) + ( y - ty ) * ( y - ty ) < 100 then
            set tx=x
            set ty=y
        endif
        call SetUnitX(target, tx)
        call SetUnitY(target, ty)
        if GetTriggerEvalCount(t) == ( LoadInteger(HT, h, 5) ) or GetTriggerEventId() == EVENT_WIDGET_DEATH then
            call FlushChildHashtable(HT, h)
            call ClearTrigger(t)
        endif
        set t=null
        set target=null
        return false
    endfunction
    function StormSpirit___ElectricVortex_Fx takes unit u,unit target,integer lv returns nothing
        local trigger t= CreateTrigger()
        local integer h= GetHandleId(t)
        local real x= GetUnitX(u)
        local real y= GetUnitY(u)
        local real tx= GetUnitX(target)
        local real ty= GetUnitY(target)
        local unit du= CreateUnit(GetOwningPlayer(u), 'nstd', x, y, GetUnitFacing(u))
        call TriggerRegisterTimerEvent(t, .05, true)
        call TriggerRegisterDeathEvent(t, target)
        call TriggerAddCondition(t, Condition(function StormSpirit___ElectricVortexTow))
        call SaveUnitHandle(HT, h, 17, target)
        call SaveInteger(HT, h, 5, 10 + 10 * lv)
        call SaveReal(HT, h, 6, x)
        call SaveReal(HT, h, 7, y)
        call SaveReal(HT, h, 11, Atan2(ty - y, tx - x))
        call UnitSetLeash(du , target , "CLPB" , 0 , 'Ab03' , 'Bmlt' , 3 , 2 , 0 , false)
        //call DamageUnit(u, target, 1 , 20)
        call UnitApplyTimedLife(du, 'BTLF', 1 + .5 * lv)
        set du=null
        set t=null
    endfunction
    //电子涡流
    function ElectricVortex takes nothing returns nothing
        if not HaveSpellShield(M_GetSpellAbilityUnit()) then
            call StormSpirit___ElectricVortex_Fx(M_GetSpellAbilityUnit() , M_GetSpellAbilityUnit() , M_GetSpellAbilityLevel())
        endif
    endfunction
    //残影动作 造成伤害或持续时间到期
    function StormSpirit___StaticRremnantActions takes nothing returns boolean
        local trigger t= GetTriggeringTrigger()
        local integer h= GetHandleId(t)
        local trigger effT= LoadTriggerHandle(HT, h, 9)
local integer effH= GetHandleId(effT)
        local unit shadow= LoadUnitHandle(HT, h, 30)
        local group g= null
        local unit u= null
        local real x
        local real y
        local integer damage
        if GetTriggerEventId() == EVENT_UNIT_DEATH then
            call ShowUnit(shadow, false)
            call KillUnit(shadow)
            call FlushChildHashtable(HT, h)
            call ClearTrigger(t)
            call FlushChildHashtable(HT, effH)
            call ClearTrigger(effT)
        else
            set P2=GetOwningPlayer(shadow)
            if Enemy_Alive_NoStructure_NoImmune(GetTriggerUnit()) then
                set x=GetUnitX(shadow)
                set y=GetUnitY(shadow)
                set u=LoadUnitHandle(HT, effH, 10)
                set damage=100 + 40 * LoadInteger(HT, effH, 50) // 残影爆炸伤害
//在单位死亡前从哈希表从获取数据 单位死亡哈希表就清空了
call ShowUnit(shadow, false)
                call KillUnit(shadow)
                call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\Bolt\\BoltImpact.mdl", x, y))
                call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\Bolt\\BoltImpact.mdl", x, y))
                set shadow=u
                set g=LoginGroup()
                call GroupEnumUnitsInRange(g, x, y, 285, null)
                loop
                    set u=FirstOfGroup(g)
                    exitwhen u == null
                    if Enemy_Alive_NoStructure_NoImmune(u) then
                        call DamageUnit(shadow , u , 1 , damage)
                        call DestroyEffect(AddSpecialEffect("Abilities\\Weapons\\ChimaeraLightningMissile\\ChimaeraLightningMissile.mdl", GetUnitX(u), GetUnitY(u)))
                    endif
                    call GroupRemoveUnit(g, u)
                endloop
                call LogoutGroup(g)
                call FlushChildHashtable(HT, h)
                call ClearTrigger(t)
                call FlushChildHashtable(HT, effH)
                call ClearTrigger(effT)
                set g=null
                set u=null
            endif
        endif
        set t=null
        set effT=null
        set shadow=null
        return false
    endfunction
    //创建残影 有0.5s的延迟出现 1.0s延迟生效
    function StormSpirit___CreateStaticRremnant takes nothing returns boolean
        local trigger t= GetTriggeringTrigger()
        local integer h= GetHandleId(t)
        local trigger newT
        local integer newH
        local integer c= GetTriggerEvalCount(t)
        local unit shadow
        if c == 1 then
            call DestroyEffect(LoadEffectHandle(HT, h, 20))
        elseif c == 2 then
            call DestroyEffect(LoadEffectHandle(HT, h, 21))
            set newT=CreateTrigger()
            set newH=GetHandleId(newT)
            //创建残影
            set shadow=CreateUnit(GetOwningPlayer(LoadUnitHandle(HT, h, 10)), 'npn2', LoadReal(HT, h, 1), LoadReal(HT, h, 2), LoadReal(HT, h, 3))
            call SetUnitVertexColor(shadow, 255, 255, 255, 100)
            call UnitApplyTimedLife(shadow, 'BHwe', 12)
            call SaveUnitHandle(HT, h, 30, shadow)
            call SaveUnitHandle(HT, newH, 30, shadow)
            call SaveTriggerHandle(HT, newH, 9, t)
            call TriggerRegisterUnitInRange(newT, shadow, 235, null) //残影触发范围
call TriggerRegisterUnitEvent(newT, shadow, EVENT_UNIT_DEATH)
            call TriggerAddCondition(newT, Condition(function StormSpirit___StaticRremnantActions))
            //else c > 2 then
        else
            call DestroyEffect(AddSpecialEffectTarget("effects\\ManaFlareBoltImpact_NoSound.mdx", LoadUnitHandle(HT, h, 30), "origin"))
        endif
        set t=null
        set newT=null
        set shadow=null
        return false
    endfunction
    //风暴之灵 - 残影
    function StaticRremnant takes nothing returns nothing
        local integer h= CreateTimerEventTrigger(0.5 , true , function StormSpirit___CreateStaticRremnant)
        local real x= GetUnitX(M_GetSpellAbilityUnit())
        local real y= GetUnitY(M_GetSpellAbilityUnit())
        call SaveInteger(HT, h, 50, M_GetSpellAbilityLevel())
        call SaveReal(HT, h, 1, ( x ) * 1.)
        call SaveReal(HT, h, 2, ( y ) * 1.)
        call SaveReal(HT, h, 3, GetUnitFacing(M_GetSpellAbilityUnit()) * 1.)
        call SaveUnitHandle(HT, h, 10, M_GetSpellAbilityUnit())
        call SaveEffectHandle(HT, h, 20, ( AddSpecialEffect("Abilities\\Spells\\Orc\\LightningShield\\LightningShieldTarget.mdl", x, y) ))
        call SaveEffectHandle(HT, h, 21, ( AddSpecialEffect("effects\\Static_Remnant_FX.mdx", x, y) ))
    endfunction
    
    //超负荷
    function OverLoadActions takes nothing returns nothing
        local integer h= GetHandleId(Tmp_DamageSource)
        local group g= LoginGroup()
        local unit u= Tmp_DamageInjured
        local real damage= GetUnitAbilityLevel(Tmp_DamageSource, 'Ast3') * 20 + 10
        call SaveInteger(UnitKeyBuff, h, StormSpirit___HaveOverload, 0)
        call DestroyEffect(LoadEffectHandle(UnitKeyBuff, h, StormSpirit___OverloadEffectLeft))
        call DestroyEffect(LoadEffectHandle(UnitKeyBuff, h, StormSpirit___OverloadEffectRight))
        call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Human\\Thunderclap\\ThunderClapCaster.mdl", GetUnitX(u), GetUnitY(u)))
	
        set P2=GetOwningPlayer(Tmp_DamageSource)
        call GroupEnumUnitsInRange(g, GetUnitX(u), GetUnitY(u), 300, null)
        loop
            set u=FirstOfGroup(g)
            exitwhen u == null //造成法术攻击 魔法伤害
if Enemy_Alive_NoStructure(u) then
                call DamageUnit(Tmp_DamageSource , u , 1 , damage)
                call UnitAddAbilityTimed(u , 'ANol' , 1 , 0.6 , 'BSts' , 2)
                call GroupRemoveUnit(g, u)
            endif
        endloop
        call LogoutGroup(g)
        set g=null
        set u=null
    endfunction
    function OverLoad_Filter takes nothing returns boolean
        if LoadInteger(UnitKeyBuff, GetHandleId(Tmp_DamageSource), StormSpirit___HaveOverload) == 1 then
            call OverLoadActions()
        endif
        return false
    endfunction
    function AddOverLoad takes nothing returns boolean
        local unit u= GetTriggerUnit()
        local integer h= GetHandleId(u)
        if LoadInteger(UnitKeyBuff, h, StormSpirit___HaveOverload) == 0 then
            call SaveInteger(UnitKeyBuff, h, StormSpirit___HaveOverload, 1)
            call SaveEffectHandle(UnitKeyBuff, h, StormSpirit___OverloadEffectRight, ( AddSpecialEffectTarget("Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl", u, "right hand") ))
            call SaveEffectHandle(UnitKeyBuff, h, StormSpirit___OverloadEffectLeft, ( AddSpecialEffectTarget("Abilities\\Weapons\\FarseerMissile\\FarseerMissile.mdl", u, "left hand") ))
        endif
        set u=null
        return false
    endfunction
    //注册超负荷攻击以及施法事件
    function OverloadLearn1 takes nothing returns nothing
        local trigger t= CreateTrigger()
        local unit u= GetTriggerUnit()
        call TriggerRegisterUnitEvent(t, u, EVENT_UNIT_SPELL_EFFECT)
        call TriggerAddCondition(t, Condition(function AddOverLoad))
        set t=CreateTrigger()
        call TriggerAddCondition(t, Condition(function OverLoad_Filter))
        call TriggerRegisterAnyUnitDamagedEvent(t , 1)
        set u=null
        set t=null
    endfunction
// scope StormSpirit ends
// scope PickMan begins
    function BattleSpiralActions takes nothing returns boolean
        local unit whichUnit= GetTriggerUnit()
        local unit hAttacker= GetAttacker()
        local string spinEffectPath= null
        local string targetEffectPath= null
        local group enumDamageTarget
        local unit firstUnit
        local integer iAbilityLevle
        local real rDamageAmount
        local real radius
        local integer iDamageType
        if IsUnitEnemy(whichUnit, GetOwningPlayer(hAttacker)) then
            if PrdRandom(whichUnit , 'Apm2' , 15) then
                // 物理伤害 对敌对单位 非建筑 无视魔免
                set iAbilityLevle=GetUnitAbilityLevel(whichUnit, 'Apm2')
                set radius=325
                set iDamageType=DAMAGE_TYPE_PHYSICAL
                set rDamageAmount=50 + iAbilityLevle * 20
                set spinEffectPath="Abilities\\Spells\\Human\\BattleSpiral\\SpinFX3.mdx"
                set targetEffectPath="Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl"
                call SetUnitAnimation(whichUnit, "spin")
                call DestroyEffect(AddSpecialEffectTarget(spinEffectPath, whichUnit, "origin"))
                call UnitDelayedStanding(whichUnit , 0.6)
                set enumDamageTarget=LoginGroup()
                call GroupEnumUnitsInRange(enumDamageTarget, GetUnitX(whichUnit), GetUnitY(whichUnit), radius, null)
                call GroupRemoveUnit(enumDamageTarget, whichUnit)
                set P2=GetOwningPlayer(whichUnit)
                loop
                    set firstUnit=FirstOfGroup(enumDamageTarget)
                    exitwhen firstUnit == null
                    if Enemy_Alive_NoStructure(firstUnit) then
                        call DestroyEffect(AddSpecialEffectTarget(targetEffectPath, firstUnit, "origin"))
                        call DamageUnit(whichUnit , firstUnit , iDamageType , rDamageAmount)
                    endif
                
                    call GroupRemoveUnit(enumDamageTarget, firstUnit)
                endloop
                set firstUnit=null
                call LogoutGroup(enumDamageTarget)
                set enumDamageTarget=null
            endif
        endif
        set whichUnit=null
        set hAttacker=null
        return false
    endfunction
    // 学习战斗螺旋
    function BattleSpiralLearn1 takes nothing returns nothing
        local unit whichUnit= GetLearningUnit()
        local integer iAbilityId= GetLearnedSkill()
        local trigger trig= CreateUnitAbilityTrigger(whichUnit , iAbilityId)
        call TriggerRegisterUnitEvent(trig, whichUnit, EVENT_UNIT_ATTACKED)
        call TriggerAddCondition(trig, Condition(function BattleSpiralActions))
        set whichUnit=null
        set trig=null
    endfunction
    function BattleImago takes nothing returns nothing
        local unit whichUnit= M_GetSpellAbilityUnit()
        local string sSpecialArt= "Abilities\\Spells\\Orc\\MirrorImage\\MirrorImageCaster.mdl"
        local string sMissileArt= "Abilities\\Spells\\Orc\\MirrorImage\\MirrorImageMissile.mdl"
        call UnitSpellImage(whichUnit , 3 , 1 , 1 , 2.2 , 60 , sSpecialArt , sMissileArt , 250 , 300 , 1500)
         call BJDebugMsg("运行")
        set whichUnit=null
    endfunction
// scope PickMan ends
// scope Pudge begins
    function Pudge___MeatHook_Filter takes nothing returns boolean
        return Alive_NoStructure(GetFilterUnit())
    endfunction
    
    function Pudge___MeatHook_Return takes nothing returns boolean
        local trigger t= GetTriggeringTrigger()
        local integer h= GetHandleId(t)
        local unit target= LoadUnitHandle(HT, h, 5)
        local integer count= LoadInteger(HT, h, 21)
        local effect hook= LoadEffectHandle(HT, h, 2100 + count)
        local real x
        local real y
        if LoadBoolean(HT, h, 10) then
            set x=EXGetEffectX(hook)
            set y=EXGetEffectY(hook)
            call SetUnitX(target, x)
            call SetUnitY(target, y)
            if ModuloInteger(GetTriggerEvalCount(t), 3) == 0 and LoadBoolean(HT, h, 11) then
                call M_UnitSetStun(target , 0.1 , 0.1 , true)
            endif
        endif
        call EXSetEffectZ(hook, - 999)
        call DestroyEffect(hook)
        set count=count - 1
        call SaveInteger(HT, h, 21, count)
        if count == 0 then
            call SetUnitPathing(target, true)
            call FlushChildHashtable(HT, h)
            call ClearTrigger(t)
        endif
        set t=null
        set hook=null
        return false
    endfunction
    
    function Pudge___Pudge_MeatHook_Move takes nothing returns boolean
        local trigger t= GetTriggeringTrigger()
        local integer h= GetHandleId(t)
        local unit u= LoadUnitHandle(HT, h, 10)
        local integer lv= LoadInteger(HT, h, 20)
        local real a
        local real x
        local real y
    
        local integer count= LoadInteger(HT, h, 21)
        local real maxcount= 30 + 5 * lv
        local real range= 75
    
        local unit target
        local group g
        local effect hook
        local trigger rt= LoadTriggerHandle(HT, h, 30)
        local integer rh= GetHandleId(rt)
        if count < maxcount then
            set count=count + 1
            call SaveInteger(HT, h, 21, count)
            set a=LoadReal(HT, h, 11)
            set x=GetUnitX(u) + count * 40 * Cos(a * bj_DEGTORAD)
            set y=GetUnitY(u) + count * 40 * Sin(a * bj_DEGTORAD)
            set hook=AddSpecialEffect("Abilities\\Weapons\\WardenMissile\\WardenMissile.mdl", x, y)
            call EXSetEffectSize(hook, 2.)
            call EXEffectMatRotateZ(hook, a)
            call EXSetEffectZ(hook, EXGetEffectZ(hook) + 25)
            call SaveEffectHandle(HT, rh, 2100 + count, hook)
            set hook=null
            set g=LoginGroup()
            call GroupEnumUnitsInRange(g, x, y, range, Condition(function Pudge___MeatHook_Filter))
            call GroupRemoveUnit(g, u)
            set target=FirstOfGroup(g)
            if target == null then
                set target=GroupPickRandomUnit(g)
            endif
            call LogoutGroup(g)
            set g=null
            if target != null then
                call FlushChildHashtable(HT, h)
                call ClearTrigger(t)
                call TriggerRegisterTimerEvent(rt, .025, true)
                call TriggerRegisterDeathEvent(rt, target)
                call TriggerAddCondition(rt, Condition(function Pudge___MeatHook_Return))
                call SetUnitPathing(target, false)
                call SaveInteger(HT, rh, 21, count)
                call SaveBoolean(HT, rh, 10, true)
                //call SaveBoolean(HT, rh, 11, IsUnitEnemy(u, GetOwningPlayer(target)))
                call SaveUnitHandle(HT, rh, 5, target)
                if IsUnitEnemy(target, GetOwningPlayer(u)) then
                    call DestroyEffect(AddSpecialEffectTarget("Objects\\Spawnmodels\\Human\\HumanBlood\\BloodElfSpellThiefBlood.mdl", target, "origin"))
                    call DamageUnit(u , target , 3 , 50)
                endif
            endif
        else
            call FlushChildHashtable(HT, h)
            call ClearTrigger(t)
            call TriggerRegisterTimerEvent(rt, .025, true)
            call TriggerAddCondition(rt, Condition(function Pudge___MeatHook_Return))
            call SaveInteger(HT, rh, 21, count)
        endif
    
        set t=null
        set u=null
        set target=null
        return false
    endfunction
    
    //技能函数不能为私有函数(因为函数名记录在哈希表内)
    function Pudge_MeatHook takes nothing returns nothing
        local integer h= CreateTimerEventTrigger(.025 , true , function Pudge___Pudge_MeatHook_Move)
        //前进方向
        local real a= AngleBetweenXY(GetUnitX(M_GetSpellAbilityUnit()) , GetUnitY(M_GetSpellAbilityUnit()) , M_GetSpellTargetX() , M_GetSpellTargetY())
        
        call SaveUnitHandle(HT, h, 10, M_GetSpellAbilityUnit())
        call SaveReal(HT, h, 11, a)
        call SaveInteger(HT, h, 20, M_GetSpellAbilityLevel())
        call SaveInteger(HT, h, 21, 0)
        call SaveTriggerHandle(HT, h, 30, CreateTrigger())
    
    endfunction
    
    function Pudge___Pudge_Rot_Action takes nothing returns boolean
        local trigger t= GetTriggeringTrigger()
        local integer h= GetHandleId(t)
        local unit u= LoadUnitHandle(HT, h, 10)
        local unit target
        local group g
        local real damage= 5
        local integer iTrigCount= GetTriggerEvalCount(t)
        local effect effSlow= LoadEffectHandle(HT, h, 0)
        if GetUnitAbilityLevel(u, 'Bpg2') == 1 then
            set g=LoginGroup()
            call GroupEnumUnitsInRange(g, GetUnitX(u), GetUnitY(u), 275, null) //250 + 25
set P2=GetOwningPlayer(u)
            loop
                set target=FirstOfGroup(g)
                exitwhen target == null
                if Enemy_Alive_NoStructure_NoImmune(target) then
                    call DamageUnit(u , target , 2 , damage)
                endif
                call GroupRemoveUnit(g, target)
            endloop
            if ModuloInteger(iTrigCount, 2) == 0 then
                call DestroyEffect(effSlow)
                call SaveEffectHandle(HT, h, 0, AddSpecialEffectTarget("Abilities\\Spells\\Human\\slow\\slowtarget.mdl", u, "head"))
            endif
            call DamageUnit(u , u , 2 , damage)
            call LogoutGroup(g)
            set g=null
            set target=null
        else
            call DestroyEffect(effSlow)
            call RemoveSavedHandle(UnitKeyBuff, GetHandleId(u), 'Bpg2')
            call FlushChildHashtable(HT, h)
            call ClearTrigger(t)
        endif
        set effSlow=null
        set u=null
        set t=null
        return false
    endfunction
    
    function Pudge_Rot takes nothing returns nothing
        local unit whichUnit= M_GetSpellAbilityUnit()
        local integer h= GetHandleId(whichUnit)
        local trigger trig
        if HaveSavedHandle(UnitKeyBuff, h, 'Bpg2') then
            set trig=LoadTriggerHandle(UnitKeyBuff, h, 'Bpg2')
            call UnitRemoveAbility(whichUnit, 'Ab05')
            call UnitRemoveAbility(whichUnit, 'Bpg2') //删除技能并立即运行一次触发 即可结束此触发
call TriggerEvaluate(trig)
        else
            set trig=CreateTrigger()
            set h=GetHandleId(trig)
            call TriggerRegisterTimerEvent(trig, 0.1, true)
            call TriggerAddCondition(trig, Condition(function Pudge___Pudge_Rot_Action))
            call SaveTriggerHandle(UnitKeyBuff, GetHandleId(whichUnit), 'Bpg2', trig)
            call SaveUnitHandle(HT, h, 10, whichUnit)
            call UnitAddPermanentAbility(whichUnit , 'Ab05')
            call SaveEffectHandle(HT, h, 0, AddSpecialEffectTarget("Abilities\\Spells\\Human\\slow\\slowtarget.mdl", whichUnit, "head"))
            //call TriggerEvaluate(trig)
        endif
        set trig=null
        set whichUnit=null
    endfunction
    
    // 肢解
    function Pudge_Dismember takes nothing returns nothing
        local unit whichUnit= M_GetSpellAbilityUnit()
        local unit targetUnit= M_GetSpellAbilityUnit()
        //指向性技能判断一下法术护盾
        if not HaveSpellShield(M_GetSpellAbilityUnit()) then
            call UnitSetLeash(whichUnit , targetUnit , null , 'A006' , 'Ab06' , 'B006' , 3 , 3 , 50 , true)
        endif
        set whichUnit=null
        set targetUnit=null
    endfunction
    //===========================================================================
    // Boss的AI要在技能后面
    //===========================================================================
    // Boos AI
    //===========================================================================
    // Pudge
    //===========================================================================
    function PudgeAIRot takes unit pudge returns nothing
        local group g
        local unit dummyUnit= null
        local integer iMeetCondition= 0
        local boolean isRot= GetUnitAbilityLevel(pudge, 'Bpg2') != 0
        local boolean isDismember
        local real pudgeLife= GetWidgetLife(pudge)
        if pudgeLife < 400 then //如果血量太低就不烧了
            if isRot then
                call IssueImmediateAbilityById(pudge , 'A005')
            endif
            return
        endif
        set g=LoginGroup()
        call GroupEnumUnitsInRange(g, GetUnitX(pudge), GetUnitY(pudge), 325, null)
        set P2=GetOwningPlayer(pudge)
        loop
            set dummyUnit=FirstOfGroup(g)
            exitwhen dummyUnit == null //检查可见度 防止烧隐身单位
            if Enemy_Alive_NoStructure_NoImmune(dummyUnit) and UnitVisibleToPlayer(dummyUnit , P2) then
                set iMeetCondition=iMeetCondition + 1
            endif
            call GroupRemoveUnit(g, dummyUnit)
        endloop
        set dummyUnit=null
        set isDismember=GetUnitCurrentOrder(pudge) == Order_MagicLeash and YDWEGetUnitAbilityState(pudge , 'A006' , 1) != 0.
        if ( ( iMeetCondition > 1 or isDismember ) and not isRot ) or ( iMeetCondition < 2 and isRot and not isDismember ) then
            call IssueImmediateAbilityById(pudge , 'A005')
        endif
        call LogoutGroup(g)
        set g=null
    endfunction
    //单位移动一定距离后的位置(未计入寻路算法, time的数值应尽量小)
    function GetUnitPositionAfterMovement takes unit whichUnit,real time returns location
        local real unitX= GetUnitX(whichUnit)
        local real unitY= GetUnitY(whichUnit)
        local real unitSpeed= GetUnitMoveSpeed(whichUnit) * time
        local real unitAngle= GetUnitFacing(whichUnit)
        local real targetX= unitX + unitSpeed * Cos(unitAngle * bj_DEGTORAD)
        local real targetY= unitY + unitSpeed * Sin(unitAngle * bj_DEGTORAD)
        local integer dstructableAmount
        set dstructableAmount=GetDestructablesAmountInCircle(targetX , targetY , 120)
        if dstructableAmount == 0 then
            return Location(targetX, targetY)
        else
            return null
        endif
    endfunction
    function PudgeAICastMeatHook takes unit pudge,unit target returns boolean
        local real pudgeX= GetUnitX(pudge)
        local real pudgeY= GetUnitY(pudge)
        local real targetX= GetUnitX(target)
        local real targetY= GetUnitY(target)
        local real rDistance= GetDistanceBetween(pudgeX , pudgeY , targetX , targetY)
        local integer targetOrder= GetUnitCurrentOrder(target)
        local real targetSpeed
        local real maxRangeMeatHook
        local real rMeatHookTime
        local location targetPosition= null
        local boolean targetNoSmartUnit
        if targetOrder == 0 or ( targetOrder != Order_Move ) then
            call Debug("log" , "targetName=  " + GetUnitName(target))
            call IssuePointOrderById(pudge, Order_Flare, targetX, targetY)
        else
            set targetSpeed=GetUnitMoveSpeed(target)
            set targetNoSmartUnit=LoadBoolean(HT, GetHandleId(GetTriggeringTrigger()), GetHandleId(target))
            if targetOrder == Order_Move or ( targetOrder == Order_Smart and targetNoSmartUnit ) then
                set maxRangeMeatHook=( 30 + 5 * GetUnitAbilityLevel(pudge, 'Apg1') ) * 40
                set rMeatHookTime=maxRangeMeatHook / 1600
                set targetPosition=GetUnitPositionAfterMovement(target , rMeatHookTime + 0.3)
                if targetPosition != null then
                    set targetX=GetLocationX(targetPosition)
                    set targetY=GetLocationY(targetPosition)
                    call Debug("log" , "targetX=  " + R2S(targetX))
                    call RemoveLocation(targetPosition)
                    set targetPosition=null
                    set rDistance=GetDistanceBetween(pudgeX , pudgeY , targetX , targetY)
                    if rDistance > maxRangeMeatHook then
                        return false
                    endif
                endif
                call IssuePointOrderById(pudge, Order_Flare, targetX, targetY)
            endif
        endif
        return true
    endfunction
    function PudgeAIMeatHook takes unit pudge returns nothing
        local real pudgeX
        local real pudgeY
        local group dummyGroup
        local group targetGroup
        local unit firstUnit
        local integer pudgeOrder= GetUnitCurrentOrder(pudge)
        local unit targetUnit
        local real maxRangeMeatHook
        if YDWEGetUnitAbilityState(pudge , 'Apg1' , 1) != 0. then //钩子cd没好则返回
//call Debug("log","CoolDown !=0.")
return
        endif
        //如果屠夫在放技能直接返回
        if pudgeOrder == Order_MagicLeash or pudgeOrder == Order_Flare then
            call Debug("log" , "return - Order = MagicLeash")
            return
        endif
        //call Debug("log","CastMeatHook")
        set pudgeX=GetUnitX(pudge)
        set pudgeY=GetUnitY(pudge)
        set targetGroup=LoginGroup()
        set dummyGroup=LoginGroup()
        set maxRangeMeatHook=( 30 + 5 * GetUnitAbilityLevel(pudge, 'Apg1') ) * 40
        call GroupEnumUnitsInRange(dummyGroup, pudgeX, pudgeY, maxRangeMeatHook, null)
        set P2=GetOwningPlayer(pudge)
        loop
            set firstUnit=FirstOfGroup(dummyGroup)
            exitwhen firstUnit == null
            if UnitVisibleToPlayer(firstUnit , P2) and Alive_NoStructure(firstUnit) then
                call GroupAddUnit(targetGroup, firstUnit)
            endif
            call GroupRemoveUnit(dummyGroup, firstUnit)
        endloop
        set firstUnit=null
        call LogoutGroup(dummyGroup)
        set dummyGroup=null
        set targetUnit=GetFarthestUnitByGroup(targetGroup , pudgeX , pudgeY)
        if targetUnit == null then
            call LogoutGroup(targetGroup)
            set targetUnit=null
            set targetGroup=null
            return
        endif
        if not PudgeAICastMeatHook(pudge , targetUnit) then
            //call Debug("log","选取最近")
            set targetUnit=GetNearestUnitByGroup(targetGroup , pudgeX , pudgeY)
            call PudgeAICastMeatHook(pudge , targetUnit)
        endif
        call LogoutGroup(targetGroup)
        set targetUnit=null
        set targetGroup=null
    endfunction
    function PudgeAIDismember takes unit pudge returns nothing
        local real pudgeX
        local real pudgeY
        local group enumGroup
        local group targetGroup
        local unit dummyUnit= null
        local integer pudgeOrder= GetUnitCurrentOrder(pudge)
        local unit targetUnit
        //肢解cd没好则返回
        if YDWEGetUnitAbilityState(pudge , 'A006' , 1) != 0. then
            return
        endif
        if pudgeOrder == Order_MagicLeash or pudgeOrder == Order_Flare then //如果屠夫在钩就返回
            call Debug("log" , " return - Order = Spell")
            return
        endif
        set pudgeX=GetUnitX(pudge)
        set pudgeY=GetUnitY(pudge)
        set enumGroup=LoginGroup()
        set targetGroup=LoginGroup()
        call GroupEnumUnitsInRange(enumGroup, pudgeX, pudgeY, 700, null)
        call GroupRemoveUnit(enumGroup, pudge)
        set P2=GetOwningPlayer(pudge)
        loop
            set dummyUnit=FirstOfGroup(enumGroup)
            exitwhen dummyUnit == null //检查可见度 防止对隐身单位
            if Enemy_Alive_NoStructure(dummyUnit) and UnitVisibleToPlayer(dummyUnit , P2) then
                call GroupAddUnit(targetGroup, dummyUnit)
            endif
            call GroupRemoveUnit(enumGroup, dummyUnit)
        endloop
        call LogoutGroup(enumGroup)
        set enumGroup=null
        set targetUnit=GetNearestUnitByGroup(targetGroup , pudgeX , pudgeY)
        call IssueTargetOrderByIdWait0S(pudge , Order_MagicLeash , targetUnit)
        call Debug("log" , "Dismember TargetName = " + GetUnitName(targetUnit))
        call LogoutGroup(targetGroup)
        set targetUnit=null
        set targetGroup=null
    endfunction
    
    function PudgeAIAttack takes unit pudge returns nothing
        local real pudgeX
        local real pudgeY
        local real targetUnitX
        local real targetUnitY
        local group enumGroup
        local group targetGroup
        local unit firstUnit= null
        local integer pudgeOrder= GetUnitCurrentOrder(pudge)
        local unit targetUnit
        local real rDistance= 0
        if pudgeOrder == Order_MagicLeash or pudgeOrder == Order_Flare then //如果屠夫在放技能就返回
            call Debug("log" , " return - Order = Spell")
            return
        endif
        set pudgeX=GetUnitX(pudge)
        set pudgeY=GetUnitY(pudge)
        set enumGroup=LoginGroup()
        set targetGroup=LoginGroup()
        call GroupEnumUnitsInRange(enumGroup, pudgeX, pudgeY, 1600, null)
        call GroupRemoveUnit(enumGroup, pudge)
        set P2=GetOwningPlayer(pudge)
        loop
            set firstUnit=FirstOfGroup(enumGroup)
            exitwhen firstUnit == null //检查可见度 防止对隐身单位
            if Enemy_Alive(firstUnit) and UnitVisibleToPlayer(firstUnit , P2) then
                call GroupAddUnit(targetGroup, firstUnit)
            endif
            call GroupRemoveUnit(enumGroup, firstUnit)
        endloop
        set firstUnit=null
        call LogoutGroup(enumGroup)
        set enumGroup=null
        set targetUnit=GetMinPercentLifeUnitByGroup(targetGroup)
        if targetUnit == null then
            call LogoutGroup(targetGroup)
            set targetUnit=null
            set targetGroup=null
            return
        endif
        call Debug("log" , "MinLife TargetName = " + GetUnitName(targetUnit))
        if pudgeOrder != Order_Move then
            if pudgeOrder == Order_Attack then
                set targetUnitX=GetUnitX(targetUnit)
                set targetUnitY=GetUnitY(targetUnit)
                set rDistance=GetDistanceBetween(pudgeX , pudgeY , targetUnitX , targetUnitY)
            endif
            if rDistance < 700 then
                if YDWEGetUnitAbilityState(pudge , 'Apg1' , 1) == 0. then
                    call IssuePointOrderById(pudge, Order_Flare, targetUnitX, targetUnitY)
                    call Debug("log" , "Hook TargetName = " + GetUnitName(targetUnit))
                elseif YDWEGetUnitAbilityState(pudge , 'A006' , 1) == 0. then
                    call IssueTargetOrderById(pudge, Order_MagicLeash, targetUnit)
                    call Debug("log" , "Dismember TargetName = " + GetUnitName(targetUnit))
                else
                    call IssueTargetOrderById(pudge, Order_Attack, targetUnit)
                    call Debug("log" , "Attack TargetName = " + GetUnitName(targetUnit))
                endif
            endif
        endif
    
        call LogoutGroup(targetGroup)
        set targetUnit=null
        set targetGroup=null
    endfunction
    
    function PudgeAI_CallBack takes nothing returns boolean
        local trigger trig= GetTriggeringTrigger()
        local integer iHandleId= GetHandleId(trig)
        local unit pudge= LoadUnitHandle(HT, iHandleId, 0)
        local eventid trigEventId= GetTriggerEventId()
        local unit orderUnit= GetOrderedUnit()
        local integer trigCount= GetTriggerEvalCount(trig)
        local integer orderId
        if trigEventId == EVENT_GAME_TIMER_EXPIRED then
            call PudgeAIRot(pudge)
            call PudgeAIMeatHook(pudge)
            if ModuloInteger(trigCount, 30) == 1 then
                call PudgeAIAttack(pudge)
            endif
        elseif trigEventId == EVENT_UNIT_TARGET_IN_RANGE or trigEventId == EVENT_UNIT_ATTACKED then
            //call Debug("log", "DAMAGED")
            call PudgeAIDismember(pudge)
        elseif orderUnit != null then
            set orderId=GetIssuedOrderId()
            if orderId == Order_Smart then
                call SaveBoolean(HT, iHandleId, GetHandleId(orderUnit), GetOrderTargetUnit() == null)
            endif
        elseif trigEventId == EVENT_WIDGET_DEATH then
            call FlushChildHashtable(HT, iHandleId)
            call ClearTrigger(trig)
        endif
    
        set orderUnit=null
        set trigEventId=null
        set pudge=null
        set trig=null
        return false
    endfunction
    
    function InitPudgeAI takes unit pudge returns nothing
        local trigger trig= CreateTrigger()
        local integer iHandleId= GetHandleId(trig)
    
        call TriggerRegisterTimerEvent(trig, 0.25, true)
        call TriggerRegisterDeathEvent(trig, pudge)
        call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER)
        call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER)
        call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_ISSUED_ORDER)
        call TriggerRegisterUnitEvent(trig, pudge, EVENT_UNIT_TARGET_IN_RANGE)
        call TriggerRegisterUnitEvent(trig, pudge, EVENT_UNIT_ATTACKED)
        call TriggerAddCondition(trig, Condition(function PudgeAI_CallBack))
        call SaveUnitHandle(HT, iHandleId, 0, pudge)
    
    
    
        set trig=null
    endfunction
    
    
    function StartBossAI takes unit whichUnit returns nothing
        local integer bossType= GetUnitTypeId(whichUnit)
        if bossType == 'U001' then
            call InitPudgeAI(whichUnit)
        endif
    
    endfunction
    
    function StartPedugAI takes nothing returns boolean
        local trigger trig= GetTriggeringTrigger()
        local integer iHandleId= GetHandleId(trig)
        call StartBossAI(LoadUnitHandle(HT, iHandleId, 0))
        call FlushChildHashtable(HT, iHandleId)
        call ClearTrigger(trig)
        return false
    endfunction
// scope Pudge ends
// UI在英雄后面加载
//非常奇怪 SimpleFrame的Show似乎是颠倒的
function UnitStateUpdateCallback takes nothing returns nothing
 local real value= 0.
 local real rateOfFire= 0.
	if not NewUnitStateUIIsEnable or LocalPlayerSelectUnit == null then
		return
	endif
	//移速
	set value=GetUnitMoveSpeed(LocalPlayerSelectUnit)
	//将移动速度UI置父控制台UI再隐藏
	if value == 0. then
		if not MoveSpeedUIVisible then
			call DzFrameSetParent(MoveSpeedFrame, ConsoleUI)
			set MoveSpeedUIVisible=true
			call DzFrameShow(MoveSpeedFrame, MoveSpeedUIVisible)
			call DzFrameSetText(MoveSpeedTextValue, null)
		endif
	else
		call DzFrameSetParent(MoveSpeedFrame, SimpleInfoPanelIconArmor2)
		call DzFrameSetText(MoveSpeedTextValue, I2S(R2I(value)))
		if MoveSpeedUIVisible then
			set MoveSpeedUIVisible=false
			call DzFrameShow(MoveSpeedFrame, MoveSpeedUIVisible)
		endif
	endif
	//当前攻击速度
	set rateOfFire=GetUnitState(LocalPlayerSelectUnit, UNIT_STATE_RATE_OF_FIRE)
	//如果没有攻速,说明两个攻击类型都没有
	if rateOfFire == 0. then
		if not AttackSpeed1UIVisible then
			set AttackSpeed1UIVisible=true
			call DzFrameShow(AttackSpeed1Frame, AttackSpeed1UIVisible)
			call DzFrameSetText(AttackSpeed1TextValue, null)
		endif
		if not AttackSpeed2UIVisible then
			set AttackSpeed2UIVisible=true
			call DzFrameShow(AttackSpeed2Frame, AttackSpeed2UIVisible)
			call DzFrameSetText(AttackSpeed2TextValue, null)
		endif
		return
	endif
	//攻击方式1
	set value=GetUnitState(LocalPlayerSelectUnit, UNIT_STATE_ATTACK1_INTERVAL)
	//被除数不能为0 所以在下面再计算
	if value == 0. then
		if not AttackSpeed1UIVisible then
			set AttackSpeed1UIVisible=true
			call DzFrameShow(AttackSpeed1Frame, AttackSpeed1UIVisible)
			call DzFrameSetText(AttackSpeed1TextValue, null)
		endif
	else
		//最高攻击速度为 5.
		set value=value / RMinBJ(5., rateOfFire)
		call DzFrameSetText(AttackSpeed1TextValue, R2SW(value, 0, 2))
		if AttackSpeed1UIVisible then
			set AttackSpeed1UIVisible=false
			call DzFrameShow(AttackSpeed1Frame, AttackSpeed1UIVisible)
		endif
	endif
	//英雄单位不必显示攻击方式2
	//if GetUnitAbilityLevel(LocalPlayerSelectUnit, 'AHer') == 0 then
	//攻击方式2
	set value=GetUnitState(LocalPlayerSelectUnit, UNIT_STATE_ATTACK2_INTERVAL)
	if value == 0. then
		if not AttackSpeed2UIVisible then
			set AttackSpeed2UIVisible=true
			call DzFrameShow(AttackSpeed2Frame, AttackSpeed2UIVisible)
			call DzFrameSetText(AttackSpeed2TextValue, null)
		endif
	else
		//最高攻击速度为 5.
		set value=value / RMinBJ(5., rateOfFire)
		call DzFrameSetText(AttackSpeed2TextValue, R2SW(value, 0, 2))
		if AttackSpeed2UIVisible then
			set AttackSpeed2UIVisible=false
			call DzFrameShow(AttackSpeed2Frame, AttackSpeed2UIVisible)
		endif
	endif
	//endif
endfunction
//启用的话就多了 移动速度 当前攻击间隔 的显示
function EnableNewUnitStateUI takes boolean enable returns nothing
 local integer whichFrame
 local integer index
 local integer backDropFrame
 local integer lableFrame
 local integer valueFrame
 local integer levelFrame
	set NewUnitStateUIIsEnable=enable
	set index=0
	//call Debug("log", I2S(GetLocalizedHotkey("QuickSave")))
	loop
		set backDropFrame=DzSimpleTextureFindByName("InfoPanelIconBackdrop", index)
		set lableFrame=DzSimpleFontStringFindByName("InfoPanelIconLabel", index)
		set valueFrame=DzSimpleFontStringFindByName("InfoPanelIconValue", index)
		set levelFrame=DzSimpleFontStringFindByName("InfoPanelIconLevel", index)
		if enable then
			call DzFrameSetSize(backDropFrame, 0.02, 0.02)
			call DzFrameSetText(lableFrame, null)
			
			//设置升级数字大小
			//call DzFrameSetFont(levelFrame, "Fonts\\dfst-m3u.ttf", 0.00576, 4)
		else
			call DzFrameSetSize(backDropFrame, 0.03125, 0.03125)
			//设置升级数字大小
			//call DzFrameSetFont(levelFrame, "Fonts\\dfst-m3u.ttf", 0.009, 4)
		endif
		if enable then
			call DzFrameSetPoint(valueFrame, 0, backDropFrame, 2, 0, - 0.005)
			call DzFrameSetPoint(levelFrame, 4, backDropFrame, 8, - 0.005225, 0.004875)
		else
			call DzFrameSetPoint(valueFrame, 0, lableFrame, 6, 0.005, - 0.003)
			call DzFrameSetPoint(levelFrame, 4, backDropFrame, 8, - 0.007625, 0.006875)
			//用获取本地字符串以确保另外语言的客户端不会突然从 英文 - 中文
			if index == 0 or index == 1 then
				call DzFrameSetText(lableFrame, GetLocalizedString("COLON_DAMAGE"))
			elseif index == 2 then
				call DzFrameSetText(lableFrame, GetLocalizedString("COLON_ARMOR"))
			elseif index == 3 then
				call DzFrameSetText(lableFrame, GetLocalizedString("COLON_RANK"))
			elseif index == 4 then
				call DzFrameSetText(lableFrame, GetLocalizedString("COLON_FOOD"))
			endif
		endif
		exitwhen index == 4
		set index=index + 1
	endloop
	//需要更改UI的父窗口再隐藏他们。
	//if LocalPlayerSelectUnit == null then
	if enable then
		//如果已经被置父为控制台，那么要更改回去。
		if DzFrameGetParent(AttackSpeed1Frame) == ConsoleUI then
			set whichFrame=DzSimpleFrameFindByName("SimpleInfoPanelIconDamage", 0)
			call DzFrameSetParent(AttackSpeed1Frame, whichFrame)
			set whichFrame=DzSimpleFrameFindByName("SimpleInfoPanelIconDamage", 1)
			call DzFrameSetParent(AttackSpeed2Frame, whichFrame)
			set whichFrame=DzSimpleFrameFindByName("SimpleInfoPanelIconArmor", 2)
			call DzFrameSetParent(MoveSpeedFrame, whichFrame)
		endif
	else
		//置父控制台UI
		call DzFrameSetParent(MoveSpeedFrame, ConsoleUI)
		call DzFrameSetParent(AttackSpeed1Frame, ConsoleUI)
		call DzFrameSetParent(AttackSpeed2Frame, ConsoleUI)
		call DzFrameShow(MoveSpeedFrame, true)
		call DzFrameShow(AttackSpeed1Frame, true)
		call DzFrameShow(AttackSpeed2Frame, true)
	endif
	//endif
	set whichFrame=DzSimpleFrameFindByName("SimpleInfoPanelIconDamage", 0)
	if enable then
		call DzFrameSetAbsolutePoint(whichFrame, 4, 0.363, 0.062)
	else
		call DzFrameSetAbsolutePoint(whichFrame, 4, 0.357, 0.067)
	endif
	//很奇怪 这里要反着来才行
	//似乎SimpleFrame都需要先隐藏再显示,然后反着填enable.
	set enable=not enable
	call DzFrameShow(MoveSpeedFrame, enable)
	set MoveSpeedUIVisible=enable
	call DzFrameShow(AttackSpeed1Frame, enable)
	set AttackSpeed1UIVisible=enable
	call DzFrameShow(AttackSpeed2Frame, enable)
	set AttackSpeed2UIVisible=enable
endfunction
//攻击方式1 - 0, 攻击方式2 - 1, 护甲 - 2, 魔法升级 - 3, 食物 - 4
function CreateUnitStateFrame takes nothing returns nothing
 local integer whichFrame
 local integer parentFrame
	set SimpleInfoPanelIconArmor2=DzSimpleFrameFindByName("SimpleInfoPanelIconArmor", 2)
	set MoveSpeedFrame=DzCreateSimpleFrame("SimpleInfoPanelIconMoveSpeed", SimpleInfoPanelIconArmor2, 0)
	set MoveSpeedTextValue=DzSimpleFontStringFindByName("InfoPanelMoveSpeedIconValue", 0)
	set parentFrame=DzSimpleFrameFindByName("SimpleInfoPanelIconDamage", 0)
	set AttackSpeed1Frame=DzCreateSimpleFrame("SimpleInfoPanelIconAttackSpeed", parentFrame, 0)
	set AttackSpeed1TextValue=DzSimpleFontStringFindByName("InfoPanelAttackSpeedIconValue", 0)
	set parentFrame=DzSimpleFrameFindByName("SimpleInfoPanelIconDamage", 1)
	set AttackSpeed2Frame=DzCreateSimpleFrame("SimpleInfoPanelIconAttackSpeed", parentFrame, 1)
	set AttackSpeed2TextValue=DzSimpleFontStringFindByName("InfoPanelAttackSpeedIconValue", 1)
	set whichFrame=DzSimpleTextureFindByName("InfoPanelIconMoveSpeedBackdrop", 0)
	call DzFrameSetSize(whichFrame, 0.02, 0.02)
	call DzFrameSetTexture(whichFrame, "UI\\Widgets\\Console\\Human\\infocard-MoveSpeed.blp", 0)
	set whichFrame=DzSimpleTextureFindByName("InfoPanelIconAttackSpeedBackdrop", 0)
	call DzFrameSetSize(whichFrame, 0.02, 0.02)
	call DzFrameSetTexture(whichFrame, "UI\\Widgets\\Console\\Human\\infocard-AttackSpeed.blp", 0)
	set whichFrame=DzSimpleTextureFindByName("InfoPanelIconAttackSpeedBackdrop", 1)
	call DzFrameSetSize(whichFrame, 0.02, 0.02)
	call DzFrameSetTexture(whichFrame, "UI\\Widgets\\Console\\Human\\infocard-AttackSpeed.blp", 0)
	set whichFrame=DzSimpleTextureFindByName("InfoPanelIconBackdrop", 0)
	call DzFrameSetPoint(AttackSpeed1Frame, 0, whichFrame, 6, - 0.0040, 0)
	set whichFrame=DzSimpleTextureFindByName("InfoPanelIconBackdrop", 1)
	call DzFrameSetPoint(AttackSpeed2Frame, 0, whichFrame, 6, - 0.0040, 0)
	set whichFrame=DzSimpleTextureFindByName("InfoPanelIconBackdrop", 2)
	call DzFrameSetPoint(MoveSpeedFrame, 3, whichFrame, 5, 0.030, - 0.0050)
	// 默认状态中,移动速度被隐藏
	call DzFrameShow(MoveSpeedFrame, false)
	call DzFrameShow(MoveSpeedFrame, true)
	call DzFrameShow(AttackSpeed1Frame, false)
	call DzFrameShow(AttackSpeed1Frame, true)
	call DzFrameShow(AttackSpeed2Frame, false)
	call DzFrameShow(AttackSpeed2Frame, true)
	//默认启用新UI
	call EnableNewUnitStateUI(true)
endfunction
//每帧回调函数 切换选择单位时立即刷新, 否则是30次回调刷新一次
function Update_Callback takes nothing returns nothing
 local unit selectUnit= GetDetectedUnit()
	set UpdateCallbackCount=UpdateCallbackCount + 1
	if LocalPlayerSelectUnit != selectUnit then
		set LocalPlayerSelectUnit=selectUnit
		call UnitStateUpdateCallback()
	elseif UpdateCallbackCount > 30 then
		set UpdateCallbackCount=0
		call UnitStateUpdateCallback()
	endif
	set selectUnit=null
	
endfunction
// scope SetHeroVariable begins
 function SetHeroVariable takes nothing returns nothing
		set StrHeroTypeId[1]='HS01'
		set StrHeroTypeId[2]='HS02'
		set StrHeroTypeId[3]='HS03'
		set StrHeroTypeId[4]='HS04'
	
		set AgiHeroTypeId[1]='HA01'
		set AgiHeroTypeId[2]='HA02'
		
		set IntHeroTypeId[1]='HI01'
		set IntHeroTypeId[2]='HI02'
		set IntHeroTypeId[3]='HI03'
		set IntHeroTypeId[4]='HI04'
		set IntHeroTypeId[5]='HI05'
		set IntHeroTypeId[6]='HI06'
	endfunction
// scope SetHeroVariable ends
function SetInit__GameEndFrame takes nothing returns nothing
	
endfunction
function ClickReturnButton takes nothing returns nothing
	call DzFrameShow(PickHeroBackDrop, false)
	//call DzFrameCageMouse(PickHeroBackDrop, false)
	//
	
	call EnableSelect(true, true)
	call EnableDragSelect(true, true)
	call EnablePreSelect(true, true)
endfunction
function ClickPickHeroButton takes nothing returns nothing
	call DzFrameShow(PickHeroBackDrop, true)
	//call DzFrameCageMouse(PickHeroBackDrop, true)
	
	call EnableSelect(false, false)
	call EnableDragSelect(false, false)
	call EnablePreSelect(false, false)
endfunction
function DisableHeroUI takes integer frameId,boolean enable returns nothing
 local string artPath= GetUnitSlkData(AllHeroTypeId[frameId] , "Art")
	set artPath="ReplaceableTextures\\CommandButtonsDisabled\\DIS" + SubString(artPath, 35, StringLength(artPath))
	call DzFrameSetTexture(HeroBackDrop[frameId], artPath, 0)
	set HeroIsSelected[frameId]=true
endfunction
function InitHeroTriggerById takes unit whichUnit returns nothing
 local integer typeId= GetUnitTypeId(whichUnit)
	if typeId == 'HI04' then
		call LolitaComplex(whichUnit)
	elseif typeId == 'HA02' then
		call DeterminedExterminator(whichUnit)
		call EnabledAttackEffect(2 , 0)
	elseif typeId == 'HI06' then
		call CreateTaxStealerGoldBarUI(whichUnit)
	endif
endfunction
function PickHeroSync takes nothing returns boolean
 local string syncData= DzGetTriggerSyncData()
 local player syncPlayer= DzGetTriggerSyncPlayer()
 local integer syncPlayerId= GetPlayerId(syncPlayer)
 local integer frameId= S2I(syncData)
 local integer residueDegree
 local unit newHero
	if HeroIsSelected[frameId] or PlayerHeroAmount[syncPlayerId] == PlayerMaxHeroAmount then
		return false
	endif
	if AllHeroTypeId[frameId] > 0 then
		set newHero=CreateUnit(syncPlayer, AllHeroTypeId[frameId], - 24940.0, - 25225.7, 89.893)
		if LocalPlayer == syncPlayer then
			call SelectUnit(newHero, true)
		endif
		call InitHeroTriggerById(newHero)
		set PlayerHeroUnit[GetUnitPointValue(newHero)]=newHero
		set newHero=null
	endif
	call DisableHeroUI(frameId , true)
	set PlayerHeroAmount[syncPlayerId]=PlayerHeroAmount[syncPlayerId] + 1
	set residueDegree=PlayerMaxHeroAmount - PlayerHeroAmount[syncPlayerId]
	if ( residueDegree ) > 0 then
		call DisplayTextToPlayer(syncPlayer, 0, 0, "你还能选择" + I2S(residueDegree) + "个英雄")
	endif
	set syncPlayer=null
	return false
endfunction
function ClickHeroButton takes nothing returns nothing
 local integer trigFrame= DzGetTriggerUIEventFrame()
 local integer trigPlayerId= GetPlayerId(DzGetTriggerUIEventPlayer())
 local integer i= 0
	if PlayerHeroAmount[trigPlayerId] == PlayerMaxHeroAmount then
		return
	endif
	loop
		exitwhen trigFrame == HeroButton[i]
		set i=i + 1
	endloop
	//call Debug("log", "Click" + I2S(i) + " "+ GetObjectName(HeroTypeId[i]))
	if not HeroIsSelected[i] then
		call DzSyncData("PickHero", I2S(i))
	endif
endfunction
function CreatePickHeroButton takes integer attributeId,integer frameId,integer heroTypeId,real x,real y returns nothing
 local real frameX= x + 0.05 * attributeId
 local real frameY= y
 local string heroArt= GetUnitSlkData(heroTypeId , "Art")
 local string tip= GetUnitSlkData(heroTypeId , "Tip")
 local string ubertip= GetUnitSlkData(heroTypeId , "UberTip")
	if heroArt == null then
		call Debug("log" , "error, HeroArt=null id:" + I2S(attributeId))
	endif
	call Debug("log" , "frameId=" + I2S(frameId))
	if frameId == 7 then
		//搞不明白为什么第八个创建的button设置ToolTip会失败
		//如果这里不删除新建一个Button,这个新建的Button在SetToolTIp时会导致游戏崩溃
		call DzDestroyFrame(DzCreateFrameByTagName("GLUETEXTBUTTON", null, PickHeroBackDrop, null, 0))
	elseif frameId == 8 then
		//搞不明白为什么第八个创建的button设置ToolTip会失败
		//如果这里不删除新建一个Button,这个新建的Button在SetToolTIp时会导致游戏崩溃
		call DzDestroyFrame(DzCreateFrameByTagName("BUTTON", null, PickHeroBackDrop, null, 0))
	endif
	set AllHeroTypeId[frameId]=heroTypeId
	set HeroBackDrop[frameId]=DzCreateFrameByTagName("BACKDROP", null, PickHeroBackDrop, null, 0)
	call DzFrameSetTexture(HeroBackDrop[frameId], heroArt, 0)
	call DzFrameSetAbsolutePoint(HeroBackDrop[frameId], 4, frameX, frameY)
	call DzFrameSetSize(HeroBackDrop[frameId], 0.038, 0.038)
	set HeroButton[frameId]=DzCreateFrameByTagName("BUTTON", null, HeroBackDrop[frameId], null, 0)
	call DzFrameSetScriptByCode(HeroButton[frameId], 1, function ClickHeroButton, false)
	call DzFrameSetAbsolutePoint(HeroButton[frameId], 4, frameX, frameY)
	call DzFrameSetSize(HeroButton[frameId], 0.038, 0.038)
	call CreateFrameTooltip(HeroButton[frameId] , tip , ubertip)
endfunction
function InitPickHerosUI takes nothing returns nothing
 local real frameX
 local real frameY
 local integer attributeId= 1
 local integer heroCount= 1
 local trigger syncTrig= CreateTrigger()
	call DzTriggerRegisterSyncData(syncTrig, "PickHero", false)
	call TriggerAddCondition(syncTrig, Condition(function PickHeroSync))
	
	set PickHeroBackDrop=DzCreateFrameByTagName("BACKDROP", null, GameUI, "EscMenuBackdrop", 0)
	call DzFrameSetPoint(PickHeroBackDrop, 4, GameUI, 4, 0, 0.06)
	call DzFrameSetSize(PickHeroBackDrop, 0.58, 0.384)
	call DzFrameShow(PickHeroBackDrop, false)
	set PickHeroReturnFrame=DzCreateFrame("PuckHeroReturnButtonFrame", PickHeroBackDrop, 0)
	call DzFrameShow(PickHeroReturnFrame, false)
	call DzFrameShow(PickHeroReturnFrame, true)
	call DzFrameSetScriptByCode(DzFrameFindByName("PuckHeroReturnGlueTextButton", 0), 1, function ClickReturnButton, false)
	call DzFrameSetAbsolutePoint(PickHeroReturnFrame, 4, 0.42, 0.15)
	set frameX=0.14
	set frameY=0.47
	loop
		exitwhen StrHeroTypeId[attributeId] == 0
		call CreatePickHeroButton(attributeId , heroCount , StrHeroTypeId[attributeId] , frameX , frameY)
		set attributeId=attributeId + 1
		set heroCount=attributeId
	endloop
	set frameX=0.14
	set frameY=0.37
	set attributeId=1
	loop
		exitwhen AgiHeroTypeId[attributeId] == 0
		call CreatePickHeroButton(attributeId , heroCount , AgiHeroTypeId[attributeId] , frameX , frameY)
		set attributeId=attributeId + 1
		set heroCount=heroCount + 1
	endloop
	set frameX=0.14
	set frameY=0.27
	set attributeId=1
	loop
		exitwhen IntHeroTypeId[attributeId] == 0
		call CreatePickHeroButton(attributeId , heroCount , IntHeroTypeId[attributeId] , frameX , frameY)
		set attributeId=attributeId + 1
		set heroCount=heroCount + 1
	endloop
	set PickHeroFrame=DzCreateSimpleFrame("PickHeroButtonTemplate", DzSimpleFrameFindByName("SimpleInfoPanelIconFood", 4), 0)
	call DzFrameSetAbsolutePoint(PickHeroFrame, 4, 0.42, 0.15)
	call DzFrameShow(PickHeroFrame, false)
	call DzFrameShow(PickHeroFrame, true)
	call DzFrameSetSize(PickHeroFrame, 0.13, 0.035)
	call DzFrameSetScriptByCode(PickHeroFrame, 1, function ClickPickHeroButton, false)
endfunction
function InitUIFrame takes nothing returns boolean
 local integer i= 0
 local integer da
 local integer db
	call DzLoadToc("UI\\path.toc")
	set GameUI=DzGetGameUI()
	set ConsoleUI=DzSimpleFrameFindByName("ConsoleUI", 0)
	
	//禁用资源栏
	//loop
	//	call DzFrameShow(DzFrameFindByName("AllyCheckBox", i), false)
	//	call DzFrameShow(DzFrameFindByName("VisionCheckBox", i), false)
	//	call DzFrameShow(DzFrameFindByName("UnitsCheckBox", i), false)
	//	call DzFrameShow(DzFrameFindByName("GoldBackdrop", i), false)
	//	call DzFrameShow(DzFrameFindByName("LumberBackdrop", i), false)
	//	exitwhen i == 6
	//	set i = i + 1
	//endloop
	//call DzFrameSetText(DzSimpleFontStringFindByName("ResourceBarGoldText", 0), "吼啊")
	call DzFrameSetEnable(DzFrameFindByName("SaveGameButton", 0), false)
	call DzFrameSetEnable(DzFrameFindByName("SaveGameSaveButton", 0), false)
	call DzFrameShow(DzFrameFindByName("SaveGameSaveButton", 0), false)
	call DzFrameSetEnable(DzFrameFindByName("OverwriteOverwriteButton", 0), false)
	call DzFrameSetEnable(DzFrameFindByName("SaveGameFileEditBox", 0), false)
	call DzFrameShow(DzFrameFindByName("SaveGameFileEditBox", 0), false)
        
	call DzFrameSetEnable(DzFrameFindByName("LoadGameButton", 0), false)
	call DzFrameSetEnable(DzFrameFindByName("LoadGameLoadButton", 0), false)
	call DzFrameShow(DzFrameFindByName("LoadGameLoadButton", 0), false)
	call DzFrameSetEnable(DzFrameFindByName("DecoratedMapListBox", 0), false)
        
	//call DzFrameSetEnable(DzFrameFindByName("TipsButton", 0), false)
	//call DzFrameShow(DzFrameFindByName("TipsButton", 0), false)
	//call DzFrameSetEnable(DzFrameFindByName("HelpButton", 0), false)
	//call DzFrameShow(DzFrameFindByName("HelpButton", 0), false)
	//call DzFrameSetEnable(DzFrameFindByName("RestartButton", 0), false)
	//call DzFrameShow(DzFrameFindByName("RestartButton", 0), false)
	//call DzFrameSetAbsolutePoint(DzFrameGetCommandBarButton(0, 3), 4, - 0.8, - 0.6)
	//call DzFrameSetAbsolutePoint(DzFrameGetCommandBarButton(0, 2), 4, - 0.8, - 0.6)
	//call DzFrameSetAbsolutePoint(DzFrameGetCommandBarButton(0, 1), 4, - 0.8, - 0.6)
	//call DzFrameSetAbsolutePoint(DzFrameGetCommandBarButton(0, 0), 4, - 0.8, - 0.6)
	//call DzFrameSetAbsolutePoint(DzFrameGetCommandBarButton(1, 0), 4, - 0.8, - 0.6)
	call InitPickHerosUI()
	//额外的单位属性UI 攻击间隔，移动速度。
	call CreateUnitStateFrame()
	call DzFrameSetUpdateCallbackByCode(function Update_Callback)
	call DzFrameSetScriptByCode(DzFrameFindByName("QuitButton", 0), 1, function SetInit__GameEndFrame, false)
	call ClearTrigger(GetTriggeringTrigger())
	return false
endfunction
// 获取鼠标在游戏内的坐标X

// 获取鼠标在游戏内的坐标Y

// 获取鼠标在游戏内的坐标Z

// 鼠标是否在游戏内

// 获取鼠标屏幕坐标X

// 获取鼠标屏幕坐标Y

// 获取鼠标游戏窗口坐标X

// 获取鼠标游戏窗口坐标Y

// 设置鼠标位置

// 注册鼠标点击触发（sync为true时，调用TriggerExecute。为false时，直接运行action函数，可以异步不掉线，action里不要有同步操作）

// 注册鼠标点击触发（sync为true时，调用TriggerExecute。为false时，直接运行action函数，可以异步不掉线，action里不要有同步操作）

// 注册键盘点击触发

// 注册键盘点击触发

// 注册鼠标滚轮触发

// 注册鼠标滚轮触发

// 注册鼠标移动触发

// 注册鼠标移动触发

// 获取触发器的按键码

// 获取滚轮delta

// 判断按键是否按下

// 获取触发key的玩家

// 获取war3窗口宽度

// 获取war3窗口高度

// 获取war3窗口X坐标

// 获取war3窗口Y坐标

// 注册war3窗口大小变化事件

// 注册war3窗口大小变化事件

// 判断窗口是否激活

// 设置可摧毁物位置

// 设置单位位置-本地调用

// 异步执行函数

// 取鼠标指向的单位

// 设置单位的贴图

//  设置内存数值

//  替换单位类型 [BZAPI]

//  替换单位模型 [BZAPI]

//  原生 - 设置小地图背景贴图

// 注册数据同步触发器

// 同步游戏数据

// 获取同步的数据

// 获取同步数据的玩家

// 隐藏界面元素

// 修改游戏世界窗口位置

// 头像

// 小地图

// 技能按钮

// 英雄按钮

// 英雄血条

// 英雄蓝条

// 道具按钮

// 小地图按钮

// 左上菜单按钮

// 鼠标提示

// 聊天信息

// 单位信息

// 获取最上的信息

// 取rgba色值

// 设置界面更新回调（非同步）

// 界面更新回调

// 显示/隐藏窗体

// 创建窗体

// 创建简单的窗体

// 销毁窗体

// 加载内容目录 (Toc table of contents)

// 设置窗体相对位置 [0:左上|1:上|2:右上|3:左|4:中|5:右|6:左下|7:下|8:右下]

// 设置窗体绝对位置

// 清空窗体锚点

// 设置窗体禁用/启用

// 注册用户界面事件回调

//  注册UI事件回调(func handle)

// 获取触发用户界面事件的玩家

// 获取触发用户界面事件的窗体

// 通过名称查找窗体

// 通过名称查找普通窗体

// 查找字符串

// 查找BACKDROP frame

// 获取游戏用户界面

// 点击窗体

// 自定义屏幕比例

// 使用宽屏模式

// 设置文字（支持EditBox, TextFrame, TextArea, SimpleFontString、GlueEditBoxWar3、SlashChatBox、TimerTextFrame、TextButtonFrame、GlueTextButton）

// 获取文字（支持EditBox, TextFrame, TextArea, SimpleFontString）

// 设置字数限制（支持EditBox）

// 获取字数限制（支持EditBox）

// 设置文字颜色（支持TextFrame, EditBox）

// 获取鼠标所在位置的用户界面控件指针

// 设置所有锚点到目标窗体上

// 设置焦点

// 设置模型（支持Sprite、Model、StatusBar）

// 获取控件是否启用

// 设置透明度（0-255）

// 获取透明度（0-255）

// 设置动画

// 设置动画进度（autocast为false是可用）

// 设置texture（支持Backdrop、SimpleStatusBar）

// 设置缩放

// 设置提示

// 鼠标限制在用户界面内

// 获取当前值（支持Slider、SimpleStatusBar、StatusBar）

// 设置最大最小值（支持Slider、SimpleStatusBar、StatusBar）

// 设置Step值（支持Slider）

// 设置当前值（支持Slider、SimpleStatusBar、StatusBar）

// 设置窗体大小

// 根据tag创建窗体

// 设置颜色（支持SimpleStatusBar）

// 不明觉厉

//  设置优先级 [NEW]

//  设置父窗口 [NEW]

//  设置字体 [NEW]

//  获取 Frame 的 高度 [NEW]

//  设置对齐方式 [NEW]

//  获取 Frame 的 Parent [NEW]

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
//***************************************************************************
//*
//*  Sounds
//*
//***************************************************************************
//***************************************************************************
//*
//*  Items
//*
//***************************************************************************

//***************************************************************************
//*
//*  Unit Creation
//*
//***************************************************************************//===========================================================================

//***************************************************************************
//*
//*  Quest
//*
//***************************************************************************

//***************************************************************************
//*
//*  Regions
//*
//***************************************************************************

//***************************************************************************
//*
//*  Cameras
//*
//***************************************************************************

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
	set value=GetUnitLifestealValue(Tmp_DamageSource)
	if value == 0. then
		return
	endif
	if not IsUnitIllusion(Tmp_DamageSource) and not IsUnitIllusion(Tmp_DamageInjured) then
		call UnitRestoreLife(Tmp_DamageSource , Tmp_DamageValue * value)
	endif
	call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Undead\\VampiricAura\\VampiricAuraTarget.mdl", Tmp_DamageSource, "origin"))
endfunction
//使得单位本次攻击 暴击
function SetUnitCriticalStrike takes real c,boolean isAttackTarget returns nothing
	set Tmp_DamageValue=Tmp_DamageValue + Tmp_DamageValue * c //设置这个全局值为暴击后的伤害
call EXSetEventDamage(Tmp_DamageValue) //设置伤害值
if isAttackTarget then
		call CriticalStrikeTextTag(Tmp_DamageSource , Tmp_DamageValue)
	endif
endfunction
//任意单位受伤动作
function TraversalDamagedEvent takes integer id returns nothing
 local integer i= id * 200
	loop //遍历其他攻击特效
exitwhen i >= DamageEventNumber[id]
		if DamageEventQueue[i] != null and IsTriggerEnabled(DamageEventQueue[i]) then
			call TriggerEvaluate(DamageEventQueue[i])
		endif
		set i=i + 1
	endloop
endfunction
//
function DamageReduction takes nothing returns nothing
 local integer level
	if EffectIsEnabled[3] then
		set level=GetUnitAbilityLevel(Tmp_DamageInjured, 'Acs3')
		if level > 0 then
			if IsPointBlighted(GetUnitX(Tmp_DamageInjured), GetUnitY(Tmp_DamageInjured)) then
				//call Debug("log", "减少"+R2S( Tmp_DamageValue * 0.05 * level))
				set Tmp_DamageValue=Tmp_DamageValue - Tmp_DamageValue * 0.05 * level
				call EXSetEventDamage(Tmp_DamageValue) //设置伤害值
endif
		endif
	endif
endfunction
function YDWEAnyUnitDamagedTriggerAction takes nothing returns boolean
 local integer i
 local real c
 local boolean isAttackTarget
	set Tmp_DamageValue=GetEventDamage() //伤害值
if Tmp_DamageValue > 0 then
		set Tmp_DamageSource=GetEventDamageSource() //伤害来源
set Tmp_DamageInjured=GetTriggerUnit() //受伤单位
set i=GetHandleId(Tmp_DamageSource)
		//伤害减免
		call DamageReduction()
		if EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_ATTACK) != 0 then //如果是物理伤害则运行此部分
//伤害减免后运行暴击
set isAttackTarget=LoadUnitHandle(UnitKeyBuff, i, AttackTarget) == Tmp_DamageInjured
			set c=LoadReal(UnitKeyBuff, i, CriticalStrikeDamage)
			if c != .0 then
				call SetUnitCriticalStrike(c , isAttackTarget) //先一步把暴击运行了 因为这会改变伤害值
			endif
			// 这里是判断一下该单位是否是普通攻击的目标(排除溅射伤害)
			if isAttackTarget then
				if CommonAttackEffectFilter(Tmp_DamageSource , Tmp_DamageInjured) then
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
function damageevent_EnchantEquipment takes nothing returns nothing
 local integer addedDamage
 local integer buffLevel
	if true then //GetUnitBuff(Tmp_DamageSource, 'Blc2') != 0 then
		set buffLevel=0 //GetUnitBuffLevel(Tmp_DamageSource, 'Blc2') 
		set addedDamage=buffLevel * 5 + 20
		call CommonTextTag("+" + I2S(addedDamage) , 5 , Tmp_DamageSource , .024 , 100 , 200 , 255 , 255 , 64)
		call DamageUnit(Tmp_DamageSource , Tmp_DamageInjured , 1 , addedDamage)
	endif
endfunction
//注册零重2技能的伤害触发
function EnchantEquipment_Learn1 takes nothing returns nothing
 local trigger t= CreateTrigger()
	call TriggerAddCondition(t, Condition(function damageevent_EnchantEquipment))
	call TriggerRegisterAnyUnitDamagedEvent(t , 1) //

	set t=null
endfunction
function CriticalStrikeAura_Learn1 takes nothing returns nothing
	call EnabledAttackEffect(1 , 0.) //永久激活
endfunction
//防御光环选取条件
function defense_aura_filter takes nothing returns boolean
	//call Debug("log", "filter" + GetUnitName(GetFilterUnit()))
	return Ally_Alive_NoStructure(GetFilterUnit())
endfunction
//光环类型
//共存模式 取最高值
function defense_aura_actions takes nothing returns boolean
 local trigger t= GetTriggeringTrigger()
 local integer h= GetHandleId(t)
 local integer firstUnitH
 local unit sourceUnit= LoadUnitHandle(HT, h, 200)
 local real value= LoadReal(HT, h, 200)
 local real maxValue= 0.
 local integer iBuff
 local integer buffCount
 local unit firstUnit= null
 local group g1= null
 local group g2= null
 local group g3= LoadGroupHandle(HT, h, 201)
 local integer buffId= LoadInteger(HT, h, 202)
 local integer level= GetUnitAbilityLevel(sourceUnit, LoadInteger(HT, h, 203))
	if not UnitAlive(sourceUnit) then
		call Debug("log" , "ClearTrigger")
		call FlushChildHashtable(HT, h)
		call ClearTrigger(t)
		loop
			set firstUnit=FirstOfGroup(g3)
			exitwhen firstUnit == null
			call GroupRemoveUnit(g3, firstUnit)
			call UnitReduceArmorBonus(firstUnit , value)
		endloop
		call LogoutGroup(g3)
	else
		set g1=LoginGroup()
		set P2=GetOwningPlayer(sourceUnit) //Real 201为光环范围
call GroupEnumUnitsInRange(g1, GetUnitX(sourceUnit), GetUnitY(sourceUnit), LoadReal(HT, h, 201), LoadBooleanExprHandle(HT, h, 205))
		set g2=LoginGroup()
		call GroupAddGroup(g3, g2)
		loop
			set firstUnit=FirstOfGroup(g2)
			exitwhen firstUnit == null
			if not IsUnitInGroup(firstUnit, g1) then
				set firstUnitH=GetHandleId(firstUnit)
				set iBuff=0 //GetUnitBuff(firstUnit, buffId)
				set maxValue=0 //GetBuffMaxData(iBuff, 1)
				//call UnitRemoveBuffByCount(firstUnit, buffId, LoadInteger(HT, h, firstUnitH))
				//删之前查buff 有没有次一级的buff
				if value == maxValue then
					set maxValue=0 //GetBuffMaxData(iBuff, 1)
					set value=value - maxValue
					call UnitReduceArmorBonus(firstUnit , value)
				endif
				call GroupRemoveUnit(g3, firstUnit)
			endif
			call GroupRemoveUnit(g2, firstUnit)
		endloop
		call LogoutGroup(g2)
		loop
			set firstUnit=FirstOfGroup(g1)
			exitwhen firstUnit == null
			if not IsUnitInGroup(firstUnit, g3) then
				//set BuffDataA = value
				set iBuff=0 //GetUnitBuff(firstUnit, buffId)
				set maxValue=0 //GetBuffMaxData(iBuff, 1)
				set buffCount=0 //EXUnitAddAbilityTimed(firstUnit, buffId, BuffAddType_Positive + BuffAddType_Aura, level)
				set firstUnitH=GetHandleId(firstUnit)
				if iBuff == 0 then
					set iBuff=0 //GetUnitBuff(firstUnit, buffId)
				endif
				call SaveInteger(HT, h, firstUnitH, buffCount)
				if value > maxValue then
					call UnitAddArmorBonus(firstUnit , value - maxValue)
				endif
			endif
			call GroupRemoveUnit(g1, firstUnit)
			call GroupAddUnit(g3, firstUnit)
		endloop
		call LogoutGroup(g1)
	endif
	set t=null
	set sourceUnit=null
	set firstUnit=null
	set g1=null
	set g2=null
	set g3=null
	return false
endfunction
//防御光环
function DefenseAura takes unit whichUnit,real value,real range,integer abilityId,integer buffId,code filter returns nothing
 local trigger trig= CreateTrigger()
 local integer h= GetHandleId(trig)
	call TriggerRegisterTimerEvent(trig, AuraFrame, true)
	call TriggerAddCondition(trig, Condition(function defense_aura_actions))
	call SaveBooleanExprHandle(HT, h, 205, Condition(filter))
	call SaveReal(HT, h, 200, value)
	call SaveReal(HT, h, 201, range)
	call SaveInteger(HT, h, 202, buffId)
	call SaveInteger(HT, h, 203, abilityId)
	call SaveUnitHandle(HT, h, 200, whichUnit)
	call SaveGroupHandle(HT, h, 201, LoginGroup())
	set trig=null
endfunction
//光环类型
//独立,暂时不考虑叠加,仅用作生命之泉的百分比回血
function restore_aura_actions takes nothing returns boolean
 local trigger t= GetTriggeringTrigger()
 local integer h= GetHandleId(t)
 local integer firstUnitH
 local unit sourceUnit= LoadUnitHandle(HT, h, 200)
 local real value= LoadReal(HT, h, 200)
 local real oldRestoreLife
 local real restoreLife
 local unit firstUnit= null
 local group g1= null
 local group g2= null
 local group g3= LoadGroupHandle(HT, h, 201)
 local integer buffId= LoadInteger(HT, h, 202)
	if not UnitAlive(sourceUnit) then
		call Debug("log" , "ClearTrigger")
		call FlushChildHashtable(HT, h)
		call ClearTrigger(t)
		call UnitRemoveAbility(sourceUnit, LoadInteger(HT, h, 203))
		loop
			set firstUnit=FirstOfGroup(g3)
			exitwhen firstUnit == null
			call GroupRemoveUnit(g3, firstUnit)
			call UnitRemoveAbility(firstUnit, buffId)
			call UnitReduceLifeRestore(firstUnit , value)
		endloop
		call LogoutGroup(g3)
	else
		set g1=LoginGroup()
		set P2=GetOwningPlayer(sourceUnit) //Real 201为光环范围
call GroupEnumUnitsInRange(g1, GetUnitX(sourceUnit), GetUnitY(sourceUnit), LoadReal(HT, h, 201), LoadBooleanExprHandle(HT, h, 205))
		set g2=LoginGroup()
		call GroupAddGroup(g3, g2)
		loop
			set firstUnit=FirstOfGroup(g2)
			exitwhen firstUnit == null
			if not IsUnitInGroup(firstUnit, g1) then
				set firstUnitH=GetHandleId(firstUnit)
				set oldRestoreLife=LoadReal(HT, h, firstUnitH)
				call UnitReduceLifeRestore(firstUnit , oldRestoreLife)
				call RemoveSavedReal(HT, h, firstUnitH)
				call UnitRemoveAbility(firstUnit, buffId)
				call GroupRemoveUnit(g3, firstUnit)
				//call Debug("log", "4减少" + R2S(oldRestoreLife))
			endif
			call GroupRemoveUnit(g2, firstUnit)
		endloop
		call LogoutGroup(g2)
		loop
			set firstUnit=FirstOfGroup(g1)
			exitwhen firstUnit == null
			set firstUnitH=GetHandleId(firstUnit)
			set restoreLife=GetUnitState(firstUnit, UNIT_STATE_MAX_LIFE) * value
			if IsUnitInGroup(firstUnit, g3) then
				set oldRestoreLife=LoadReal(HT, h, firstUnitH)
	
				if restoreLife > oldRestoreLife then
					call SaveReal(HT, h, firstUnitH, restoreLife)
					//call Debug("log", "2添加" + R2S(restoreLife - oldRestoreLife))
					set restoreLife=restoreLife - oldRestoreLife
					call UnitAddLifeRestore(firstUnit , restoreLife)
				elseif oldRestoreLife > restoreLife then
					call SaveReal(HT, h, firstUnitH, restoreLife)
					//call Debug("log", "3减少" + R2S(oldRestoreLife - restoreLife))
					set restoreLife=oldRestoreLife - restoreLife
					call UnitReduceLifeRestore(firstUnit , restoreLife)
				endif
			else
				call UnitAddLifeRestore(firstUnit , restoreLife)
				call SaveReal(HT, h, firstUnitH, restoreLife)
				//call Debug("log", "1添加" + R2S(restoreLife))
			endif
			call GroupRemoveUnit(g1, firstUnit)
			call GroupAddUnit(g3, firstUnit)
		endloop
		call LogoutGroup(g1)
	endif
	set t=null
	set sourceUnit=null
	set firstUnit=null
	set g1=null
	set g2=null
	set g3=null
	return false
endfunction
//百分比 回复光环
function PercentRestoreAura takes unit whichUnit,real value,real range,integer abilityId,integer buffId,code filter returns nothing
 local integer h= CreateTimerEventTrigger(AuraFrame , true , function restore_aura_actions)
	call SaveBooleanExprHandle(HT, h, 205, Condition(filter))
	call SaveReal(HT, h, 200, value)
	call SaveReal(HT, h, 201, range)
	call SaveInteger(HT, h, 202, buffId)
	call SaveInteger(HT, h, 203, abilityId)
	call SaveUnitHandle(HT, h, 200, whichUnit)
	call SaveGroupHandle(HT, h, 201, LoginGroup())
endfunction
//任意单位腐烂
function UnitDecayEvnetActions takes nothing returns boolean
 local unit decayUnit= GetDecayingUnit()
	set decayUnit=null
	return false
endfunction
function InitBoss takes nothing returns nothing
 local trigger trig= CreateTrigger()
 local integer iHandleId= GetHandleId(trig)
 local unit whichBoss
	
	//屠夫 9级
	set whichBoss=CreateUnit(Player(9), 'U001', - 13853.3, - 27003.7, 89.893)
	call SetHeroLevel(whichBoss, 9, false)
	call TriggerRegisterUnitInRange(trig, whichBoss, 600, null)
	call TriggerAddCondition(trig, Condition(function StartPedugAI))
	call SaveUnitHandle(HT, iHandleId, 0, whichBoss)
	//死灵法师 10级
	set whichBoss=CreateUnit(Player(9), 'U002', - 8341.3, - 18597.8, 165.143)
	call SetHeroLevel(whichBoss, 10, false)
	set whichBoss=null
	set trig=null
endfunction
//***************************************************************************
//*
//*  Main Initialization
//*
//***************************************************************************
//===========================================================================
function funcTestSpeed takes nothing returns nothing
 local integer i= 0
	loop
		exitwhen i == 1000
		call GetDetectedUnit()
		set i=i + 1
	endloop
endfunction
function TestEsc takes nothing returns boolean
 local integer i= 0
 local real time
	call ClearTextMessages()
	if false then
		set time=S2R(EXExecuteScript("os.clock()"))
		loop
			exitwhen i == 100
			call ExecuteFunc("funcTestSpeed")
			set i=i + 1
		endloop
		//call ClearTextMessages()
		call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, "运行时间" + R2S(S2R(EXExecuteScript("os.clock()")) - time))
		call BJDebugMsg(R2S(GetUnitState(LocalPlayerSelectUnit, UNIT_STATE_RATE_OF_FIRE)))
	endif
	//call GetLocalizedHotkey("yd_leak_monitor::create_report")
	//call EnableNewUnitStateUI(not NewUnitStateUIIsEnable)
	return false
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

//Struct method generated initializers/callers:
//***************************************************************************
//*
//*  Triggers
//*
//***************************************************************************
//===========================================================================
// Trigger: Intro Start
//
// 
// // 没有事件 大概是在J文件里面初始化调用此触发器
// // 等待一律用玩家时间(因为单机测试如果SleepActions同时暂停游戏了就傻x了)
// 马甲单位都在j脚本被特殊处理 即进入地图就有生命倒计时 所以无需在触发器中清理
// 黄色区域为单位头部朝向点的区域
// 红色区域为单位出生的区域
//     call SetUnitLookAt(udg_OgreMagi, "bone_head01", udg_TempArryUnit[1], 0, 0, 90)
//===========================================================================
function Trig_Intro_StartActions takes nothing returns nothing
    set udg_InCinematic=true
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEOUT, 0.00, "ReplaceableTextures\\CameraMasks\\White_mask.blp", 0, 0, 0, 0)
    call SetSkyModel("Environment\\Sky\\LordaeronSummerSky\\LordaeronSummerSky.mdl")
    call UseTimeOfDayBJ(false)
    call SetTerrainFogExBJ(0, 950.00, 3500.00, 0, 45.00, 50.00, 45.00)
    call CinematicModeBJ(true, GetPlayersAll())
    call VolumeGroupResetBJ()
    call TriggerExecute(gg_trg_Init_IntroCine)
    call CameraSetupApplyForceDuration(gg_cam_Intro__OrgeInitialPoint, true, 0)
    call YDWEPolledWaitNull(1.00)
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 2.00, "ReplaceableTextures\\CameraMasks\\White_mask.blp", 0, 0, 0, 0)
    call ExecuteFunc("InitTrig_Intro_Skipped_Orig")
    // 允许跳过电影
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call SetDestructableAnimation(udg_IntroCinePortal, "Birth")
    call SetSoundVolumeBJ(gg_snd_ShimmeringPortalBirth, 80.00)
    call PlaySoundBJ(gg_snd_ShimmeringPortalBirth)
    call CameraSetupApplyForceDuration(gg_cam_Intro__PortalCloseUp, true, 13.00)
    call YDWEPolledWaitNull(6.80)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call PlaySoundBJ(gg_snd_CityScapeMagicRunesLoop1)
    call YDWEPolledWaitNull(0.50)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call PlaySoundAtPointBJ(gg_snd_ShimmeringPortalEntrance, 100, GetRectCenter(gg_rct_Intro__OrgeBirth1), 480.00)
    call YDWEPolledWaitNull(0.50)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    // 菊花坠落
    call ShowUnit(udg_OgreMagi, true)
    call SetUnitFlyHeight(udg_OgreMagi, GetUnitDefaultFlyHeight(udg_OgreMagi), 1500.00)
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_OgreMagi, GetUnitName(udg_OgreMagi), null, "妮玛哟！妮玛哟！！", bj_TIMETYPE_SET, 4.00, false)
    call YDWEPolledWaitNull(0.30)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    // 砸出个坑
    call TerrainDeformationCraterBJ(0.25, true, GetUnitLoc(udg_OgreMagi), 256.00, 32.00)
    call DestroyEffect(AddSpecialEffectLoc("Abilities\\Spells\\Orc\\WarStomp\\WarStompCaster.mdl", GetUnitLoc(udg_OgreMagi)))
    call YDWEPolledWaitNull(2.00)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call KillDestructable(udg_IntroCinePortal)
    call StopSoundBJ(gg_snd_CityScapeMagicRunesLoop1, true)
    call PlaySoundBJ(gg_snd_ShimmeringPortalDeath)
    call YDWEPolledWaitNull(2.00)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call CameraSetupApplyForceDuration(gg_cam_Intro__OrgeCloseUp, true, 8.00)
    // 起身 左看看右看看然后再前进
    call SetUnitAnimation(udg_OgreMagi, "birth")
    call QueueUnitAnimation(udg_OgreMagi, "stand")
    set udg_TempArryUnit[1]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'ndum', GetRectCenterX(gg_rct_Intro__OrgeLookPos1), GetRectCenterY(gg_rct_Intro__OrgeLookPos1), 0)
    set udg_TempArryUnit[2]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'ndum', GetRectCenterX(gg_rct_Intro__OrgeLookPos2), GetRectCenterY(gg_rct_Intro__OrgeLookPos2), 0)
    // 略坑啊 蓝胖左边的头竟没节点 要改模型
    call SetUnitLookAt(udg_OgreMagi, "bone_head", udg_TempArryUnit[1], 0, 0, 90)
    call YDWEPolledWaitNull(0.50)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call SetUnitLookAt(udg_OgreMagi, "Left Head", udg_TempArryUnit[2], 0, 0, 90)
    call YDWEPolledWaitNull(1.00)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call ResetUnitLookAt(udg_OgreMagi)
    call YDWEPolledWaitNull(1.50)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call IssuePointOrderLoc(udg_OgreMagi, "move", GetRectCenter(gg_rct_Intro__OrgeMove1))
    call YDWEPolledWaitNull(1.00)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_OgreMagi, GetUnitName(udg_OgreMagi), null, "哦.....这是什么地方，我感受到了一股熟悉的力量。", bj_TIMETYPE_SET, 5.00, false)
    call YDWEPolledWaitNull(3.00)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call IssuePointOrderLoc(udg_Kael, "move", GetRectCenter(gg_rct_Intro__KaelMove1))
    call YDWEPolledWaitNull(1.00)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call CameraSetupApplyForceDuration(gg_cam_Intro__Talk1, true, 0.00)
    call CameraSetupApplyForceDuration(gg_cam_Intro__Talk2, true, 11.00)
    call YDWEPolledWaitNull(1.00)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call YDWESetUnitFacingToFaceUnitTimedNull(udg_OgreMagi , udg_Kael , 1.00)
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_Kael, GetUnitName(udg_Kael), null, "菊花？你怎么在这里。", bj_TIMETYPE_SET, 4.00, false)
    call YDWEPolledWaitNull(4.00)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_OgreMagi, GetUnitName(udg_OgreMagi), null, "我刚刚打败了一个非常阴暗的存在，就来到了这里。这是哪里？", bj_TIMETYPE_SET, 5.50, false)
    call YDWEPolledWaitNull(5.00)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEOUT, 0.50, "ReplaceableTextures\\CameraMasks\\White_mask.blp", 0, 0, 0, 0)
    call YDWEPolledWaitNull(0.50)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 0.50, "ReplaceableTextures\\CameraMasks\\White_mask.blp", 0, 0, 0, 0)
    call SetUnitPositionLoc(udg_Kael, GetRectCenter(gg_rct_Intro__KaelBirth2))
    call SetUnitPositionLoc(udg_OgreMagi, GetRectCenter(gg_rct_Intro__OrgeBirth2))
    call YDWESetUnitFacingToFaceUnitTimedNull(udg_Kael , udg_OgreMagi , 0)
    call YDWESetUnitFacingToFaceUnitTimedNull(udg_OgreMagi , udg_Kael , 0)
    call IssueTargetOrder(gg_unit_nhew_0025, "harvest", gg_dest_ZTtw_1356)
    call CameraSetupApplyForceDuration(gg_cam_Intro__Talk3, true, 0.00)
    call CameraSetupApplyForceDuration(gg_cam_Intro__Talk4, true, 10.00)
    // 动画
    call SetUnitAnimation(udg_TempArryUnit[3], "decay")
    call SetUnitAnimation(udg_TempArryUnit[4], "birth")
    call SetUnitAnimation(udg_TempArryUnit[5], "birth")
    call SetUnitAnimation(udg_TempArryUnit[6], "birth")
    call SetUnitAnimation(gg_unit_hlum_0017, "birth")
    call SetUnitAnimation(gg_unit_nbee_0014, "stand work")
    call SetUnitAnimation(gg_unit_nhew_0010, "stand work lumber")
    call YDWEPolledWaitNull(0.10)
    call SetUnitAnimation(gg_unit_nhew_0015, "stand work")
    call SetUnitAnimation(gg_unit_nhew_0088, "stand work")
    call YDWEPolledWaitNull(0.20)
    call SetUnitAnimation(gg_unit_nhew_0018, "stand work")
    call SetUnitAnimation(gg_unit_nhew_0013, "stand work")
    // --------
    call YDWEPolledWaitNull(0.20)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_Kael, GetUnitName(udg_Kael), null, "长话短说，我们公司遭遇了变故，组织架构分崩离析。员工们被亡灵围攻，被迫开启了“神秘通道”。但通道太久没有被维护了，在我和剩下的人进入时，通道出了差错，传到了这里。", bj_TIMETYPE_SET, 10.00, false)
    call YDWEPolledWaitNull(3.00)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call IssuePointOrderLoc(udg_Kael, "move", GetRectCenter(gg_rct_Intro__KaelMove2))
    call YDWEPolledWaitNull(1.20)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call IssuePointOrderLoc(udg_OgreMagi, "move", GetRectCenter(gg_rct_Intro__OrgeMove2))
    call YDWESetUnitFacingToFaceUnitTimedNull(udg_Kael , udg_Elevators[1] , 1.00)
    call YDWEPolledWaitNull(1.50)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call YDWESetUnitFacingToFaceUnitTimedNull(udg_OgreMagi , udg_Elevators[1] , 1.00)
    call YDWEPolledWaitNull(3.30)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_Kael, GetUnitName(udg_Kael), null, "在传送完我们后，这边的“神秘通道”也损坏了，我们的工程师对这种远古造物完全没有头绪，幸运的是你来了。", bj_TIMETYPE_SET, 10.00, false)
    call CameraSetupApplyForceDuration(gg_cam_Intro__Talk5, true, 0.00)
    call CameraSetupApplyForceDuration(gg_cam_Intro__Talk6, true, 13.00)
    call YDWEPolledWaitNull(3.00)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call YDWESetUnitFacingToFaceUnitTimedNull(udg_Kael , udg_OgreMagi , 1.20)
    call YDWEPolledWaitNull(1.00)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call YDWESetUnitFacingToFaceUnitTimedNull(udg_OgreMagi , udg_Kael , 1.20)
    call YDWEPolledWaitNull(2.00)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call SetUnitLookAt(udg_Kael, "bone_head", udg_Elevators[1], 0, 0, 90)
    call YDWEPolledWaitNull(3.00)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call ResetUnitLookAt(udg_Kael)
    call YDWEPolledWaitNull(1.00)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_OgreMagi, GetUnitName(udg_OgreMagi), null, "没有专业的配套工具，这种程度的损伤我也没有办法修复，不过通常神秘通道不会单独存在一个地方，这里应该还有一处通道。", bj_TIMETYPE_SET, 8.00, false)
    call YDWEPolledWaitNull(8.00)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_Kael, GetUnitName(udg_Kael), null, "我们可以一部分人出去探索这个地方，但得有人留守营地，还有一些没有战斗能力的人需要保护。在这之前，你可以认识一下这些人，他们也是因为被迫使用了通道而来到这里的。", bj_TIMETYPE_SET, 10.00, false)
    call YDWEPolledWaitNull(8.00)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call YDWEPolledWaitNull(2.00)
    call CameraSetupApplyForceDuration(gg_cam_Intro__Talk7, true, 7.00)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_OgreMagi, GetUnitName(udg_OgreMagi), null, "好吧，但这么多人会同时出现在这里，你不感觉很诡异吗。", bj_TIMETYPE_SET, 4.50, false)
    call YDWEPolledWaitNull(2.00)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call IssuePointOrderLoc(udg_OgreMagi, "move", GetRectCenter(gg_rct_Intro__KaelBirth2))
    call YDWEPolledWaitNull(1.00)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call YDWEPolledWaitNull(0.50)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call IssuePointOrderLoc(gg_unit_nm03_0022, "move", GetRectCenter(gg_rct_Intro__LieutenantMove1))
    call YDWEPolledWaitNull(0.30)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call IssuePointOrderLoc(gg_unit_nm05_0023, "move", GetRectCenter(gg_rct_Intro__TrollMove1))
    call YDWEPolledWaitNull(0.20)
    if ( ( udg_IsSkipCinematic == true ) ) then
        return
    else
        call DoNothing()
    endif
    call IssuePointOrderLoc(gg_unit_nm06_0024, "move", GetRectCenter(gg_rct_Intro__DeterminedExterminatorMove1))
    call YDWEPolledWaitNull(0.50)
    // 电影结束
    call DisableTrigger(gg_trg_Intro_Skipped)
    // --------
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEOUT, 1.00, "ReplaceableTextures\\CameraMasks\\White_mask.blp", 0, 0, 0, 0)
    call YDWEPolledWaitNull(1.00)
    // 清理单位动画之类的
    call TriggerExecute(gg_trg_Intro_Cleanup)
    // --------
    call YDWEPolledWaitNull(1.00)
    call CinematicModeBJ(false, GetPlayersAll())
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 1.00, "ReplaceableTextures\\CameraMasks\\White_mask.blp", 0, 0, 0, 0)
    call YDWEPolledWaitNull(1.00)
    // 结束电影
    set udg_InCinematic=true
    // 清除触发器
    call DestroyTrigger(gg_trg_Intro_Start)
    call DestroyTrigger(gg_trg_Intro_Skipped)
    call DestroyTrigger(gg_trg_Init_IntroCine)
    // 游戏开始
    call YDWEPolledWaitNull(1.00)
    call TriggerExecute(gg_trg_GameStart)
endfunction
//===========================================================================
function InitTrig_Intro_Start takes nothing returns nothing
    set gg_trg_Intro_Start=CreateTrigger()
    call DoNothing()
    call TriggerAddAction(gg_trg_Intro_Start, function Trig_Intro_StartActions)
endfunction
//===========================================================================
// Trigger: Init IntroCine
//===========================================================================
function Trig_Init_IntroCineActions takes nothing returns nothing
    local group ydl_group
    local unit ydl_unit
    // 改变所属
    set ydl_group=CreateGroup()
    call GroupEnumUnitsInRange(ydl_group, GetRectCenterX(gg_rct_Intro__OrgeMove2), GetRectCenterY(gg_rct_Intro__OrgeMove2), 1200.00, null)
    loop
        set ydl_unit=FirstOfGroup(ydl_group)
        exitwhen ydl_unit == null
        call GroupRemoveUnit(ydl_group, ydl_unit)
        call SetUnitOwner(ydl_unit, Player(6), false)
    endloop
    call DestroyGroup(ydl_group)
    // 建筑
    set udg_TempArryUnit[3]=CreateUnitAtLoc(Player(6), 'n003', GetRectCenter(gg_rct_Intro__Build1), 220.00)
    set udg_TempArryUnit[4]=CreateUnitAtLoc(Player(6), 'hwtw', GetRectCenter(gg_rct_Intro__Build2), 136.00)
    set udg_TempArryUnit[5]=CreateUnitAtLoc(Player(6), 'nefm', GetRectCenter(gg_rct_Intro__Build3), 270.00)
    set udg_TempArryUnit[6]=CreateUnitAtLoc(Player(6), 'nefm', GetRectCenter(gg_rct_Intro__Build4), 60.00)
    set udg_Elevators[1]=CreateUnitAtLoc(Player(PLAYER_NEUTRAL_PASSIVE), 'n000', GetRectCenter(gg_rct_Elevators_01), bj_UNIT_FACING)
    set udg_Tavern[1]=gg_unit_n001_0016
    // 创建物体
    set udg_IntroCinePortal=CreateDestructableZ('B000', GetRectCenterX(gg_rct_Intro__PortalBirth), GetRectCenterY(gg_rct_Intro__PortalBirth), 600.00, 235.00, 1, 0)
    set udg_OgreMagi=CreateUnit(Player(6), 'nm01', GetRectCenterX(gg_rct_Intro__OrgeBirth1), GetRectCenterY(gg_rct_Intro__OrgeBirth1), 45.00)
    call ShowUnit(udg_OgreMagi, false)
    call YDWEFlyEnable(udg_OgreMagi)
    call SetUnitFlyHeight(udg_OgreMagi, 480.00, 0.00)
    call SetUnitAnimation(udg_OgreMagi, "death")
    set udg_Kael=CreateUnit(Player(3), 'nm02', GetRectCenterX(gg_rct_Intro__KaelBirth1), GetRectCenterY(gg_rct_Intro__KaelBirth1), 228.15)
    // 添加进单位组
    set udg_CinematicUnitsGroup=CreateGroup()
    call GroupAddUnit(udg_CinematicUnitsGroup, gg_unit_nm05_0023)
    call GroupAddUnit(udg_CinematicUnitsGroup, gg_unit_nm06_0024)
    call GroupAddUnit(udg_CinematicUnitsGroup, gg_unit_nm03_0022)
    call GroupAddUnit(udg_CinematicUnitsGroup, udg_OgreMagi)
    call GroupAddUnit(udg_CinematicUnitsGroup, udg_Kael)
    // 不忽略警戒点会乱跑
    call RemoveGuardPosition(udg_OgreMagi)
    call RemoveGuardPosition(udg_Kael)
    // 初始化音乐
    call ClearMapMusic()
    call YDWEPolledWaitNull(0.01)
    call PlayThematicMusic("Sound\\Music\\mp3Music\\Comradeship.mp3")
    call SetMapMusic("music", false, 0)
    set ydl_group=null
    set ydl_unit=null
endfunction
//===========================================================================
function InitTrig_Init_IntroCine takes nothing returns nothing
    set gg_trg_Init_IntroCine=CreateTrigger()
    call DoNothing()
    call TriggerAddAction(gg_trg_Init_IntroCine, function Trig_Init_IntroCineActions)
endfunction
//===========================================================================
// Trigger: Intro Skipped
//
// 因为修改了bj 按ESC不会立即结束电影
// 使用CancelCineSceneBJ()来结束电影
//===========================================================================
function Trig_Intro_SkippedActions takes nothing returns nothing
    call DisableTrigger(gg_trg_Intro_Skipped)
    set udg_IsSkipCinematic=true
    call CancelCineSceneBJ()
    // 淡出淡入
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEOUT, 0.50, "ReplaceableTextures\\CameraMasks\\White_mask.blp", 0, 0, 0, 0)
    call YDWEPolledWaitNull(0.50)
    // 清理单位动画之类的
    call TriggerExecute(gg_trg_Intro_Cleanup)
    call YDWEPolledWaitNull(1.00)
    // 然后再淡入
    call CinematicModeBJ(false, GetPlayersAll())
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 0.50, "ReplaceableTextures\\CameraMasks\\White_mask.blp", 0, 0, 0, 0)
    call YDWEPolledWaitNull(0.50)
    // 结束电影
    set udg_InCinematic=false
    // 清除触发器
    call DestroyTrigger(gg_trg_Intro_Start)
    call DestroyTrigger(gg_trg_Intro_Skipped)
    call DestroyTrigger(gg_trg_Init_IntroCine)
    // 游戏开始
    call YDWEPolledWaitNull(1.00)
    call TriggerExecute(gg_trg_GameStart)
endfunction
//===========================================================================
function InitTrig_Intro_Skipped_Orig takes nothing returns nothing
    set gg_trg_Intro_Skipped=CreateTrigger()
    call DoNothing()

        call TriggerRegisterPlayerEventEndCinematic(gg_trg_Intro_Skipped, Player(0))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_Intro_Skipped, Player(1))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_Intro_Skipped, Player(2))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_Intro_Skipped, Player(3))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_Intro_Skipped, Player(4))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_Intro_Skipped, Player(5))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_Intro_Skipped, Player(6))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_Intro_Skipped, Player(7))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_Intro_Skipped, Player(8))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_Intro_Skipped, Player(9))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_Intro_Skipped, Player(10))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_Intro_Skipped, Player(11))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_Intro_Skipped, Player(12))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_Intro_Skipped, Player(13))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_Intro_Skipped, Player(14))
        call TriggerRegisterPlayerEventEndCinematic(gg_trg_Intro_Skipped, Player(15))
    call TriggerAddAction(gg_trg_Intro_Skipped, function Trig_Intro_SkippedActions)
endfunction
function InitTrig_Intro_Skipped takes nothing returns nothing
endfunction
//===========================================================================
// Trigger: Intro Cleanup
//===========================================================================
function Trig_Intro_CleanupFunc026Conditions takes nothing returns nothing
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'nhew' ) ) then
        call RemoveUnit(GetTriggerUnit())
    else
        if ( ( ( EVENT_GAME_TIMER_EXPIRED == GetTriggerEventId() ) == true ) ) then
            call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()))
            call DestroyTrigger(GetTriggeringTrigger())
        else
        endif
    endif
endfunction
function Trig_Intro_CleanupActions takes nothing returns nothing
    local group ydl_group
    local unit ydl_unit
    local trigger ydl_trigger
    call SetSkyModel(null)
    call UseTimeOfDayBJ(true)
    call ResetTerrainFog()
    call CameraSetupApplyForceDuration(gg_cam_Intro__GameStart, true, 0)
    call ResetUnitAnimation(udg_TempArryUnit[3])
    call ResetUnitAnimation(udg_TempArryUnit[4])
    call ResetUnitAnimation(udg_TempArryUnit[5])
    call ResetUnitAnimation(udg_TempArryUnit[6])
    call SetUnitColor(udg_TempArryUnit[3], PLAYER_COLOR_PURPLE)
    call SetUnitColor(udg_TempArryUnit[4], PLAYER_COLOR_PURPLE)
    call SetUnitColor(udg_TempArryUnit[5], PLAYER_COLOR_PURPLE)
    call SetUnitColor(udg_TempArryUnit[6], PLAYER_COLOR_PURPLE)
    call SetUnitColor(gg_unit_hlum_0017, PLAYER_COLOR_PURPLE)
    call ResetUnitAnimation(gg_unit_hlum_0017)
    call ResetUnitAnimation(gg_unit_nbee_0014)
    call ResetUnitAnimation(gg_unit_nhew_0010)
    call ResetUnitAnimation(gg_unit_nhew_0015)
    call ResetUnitAnimation(gg_unit_nhew_0088)
    call ResetUnitAnimation(gg_unit_nhew_0018)
    call ResetUnitAnimation(gg_unit_nhew_0013)
    call StopSoundBJ(gg_snd_ShimmeringPortalBirth, true)
    call StopSoundBJ(gg_snd_CityScapeMagicRunesLoop1, true)
    if ( ( IsDestructableAliveBJ(udg_IntroCinePortal) == true ) ) then
        call RemoveDestructable(udg_IntroCinePortal)
    else
    endif
    set ydl_group=CreateGroup()
    call GroupEnumUnitsInRange(ydl_group, GetRectCenterX(gg_rct_Intro__OrgeMove2), GetRectCenterY(gg_rct_Intro__OrgeMove2), 1200.00, null)
    loop
        set ydl_unit=FirstOfGroup(ydl_group)
        exitwhen ydl_unit == null
        call GroupRemoveUnit(ydl_group, ydl_unit)
        if ( ( GetUnitTypeId(ydl_unit) == 'nhew' ) ) then
            call IssueTargetOrder(ydl_unit, "smart", udg_Tavern[1])
        else
            if ( ( IsUnitInGroup(ydl_unit, udg_CinematicUnitsGroup) == true ) ) then
                call PauseUnit(ydl_unit, true)
                call ShowUnit(ydl_unit, false)
            else
            endif
        endif
    endloop
    call DestroyGroup(ydl_group)
    call IssueTargetOrder(gg_unit_nbee_0014, "smart", udg_Tavern[1])
    set ydl_trigger=CreateTrigger()
    call TriggerRegisterTimerEventSingle(ydl_trigger, 10.00)
    call TriggerRegisterUnitInRangeSimple(ydl_trigger, 200.00, udg_Tavern[1])
    call TriggerAddCondition(ydl_trigger, Condition(function Trig_Intro_CleanupFunc026Conditions))
    call DestroyTrigger(gg_trg_Intro_Cleanup)
    set ydl_group=null
    set ydl_unit=null
    set ydl_trigger=null
endfunction
//===========================================================================
function InitTrig_Intro_Cleanup takes nothing returns nothing
    set gg_trg_Intro_Cleanup=CreateTrigger()
    call DoNothing()
    call TriggerAddAction(gg_trg_Intro_Cleanup, function Trig_Intro_CleanupActions)
endfunction
//===========================================================================
// Trigger: GameStart
//
// MainQuest
// SideQuest
//===========================================================================
function Trig_GameStartActions takes nothing returns nothing
    call TriggerExecute(gg_trg_InitQuest)
    call DestroyTrigger(gg_trg_GameStart)
endfunction
//===========================================================================
function InitTrig_GameStart takes nothing returns nothing
    set gg_trg_GameStart=CreateTrigger()
    call DoNothing()
    call TriggerAddAction(gg_trg_GameStart, function Trig_GameStartActions)
endfunction
//===========================================================================
// Trigger: InitQuest
//
// |cffffcc00主任务|r
// 等待支援
//   - 前线“了望塔”不能失守
// |cff32CD32提示|r - 你控制凯尔新材的新材料开发部门，经理因为贪污入狱，没有可控制英雄，但你可以在国王祭坛中训练血精灵工程师。
// |cff87ceeb额外可用单位|r
// 魔法破坏者 - 精灵族的英勇战士，被训练来消灭法师，拥有魔法防御，魔法反馈技能。
//===========================================================================
function Trig_InitQuestActions takes nothing returns nothing
    set udg_MainQuest[1]=CreateQuestBJ(bj_QUESTTYPE_REQ_DISCOVERED, "神秘通道", "神秘通道损坏了，菊花众人被困在岛上，找到另外一个神秘通道来逃离这里。", "ReplaceableTextures\\CommandButtons\\BTNMassTeleport.blp")
    set udg_SideQuest[1]=CreateQuestBJ(bj_QUESTTYPE_OPT_UNDISCOVERED, "蟹皇", "蟹皇被冲到这里了 怎么回事12313", "ReplaceableTextures\\CommandButtons\\BTNSpinyCrab.blp")
    call YDWEPolledWaitNull(bj_QUEUE_DELAY_QUEST)
    call QuestMessageBJ(GetPlayersAll(), bj_QUESTMESSAGE_DISCOVERED, "|cffffcc00主任务|r
神秘通道
  - 找到另一个神秘通道")
    call DestroyTrigger(gg_trg_InitQuest)
endfunction
//===========================================================================
function InitTrig_InitQuest takes nothing returns nothing
    set gg_trg_InitQuest=CreateTrigger()
    call DoNothing()
    call TriggerAddAction(gg_trg_InitQuest, function Trig_InitQuestActions)
endfunction
//===========================================================================
function InitCustomTriggers takes nothing returns nothing
    call InitTrig_Intro_Start()
    call InitTrig_Init_IntroCine()
    call InitTrig_Intro_Skipped()
    call InitTrig_Intro_Cleanup()
    call InitTrig_GameStart()
    call InitTrig_InitQuest()
endfunction
//***************************************************************************
//*
//*  Players
//*
//***************************************************************************
function InitCustomPlayerSlots takes nothing returns nothing
    // Player 0
    call SetPlayerStartLocation(Player(0), 0)
    call ForcePlayerStartLocation(Player(0), 0)
    call SetPlayerColor(Player(0), ConvertPlayerColor(0))
    call SetPlayerRacePreference(Player(0), RACE_PREF_ORC)
    call SetPlayerRaceSelectable(Player(0), false)
    call SetPlayerController(Player(0), MAP_CONTROL_USER)
    // Player 1
    call SetPlayerStartLocation(Player(1), 1)
    call ForcePlayerStartLocation(Player(1), 1)
    call SetPlayerColor(Player(1), ConvertPlayerColor(1))
    call SetPlayerRacePreference(Player(1), RACE_PREF_ORC)
    call SetPlayerRaceSelectable(Player(1), false)
    call SetPlayerController(Player(1), MAP_CONTROL_USER)
    // Player 2
    call SetPlayerStartLocation(Player(2), 2)
    call ForcePlayerStartLocation(Player(2), 2)
    call SetPlayerColor(Player(2), ConvertPlayerColor(2))
    call SetPlayerRacePreference(Player(2), RACE_PREF_ORC)
    call SetPlayerRaceSelectable(Player(2), false)
    call SetPlayerController(Player(2), MAP_CONTROL_USER)
    // Player 3
    call SetPlayerStartLocation(Player(3), 3)
    call ForcePlayerStartLocation(Player(3), 3)
    call SetPlayerColor(Player(3), ConvertPlayerColor(3))
    call SetPlayerRacePreference(Player(3), RACE_PREF_ORC)
    call SetPlayerRaceSelectable(Player(3), false)
    call SetPlayerController(Player(3), MAP_CONTROL_USER)
    // Player 4
    call SetPlayerStartLocation(Player(4), 4)
    call ForcePlayerStartLocation(Player(4), 4)
    call SetPlayerColor(Player(4), ConvertPlayerColor(4))
    call SetPlayerRacePreference(Player(4), RACE_PREF_ORC)
    call SetPlayerRaceSelectable(Player(4), false)
    call SetPlayerController(Player(4), MAP_CONTROL_USER)
    // Player 5
    call SetPlayerStartLocation(Player(5), 5)
    call ForcePlayerStartLocation(Player(5), 5)
    call SetPlayerColor(Player(5), ConvertPlayerColor(5))
    call SetPlayerRacePreference(Player(5), RACE_PREF_ORC)
    call SetPlayerRaceSelectable(Player(5), false)
    call SetPlayerController(Player(5), MAP_CONTROL_USER)
    // Player 6
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
    // Force: TRIGSTR_017
    call SetPlayerTeam(Player(0), 0)
    call SetPlayerState(Player(0), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(1), 0)
    call SetPlayerState(Player(1), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(2), 0)
    call SetPlayerState(Player(2), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(3), 0)
    call SetPlayerState(Player(3), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(4), 0)
    call SetPlayerState(Player(4), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(5), 0)
    call SetPlayerState(Player(5), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(6), 0)
    call SetPlayerState(Player(6), PLAYER_STATE_ALLIED_VICTORY, 1)
    //   Allied
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(5), true)
    //   Shared Vision
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(5), true)
    // Force: TRIGSTR_018
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
    //   Shared Vision
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(10), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(10), true)
    call SetPlayerAllianceStateVisionBJ(Player(10), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(10), Player(8), true)
endfunction
function InitAllyPriorities takes nothing returns nothing
    call SetStartLocPrioCount(0, 5)
    call SetStartLocPrio(0, 0, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 1, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 2, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 3, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 4, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(1, 5)
    call SetStartLocPrio(1, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 1, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 2, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 3, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 4, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(2, 5)
    call SetStartLocPrio(2, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 2, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 3, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 4, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(3, 5)
    call SetStartLocPrio(3, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 2, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 3, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 4, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(4, 5)
    call SetStartLocPrio(4, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 2, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 3, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 4, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(5, 5)
    call SetStartLocPrio(5, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(5, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(5, 2, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(5, 3, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(5, 4, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(6, 6)
    call SetStartLocPrio(6, 0, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(6, 1, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(6, 2, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(6, 3, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(6, 4, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(6, 5, 7, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(7, 6)
    call SetStartLocPrio(7, 0, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(7, 1, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(7, 2, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(7, 3, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(7, 4, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(7, 5, 6, MAP_LOC_PRIO_HIGH)
endfunction
//***************************************************************************
//*
//*  Main Initialization
//*
//***************************************************************************
//===========================================================================
function main takes nothing returns nothing
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
	set DamageEventCondition=Condition(function YDWEAnyUnitDamagedTriggerAction)
	
	call InitBlizzard()
    //call InitGlobals(  )
    call InitCustomTriggers()
	if M_OnlinePlayerAmount == 1 then
		set PlayerMaxHeroAmount=4
	elseif M_OnlinePlayerAmount == 2 then
		set PlayerMaxHeroAmount=2
	endif
	//单机测试
	if bj_isSinglePlayer then
		call SetPlayerState(Player(0), PLAYER_STATE_RESOURCE_GOLD, 99999)
		//测试时Esc清屏
		set IsMirage=true
		call FogEnable(false)
		call FogMaskEnable(false)
		set trig=CreateTrigger()
		call TriggerRegisterPlayerEvent(trig, Player(0), EVENT_PLAYER_END_CINEMATIC)
		call TriggerAddCondition(trig, Condition(function TestEsc))
	endif
	//预先创建马甲单位,防止被设置生命周期
	set BonusDummy=CreateUnit(Player(bj_PLAYER_NEUTRAL_VICTIM), 'ndum', 0, 0, 0)
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
	// call CreateMovieDummyUnit()
	//将vJass初始化放置在此处，注意，结构优先被初始化，然后是库初始化 


call ExecuteFunc("InitSetUp___Init")
call ExecuteFunc("YDTriggerSaveLoadSystem___Init")
call ExecuteFunc("InitializeYD")
call InitUnitRestore()
call InitItemSystem()
call UnitAttackEvent___Init()
call UnitDeathEvent___Init()
call UnitAbilityEvent___Init()
call UnitEnterMapEvent___Init()
call HeroLevelUp___Init()
call UnitSummonEvent___Init()
call SetHeroVariable()

	//创建单位进入地图事件 早于任意单位受伤事件之前
	//call SetWorldRegion() 
	//任意单位受伤事件
	call YDWESyStemAnyUnitDamagedRegistTrigger()
	//创建单位
	call CreateAllUnits()
	//创建所有任务
	// call CreateAllQuest()
	set IsInitUnit=false
	call InitBoss()
	//set trig = CreateTrigger() 
	//call TriggerRegisterAnyUnitEventBJ(trig, EVENT_PLAYER_UNIT_DECAY)
	//call TriggerAddCondition(trig, Condition(function UnitDecayEvnetActions))
	call TriggerExecute(gg_trg_Intro_Start)
	//初始化UI
	call CreateTimerEventTrigger(.0 , false , function InitUIFrame)
	//设置英雄变量
	set trig=null

endfunction //injected main function (! inject command)??
//***************************************************************************
//*
//*  Map Configuration
//*
//***************************************************************************
function config takes nothing returns nothing
    call SetMapName("基佬之岛测试版v0.003")
    call SetMapDescription("简易小地图，菊花系列第二部，估计也是最后一步和退坑作品。\n也许不会再有新作品但是会保持维护。\n不追求效率，也许会对机器有一定要求。")
    call SetPlayers(10)
    call SetTeams(10)
    call SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)
    call DefineStartLocation(0, 0.0, 0.0)
    call DefineStartLocation(1, 0.0, 0.0)
    call DefineStartLocation(2, 0.0, 0.0)
    call DefineStartLocation(3, 0.0, 0.0)
    call DefineStartLocation(4, 0.0, 0.0)
    call DefineStartLocation(5, 0.0, 0.0)
    call DefineStartLocation(6, 0.0, 0.0)
    call DefineStartLocation(7, 0.0, 0.0)
    call DefineStartLocation(8, 0.0, 0.0)
    call DefineStartLocation(9, 0.0, 0.0)
    // Player setup
    call InitCustomPlayerSlots()
    call InitCustomTeams()
    call InitAllyPriorities()
endfunction




//Struct method generated initializers/callers:

