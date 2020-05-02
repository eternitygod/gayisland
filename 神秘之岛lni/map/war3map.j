globals
//globals from BzAPI:
constant boolean LIBRARY_BzAPI=true
//endglobals from BzAPI
//globals from YDTriggerSaveLoadSystem:
constant boolean LIBRARY_YDTriggerSaveLoadSystem=true
hashtable YDHT
hashtable YDLOC
//endglobals from YDTriggerSaveLoadSystem
//globals from YDWEAbilityState:
constant boolean LIBRARY_YDWEAbilityState=true
constant integer YDWEAbilityState___ABILITY_STATE_COOLDOWN= 1
constant integer YDWEAbilityState___ABILITY_DATA_TARGS= 100
constant integer YDWEAbilityState___ABILITY_DATA_CAST= 101
constant integer YDWEAbilityState___ABILITY_DATA_DUR= 102
constant integer YDWEAbilityState___ABILITY_DATA_HERODUR= 103
constant integer YDWEAbilityState___ABILITY_DATA_COST= 104
constant integer YDWEAbilityState___ABILITY_DATA_COOL= 105
constant integer YDWEAbilityState___ABILITY_DATA_AREA= 106
constant integer YDWEAbilityState___ABILITY_DATA_RNG= 107
constant integer YDWEAbilityState___ABILITY_DATA_DATA_A= 108
constant integer YDWEAbilityState___ABILITY_DATA_DATA_B= 109
constant integer YDWEAbilityState___ABILITY_DATA_DATA_C= 110
constant integer YDWEAbilityState___ABILITY_DATA_DATA_D= 111
constant integer YDWEAbilityState___ABILITY_DATA_DATA_E= 112
constant integer YDWEAbilityState___ABILITY_DATA_DATA_F= 113
constant integer YDWEAbilityState___ABILITY_DATA_DATA_G= 114
constant integer YDWEAbilityState___ABILITY_DATA_DATA_H= 115
constant integer YDWEAbilityState___ABILITY_DATA_DATA_I= 116
constant integer YDWEAbilityState___ABILITY_DATA_UNITID= 117

constant integer YDWEAbilityState___ABILITY_DATA_HOTKET= 200
constant integer YDWEAbilityState___ABILITY_DATA_UNHOTKET= 201
constant integer YDWEAbilityState___ABILITY_DATA_RESEARCH_HOTKEY= 202
constant integer YDWEAbilityState___ABILITY_DATA_NAME= 203
constant integer YDWEAbilityState___ABILITY_DATA_ART= 204
constant integer YDWEAbilityState___ABILITY_DATA_TARGET_ART= 205
constant integer YDWEAbilityState___ABILITY_DATA_CASTER_ART= 206
constant integer YDWEAbilityState___ABILITY_DATA_EFFECT_ART= 207
constant integer YDWEAbilityState___ABILITY_DATA_AREAEFFECT_ART= 208
constant integer YDWEAbilityState___ABILITY_DATA_MISSILE_ART= 209
constant integer YDWEAbilityState___ABILITY_DATA_SPECIAL_ART= 210
constant integer YDWEAbilityState___ABILITY_DATA_LIGHTNING_EFFECT= 211
constant integer YDWEAbilityState___ABILITY_DATA_BUFF_TIP= 212
constant integer YDWEAbilityState___ABILITY_DATA_BUFF_UBERTIP= 213
constant integer YDWEAbilityState___ABILITY_DATA_RESEARCH_TIP= 214
constant integer YDWEAbilityState___ABILITY_DATA_TIP= 215
constant integer YDWEAbilityState___ABILITY_DATA_UNTIP= 216
constant integer YDWEAbilityState___ABILITY_DATA_RESEARCH_UBERTIP= 217
constant integer YDWEAbilityState___ABILITY_DATA_UBERTIP= 218
constant integer YDWEAbilityState___ABILITY_DATA_UNUBERTIP= 219
constant integer YDWEAbilityState___ABILITY_DATA_UNART= 220
//endglobals from YDWEAbilityState
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
string array YDWEBase___yd_PlayerColor
trigger array YDWEBase___AbilityCastingOverEventQueue
integer array YDWEBase___AbilityCastingOverEventType
integer YDWEBase___AbilityCastingOverEventNumber= 0
//endglobals from YDWEBase
//globals from YDWEEnumDestructablesInCircleBJFilterNull:
constant boolean LIBRARY_YDWEEnumDestructablesInCircleBJFilterNull=true
//endglobals from YDWEEnumDestructablesInCircleBJFilterNull
//globals from YDWEEventDamageData:
constant boolean LIBRARY_YDWEEventDamageData=true
constant integer YDWEEventDamageData___EVENT_DAMAGE_DATA_VAILD= 0
constant integer YDWEEventDamageData___EVENT_DAMAGE_DATA_IS_PHYSICAL= 1
constant integer YDWEEventDamageData___EVENT_DAMAGE_DATA_IS_ATTACK= 2
constant integer YDWEEventDamageData___EVENT_DAMAGE_DATA_IS_RANGED= 3
constant integer YDWEEventDamageData___EVENT_DAMAGE_DATA_DAMAGE_TYPE= 4
constant integer YDWEEventDamageData___EVENT_DAMAGE_DATA_WEAPON_TYPE= 5
constant integer YDWEEventDamageData___EVENT_DAMAGE_DATA_ATTACK_TYPE= 6
//endglobals from YDWEEventDamageData
//globals from YDWEGetInventoryIndexOfItemTypeBJNull:
constant boolean LIBRARY_YDWEGetInventoryIndexOfItemTypeBJNull=true
//endglobals from YDWEGetInventoryIndexOfItemTypeBJNull
//globals from YDWEGetItemOfTypeFromUnitBJNull:
constant boolean LIBRARY_YDWEGetItemOfTypeFromUnitBJNull=true
item yd_NullTempItem
//endglobals from YDWEGetItemOfTypeFromUnitBJNull
//globals from YDWEGetUnitsInRangeOfLocMatchingNull:
constant boolean LIBRARY_YDWEGetUnitsInRangeOfLocMatchingNull=true
//endglobals from YDWEGetUnitsInRangeOfLocMatchingNull
//globals from YDWEGetUnitsInRectMatchingNull:
constant boolean LIBRARY_YDWEGetUnitsInRectMatchingNull=true
group yd_NullTempGroup
//endglobals from YDWEGetUnitsInRectMatchingNull
//globals from YDWEMultiboardSetItemColorBJNull:
constant boolean LIBRARY_YDWEMultiboardSetItemColorBJNull=true
//endglobals from YDWEMultiboardSetItemColorBJNull
//globals from YDWEMultiboardSetItemValueBJNull:
constant boolean LIBRARY_YDWEMultiboardSetItemValueBJNull=true
//endglobals from YDWEMultiboardSetItemValueBJNull
//globals from YDWEPlaySoundNull:
constant boolean LIBRARY_YDWEPlaySoundNull=true
//endglobals from YDWEPlaySoundNull
//globals from YDWESetUnitFacingToFaceLocTimedNull:
constant boolean LIBRARY_YDWESetUnitFacingToFaceLocTimedNull=true
//endglobals from YDWESetUnitFacingToFaceLocTimedNull
//globals from YDWETriggerEvent:
constant boolean LIBRARY_YDWETriggerEvent=true
trigger yd_DamageEventTrigger= null
trigger array YDWETriggerEvent__DamageEventQueue
integer YDWETriggerEvent__DamageEventNumber= 0
	
item bj_lastMovedItemInItemSlot= null
	
trigger YDWETriggerEvent__MoveItemEventTrigger= null
trigger array YDWETriggerEvent__MoveItemEventQueue
integer YDWETriggerEvent__MoveItemEventNumber= 0
//endglobals from YDWETriggerEvent
//globals from MeatHook:
constant boolean LIBRARY_MeatHook=true
        //private constant real MOVE_DIST = 40. //
        //private constant real KEEP_DIST = 50. // 
        //
group MeatHook___Except= CreateGroup()
location MeatHook___Point= Location(0.0, 0.0)
//endglobals from MeatHook
//globals from MemoryLeakHelper:
constant boolean LIBRARY_MemoryLeakHelper=true
constant real MemoryLeakHelper___HASH_DECAY_TIME= 500.
constant integer MemoryLeakHelper___CLEAR_HASH_COUNT= 8190
integer MemoryLeakHelper___HashNumber= 0
integer array MemoryLeakHelper___HashData
integer array MemoryLeakHelper___HashHash
integer array MemoryLeakHelper___HashPlace
real array MemoryLeakHelper___CreationTime
        
integer MemoryLeakHelper___TempHashNumber= 0
integer array MemoryLeakHelper___TempHashHash
integer array MemoryLeakHelper___TempHashPlace
integer array MemoryLeakHelper___TempHashData
real array MemoryLeakHelper___TempCreationTime
        
integer MemoryLeakHelper___LastHashedValue= 0
integer MemoryLeakHelper___LastIndex= 0
real MemoryLeakHelper___GameTime= 0.
timer MemoryLeakHelper___GameTimeTimer= CreateTimer()
constant real MemoryLeakHelper___GAMETIME_TIMER_INTERVAL= 30.
constant integer MemoryLeakHelper___key= 0
        
constant integer MemoryLeakHelper___MAX_INSTANCES=8100

        // The system fires when you do something that creates a leak.
        // The data that cause leak are saved in a variable then.
        // And every CLEAN_UP_INTERVAL seconds those data are destroyed.
        // This shouldn't be too high, or too low.
constant real MemoryLeakHelper___CLEAN_UP_INTERVAL= 10
        // If this is set to true, the system will work more slowly (but you wont notice)
        // and count, how much memory this system was able to save.
        // This value is display by the function DisplayLeaks() then.
        // WARNING: This sucks a lot of performance. I would ONLY use it when you want
        // to test, if this is useful for your map. Later set it to false.
constant boolean MemoryLeakHelper___DISPLAY_SAVED_MEMORY= true
        // The Data are only cleaned up, when that many handles were caught
constant integer MemoryLeakHelper___MIN_LEAK_NUMBER= 1750
        // How often are data passed to the destroyer?
        // Leaks stay for a random time between CLEAN_UP_INTERVAL and CLEAN_UP_INTERVAL+PASS_INTERVAL
        // in the game
constant real MemoryLeakHelper___PASS_INTERVAL= 2.5
        // Memory leaks occur pretty frequently. When a leak is caught it is saved in
        // an array. But the array can't have more than MAX_LEAK_INSTANCES instances, so
        // if more than MAX_LEAK_INSTANCES memory leaks occur during a destroy interval,
        // the system fails.
constant integer MemoryLeakHelper___MAX_LEAK_INSTANCES= 60000
integer MemoryLeakHelper___IndexData
integer MemoryLeakHelper___IsSaved
        
integer MemoryLeakHelper___CaughtLocationLeaks= 0
// processed:         location array MemoryLeakHelper___LocationLeakData[MemoryLeakHelper___MAX_LEAK_INSTANCES]
integer MemoryLeakHelper___LocationDestroyCount= 0
// processed:         location array MemoryLeakHelper___LocationDestroyData[MemoryLeakHelper___MAX_LEAK_INSTANCES]
		
integer MemoryLeakHelper___CaughtEffectLeaks= 0
// processed:         effect array MemoryLeakHelper___EffectLeakData[MemoryLeakHelper___MAX_LEAK_INSTANCES]
integer MemoryLeakHelper___EffectDestroyCount= 0
// processed:         effect array MemoryLeakHelper___EffectDestroyData[MemoryLeakHelper___MAX_LEAK_INSTANCES]
		
integer MemoryLeakHelper___CaughtGroupLeaks= 0
// processed:         group array MemoryLeakHelper___GroupLeakData[MemoryLeakHelper___MAX_LEAK_INSTANCES]
integer MemoryLeakHelper___GroupDestroyCount= 0
// processed:         group array MemoryLeakHelper___GroupDestroyData[MemoryLeakHelper___MAX_LEAK_INSTANCES]
        
        
integer MemoryLeakHelper___DestroyedLeaks= 0
integer MemoryLeakHelper___CaughtLeaks= 0
integer MemoryLeakHelper___DestroyedLeaksUser= 0
handle MemoryLeakHelper___LastCaught
timer MemoryLeakHelper___PassTimer= CreateTimer()
timer MemoryLeakHelper___CleanTimer= CreateTimer()
timer MemoryLeakHelper___DelayTimer= CreateTimer()
boolean MemoryLeakHelper___IsDestroying= false
real MemoryLeakHelper___SavedMemory= 0.
real MemoryLeakHelper___LastCheckedGroupMemoryUsage= 0.
boolean MemoryLeakHelper___DestroyThreadRunning= false
boolean MemoryLeakHelper___Disabled= false
        
        // These values were found out in a big leak test by gekko.
constant real MemoryLeakHelper___LOCATION_MEMORY_USAGE= 0.361
constant real MemoryLeakHelper___GROUP_MEMORY_USAGE= 0.62
constant real MemoryLeakHelper___GROUP_UNIT_MEMORY_USAGE= 0.040
constant real MemoryLeakHelper___EFFECT_MEMORY_USAGE= 11.631
constant real MemoryLeakHelper___REMOVED_EFFECT_MEMORY_USAGE= 0.066
        // 用于判断是否开启内存排泄帮助
boolean MemoryLeakHelper___IsOpenMemoryLeakHelper= false
boolean MemoryLeakHelper___IsDisplayMemoryLeakHelper= false
//endglobals from MemoryLeakHelper
//globals from YDWEEnumDestructablesInCircleBJNull:
constant boolean LIBRARY_YDWEEnumDestructablesInCircleBJNull=true
//endglobals from YDWEEnumDestructablesInCircleBJNull
//globals from YDWEGetUnitsInRectAllNull:
constant boolean LIBRARY_YDWEGetUnitsInRectAllNull=true
//endglobals from YDWEGetUnitsInRectAllNull
//globals from YDWESetUnitFacingToFaceUnitTimedNull:
constant boolean LIBRARY_YDWESetUnitFacingToFaceUnitTimedNull=true
//endglobals from YDWESetUnitFacingToFaceUnitTimedNull
//globals from YDWETimerSystem:
constant boolean LIBRARY_YDWETimerSystem=true
integer YDWETimerSystem___CurrentTime
integer YDWETimerSystem___CurrentIndex
integer YDWETimerSystem___TaskListHead
integer YDWETimerSystem___TaskListIdleHead
integer YDWETimerSystem___TaskListIdleMax
integer array YDWETimerSystem___TaskListIdle
integer array YDWETimerSystem___TaskListNext
integer array YDWETimerSystem___TaskListTime
trigger array YDWETimerSystem___TaskListProc
trigger YDWETimerSystem___fnRemoveUnit
trigger YDWETimerSystem___fnDestroyTimer
trigger YDWETimerSystem___fnRemoveItem
trigger YDWETimerSystem___fnDestroyEffect
trigger YDWETimerSystem___fnDestroyLightning
trigger YDWETimerSystem___fnRunTrigger
timer YDWETimerSystem___Timer
integer YDWETimerSystem___TimerHandle
integer YDWETimerSystem___TimerSystem_RunIndex= 0
//endglobals from YDWETimerSystem
    // User-defined
force udg_OE= null
player array udg_PG
unit array udg_Hero
group udg_HeroGroup= null
multiboard udg_DMB= null
multiboarditem array udg_DMB10WanJiaMingZi
boolean array udg_online
boolean udg_OffMovie= false
boolean udg_DuoChongShiFa= false
unit array udg_FovDummy
group udg_FovDummyGroup= null
boolean udg_HanPiGuangHuan= false
unit array udg_CuiDuDanWei
unit array udg_CuiDuMuBiaoDanWei
unit array udg_Hero10SiWangDW
group udg_Hero10SiWangDWZ= null
integer udg_playernumber= 0
dialog array udg_DialogBox
boolean udg_booleanthreehero= false
player udg_Host= null
boolean array udg_BooleanChooseHero
boolean udg_choicemode= false
button array udg_TH
button array udg_BM
boolean udg_booleanMovie= false
boolean udg_booleanEscMovie= false
button array udg_BEM
unit array udg_Boos
boolean udg_BoosFangJian= false
group udg_Hero10CunHuoDWZ= null
boolean array udg_DiXBoos
fogmodifier array udg_Fov
group udg_StrartUnitGroup= null
unit array udg_Dummy
group udg_DummyGroup= null
camerasetup udg_FuHuoJingTou= null
real udg_GetUnitX= 0
unit udg_StartTent= null
unit array udg_Circle
trigger udg_SphereStart= null
group udg_EggGroup= null
player udg_PD= null
region udg_SlkR= null
timer udg_testhandle= null
integer udg_handleId= 0
    // Generated
sound gg_snd_ShouSiJuHua= null
sound gg_snd_FootmanYes1= null
sound gg_snd_PeasantPissed3= null
sound gg_snd_SkeletonYes1= null
sound gg_snd_ForestTrollYesAttack2= null
sound gg_snd_ForestTrollWarcry1= null
sound gg_snd_PriestYesAttack1= null
sound gg_snd_PriestYesAttack3= null
sound gg_snd_ArthasYesAttack2= null
sound gg_snd_ArthasYesAttack5= null
sound gg_snd_ArthasPissed4= null
sound gg_snd_DemonHunterMorphedYesAttack1= null
sound gg_snd_H05Arthas10= null
sound gg_snd_DemonHunterMorphedYesAttack3= null
sound gg_snd_DemonHunterMorphedPissed2= null
sound gg_snd_NecromancerPissed4= null
sound gg_snd_NecromancerWhat1= null
sound gg_snd_pl_impact_stun= null
trigger gg_trg_______u= null
trigger gg_trg_123= null
trigger gg_trg_Test= null
trigger gg_trg_De= null
trigger gg_trg_T_TrollWarlord= null
trigger gg_trg_T_Grunt= null
trigger gg_trg_T_Paladin= null
trigger gg_trg_QQ= null
trigger gg_trg_FovDummy= null
trigger gg_trg________________u= null
trigger gg_trg_StartMovie= null
trigger gg_trg_EscStartMovie= null
trigger gg_trg_Music1= null
trigger gg_trg_Music2= null
trigger gg_trg_Sphere_Start= null
trigger gg_trg_Heihei= null
trigger gg_trg_HideEgg= null
trigger gg_trg_Black_shadow= null
trigger gg_trg_Open_Black_shadow= null
trigger gg_trg_Fog_of_war= null
trigger gg_trg_Open_the_fog_of_war= null
trigger gg_trg_Item_superposition= null
trigger gg_trg_Discard_Items= null
trigger gg_trg_Dialog_Tf= null
trigger gg_trg_Boos_Tf= null
trigger gg_trg_Boos_Slk= null
trigger gg_trg_Boos_Nec= null
trigger gg_trg_Boos_Nect= null
trigger gg_trg_Zzzzzzzzz= null
trigger gg_trg_Rect= null
trigger gg_trg_OgreMagi= null
trigger gg_trg_StartSet= null
trigger gg_trg_StarUnit= null
trigger gg_trg_PlayerGroup= null
trigger gg_trg_Player_Hero= null
trigger gg_trg_Host= null
trigger gg_trg_Dummy_And_Start= null
trigger gg_trg_Register= null
trigger gg_trg_EEEEE= null
trigger gg_trg_WWWWWWWWWW= null
trigger gg_trg_Zzzzzzzzzzz= null
unit gg_unit_Hart_0013= null
hashtable HT=InitHashtable()
hashtable HY=InitHashtable()
hashtable P=InitHashtable()
trigger AudtOM= null

trigger l__library_init

//JASSHelper struct globals:
constant integer si__MemoryLeakHelper___Index=1
integer si__MemoryLeakHelper___Index_F=0
integer si__MemoryLeakHelper___Index_I=0
integer array si__MemoryLeakHelper___Index_V
constant integer si__MemoryLeakHelper___GTable=2
integer si__MemoryLeakHelper___GTable_F=0
integer si__MemoryLeakHelper___GTable_I=0
integer array si__MemoryLeakHelper___GTable_V
constant integer si__MemoryLeakHelper___HandleTable=3
location array s__MemoryLeakHelper___LocationLeakData
location array s__2MemoryLeakHelper___LocationLeakData
location array s__3MemoryLeakHelper___LocationLeakData
location array s__4MemoryLeakHelper___LocationLeakData
location array s__5MemoryLeakHelper___LocationLeakData
location array s__6MemoryLeakHelper___LocationLeakData
location array s__7MemoryLeakHelper___LocationLeakData
location array s__8MemoryLeakHelper___LocationLeakData
location array s__MemoryLeakHelper___LocationDestroyData
location array s__2MemoryLeakHelper___LocationDestroyData
location array s__3MemoryLeakHelper___LocationDestroyData
location array s__4MemoryLeakHelper___LocationDestroyData
location array s__5MemoryLeakHelper___LocationDestroyData
location array s__6MemoryLeakHelper___LocationDestroyData
location array s__7MemoryLeakHelper___LocationDestroyData
location array s__8MemoryLeakHelper___LocationDestroyData
effect array s__MemoryLeakHelper___EffectLeakData
effect array s__2MemoryLeakHelper___EffectLeakData
effect array s__3MemoryLeakHelper___EffectLeakData
effect array s__4MemoryLeakHelper___EffectLeakData
effect array s__5MemoryLeakHelper___EffectLeakData
effect array s__6MemoryLeakHelper___EffectLeakData
effect array s__7MemoryLeakHelper___EffectLeakData
effect array s__8MemoryLeakHelper___EffectLeakData
effect array s__MemoryLeakHelper___EffectDestroyData
effect array s__2MemoryLeakHelper___EffectDestroyData
effect array s__3MemoryLeakHelper___EffectDestroyData
effect array s__4MemoryLeakHelper___EffectDestroyData
effect array s__5MemoryLeakHelper___EffectDestroyData
effect array s__6MemoryLeakHelper___EffectDestroyData
effect array s__7MemoryLeakHelper___EffectDestroyData
effect array s__8MemoryLeakHelper___EffectDestroyData
group array s__MemoryLeakHelper___GroupLeakData
group array s__2MemoryLeakHelper___GroupLeakData
group array s__3MemoryLeakHelper___GroupLeakData
group array s__4MemoryLeakHelper___GroupLeakData
group array s__5MemoryLeakHelper___GroupLeakData
group array s__6MemoryLeakHelper___GroupLeakData
group array s__7MemoryLeakHelper___GroupLeakData
group array s__8MemoryLeakHelper___GroupLeakData
group array s__MemoryLeakHelper___GroupDestroyData
group array s__2MemoryLeakHelper___GroupDestroyData
group array s__3MemoryLeakHelper___GroupDestroyData
group array s__4MemoryLeakHelper___GroupDestroyData
group array s__5MemoryLeakHelper___GroupDestroyData
group array s__6MemoryLeakHelper___GroupDestroyData
group array s__7MemoryLeakHelper___GroupDestroyData
group array s__8MemoryLeakHelper___GroupDestroyData
integer array si__MemoryLeakHelper___GTable_type
trigger array st__MemoryLeakHelper___GTable_onDestroy
trigger array st___prototype181
trigger array st___prototype185
real f__result_real
trigger array st___prototype189
trigger array st___prototype190
trigger array st___prototype191
trigger array st___prototype192
trigger array st___prototype193
trigger array st___prototype194
trigger array st___prototype195
trigger array st___prototype196
trigger array st___prototype197
trigger array st___prototype198
trigger array st___prototype199
trigger array st___prototype200
unit f__arg_unit1
location f__arg_location1
location f__arg_location2
real f__arg_real1
real f__arg_real2
group f__arg_group1
effect f__arg_effect1
integer f__arg_integer1
integer f__arg_integer2
player f__arg_player1
string f__arg_string1
string f__arg_string2
boolexpr f__arg_boolexpr1
code f__arg_code1
widget f__arg_widget1
integer f__arg_this

endglobals
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
    native DzGetLocale takes nothing returns string
    native DzGetUnitNeededXP takes unit whichUnit, integer level returns integer
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
    native DzFrameGetHeight takes integer frame returns real
    native DzFrameSetFont takes integer frame, string fileName, real height, integer flag returns nothing
    native DzFrameGetParent takes integer frame returns integer
    native DzFrameSetTextAlignment takes integer frame, integer align returns nothing
    native DzFrameGetName takes integer frame returns string
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
	native EXSetAbilityAEmeDataA takes ability abil, integer unitid returns boolean
	native EXGetItemDataString takes integer itemcode, integer data_type returns string
	native EXSetItemDataString takes integer itemcode, integer data_type, string value returns boolean
	native EXGetEventDamageData takes integer edd_type returns integer
	native EXSetEventDamage takes real amount returns boolean


function sg__MemoryLeakHelper___LocationLeakData_get takes integer i returns location
    if(i<8191) then
        return s__MemoryLeakHelper___LocationLeakData[i]
    elseif(i<32764) then
        if(i<16382) then
            return s__2MemoryLeakHelper___LocationLeakData[i-8191]
        elseif(i<24573) then
            return s__3MemoryLeakHelper___LocationLeakData[i-16382]
        else
            return s__4MemoryLeakHelper___LocationLeakData[i-24573]
        endif
    elseif(i<40955) then
        return s__5MemoryLeakHelper___LocationLeakData[i-32764]
    elseif(i<49146) then
            return s__6MemoryLeakHelper___LocationLeakData[i-40955]
    elseif(i<57337) then
        return s__7MemoryLeakHelper___LocationLeakData[i-49146]
    else
        return s__8MemoryLeakHelper___LocationLeakData[i-57337]
    endif
endfunction

function sg__MemoryLeakHelper___LocationLeakData_set takes integer i,location v returns nothing
    if(i<8191) then
        set s__MemoryLeakHelper___LocationLeakData[i]=v
    elseif(i<32764) then
        if(i<16382) then
            set s__2MemoryLeakHelper___LocationLeakData[i-8191]=v
        elseif(i<24573) then
            set s__3MemoryLeakHelper___LocationLeakData[i-16382]=v
        else
            set s__4MemoryLeakHelper___LocationLeakData[i-24573]=v
        endif
    elseif(i<40955) then
        set s__5MemoryLeakHelper___LocationLeakData[i-32764]=v
    elseif(i<49146) then
            set s__6MemoryLeakHelper___LocationLeakData[i-40955]=v
    elseif(i<57337) then
        set s__7MemoryLeakHelper___LocationLeakData[i-49146]=v
    else
        set s__8MemoryLeakHelper___LocationLeakData[i-57337]=v
    endif
endfunction

function sg__MemoryLeakHelper___LocationDestroyData_get takes integer i returns location
    if(i<8191) then
        return s__MemoryLeakHelper___LocationDestroyData[i]
    elseif(i<32764) then
        if(i<16382) then
            return s__2MemoryLeakHelper___LocationDestroyData[i-8191]
        elseif(i<24573) then
            return s__3MemoryLeakHelper___LocationDestroyData[i-16382]
        else
            return s__4MemoryLeakHelper___LocationDestroyData[i-24573]
        endif
    elseif(i<40955) then
        return s__5MemoryLeakHelper___LocationDestroyData[i-32764]
    elseif(i<49146) then
            return s__6MemoryLeakHelper___LocationDestroyData[i-40955]
    elseif(i<57337) then
        return s__7MemoryLeakHelper___LocationDestroyData[i-49146]
    else
        return s__8MemoryLeakHelper___LocationDestroyData[i-57337]
    endif
endfunction

function sg__MemoryLeakHelper___LocationDestroyData_set takes integer i,location v returns nothing
    if(i<8191) then
        set s__MemoryLeakHelper___LocationDestroyData[i]=v
    elseif(i<32764) then
        if(i<16382) then
            set s__2MemoryLeakHelper___LocationDestroyData[i-8191]=v
        elseif(i<24573) then
            set s__3MemoryLeakHelper___LocationDestroyData[i-16382]=v
        else
            set s__4MemoryLeakHelper___LocationDestroyData[i-24573]=v
        endif
    elseif(i<40955) then
        set s__5MemoryLeakHelper___LocationDestroyData[i-32764]=v
    elseif(i<49146) then
            set s__6MemoryLeakHelper___LocationDestroyData[i-40955]=v
    elseif(i<57337) then
        set s__7MemoryLeakHelper___LocationDestroyData[i-49146]=v
    else
        set s__8MemoryLeakHelper___LocationDestroyData[i-57337]=v
    endif
endfunction

function sg__MemoryLeakHelper___EffectLeakData_get takes integer i returns effect
    if(i<8191) then
        return s__MemoryLeakHelper___EffectLeakData[i]
    elseif(i<32764) then
        if(i<16382) then
            return s__2MemoryLeakHelper___EffectLeakData[i-8191]
        elseif(i<24573) then
            return s__3MemoryLeakHelper___EffectLeakData[i-16382]
        else
            return s__4MemoryLeakHelper___EffectLeakData[i-24573]
        endif
    elseif(i<40955) then
        return s__5MemoryLeakHelper___EffectLeakData[i-32764]
    elseif(i<49146) then
            return s__6MemoryLeakHelper___EffectLeakData[i-40955]
    elseif(i<57337) then
        return s__7MemoryLeakHelper___EffectLeakData[i-49146]
    else
        return s__8MemoryLeakHelper___EffectLeakData[i-57337]
    endif
endfunction

function sg__MemoryLeakHelper___EffectLeakData_set takes integer i,effect v returns nothing
    if(i<8191) then
        set s__MemoryLeakHelper___EffectLeakData[i]=v
    elseif(i<32764) then
        if(i<16382) then
            set s__2MemoryLeakHelper___EffectLeakData[i-8191]=v
        elseif(i<24573) then
            set s__3MemoryLeakHelper___EffectLeakData[i-16382]=v
        else
            set s__4MemoryLeakHelper___EffectLeakData[i-24573]=v
        endif
    elseif(i<40955) then
        set s__5MemoryLeakHelper___EffectLeakData[i-32764]=v
    elseif(i<49146) then
            set s__6MemoryLeakHelper___EffectLeakData[i-40955]=v
    elseif(i<57337) then
        set s__7MemoryLeakHelper___EffectLeakData[i-49146]=v
    else
        set s__8MemoryLeakHelper___EffectLeakData[i-57337]=v
    endif
endfunction

function sg__MemoryLeakHelper___EffectDestroyData_get takes integer i returns effect
    if(i<8191) then
        return s__MemoryLeakHelper___EffectDestroyData[i]
    elseif(i<32764) then
        if(i<16382) then
            return s__2MemoryLeakHelper___EffectDestroyData[i-8191]
        elseif(i<24573) then
            return s__3MemoryLeakHelper___EffectDestroyData[i-16382]
        else
            return s__4MemoryLeakHelper___EffectDestroyData[i-24573]
        endif
    elseif(i<40955) then
        return s__5MemoryLeakHelper___EffectDestroyData[i-32764]
    elseif(i<49146) then
            return s__6MemoryLeakHelper___EffectDestroyData[i-40955]
    elseif(i<57337) then
        return s__7MemoryLeakHelper___EffectDestroyData[i-49146]
    else
        return s__8MemoryLeakHelper___EffectDestroyData[i-57337]
    endif
endfunction

function sg__MemoryLeakHelper___EffectDestroyData_set takes integer i,effect v returns nothing
    if(i<8191) then
        set s__MemoryLeakHelper___EffectDestroyData[i]=v
    elseif(i<32764) then
        if(i<16382) then
            set s__2MemoryLeakHelper___EffectDestroyData[i-8191]=v
        elseif(i<24573) then
            set s__3MemoryLeakHelper___EffectDestroyData[i-16382]=v
        else
            set s__4MemoryLeakHelper___EffectDestroyData[i-24573]=v
        endif
    elseif(i<40955) then
        set s__5MemoryLeakHelper___EffectDestroyData[i-32764]=v
    elseif(i<49146) then
            set s__6MemoryLeakHelper___EffectDestroyData[i-40955]=v
    elseif(i<57337) then
        set s__7MemoryLeakHelper___EffectDestroyData[i-49146]=v
    else
        set s__8MemoryLeakHelper___EffectDestroyData[i-57337]=v
    endif
endfunction

function sg__MemoryLeakHelper___GroupLeakData_get takes integer i returns group
    if(i<8191) then
        return s__MemoryLeakHelper___GroupLeakData[i]
    elseif(i<32764) then
        if(i<16382) then
            return s__2MemoryLeakHelper___GroupLeakData[i-8191]
        elseif(i<24573) then
            return s__3MemoryLeakHelper___GroupLeakData[i-16382]
        else
            return s__4MemoryLeakHelper___GroupLeakData[i-24573]
        endif
    elseif(i<40955) then
        return s__5MemoryLeakHelper___GroupLeakData[i-32764]
    elseif(i<49146) then
            return s__6MemoryLeakHelper___GroupLeakData[i-40955]
    elseif(i<57337) then
        return s__7MemoryLeakHelper___GroupLeakData[i-49146]
    else
        return s__8MemoryLeakHelper___GroupLeakData[i-57337]
    endif
endfunction

function sg__MemoryLeakHelper___GroupLeakData_set takes integer i,group v returns nothing
    if(i<8191) then
        set s__MemoryLeakHelper___GroupLeakData[i]=v
    elseif(i<32764) then
        if(i<16382) then
            set s__2MemoryLeakHelper___GroupLeakData[i-8191]=v
        elseif(i<24573) then
            set s__3MemoryLeakHelper___GroupLeakData[i-16382]=v
        else
            set s__4MemoryLeakHelper___GroupLeakData[i-24573]=v
        endif
    elseif(i<40955) then
        set s__5MemoryLeakHelper___GroupLeakData[i-32764]=v
    elseif(i<49146) then
            set s__6MemoryLeakHelper___GroupLeakData[i-40955]=v
    elseif(i<57337) then
        set s__7MemoryLeakHelper___GroupLeakData[i-49146]=v
    else
        set s__8MemoryLeakHelper___GroupLeakData[i-57337]=v
    endif
endfunction

function sg__MemoryLeakHelper___GroupDestroyData_get takes integer i returns group
    if(i<8191) then
        return s__MemoryLeakHelper___GroupDestroyData[i]
    elseif(i<32764) then
        if(i<16382) then
            return s__2MemoryLeakHelper___GroupDestroyData[i-8191]
        elseif(i<24573) then
            return s__3MemoryLeakHelper___GroupDestroyData[i-16382]
        else
            return s__4MemoryLeakHelper___GroupDestroyData[i-24573]
        endif
    elseif(i<40955) then
        return s__5MemoryLeakHelper___GroupDestroyData[i-32764]
    elseif(i<49146) then
            return s__6MemoryLeakHelper___GroupDestroyData[i-40955]
    elseif(i<57337) then
        return s__7MemoryLeakHelper___GroupDestroyData[i-49146]
    else
        return s__8MemoryLeakHelper___GroupDestroyData[i-57337]
    endif
endfunction

function sg__MemoryLeakHelper___GroupDestroyData_set takes integer i,group v returns nothing
    if(i<8191) then
        set s__MemoryLeakHelper___GroupDestroyData[i]=v
    elseif(i<32764) then
        if(i<16382) then
            set s__2MemoryLeakHelper___GroupDestroyData[i-8191]=v
        elseif(i<24573) then
            set s__3MemoryLeakHelper___GroupDestroyData[i-16382]=v
        else
            set s__4MemoryLeakHelper___GroupDestroyData[i-24573]=v
        endif
    elseif(i<40955) then
        set s__5MemoryLeakHelper___GroupDestroyData[i-32764]=v
    elseif(i<49146) then
            set s__6MemoryLeakHelper___GroupDestroyData[i-40955]=v
    elseif(i<57337) then
        set s__7MemoryLeakHelper___GroupDestroyData[i-49146]=v
    else
        set s__8MemoryLeakHelper___GroupDestroyData[i-57337]=v
    endif
endfunction

//Generated allocator of MemoryLeakHelper___Index
function s__MemoryLeakHelper___Index__allocate takes nothing returns integer
 local integer this=si__MemoryLeakHelper___Index_F
    if (this!=0) then
        set si__MemoryLeakHelper___Index_F=si__MemoryLeakHelper___Index_V[this]
    else
        set si__MemoryLeakHelper___Index_I=si__MemoryLeakHelper___Index_I+1
        set this=si__MemoryLeakHelper___Index_I
    endif
    if (this>8190) then
        return 0
    endif

    set si__MemoryLeakHelper___Index_V[this]=-1
 return this
endfunction

//Generated destructor of MemoryLeakHelper___Index
function s__MemoryLeakHelper___Index_deallocate takes integer this returns nothing
    if this==null then
        return
    elseif (si__MemoryLeakHelper___Index_V[this]!=-1) then
        return
    endif
    set si__MemoryLeakHelper___Index_V[this]=si__MemoryLeakHelper___Index_F
    set si__MemoryLeakHelper___Index_F=this
endfunction

//Generated method caller for MemoryLeakHelper___GTable.onDestroy
function sc__MemoryLeakHelper___GTable_onDestroy takes integer this returns nothing
    set f__arg_this=this
    call TriggerEvaluate(st__MemoryLeakHelper___GTable_onDestroy[2])
endfunction

//Generated allocator of MemoryLeakHelper___GTable
function s__MemoryLeakHelper___GTable__allocate takes nothing returns integer
 local integer this=si__MemoryLeakHelper___GTable_F
    if (this!=0) then
        set si__MemoryLeakHelper___GTable_F=si__MemoryLeakHelper___GTable_V[this]
    else
        set si__MemoryLeakHelper___GTable_I=si__MemoryLeakHelper___GTable_I+1
        set this=si__MemoryLeakHelper___GTable_I
    endif
    if (this>8100) then
        return 0
    endif

    set si__MemoryLeakHelper___GTable_type[this]=2
    set si__MemoryLeakHelper___GTable_V[this]=-1
 return this
endfunction

//Generated destructor of MemoryLeakHelper___GTable
function sc__MemoryLeakHelper___GTable_deallocate takes integer this returns nothing
    if this==null then
        return
    elseif (si__MemoryLeakHelper___GTable_V[this]!=-1) then
        return
    endif
    set f__arg_this=this
    call TriggerEvaluate(st__MemoryLeakHelper___GTable_onDestroy[si__MemoryLeakHelper___GTable_type[this]])
    set si__MemoryLeakHelper___GTable_V[this]=si__MemoryLeakHelper___GTable_F
    set si__MemoryLeakHelper___GTable_F=this
endfunction

//Generated allocator of MemoryLeakHelper___HandleTable
function s__MemoryLeakHelper___HandleTable__allocate takes nothing returns integer
 local integer this=s__MemoryLeakHelper___GTable__allocate()
 local integer kthis
    if(this==0) then
        return 0
    endif
    set si__MemoryLeakHelper___GTable_type[this]=3
    set kthis=this

 return this
endfunction

function sc___prototype181_execute takes integer i,unit a1,location a2,real a3 returns nothing
    set f__arg_unit1=a1
    set f__arg_location1=a2
    set f__arg_real1=a3

    call TriggerExecute(st___prototype181[i])
endfunction
function sc___prototype181_evaluate takes integer i,unit a1,location a2,real a3 returns nothing
    set f__arg_unit1=a1
    set f__arg_location1=a2
    set f__arg_real1=a3

    call TriggerEvaluate(st___prototype181[i])

endfunction
function sc___prototype185_execute takes integer i returns nothing

    call TriggerExecute(st___prototype185[i])
endfunction
function sc___prototype185_evaluate takes integer i returns real

    call TriggerEvaluate(st___prototype185[i])
 return f__result_real
endfunction
function sc___prototype189_execute takes integer i,location a1 returns nothing
    set f__arg_location1=a1

    call TriggerExecute(st___prototype189[i])
endfunction
function sc___prototype189_evaluate takes integer i,location a1 returns nothing
    set f__arg_location1=a1

    call TriggerEvaluate(st___prototype189[i])

endfunction
function sc___prototype190_execute takes integer i,group a1 returns nothing
    set f__arg_group1=a1

    call TriggerExecute(st___prototype190[i])
endfunction
function sc___prototype190_evaluate takes integer i,group a1 returns nothing
    set f__arg_group1=a1

    call TriggerEvaluate(st___prototype190[i])

endfunction
function sc___prototype191_execute takes integer i,effect a1 returns nothing
    set f__arg_effect1=a1

    call TriggerExecute(st___prototype191[i])
endfunction
function sc___prototype191_evaluate takes integer i,effect a1 returns nothing
    set f__arg_effect1=a1

    call TriggerEvaluate(st___prototype191[i])

endfunction
function sc___prototype192_execute takes integer i,location a1,real a2,real a3 returns nothing
    set f__arg_location1=a1
    set f__arg_real1=a2
    set f__arg_real2=a3

    call TriggerExecute(st___prototype192[i])
endfunction
function sc___prototype192_evaluate takes integer i,location a1,real a2,real a3 returns nothing
    set f__arg_location1=a1
    set f__arg_real1=a2
    set f__arg_real2=a3

    call TriggerEvaluate(st___prototype192[i])

endfunction
function sc___prototype193_execute takes integer i,integer a1,integer a2,player a3,location a4,real a5 returns nothing
    set f__arg_integer1=a1
    set f__arg_integer2=a2
    set f__arg_player1=a3
    set f__arg_location1=a4
    set f__arg_real1=a5

    call TriggerExecute(st___prototype193[i])
endfunction
function sc___prototype193_evaluate takes integer i,integer a1,integer a2,player a3,location a4,real a5 returns nothing
    set f__arg_integer1=a1
    set f__arg_integer2=a2
    set f__arg_player1=a3
    set f__arg_location1=a4
    set f__arg_real1=a5

    call TriggerEvaluate(st___prototype193[i])

endfunction
function sc___prototype194_execute takes integer i,unit a1,string a2,location a3 returns nothing
    set f__arg_unit1=a1
    set f__arg_string1=a2
    set f__arg_location1=a3

    call TriggerExecute(st___prototype194[i])
endfunction
function sc___prototype194_evaluate takes integer i,unit a1,string a2,location a3 returns nothing
    set f__arg_unit1=a1
    set f__arg_string1=a2
    set f__arg_location1=a3

    call TriggerEvaluate(st___prototype194[i])

endfunction
function sc___prototype195_execute takes integer i,unit a1,location a2 returns nothing
    set f__arg_unit1=a1
    set f__arg_location1=a2

    call TriggerExecute(st___prototype195[i])
endfunction
function sc___prototype195_evaluate takes integer i,unit a1,location a2 returns nothing
    set f__arg_unit1=a1
    set f__arg_location1=a2

    call TriggerEvaluate(st___prototype195[i])

endfunction
function sc___prototype196_execute takes integer i,real a1,location a2,boolexpr a3 returns nothing
    set f__arg_real1=a1
    set f__arg_location1=a2
    set f__arg_boolexpr1=a3

    call TriggerExecute(st___prototype196[i])
endfunction
function sc___prototype196_evaluate takes integer i,real a1,location a2,boolexpr a3 returns nothing
    set f__arg_real1=a1
    set f__arg_location1=a2
    set f__arg_boolexpr1=a3

    call TriggerEvaluate(st___prototype196[i])

endfunction
function sc___prototype197_execute takes integer i,integer a1,integer a2,player a3,location a4,location a5 returns nothing
    set f__arg_integer1=a1
    set f__arg_integer2=a2
    set f__arg_player1=a3
    set f__arg_location1=a4
    set f__arg_location2=a5

    call TriggerExecute(st___prototype197[i])
endfunction
function sc___prototype197_evaluate takes integer i,integer a1,integer a2,player a3,location a4,location a5 returns nothing
    set f__arg_integer1=a1
    set f__arg_integer2=a2
    set f__arg_player1=a3
    set f__arg_location1=a4
    set f__arg_location2=a5

    call TriggerEvaluate(st___prototype197[i])

endfunction
function sc___prototype198_execute takes integer i,group a1,code a2 returns nothing
    set f__arg_group1=a1
    set f__arg_code1=a2

    call TriggerExecute(st___prototype198[i])
endfunction
function sc___prototype198_evaluate takes integer i,group a1,code a2 returns nothing
    set f__arg_group1=a1
    set f__arg_code1=a2

    call TriggerEvaluate(st___prototype198[i])

endfunction
function sc___prototype199_execute takes integer i,string a1,widget a2,string a3 returns nothing
    set f__arg_string1=a1
    set f__arg_widget1=a2
    set f__arg_string2=a3

    call TriggerExecute(st___prototype199[i])
endfunction
function sc___prototype199_evaluate takes integer i,string a1,widget a2,string a3 returns nothing
    set f__arg_string1=a1
    set f__arg_widget1=a2
    set f__arg_string2=a3

    call TriggerEvaluate(st___prototype199[i])

endfunction
function sc___prototype200_execute takes integer i,location a1,string a2 returns nothing
    set f__arg_location1=a1
    set f__arg_string1=a2

    call TriggerExecute(st___prototype200[i])
endfunction
function sc___prototype200_evaluate takes integer i,location a1,string a2 returns nothing
    set f__arg_location1=a1
    set f__arg_string1=a2

    call TriggerEvaluate(st___prototype200[i])

endfunction
function h__PolarProjectionBJ takes location a0, real a1, real a2 returns location
    //hook: MemoryLeakHelper___PP
    call sc___prototype192_evaluate(1,a0,a1,a2)
return PolarProjectionBJ(a0,a1,a2)
endfunction
function h__CreateNUnitsAtLoc takes integer a0, integer a1, player a2, location a3, real a4 returns group
    //hook: MemoryLeakHelper___CU
    call sc___prototype193_evaluate(1,a0,a1,a2,a3,a4)
return CreateNUnitsAtLoc(a0,a1,a2,a3,a4)
endfunction
function h__CreateNUnitsAtLocFacingLocBJ takes integer a0, integer a1, player a2, location a3, location a4 returns group
    //hook: MemoryLeakHelper___CUF
    call sc___prototype197_evaluate(1,a0,a1,a2,a3,a4)
return CreateNUnitsAtLocFacingLocBJ(a0,a1,a2,a3,a4)
endfunction
function h__IssuePointOrderLocBJ takes unit a0, string a1, location a2 returns boolean
    //hook: MemoryLeakHelper___IPO
    call sc___prototype194_evaluate(1,a0,a1,a2)
return IssuePointOrderLocBJ(a0,a1,a2)
endfunction
function h__SetUnitPositionLoc takes unit a0, location a1 returns nothing
    //hook: MemoryLeakHelper___SUP
    call sc___prototype195_evaluate(1,a0,a1)
call SetUnitPositionLoc(a0,a1)
endfunction
function h__SetUnitFacingToFaceLocTimed takes unit a0, location a1, real a2 returns nothing
    //hook: MemoryLeakHelper___SUF
    call sc___prototype181_evaluate(1,a0,a1,a2)
call SetUnitFacingToFaceLocTimed(a0,a1,a2)
endfunction
function h__GetUnitsInRangeOfLocMatching takes real a0, location a1, boolexpr a2 returns group
    //hook: MemoryLeakHelper___GUR
    call sc___prototype196_evaluate(1,a0,a1,a2)
return GetUnitsInRangeOfLocMatching(a0,a1,a2)
endfunction
function h__RemoveLocation takes location a0 returns nothing
    //hook: MemoryLeakHelper___ReleaseLocation
    call sc___prototype189_evaluate(1,a0)
call RemoveLocation(a0)
endfunction
function h__ForGroupBJ takes group a0, code a1 returns nothing
    //hook: MemoryLeakHelper___FG
    call sc___prototype198_evaluate(1,a0,a1)
call ForGroupBJ(a0,a1)
endfunction
function h__GroupPickRandomUnit takes group a0 returns unit
    //hook: MemoryLeakHelper___CatchGroup
    call sc___prototype190_evaluate(1,a0)
return GroupPickRandomUnit(a0)
endfunction
function h__CountUnitsInGroup takes group a0 returns integer
    //hook: MemoryLeakHelper___CatchGroup
    call sc___prototype190_evaluate(1,a0)
return CountUnitsInGroup(a0)
endfunction
function h__DestroyGroup takes group a0 returns nothing
    //hook: MemoryLeakHelper___ReleaseGroup
    call sc___prototype190_evaluate(2,a0)
call DestroyGroup(a0)
endfunction
function h__AddSpecialEffectLocBJ takes location a0, string a1 returns effect
    //hook: MemoryLeakHelper___ASE
    call sc___prototype200_evaluate(1,a0,a1)
return AddSpecialEffectLocBJ(a0,a1)
endfunction
function h__AddSpecialEffectTargetUnitBJ takes string a0, widget a1, string a2 returns effect
    //hook: MemoryLeakHelper___ASETU
    call sc___prototype199_evaluate(1,a0,a1,a2)
return AddSpecialEffectTargetUnitBJ(a0,a1,a2)
endfunction
function h__DestroyEffect takes effect a0 returns nothing
    //hook: MemoryLeakHelper___ReleaseEffect
    call sc___prototype191_evaluate(1,a0)
call DestroyEffect(a0)
endfunction
function h__DestroyEffectBJ takes effect a0 returns nothing
    //hook: MemoryLeakHelper___ReleaseEffect
    call sc___prototype191_evaluate(1,a0)
call DestroyEffectBJ(a0)
endfunction

//library BzAPI:
    //hardware




























    //plus











    //sync




    //gui








































































    function DzTriggerRegisterMouseEventTrg takes trigger trg,integer status,integer btn returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterMouseEvent(trg, btn, status, true, null)
    endfunction
    function DzTriggerRegisterKeyEventTrg takes trigger trg,integer status,integer btn returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterKeyEvent(trg, btn, status, true, null)
    endfunction
    function DzTriggerRegisterMouseMoveEventTrg takes trigger trg returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterMouseMoveEvent(trg, true, null)
    endfunction
    function DzTriggerRegisterMouseWheelEventTrg takes trigger trg returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterMouseWheelEvent(trg, true, null)
    endfunction
    function DzTriggerRegisterWindowResizeEventTrg takes trigger trg returns nothing
        if trg == null then
            return
        endif
        call DzTriggerRegisterWindowResizeEvent(trg, true, null)
    endfunction
    function DzF2I takes integer i returns integer
        return i
    endfunction
    function DzI2F takes integer i returns integer
        return i
    endfunction
    function DzK2I takes integer i returns integer
        return i
    endfunction
    function DzI2K takes integer i returns integer
        return i
    endfunction

//library BzAPI ends
//library YDTriggerSaveLoadSystem:
    function YDTriggerSaveLoadSystem___Init takes nothing returns nothing
            set YDHT=InitHashtable()
        set YDLOC=InitHashtable()
    endfunction

//library YDTriggerSaveLoadSystem ends
//library YDWEAbilityState:











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

 function YDWEUnitTransform takes unit u,integer abilcode,integer targetid returns nothing
		call UnitAddAbility(u, abilcode)
		call EXSetAbilityDataInteger(EXGetUnitAbility(u, abilcode), 1, YDWEAbilityState___ABILITY_DATA_UNITID, GetUnitTypeId(u))
		call EXSetAbilityAEmeDataA(EXGetUnitAbility(u, abilcode), GetUnitTypeId(u))
		call UnitRemoveAbility(u, abilcode)
		call UnitAddAbility(u, abilcode)
		call EXSetAbilityAEmeDataA(EXGetUnitAbility(u, abilcode), targetid)
		call UnitRemoveAbility(u, abilcode)
	endfunction


 function YDWEGetItemDataString takes integer itemcode,integer data_type returns string
		return EXGetItemDataString(itemcode, data_type)
	endfunction
 function YDWESetItemDataString takes integer itemcode,integer data_type,string value returns boolean
		return EXSetItemDataString(itemcode, data_type, value)
	endfunction

//library YDWEAbilityState ends
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
//两个单位之间的距离
function YDWEDistanceBetweenUnits takes unit a,unit b returns real
    return SquareRoot(( GetUnitX(a) - GetUnitX(b) ) * ( GetUnitX(a) - GetUnitX(b) ) + ( GetUnitY(a) - GetUnitY(b) ) * ( GetUnitY(a) - GetUnitY(b) ))
endfunction
//两个单位之间的角度
function YDWEAngleBetweenUnits takes unit fromUnit,unit toUnit returns real
    return bj_RADTODEG * Atan2(GetUnitY(toUnit) - GetUnitY(fromUnit), GetUnitX(toUnit) - GetUnitX(fromUnit))
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
        exitwhen i >= YDWEBase___AbilityCastingOverEventNumber
        if YDWEBase___AbilityCastingOverEventType[i] == index then
            set bj_lastAbilityCastingUnit=hero
			if YDWEBase___AbilityCastingOverEventQueue[i] != null and TriggerEvaluate(YDWEBase___AbilityCastingOverEventQueue[i]) and IsTriggerEnabled(YDWEBase___AbilityCastingOverEventQueue[i]) then
				call TriggerExecute(YDWEBase___AbilityCastingOverEventQueue[i])
			endif
		endif
        set i=i + 1
    endloop
endfunction
//===========================================================================  
//YDWE技能捕捉事件 
//===========================================================================  
function YDWESyStemAbilityCastingOverRegistTrigger takes trigger trg,integer index returns nothing
	set YDWEBase___AbilityCastingOverEventQueue[YDWEBase___AbilityCastingOverEventNumber]=trg
	set YDWEBase___AbilityCastingOverEventType[YDWEBase___AbilityCastingOverEventNumber]=index
	set YDWEBase___AbilityCastingOverEventNumber=YDWEBase___AbilityCastingOverEventNumber + 1
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
    return YDWEBase___yd_PlayerColor[GetHandleId(GetPlayerColor(p))] + s + "|r"
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
    call DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 30, "|cFF1E90FF当前编辑器版本为： |r|cFF00FF00YDWE 0.0.0.0")
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
	
    set YDWEBase___yd_PlayerColor[0]="|cFFFF0303"
    set YDWEBase___yd_PlayerColor[1]="|cFF0042FF"
    set YDWEBase___yd_PlayerColor[2]="|cFF1CE6B9"
    set YDWEBase___yd_PlayerColor[3]="|cFF540081"
    set YDWEBase___yd_PlayerColor[4]="|cFFFFFC01"
    set YDWEBase___yd_PlayerColor[5]="|cFFFE8A0E"
    set YDWEBase___yd_PlayerColor[6]="|cFF20C000"
    set YDWEBase___yd_PlayerColor[7]="|cFFE55BB0"
    set YDWEBase___yd_PlayerColor[8]="|cFF959697"
    set YDWEBase___yd_PlayerColor[9]="|cFF7EBFF1"
    set YDWEBase___yd_PlayerColor[10]="|cFF106246"
    set YDWEBase___yd_PlayerColor[11]="|cFF4E2A04"
    set YDWEBase___yd_PlayerColor[12]="|cFF282828"
    set YDWEBase___yd_PlayerColor[13]="|cFF282828"
    set YDWEBase___yd_PlayerColor[14]="|cFF282828"
    set YDWEBase___yd_PlayerColor[15]="|cFF282828"
    //=================显示版本=====================
    call YDWEVersion_Init()
endfunction

//library YDWEBase ends
//library YDWEEnumDestructablesInCircleBJFilterNull:
function YDWEEnumDestructablesInCircleBJFilterNull takes nothing returns boolean
    local real dx= GetDestructableX(GetFilterDestructable()) - GetLocationX(bj_enumDestructableCenter)
    local real dy= GetDestructableY(GetFilterDestructable()) - GetLocationY(bj_enumDestructableCenter)
    return dx * dx + dy * dy <= bj_enumDestructableRadius * bj_enumDestructableRadius
endfunction

//library YDWEEnumDestructablesInCircleBJFilterNull ends
//library YDWEEventDamageData:


	
 function YDWEIsEventPhysicalDamage takes nothing returns boolean
		return 0 != EXGetEventDamageData(YDWEEventDamageData___EVENT_DAMAGE_DATA_IS_PHYSICAL)
	endfunction
 function YDWEIsEventAttackDamage takes nothing returns boolean
		return 0 != EXGetEventDamageData(YDWEEventDamageData___EVENT_DAMAGE_DATA_IS_ATTACK)
	endfunction
	
 function YDWEIsEventRangedDamage takes nothing returns boolean
		return 0 != EXGetEventDamageData(YDWEEventDamageData___EVENT_DAMAGE_DATA_IS_RANGED)
	endfunction
	
 function YDWEIsEventDamageType takes damagetype damageType returns boolean
		return damageType == ConvertDamageType(EXGetEventDamageData(YDWEEventDamageData___EVENT_DAMAGE_DATA_DAMAGE_TYPE))
	endfunction
 function YDWEIsEventWeaponType takes weapontype weaponType returns boolean
		return weaponType == ConvertWeaponType(EXGetEventDamageData(YDWEEventDamageData___EVENT_DAMAGE_DATA_WEAPON_TYPE))
	endfunction
	
 function YDWEIsEventAttackType takes attacktype attackType returns boolean
		return attackType == ConvertAttackType(EXGetEventDamageData(YDWEEventDamageData___EVENT_DAMAGE_DATA_ATTACK_TYPE))
	endfunction
	
 function YDWESetEventDamage takes real amount returns boolean
		return EXSetEventDamage(amount)
	endfunction
	
	

//library YDWEEventDamageData ends
//library YDWEGetInventoryIndexOfItemTypeBJNull:
function YDWEGetInventoryIndexOfItemTypeBJNull takes unit whichUnit,integer itemId returns integer
    local integer index= 0
	if itemId != 0 then
		loop
			if GetItemTypeId(UnitItemInSlot(whichUnit, index)) == itemId then
				return index + 1
			endif
			set index=index + 1
			exitwhen index >= bj_MAX_INVENTORY
		endloop
	endif
    return 0
endfunction

//library YDWEGetInventoryIndexOfItemTypeBJNull ends
//library YDWEGetItemOfTypeFromUnitBJNull:
function YDWEGetItemOfTypeFromUnitBJNull takes unit whichUnit,integer itemId returns item
    local integer index= 0
    loop
        set yd_NullTempItem=UnitItemInSlot(whichUnit, index)
        if GetItemTypeId(yd_NullTempItem) == itemId then
            return yd_NullTempItem
        endif
        set index=index + 1
        exitwhen index >= bj_MAX_INVENTORY
    endloop
    return null
endfunction

//library YDWEGetItemOfTypeFromUnitBJNull ends
//library YDWEGetUnitsInRangeOfLocMatchingNull:
function YDWEGetUnitsInRangeOfLocMatchingNull takes real radius,location whichLocation,boolexpr filter returns group
    local group g= CreateGroup()
    call GroupEnumUnitsInRangeOfLoc(g, whichLocation, radius, filter)
    call DestroyBoolExpr(filter)
    set yd_NullTempGroup=g
    set g=null
    return yd_NullTempGroup
endfunction

//library YDWEGetUnitsInRangeOfLocMatchingNull ends
//library YDWEGetUnitsInRectMatchingNull:
function YDWEGetUnitsInRectMatchingNull takes rect r,boolexpr filter returns group
    local group g= CreateGroup()
    call GroupEnumUnitsInRect(g, r, filter)
    call DestroyBoolExpr(filter)
    set yd_NullTempGroup=g
    set g=null
    return yd_NullTempGroup
endfunction

//library YDWEGetUnitsInRectMatchingNull ends
//library YDWEMultiboardSetItemColorBJNull:
function YDWEMultiboardSetItemColorBJNull takes multiboard mb,integer col,integer row,real red,real green,real blue,real transparency returns nothing
    local integer curRow= 0
    local integer curCol= 0
    local integer numRows= MultiboardGetRowCount(mb)
    local integer numCols= MultiboardGetColumnCount(mb)
    local multiboarditem mbitem= null
    // Loop over rows, using 1-based index
    loop
        set curRow=curRow + 1
        exitwhen curRow > numRows
        // Apply setting to the requested row, or all rows (if row is 0)
        if ( row == 0 or row == curRow ) then
            // Loop over columns, using 1-based index
            set curCol=0
            loop
                set curCol=curCol + 1
                exitwhen curCol > numCols
                // Apply setting to the requested column, or all columns (if col is 0)
                if ( col == 0 or col == curCol ) then
                    set mbitem=MultiboardGetItem(mb, curRow - 1, curCol - 1)
                    call MultiboardSetItemValueColor(mbitem, PercentTo255(red), PercentTo255(green), PercentTo255(blue), PercentTo255(100.0 - transparency))
                    call MultiboardReleaseItem(mbitem)
                endif
            endloop
        endif
    endloop
    set mbitem=null
endfunction

//library YDWEMultiboardSetItemColorBJNull ends
//library YDWEMultiboardSetItemValueBJNull:
function YDWEMultiboardSetItemValueBJNull takes multiboard mb,integer col,integer row,string val returns nothing
    local integer curRow= 0
    local integer curCol= 0
    local integer numRows= MultiboardGetRowCount(mb)
    local integer numCols= MultiboardGetColumnCount(mb)
    local multiboarditem mbitem= null
    // Loop over rows, using 1-based index
    loop
        set curRow=curRow + 1
        exitwhen curRow > numRows
        // Apply setting to the requested row, or all rows (if row is 0)
        if ( row == 0 or row == curRow ) then
            // Loop over columns, using 1-based index
            set curCol=0
            loop
                set curCol=curCol + 1
                exitwhen curCol > numCols
                // Apply setting to the requested column, or all columns (if col is 0)
                if ( col == 0 or col == curCol ) then
                    set mbitem=MultiboardGetItem(mb, curRow - 1, curCol - 1)
                    call MultiboardSetItemValue(mbitem, val)
                    call MultiboardReleaseItem(mbitem)
                endif
            endloop
        endif
    endloop
    set mbitem=null
endfunction

//library YDWEMultiboardSetItemValueBJNull ends
//library YDWEPlaySoundNull:
function YDWEPlaySoundNull takes string soundName returns nothing
    local sound soundHandle= CreateSound(soundName, false, false, true, 12700, 12700, "")
    call StartSound(soundHandle)
    call KillSoundWhenDone(soundHandle)
    set soundHandle=null
endfunction

//library YDWEPlaySoundNull ends
//library YDWESetUnitFacingToFaceLocTimedNull:
function YDWESetUnitFacingToFaceLocTimedNull takes unit whichUnit,location target,real duration returns nothing
    local location unitLoc= GetUnitLoc(whichUnit)
    call SetUnitFacingTimed(whichUnit, AngleBetweenPoints(unitLoc, target), duration)
    call h__RemoveLocation(unitLoc)
    set unitLoc=null
endfunction

//library YDWESetUnitFacingToFaceLocTimedNull ends
//library YDWETriggerEvent:
	
//===========================================================================  
//���ⵥλ�˺��¼� 
//===========================================================================
function YDWEAnyUnitDamagedTriggerAction takes nothing returns nothing
    local integer i= 0
    
    loop
        exitwhen i >= YDWETriggerEvent__DamageEventNumber
        if YDWETriggerEvent__DamageEventQueue[i] != null and IsTriggerEnabled(YDWETriggerEvent__DamageEventQueue[i]) and TriggerEvaluate(YDWETriggerEvent__DamageEventQueue[i]) then
            call TriggerExecute(YDWETriggerEvent__DamageEventQueue[i])
        endif
        set i=i + 1
    endloop
endfunction
function YDWEAnyUnitDamagedFilter takes nothing returns boolean
    if GetUnitAbilityLevel(GetFilterUnit(), 'Aloc') <= 0 then
        call TriggerRegisterUnitEvent(yd_DamageEventTrigger, GetFilterUnit(), EVENT_UNIT_DAMAGED)
    endif
    return false
endfunction
function YDWEAnyUnitDamagedEnumUnit takes nothing returns nothing
    local trigger t= CreateTrigger()
    local region r= CreateRegion()
    local group g= CreateGroup()
    call RegionAddRect(r, GetWorldBounds())
    call TriggerRegisterEnterRegion(t, r, Condition(function YDWEAnyUnitDamagedFilter))
    call GroupEnumUnitsInRect(g, GetWorldBounds(), Condition(function YDWEAnyUnitDamagedFilter))
    call h__DestroyGroup(g)
    set r=null
    set t=null
    set g=null
endfunction
	
function YDWESyStemAnyUnitDamagedRegistTrigger takes trigger trg returns nothing
    if trg == null then
        return
    endif
        
    if YDWETriggerEvent__DamageEventNumber == 0 then
        set yd_DamageEventTrigger=CreateTrigger()
        call TriggerAddAction(yd_DamageEventTrigger, function YDWEAnyUnitDamagedTriggerAction)
        call YDWEAnyUnitDamagedEnumUnit()
    endif
    
    set YDWETriggerEvent__DamageEventQueue[YDWETriggerEvent__DamageEventNumber]=trg
    set YDWETriggerEvent__DamageEventNumber=YDWETriggerEvent__DamageEventNumber + 1
endfunction
//===========================================================================  
//�ƶ���Ʒ�¼� 
//===========================================================================  
function YDWESyStemItemUnmovableTriggerAction takes nothing returns nothing
    local integer i= 0
    
    if GetIssuedOrderId() >= 852002 and GetIssuedOrderId() <= 852007 then
		set bj_lastMovedItemInItemSlot=GetOrderTargetItem()
    	loop
        	exitwhen i >= YDWETriggerEvent__MoveItemEventNumber
        	if YDWETriggerEvent__MoveItemEventQueue[i] != null and IsTriggerEnabled(YDWETriggerEvent__MoveItemEventQueue[i]) and TriggerEvaluate(YDWETriggerEvent__MoveItemEventQueue[i]) then
        	    call TriggerExecute(YDWETriggerEvent__MoveItemEventQueue[i])
        	endif
        	set i=i + 1
    	endloop
	endif
endfunction
function YDWESyStemItemUnmovableRegistTrigger takes trigger trg returns nothing
    if trg == null then
        return
    endif
        
    if YDWETriggerEvent__MoveItemEventNumber == 0 then
        set YDWETriggerEvent__MoveItemEventTrigger=CreateTrigger()
        call TriggerAddAction(YDWETriggerEvent__MoveItemEventTrigger, function YDWESyStemItemUnmovableTriggerAction)
        call TriggerRegisterAnyUnitEventBJ(YDWETriggerEvent__MoveItemEventTrigger, EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER)
    endif
    
    set YDWETriggerEvent__MoveItemEventQueue[YDWETriggerEvent__MoveItemEventNumber]=trg
    set YDWETriggerEvent__MoveItemEventNumber=YDWETriggerEvent__MoveItemEventNumber + 1
endfunction
function GetLastMovedItemInItemSlot takes nothing returns item
    return bj_lastMovedItemInItemSlot
endfunction

//library YDWETriggerEvent ends
//library MeatHook:
//****************************//
//* ����-���� Fetrix_sai���� *//
//****************************//
    
    function MeatHook___GetUnitZ takes unit u returns real
        call MoveLocation(MeatHook___Point, GetUnitX(u), GetUnitY(u))
        return ( GetUnitFlyHeight(u) + GetLocationZ(MeatHook___Point) )
    endfunction
    
    function MeatHook___HookAim takes string key,unit pudge,real x,real y,real z returns nothing
        local real damage= (LoadReal(YDHT, StringHash((key )), StringHash(( "Damage")))) // INLINED!!
        local group g= CreateGroup()
        local unit f= null
        call GroupEnumUnitsInRange(g, x, y, 120., null)
        loop
            set f=FirstOfGroup(g)
            exitwhen f == null
            if GetWidgetLife(f) > 0.405 and not ( IsUnitType(f, UNIT_TYPE_STRUCTURE) ) and not ( IsUnitInGroup(f, MeatHook___Except) ) and f != pudge then
                if ( GetUnitX(f) - x ) * ( GetUnitX(f) - x ) + ( GetUnitY(f) - y ) * ( GetUnitY(f) - y ) + ( MeatHook___GetUnitZ(f) - z ) * ( MeatHook___GetUnitZ(f) - z ) < 14400 then
                    //* ���ұ����ӹ����ˣ�ʹ��غ���һ��������~��
                    set bj_lastAbilityTargetUnit=f
                    call YDWESyStemAbilityCastingOverTriggerAction(pudge , 4)
                    call SaveInteger(YDHT, StringHash((key )), StringHash(( "Switch" )), ( 2)) // INLINED!!
                    call SaveUnitHandle(YDHT, StringHash((key )), StringHash(( "Target" )), ( f)) // INLINED!!
                    if IsUnitEnemy(f, GetOwningPlayer(pudge)) then
                        call h__DestroyEffect(AddSpecialEffectTarget("Objects\\Spawnmodels\\Human\\HumanBlood\\BloodElfSpellThiefBlood.mdl", f, "origin"))
                        call UnitDamageTarget(pudge, f, damage, true, false, bj_lastSetAttackType, bj_lastSetDamageType, bj_lastSetWeaponType)
                    endif
                    call IssueImmediateOrderById(f, 851972)
                    call GroupAddUnit(MeatHook___Except, f)
                    exitwhen true
                endif
            endif
            call GroupRemoveUnit(g, f)
            set f=null
        endloop
        call h__DestroyGroup(g)
        set g=null
        set f=null
    endfunction
    
    function MeatHook___Cycle takes nothing returns nothing
        local string key= I2S((GetHandleId((GetExpiredTimer())))) // INLINED!!
        local integer total= (LoadInteger(YDHT, StringHash((key )), StringHash(( "ChainLinkNumber")))) // INLINED!!
        local integer size= (LoadInteger(YDHT, StringHash((key )), StringHash(( "ChainLinkNumberMax")))) // INLINED!!
        local integer utid= (LoadInteger(YDHT, StringHash((key )), StringHash(( "ChainLinkId")))) // INLINED!!
        local integer switch= (LoadInteger(YDHT, StringHash((key )), StringHash(( "Switch")))) // INLINED!!
        local unit pudge= (LoadUnitHandle(YDHT, StringHash((key )), StringHash(( "Pudge")))) // INLINED!!
        local unit target= (LoadUnitHandle(YDHT, StringHash((key )), StringHash(( "Target")))) // INLINED!!
        local real dist= (LoadReal(YDHT, StringHash((key )), StringHash(( "Distance")))) // INLINED!!
        local real l
        local real f
        local real x
        local real y
        local real xvel
        local real yvel
        local unit array part
        local integer i= 0
        
        loop
            exitwhen i == total
            set part[i]=(LoadUnitHandle(YDHT, StringHash((key )), StringHash(( "ChainLinks" + I2S(i))))) // INLINED!!
            set i=i + 1
        endloop
        
        //*===== Hook Target =====*
        if target == null then
            call MeatHook___HookAim(key , pudge , GetUnitX(part[0]) , GetUnitY(part[0]) , MeatHook___GetUnitZ(part[0]))
        else
            call SetUnitX(target, GetUnitX(part[0]))
            call SetUnitY(target, GetUnitY(part[0]))
            if GetLocalPlayer() == GetOwningPlayer(target) then
                call SelectUnit(target, false)
            endif
        endif
        
        //*===== Stretch =====*
        if switch == 1 then
            //*===== Chain Head =====*
            set x=GetUnitX(part[0]) + (LoadReal(YDHT, StringHash((key )), StringHash(( "VelocityX")))) // INLINED!!
            set y=GetUnitY(part[0]) + (LoadReal(YDHT, StringHash((key )), StringHash(( "VelocityY")))) // INLINED!!
            call SetUnitX(part[0], x)
            call SetUnitY(part[0], y)
            //call SetUnitFacing(part[i], YDWEGetRealByString(key, "Face"))
            if (RMinBJ(RMaxBJ(((x)*1.0), yd_MapMinX), yd_MapMaxX)) != x or (RMinBJ(RMaxBJ(((y)*1.0), yd_MapMinY), yd_MapMaxY)) != y then // INLINED!!
                call SaveInteger(YDHT, StringHash((key )), StringHash(( "Switch" )), ( 2)) // INLINED!!
            endif
            //*===== Chain Links =====*
            set i=1
            loop
                exitwhen i == total
                set f=Atan2(GetUnitY(part[i - 1]) - GetUnitY(part[i]), GetUnitX(part[i - 1]) - GetUnitX(part[i]))
                call SetUnitX(part[i], GetUnitX(part[i]) + Cos(f) * 40.0)
                call SetUnitY(part[i], GetUnitY(part[i]) + Sin(f) * 40.0)
                call SetUnitFacing(part[i], f * bj_RADTODEG)
                set i=i + 1
            endloop
        elseif switch == 2 then
            set l=( 50.0 + 40.0 ) * ( 50.0 + 40.0 )
            set i=total - 1
            //*===== Move Back =====*
            loop
                exitwhen i < 0
                if part[i + 1] == null then
                    set xvel=GetUnitX(part[i]) - GetUnitX(pudge)
                    set yvel=GetUnitY(part[i]) - GetUnitY(pudge)
                    if xvel * xvel + yvel * yvel <= l then
                        call RemoveUnit(part[i])
                        set part[i]=null
                        set total=total - 1
                        call SaveInteger(YDHT, StringHash((key )), StringHash(( "ChainLinkNumber" )), ( total)) // INLINED!!
                    endif
                else
                    set xvel=GetUnitX(part[i]) - GetUnitX(part[i + 1])
                    set yvel=GetUnitY(part[i]) - GetUnitY(part[i + 1])
                endif
                
                if part[i] != null then
                    set f=Atan2(yvel, xvel)
                    call SetUnitX(part[i], GetUnitX(part[i]) - Cos(f) * 40.0)
                    call SetUnitY(part[i], GetUnitY(part[i]) - Sin(f) * 40.0)
                    call SetUnitFacing(part[i], f * bj_RADTODEG)
                endif
                
                set i=i - 1
            endloop
            if total < 1 then
                call SaveInteger(YDHT, StringHash((key )), StringHash(( "Switch" )), ( 0)) // INLINED!!
                set switch=0
            endif
        endif
               
        //*===== Fill Chain =====*
        if switch > 0 then
            set x=GetUnitX(part[total - 1])
            set y=GetUnitY(part[total - 1])
            set xvel=x - GetUnitX(pudge)
            set yvel=y - GetUnitY(pudge)
            set l=SquareRoot(xvel * xvel + yvel * yvel)
            
            if l > dist + 50.0 then
                set f=bj_RADTODEG * Atan2(yvel, xvel)
                set xvel=xvel * ( dist / l )
                set yvel=yvel * ( dist / l )
                loop
                    exitwhen l < dist
                    if total > size then
                        call SaveInteger(YDHT, StringHash((key )), StringHash(( "Switch" )), ( 2)) // INLINED!!
                        exitwhen true
                    endif
                    set x=x - xvel
                    set y=y - yvel
                    set part[total]=CreateUnit(GetOwningPlayer(pudge), utid, x, y, f)
                    call SaveUnitHandle(YDHT, StringHash((key )), StringHash(( "ChainLinks" + I2S(total) )), ( part[total])) // INLINED!!
                    set total=total + 1
                    set l=l - dist
                endloop
                call SaveInteger(YDHT, StringHash((key )), StringHash(( "ChainLinkNumber" )), ( total)) // INLINED!!
            endif
            
            if l > 50.0 + 40.0 * 2 then
                set l=( 50.0 + 40.0 ) / dist
                set xvel=xvel * l
                set yvel=yvel * l
                call SetUnitX(part[total - 1], GetUnitX(pudge) + xvel)
                call SetUnitY(part[total - 1], GetUnitY(pudge) + yvel)
                call SetUnitFacing(part[total - 1], Atan2(yvel, xvel) * bj_RADTODEG)
                
                set i=total - 2
                loop
                    exitwhen i < 0
                    set xvel=GetUnitX(part[i]) - GetUnitX(part[i + 1])
                    set yvel=GetUnitY(part[i]) - GetUnitY(part[i + 1])
                    set l=dist / SquareRoot(xvel * xvel + yvel * yvel)
                    call SetUnitX(part[i], GetUnitX(part[i + 1]) + xvel * l)
                    call SetUnitY(part[i], GetUnitY(part[i + 1]) + yvel * l)
                    call SetUnitFacing(part[i], Atan2(yvel, xvel) * bj_RADTODEG)
                    set i=i - 1
                endloop
            endif
        endif
        
        //*===== Release =====*
        if switch == 0 then
            call YDWESyStemAbilityCastingOverTriggerAction(pudge , 5)
            call FlushChildHashtable(YDHT, StringHash((key))) // INLINED!!
            call GroupRemoveUnit(MeatHook___Except, target)
            call PauseTimer(GetExpiredTimer())
            call DestroyTimer(GetExpiredTimer())
        endif
        
        set i=0
        loop
            exitwhen i >= total
            set part[i]=null
            set i=i + 1
        endloop
        
        set target=null
        set pudge=null
        set key=""
    endfunction
    
    function YDWEMeatHook takes unit pudge,location point,integer headid,integer chainid,real length,real distance,real damage,real timeout returns nothing
        local real f= Atan2(GetLocationY(point) - GetUnitY(pudge), GetLocationX(point) - GetUnitX(pudge))
        local real x= Cos(f) * 50.0
        local real y= Sin(f) * 50.0
        local unit u= CreateUnit(GetOwningPlayer(pudge), headid, GetUnitX(pudge) + x, GetUnitY(pudge) + y, f * bj_RADTODEG)
        local timer t= CreateTimer()
        // *===== Save =====*
        call SaveUnitHandle(YDHT, StringHash((I2S((GetHandleId((t)))) )), StringHash(( "Pudge" )), ( pudge)) // INLINED!!
        call SaveUnitHandle(YDHT, StringHash((I2S((GetHandleId((t)))) )), StringHash(( "ChainLinks" + I2S(0) )), ( u)) // INLINED!!
        call SaveReal(YDHT, StringHash((I2S((GetHandleId((t)))) )), StringHash(( "VelocityX" )), (( x * ( 40.0 / 50.0 ))*1.0)) // INLINED!!
        call SaveReal(YDHT, StringHash((I2S((GetHandleId((t)))) )), StringHash(( "VelocityY" )), (( y * ( 40.0 / 50.0 ))*1.0)) // INLINED!!
        call SaveReal(YDHT, StringHash((I2S((GetHandleId((t)))) )), StringHash(( "Face" )), (( f * bj_RADTODEG)*1.0)) // INLINED!!
        call SaveReal(YDHT, StringHash((I2S((GetHandleId((t)))) )), StringHash(( "Distance" )), (( distance)*1.0)) // INLINED!!
        call SaveInteger(YDHT, StringHash((I2S((GetHandleId((t)))) )), StringHash(( "Switch" )), ( 1)) // INLINED!!
	    call SaveInteger(YDHT, StringHash((I2S((GetHandleId((t)))) )), StringHash(( "ChainLinkId" )), ( chainid)) // INLINED!!
	    call SaveInteger(YDHT, StringHash((I2S((GetHandleId((t)))) )), StringHash(( "ChainLinkNumberMax" )), ( R2I(length / distance))) // INLINED!!
        call SaveInteger(YDHT, StringHash((I2S((GetHandleId((t)))) )), StringHash(( "ChainLinkNumber" )), ( 1)) // INLINED!!
	    call SaveReal(YDHT, StringHash((I2S((GetHandleId((t)))) )), StringHash(( "Damage" )), (( damage)*1.0)) // INLINED!!
	    call TimerStart(t, timeout, true, function MeatHook___Cycle)
        // *===== end =====*
        set u=null
        set t=null
    endfunction

//library MeatHook ends
//library MemoryLeakHelper:
    
    function MemoryLeakHelper___GetElapsedGameTime takes nothing returns real
        return MemoryLeakHelper___GameTime + TimerGetElapsed(MemoryLeakHelper___GameTimeTimer)
    endfunction
    
    function MemoryLeakHelper___UpdateGameTime takes nothing returns nothing
        set MemoryLeakHelper___GameTime=MemoryLeakHelper___GameTime + MemoryLeakHelper___GAMETIME_TIMER_INTERVAL
    endfunction
  function s__MemoryLeakHelper___Index_DestroyHashes takes nothing returns nothing
   local real gt= (1)
   local integer ind
			
			// Well, due to the nature of this system, the looking of the code sucks.
			loop
				exitwhen MemoryLeakHelper___HashNumber == 0
				if gt - MemoryLeakHelper___CreationTime[MemoryLeakHelper___HashNumber] > MemoryLeakHelper___HASH_DECAY_TIME then
					set ind=MemoryLeakHelper___HashHash[MemoryLeakHelper___HashNumber]
					call s__MemoryLeakHelper___Index_deallocate(ind)
					call RemoveSavedInteger(YDHT, (MemoryLeakHelper___key ), ( MemoryLeakHelper___HashData[MemoryLeakHelper___HashNumber])) // INLINED!!
				else
					set MemoryLeakHelper___TempHashNumber=MemoryLeakHelper___TempHashNumber + 1
					set MemoryLeakHelper___TempHashData[MemoryLeakHelper___TempHashNumber]=MemoryLeakHelper___HashData[MemoryLeakHelper___HashNumber]
					set MemoryLeakHelper___TempHashHash[MemoryLeakHelper___TempHashNumber]=MemoryLeakHelper___HashHash[MemoryLeakHelper___HashNumber]
					set MemoryLeakHelper___TempHashPlace[MemoryLeakHelper___TempHashNumber]=MemoryLeakHelper___HashPlace[MemoryLeakHelper___HashNumber]
					set MemoryLeakHelper___TempCreationTime[MemoryLeakHelper___TempHashNumber]=MemoryLeakHelper___CreationTime[MemoryLeakHelper___HashNumber]
				endif
				set MemoryLeakHelper___HashData[MemoryLeakHelper___HashNumber]=0
				set MemoryLeakHelper___HashHash[MemoryLeakHelper___HashNumber]=0
				set MemoryLeakHelper___HashPlace[MemoryLeakHelper___HashNumber]=0
				set MemoryLeakHelper___CreationTime[MemoryLeakHelper___HashNumber]=0.
				set MemoryLeakHelper___HashNumber=MemoryLeakHelper___HashNumber - 1
			endloop
			
			loop
				exitwhen MemoryLeakHelper___TempHashNumber == 0
				set MemoryLeakHelper___HashNumber=MemoryLeakHelper___HashNumber + 1
				set MemoryLeakHelper___HashData[MemoryLeakHelper___HashNumber]=MemoryLeakHelper___TempHashData[MemoryLeakHelper___TempHashNumber]
				set MemoryLeakHelper___HashHash[MemoryLeakHelper___HashNumber]=MemoryLeakHelper___TempHashHash[MemoryLeakHelper___TempHashNumber]
				set MemoryLeakHelper___HashPlace[MemoryLeakHelper___HashNumber]=MemoryLeakHelper___TempHashPlace[MemoryLeakHelper___TempHashNumber]
				set MemoryLeakHelper___TempHashData[MemoryLeakHelper___TempHashNumber]=0
				set MemoryLeakHelper___TempHashNumber=MemoryLeakHelper___TempHashNumber - 1
			endloop
			
  endfunction
	
        function s__MemoryLeakHelper___Index_GetHash takes integer value returns integer
            local integer int= (LoadInteger(YDHT, (MemoryLeakHelper___key ), ( value))) // INLINED!!
            
            if int == 0 then
                set int=s__MemoryLeakHelper___Index__allocate()
                call SaveInteger(YDHT, (MemoryLeakHelper___key ), ( value ), ( int)) // INLINED!!
                
                set MemoryLeakHelper___HashNumber=MemoryLeakHelper___HashNumber + 1
                set MemoryLeakHelper___HashPlace[int]=MemoryLeakHelper___HashNumber
                set MemoryLeakHelper___HashData[MemoryLeakHelper___HashNumber]=value
                set MemoryLeakHelper___HashHash[MemoryLeakHelper___HashNumber]=int
                set MemoryLeakHelper___CreationTime[MemoryLeakHelper___HashNumber]=(MemoryLeakHelper___GameTime + TimerGetElapsed(MemoryLeakHelper___GameTimeTimer)) // INLINED!!
                
                if MemoryLeakHelper___HashNumber >= MemoryLeakHelper___CLEAR_HASH_COUNT then
                    call s__MemoryLeakHelper___Index_DestroyHashes()
                endif
            endif
            
            set MemoryLeakHelper___LastHashedValue=value
            set MemoryLeakHelper___LastIndex=int
            
            return int
        endfunction
        function s__MemoryLeakHelper___GTable_reset takes integer this returns nothing
			call FlushChildHashtable(YDHT, (0)) // INLINED!!
            call FlushChildHashtable(YDHT, ((this))) // INLINED!!
        endfunction
        function s__MemoryLeakHelper___GTable_onDestroy takes integer this returns nothing
            call s__MemoryLeakHelper___GTable_reset(this)
        endfunction
	
function s__MemoryLeakHelper___HandleTable__getindex takes integer this,handle l__MemoryLeakHelper___key returns integer
            return (LoadInteger(YDHT, ((this) ), ( (GetHandleId((l__MemoryLeakHelper___key)))))) // INLINED!!
        endfunction
function s__MemoryLeakHelper___HandleTable__setindex takes integer this,handle l__MemoryLeakHelper___key,integer value returns nothing
            call SaveInteger(YDHT, ((this) ), ( (GetHandleId((l__MemoryLeakHelper___key))) ), ( value)) // INLINED!!
        endfunction
function s__MemoryLeakHelper___HandleTable_flush takes integer this,handle l__MemoryLeakHelper___key returns nothing
            call RemoveSavedInteger(YDHT, ((this) ), ( (GetHandleId((l__MemoryLeakHelper___key))))) // INLINED!!
        endfunction
function s__MemoryLeakHelper___HandleTable_exists takes integer this,handle l__MemoryLeakHelper___key returns boolean
            return (HaveSavedInteger(YDHT, ((this) ), ( (GetHandleId((l__MemoryLeakHelper___key)))))) // INLINED!!
        endfunction
        function s__MemoryLeakHelper___HandleTable_flush2D takes string firstkey returns nothing
            call s__MemoryLeakHelper___GTable_reset((- (StringHash((firstkey))))) // INLINED!!
        endfunction
        function s__MemoryLeakHelper___HandleTable__staticgetindex takes string firstkey returns integer
            return (- (StringHash((firstkey)))) // INLINED!!
        endfunction
//===========================================================================
// Trigger: MemoryLeakHelper
//
//     //hook GetLocationX CatchLocation
//     //hook GetLocationY CatchLocation  
//      //hook ForGroup FG
// 129k
// 3,02 + 43,32 + 697,86
// 744
//===========================================================================
    
    
    
    function YDWEMemoryLeakHelperGetLastCaughtHandle takes nothing returns handle
        return MemoryLeakHelper___LastCaught
    endfunction
    
    function YDWEMemoryLeakHelperProtectHandle takes handle h returns nothing
        call SaveInteger(YDHT, (((MemoryLeakHelper___IsSaved)) ), ( (GetHandleId(((h)))) ), ( ( 1))) // INLINED!!
    endfunction
    
    function YDWEMemoryLeakHelperProtectVariable takes handle h returns nothing
        call SaveInteger(YDHT, (((MemoryLeakHelper___IsSaved)) ), ( (GetHandleId(((h)))) ), ( ( 1))) // INLINED!!
    endfunction
    function MemoryLeakHelper___EnableMMH takes nothing returns nothing
        set MemoryLeakHelper___Disabled=false
    endfunction
    function YDWEMemoryLeakHelperDelayMMH takes nothing returns nothing
        set MemoryLeakHelper___Disabled=true
        call TimerStart(MemoryLeakHelper___DelayTimer, 0.00, false, function MemoryLeakHelper___EnableMMH)
    endfunction
    
    function YDWEMemoryLeakHelperDisplayLeaks takes nothing returns nothing
        local location loc=null
        if MemoryLeakHelper___IsDisplayMemoryLeakHelper == false then
            call h__CreateNUnitsAtLoc(1, 'hfoo', Player(15), GetRectCenter(GetPlayableMapRect()), bj_UNIT_FACING)
            call RemoveUnit(bj_lastCreatedUnit)
            set loc=GetRectCenter(GetPlayableMapRect())
            call h__CreateNUnitsAtLoc(1, 'hfoo', Player(15), loc, bj_UNIT_FACING)
            call RemoveUnit(bj_lastCreatedUnit)
            call h__RemoveLocation(loc)
            set loc=null
            set MemoryLeakHelper___IsDisplayMemoryLeakHelper=true
        endif
        call ClearTextMessages()
        call BJDebugMsg("======= 自动排泄系统 =======")
        call BJDebugMsg("排除的泄漏" + I2S(MemoryLeakHelper___DestroyedLeaks))
        call BJDebugMsg("用户手动排除的泄漏" + I2S(MemoryLeakHelper___DestroyedLeaksUser))
        call BJDebugMsg("系统排泄比例: " + R2S(I2R(MemoryLeakHelper___DestroyedLeaks) / I2R(MemoryLeakHelper___DestroyedLeaks + MemoryLeakHelper___DestroyedLeaksUser) * 100.) + "%")
        call BJDebugMsg("作者排泄比例" + R2S(I2R(MemoryLeakHelper___DestroyedLeaksUser) / I2R(MemoryLeakHelper___DestroyedLeaks + MemoryLeakHelper___DestroyedLeaksUser) * 100.) + "%")
        call BJDebugMsg("下次排除的泄漏" + I2S(MemoryLeakHelper___MIN_LEAK_NUMBER - MemoryLeakHelper___CaughtLeaks))
        call BJDebugMsg(" === 待排除的泄漏 === ")
        call BJDebugMsg("   单位组泄漏" + I2S(MemoryLeakHelper___GroupDestroyCount))
        call BJDebugMsg("   点泄漏" + I2S(MemoryLeakHelper___LocationDestroyCount))
        call BJDebugMsg("   特效泄漏: " + I2S(MemoryLeakHelper___EffectDestroyCount))
        call BJDebugMsg(" === 还未排除的泄漏=== ")
        call BJDebugMsg("   单位组泄漏" + I2S(MemoryLeakHelper___CaughtGroupLeaks))
        call BJDebugMsg("   点泄漏" + I2S(MemoryLeakHelper___CaughtLocationLeaks))
        call BJDebugMsg("   特效泄漏: " + I2S(MemoryLeakHelper___CaughtEffectLeaks))
        call BJDebugMsg("下次排泄时间: " + I2S(R2I(TimerGetRemaining(MemoryLeakHelper___PassTimer) + 0.5)) + " seconds.")
        call BJDebugMsg("======= 自动排泄系统 =======")
        call BJDebugMsg("排除泄漏" + I2S(MemoryLeakHelper___DestroyedLeaks))
        //if DISPLAY_SAVED_MEMORY then
            call BJDebugMsg("自动排泄系统释放的总内存为 " + R2S(MemoryLeakHelper___SavedMemory) + " kb.")
        //endif
        call BJDebugMsg("================================")
    endfunction
    
    function MemoryLeakHelper___GroupGetMemoryUsageEnum takes nothing returns nothing
        set MemoryLeakHelper___LastCheckedGroupMemoryUsage=MemoryLeakHelper___LastCheckedGroupMemoryUsage + MemoryLeakHelper___GROUP_UNIT_MEMORY_USAGE
    endfunction
    
    function MemoryLeakHelper___GroupGetMemoryUsage takes group g returns real
        set MemoryLeakHelper___LastCheckedGroupMemoryUsage=0.
        call ForGroup(g, function MemoryLeakHelper___GroupGetMemoryUsageEnum)
        return MemoryLeakHelper___LastCheckedGroupMemoryUsage + MemoryLeakHelper___GROUP_MEMORY_USAGE
    endfunction
    	
 function MemoryLeakHelper___CatchLocation takes location l returns nothing
        set MemoryLeakHelper___LastCaught=l
        
        if MemoryLeakHelper___Disabled then
            return
        elseif MemoryLeakHelper___CaughtLocationLeaks == MemoryLeakHelper___MAX_LEAK_INSTANCES then
            return
        endif
        
        if (HaveSavedInteger(YDHT, (((MemoryLeakHelper___IndexData)) ), ( (GetHandleId(((l))))))) == false then // INLINED!!
            //call BJDebugMsg("Caught Location")
            set MemoryLeakHelper___CaughtLocationLeaks=MemoryLeakHelper___CaughtLocationLeaks + 1
            call sg__MemoryLeakHelper___LocationLeakData_set(MemoryLeakHelper___CaughtLocationLeaks,l)
            call SaveInteger(YDHT, (((MemoryLeakHelper___IndexData)) ), ( (GetHandleId(((l)))) ), ( ( MemoryLeakHelper___CaughtLocationLeaks))) // INLINED!!
        endif
    endfunction
    
    function MemoryLeakHelper___AddToLocationDestroyQueue takes location l returns nothing
        set MemoryLeakHelper___LocationDestroyCount=MemoryLeakHelper___LocationDestroyCount + 1
        call sg__MemoryLeakHelper___LocationDestroyData_set(MemoryLeakHelper___LocationDestroyCount,l)
        call SaveInteger(YDHT, (((MemoryLeakHelper___IndexData)) ), ( (GetHandleId(((l)))) ), ( ( MemoryLeakHelper___LocationDestroyCount * - 1))) // Put his to negative, so we know that this is used in the DestroyQueue now. // INLINED!!
endfunction
    
    function MemoryLeakHelper___ReleaseLocation takes location l returns nothing
        local integer index
        if MemoryLeakHelper___IsDestroying == false and (HaveSavedInteger(YDHT, (((MemoryLeakHelper___IndexData)) ), ( (GetHandleId(((l))))))) then // INLINED!!
            set index=(LoadInteger(YDHT, (((MemoryLeakHelper___IndexData)) ), ( (GetHandleId(((l))))))) // INLINED!!
            // If this is true, the index wasn't put to a destroy queue yet.
            if index > 0 then
                call sg__MemoryLeakHelper___LocationLeakData_set(index,sg__MemoryLeakHelper___LocationLeakData_get(MemoryLeakHelper___CaughtLocationLeaks))
                set MemoryLeakHelper___CaughtLocationLeaks=MemoryLeakHelper___CaughtLocationLeaks - 1
            else
                set index=index * - 1
                call sg__MemoryLeakHelper___LocationDestroyData_set(index,sg__MemoryLeakHelper___LocationDestroyData_get(MemoryLeakHelper___LocationDestroyCount))
                set MemoryLeakHelper___LocationDestroyCount=MemoryLeakHelper___LocationDestroyCount - 1
            endif
            call RemoveSavedInteger(YDHT, (((MemoryLeakHelper___IndexData)) ), ( (GetHandleId(((l)))))) // INLINED!!
            set MemoryLeakHelper___DestroyedLeaksUser=MemoryLeakHelper___DestroyedLeaksUser + 1
        endif
    endfunction
	
 function MemoryLeakHelper___CatchGroup takes group l returns nothing
        set MemoryLeakHelper___LastCaught=l
        
        if MemoryLeakHelper___Disabled then
            return
        elseif MemoryLeakHelper___CaughtGroupLeaks == MemoryLeakHelper___MAX_LEAK_INSTANCES then
            return
        endif
        
        if (HaveSavedInteger(YDHT, (((MemoryLeakHelper___IndexData)) ), ( (GetHandleId(((l))))))) == false then // INLINED!!
            //call BJDebugMsg("Caught Group")
            set MemoryLeakHelper___CaughtGroupLeaks=MemoryLeakHelper___CaughtGroupLeaks + 1
            call sg__MemoryLeakHelper___GroupLeakData_set(MemoryLeakHelper___CaughtGroupLeaks,l)
            call SaveInteger(YDHT, (((MemoryLeakHelper___IndexData)) ), ( (GetHandleId(((l)))) ), ( ( MemoryLeakHelper___CaughtGroupLeaks))) // INLINED!!
        endif
    endfunction
    
    function MemoryLeakHelper___AddToGroupDestroyQueue takes group l returns nothing
        set MemoryLeakHelper___GroupDestroyCount=MemoryLeakHelper___GroupDestroyCount + 1
        call sg__MemoryLeakHelper___GroupDestroyData_set(MemoryLeakHelper___GroupDestroyCount,l)
        call SaveInteger(YDHT, (((MemoryLeakHelper___IndexData)) ), ( (GetHandleId(((l)))) ), ( ( MemoryLeakHelper___GroupDestroyCount * - 1))) // Put his to negative, so we know that this is used in the DestroyQueue now. // INLINED!!
endfunction
    
    function MemoryLeakHelper___ReleaseGroup takes group l returns nothing
        local integer index
        if MemoryLeakHelper___IsDestroying == false and (HaveSavedInteger(YDHT, (((MemoryLeakHelper___IndexData)) ), ( (GetHandleId(((l))))))) then // INLINED!!
            set index=(LoadInteger(YDHT, (((MemoryLeakHelper___IndexData)) ), ( (GetHandleId(((l))))))) // INLINED!!
            // If this is true, the index wasn't put to a destroy queue yet.
            if index > 0 then
                call sg__MemoryLeakHelper___GroupLeakData_set(index,sg__MemoryLeakHelper___GroupLeakData_get(MemoryLeakHelper___CaughtGroupLeaks))
                set MemoryLeakHelper___CaughtGroupLeaks=MemoryLeakHelper___CaughtGroupLeaks - 1
            else
                set index=index * - 1
                call sg__MemoryLeakHelper___GroupDestroyData_set(index,sg__MemoryLeakHelper___GroupDestroyData_get(MemoryLeakHelper___GroupDestroyCount))
                set MemoryLeakHelper___GroupDestroyCount=MemoryLeakHelper___GroupDestroyCount - 1
            endif
            call RemoveSavedInteger(YDHT, (((MemoryLeakHelper___IndexData)) ), ( (GetHandleId(((l)))))) // INLINED!!
            set MemoryLeakHelper___DestroyedLeaksUser=MemoryLeakHelper___DestroyedLeaksUser + 1
        endif
    endfunction
	
 function MemoryLeakHelper___CatchEffect takes effect l returns nothing
        set MemoryLeakHelper___LastCaught=l
        
        if MemoryLeakHelper___Disabled then
            return
        elseif MemoryLeakHelper___CaughtEffectLeaks == MemoryLeakHelper___MAX_LEAK_INSTANCES then
            return
        endif
        
        if (HaveSavedInteger(YDHT, (((MemoryLeakHelper___IndexData)) ), ( (GetHandleId(((l))))))) == false then // INLINED!!
            //call BJDebugMsg("Caught Effect")
            set MemoryLeakHelper___CaughtEffectLeaks=MemoryLeakHelper___CaughtEffectLeaks + 1
            call sg__MemoryLeakHelper___EffectLeakData_set(MemoryLeakHelper___CaughtEffectLeaks,l)
            call SaveInteger(YDHT, (((MemoryLeakHelper___IndexData)) ), ( (GetHandleId(((l)))) ), ( ( MemoryLeakHelper___CaughtEffectLeaks))) // INLINED!!
        endif
    endfunction
    
    function MemoryLeakHelper___AddToEffectDestroyQueue takes effect l returns nothing
        set MemoryLeakHelper___EffectDestroyCount=MemoryLeakHelper___EffectDestroyCount + 1
        call sg__MemoryLeakHelper___EffectDestroyData_set(MemoryLeakHelper___EffectDestroyCount,l)
        call SaveInteger(YDHT, (((MemoryLeakHelper___IndexData)) ), ( (GetHandleId(((l)))) ), ( ( MemoryLeakHelper___EffectDestroyCount * - 1))) // Put his to negative, so we know that this is used in the DestroyQueue now. // INLINED!!
endfunction
    
    function MemoryLeakHelper___ReleaseEffect takes effect l returns nothing
        local integer index
        if MemoryLeakHelper___IsDestroying == false and (HaveSavedInteger(YDHT, (((MemoryLeakHelper___IndexData)) ), ( (GetHandleId(((l))))))) then // INLINED!!
            set index=(LoadInteger(YDHT, (((MemoryLeakHelper___IndexData)) ), ( (GetHandleId(((l))))))) // INLINED!!
            // If this is true, the index wasn't put to a destroy queue yet.
            if index > 0 then
                call sg__MemoryLeakHelper___EffectLeakData_set(index,sg__MemoryLeakHelper___EffectLeakData_get(MemoryLeakHelper___CaughtEffectLeaks))
                set MemoryLeakHelper___CaughtEffectLeaks=MemoryLeakHelper___CaughtEffectLeaks - 1
            else
                set index=index * - 1
                call sg__MemoryLeakHelper___EffectDestroyData_set(index,sg__MemoryLeakHelper___EffectDestroyData_get(MemoryLeakHelper___EffectDestroyCount))
                set MemoryLeakHelper___EffectDestroyCount=MemoryLeakHelper___EffectDestroyCount - 1
            endif
            call RemoveSavedInteger(YDHT, (((MemoryLeakHelper___IndexData)) ), ( (GetHandleId(((l)))))) // INLINED!!
            set MemoryLeakHelper___DestroyedLeaksUser=MemoryLeakHelper___DestroyedLeaksUser + 1
        endif
    endfunction
	
    function MemoryLeakHelper___DestroyMemoryLeaks takes nothing returns nothing
        set MemoryLeakHelper___IsDestroying=true
        
		set MemoryLeakHelper___DestroyedLeaks=MemoryLeakHelper___DestroyedLeaks + MemoryLeakHelper___GroupDestroyCount
        loop
            exitwhen MemoryLeakHelper___GroupDestroyCount == 0
            
            if MemoryLeakHelper___DISPLAY_SAVED_MEMORY then
                set MemoryLeakHelper___SavedMemory=MemoryLeakHelper___SavedMemory + MemoryLeakHelper___GroupGetMemoryUsage(sg__MemoryLeakHelper___GroupDestroyData_get(MemoryLeakHelper___GroupDestroyCount))
            endif
            
            call h__DestroyGroup(sg__MemoryLeakHelper___GroupDestroyData_get(MemoryLeakHelper___GroupDestroyCount))
            call RemoveSavedInteger(YDHT, (((MemoryLeakHelper___IndexData)) ), ( (GetHandleId(((sg__MemoryLeakHelper___GroupDestroyData_get(MemoryLeakHelper___GroupDestroyCount))))))) // INLINED!!
            set MemoryLeakHelper___GroupDestroyCount=MemoryLeakHelper___GroupDestroyCount - 1
        endloop
		
		set MemoryLeakHelper___DestroyedLeaks=MemoryLeakHelper___DestroyedLeaks + MemoryLeakHelper___LocationDestroyCount
        loop
            exitwhen MemoryLeakHelper___LocationDestroyCount == 0
            
            if MemoryLeakHelper___DISPLAY_SAVED_MEMORY then
                set MemoryLeakHelper___SavedMemory=MemoryLeakHelper___SavedMemory + MemoryLeakHelper___LOCATION_MEMORY_USAGE
            endif
            
            call h__RemoveLocation(sg__MemoryLeakHelper___LocationDestroyData_get(MemoryLeakHelper___LocationDestroyCount))
            call RemoveSavedInteger(YDHT, (((MemoryLeakHelper___IndexData)) ), ( (GetHandleId(((sg__MemoryLeakHelper___LocationDestroyData_get(MemoryLeakHelper___LocationDestroyCount))))))) // INLINED!!
            set MemoryLeakHelper___LocationDestroyCount=MemoryLeakHelper___LocationDestroyCount - 1
        endloop
		
		set MemoryLeakHelper___DestroyedLeaks=MemoryLeakHelper___DestroyedLeaks + MemoryLeakHelper___EffectDestroyCount
        loop
            exitwhen MemoryLeakHelper___EffectDestroyCount == 0
            
            if MemoryLeakHelper___DISPLAY_SAVED_MEMORY then
                set MemoryLeakHelper___SavedMemory=MemoryLeakHelper___SavedMemory + MemoryLeakHelper___EFFECT_MEMORY_USAGE
            endif
            
            call h__DestroyEffect(sg__MemoryLeakHelper___EffectDestroyData_get(MemoryLeakHelper___EffectDestroyCount))
            call RemoveSavedInteger(YDHT, (((MemoryLeakHelper___IndexData)) ), ( (GetHandleId(((sg__MemoryLeakHelper___EffectDestroyData_get(MemoryLeakHelper___EffectDestroyCount))))))) // INLINED!!
            set MemoryLeakHelper___EffectDestroyCount=MemoryLeakHelper___EffectDestroyCount - 1
        endloop
		
        set MemoryLeakHelper___IsDestroying=false
        set MemoryLeakHelper___DestroyThreadRunning=false
        //call StartPassTimer.execute() // Strange. This causes bugs sometimes and the function isn't called
        // This is slower, but safe.
        call ExecuteFunc("YDWEMemoryLeakStartPassTimer")
    endfunction
    
    function MemoryLeakHelper___StartDestroyThread takes nothing returns nothing
        if MemoryLeakHelper___DestroyThreadRunning == false then
            set MemoryLeakHelper___DestroyThreadRunning=true
            call TimerStart(MemoryLeakHelper___CleanTimer, MemoryLeakHelper___CLEAN_UP_INTERVAL, false, function MemoryLeakHelper___DestroyMemoryLeaks)
            call PauseTimer(MemoryLeakHelper___PassTimer)
        endif
    endfunction
    
   // hook DoNothing StartDestroyThread
    
    // We want that the user doesn't have to protect too many variables, but all the variables that are filled longer
    // than CLEAN_UP_INTERVAL seconds. But what, when the handle thing is put into the destroy stack and the next destroy is
    // in 5 seconds, because the last one was 15 seconds ago? We can simply avoid something like that by using a 2-step-system
    // that goes sure, the handle is only destroyed when it passed the CLEAN_UP_INTERVAL twice.
    // Having two kinds of variables is simply easier and more efficient than having another variable that refers to
    // how many times the handle passed the timer; If it isn't passed/cleared in the Interval then, we can't loop
    // that easily through the data and we'd have to fix gaps later; That would suck a lot of performacne.
    function MemoryLeakHelper___PassMemoryLeaks takes nothing returns nothing
		set MemoryLeakHelper___CaughtLeaks=MemoryLeakHelper___CaughtLeaks + MemoryLeakHelper___CaughtGroupLeaks
        loop
            exitwhen MemoryLeakHelper___CaughtGroupLeaks < 1
            if (HaveSavedInteger(YDHT, (((MemoryLeakHelper___IsSaved)) ), ( (GetHandleId(((sg__MemoryLeakHelper___GroupLeakData_get(MemoryLeakHelper___CaughtGroupLeaks)))))))) == false and sg__MemoryLeakHelper___GroupLeakData_get(MemoryLeakHelper___CaughtGroupLeaks) != null then // INLINED!!
                call MemoryLeakHelper___AddToGroupDestroyQueue(sg__MemoryLeakHelper___GroupLeakData_get(MemoryLeakHelper___CaughtGroupLeaks))
            endif
            call sg__MemoryLeakHelper___GroupLeakData_set(MemoryLeakHelper___CaughtGroupLeaks,null)
            set MemoryLeakHelper___CaughtGroupLeaks=MemoryLeakHelper___CaughtGroupLeaks - 1
        endloop
		
		set MemoryLeakHelper___CaughtLeaks=MemoryLeakHelper___CaughtLeaks + MemoryLeakHelper___CaughtLocationLeaks
        loop
            exitwhen MemoryLeakHelper___CaughtLocationLeaks < 1
            if (HaveSavedInteger(YDHT, (((MemoryLeakHelper___IsSaved)) ), ( (GetHandleId(((sg__MemoryLeakHelper___LocationLeakData_get(MemoryLeakHelper___CaughtLocationLeaks)))))))) == false and sg__MemoryLeakHelper___LocationLeakData_get(MemoryLeakHelper___CaughtLocationLeaks) != null then // INLINED!!
                call MemoryLeakHelper___AddToLocationDestroyQueue(sg__MemoryLeakHelper___LocationLeakData_get(MemoryLeakHelper___CaughtLocationLeaks))
            endif
            call sg__MemoryLeakHelper___LocationLeakData_set(MemoryLeakHelper___CaughtLocationLeaks,null)
            set MemoryLeakHelper___CaughtLocationLeaks=MemoryLeakHelper___CaughtLocationLeaks - 1
        endloop
		
		set MemoryLeakHelper___CaughtLeaks=MemoryLeakHelper___CaughtLeaks + MemoryLeakHelper___CaughtEffectLeaks
        loop
            exitwhen MemoryLeakHelper___CaughtEffectLeaks < 1
            if (HaveSavedInteger(YDHT, (((MemoryLeakHelper___IsSaved)) ), ( (GetHandleId(((sg__MemoryLeakHelper___EffectLeakData_get(MemoryLeakHelper___CaughtEffectLeaks)))))))) == false and sg__MemoryLeakHelper___EffectLeakData_get(MemoryLeakHelper___CaughtEffectLeaks) != null then // INLINED!!
                call MemoryLeakHelper___AddToEffectDestroyQueue(sg__MemoryLeakHelper___EffectLeakData_get(MemoryLeakHelper___CaughtEffectLeaks))
            endif
            call sg__MemoryLeakHelper___EffectLeakData_set(MemoryLeakHelper___CaughtEffectLeaks,null)
            set MemoryLeakHelper___CaughtEffectLeaks=MemoryLeakHelper___CaughtEffectLeaks - 1
        endloop
		
        if MemoryLeakHelper___CaughtLeaks > MemoryLeakHelper___MIN_LEAK_NUMBER then
            set MemoryLeakHelper___CaughtLeaks=0
            //call BJDebugMsg("Caught Leaks: "+I2S(MIN_LEAK_NUMBER))
            //call BJDebugMsg("Now start Destroy Timer")
            set MemoryLeakHelper___DestroyThreadRunning=true
            call TimerStart(MemoryLeakHelper___CleanTimer, MemoryLeakHelper___CLEAN_UP_INTERVAL, false, function MemoryLeakHelper___DestroyMemoryLeaks)
            // We have to pause this timer a bit; Otherwise it would break the CLEAN_UP_INTERVAL rule.
            call PauseTimer(MemoryLeakHelper___PassTimer)
        endif
        
    endfunction
    
    // =================================
    // ============= Usage =============
    // =================================
    
    function MemoryLeakHelper___PP takes location source,real dist,real angle returns nothing
        call MemoryLeakHelper___CatchLocation(source)
    endfunction
    
    function MemoryLeakHelper___CU takes integer count,integer unitId,player p,location l,real face returns nothing
        call MemoryLeakHelper___CatchLocation(l)
    endfunction
    
    function MemoryLeakHelper___IPO takes unit k,string order,location l returns nothing
        call MemoryLeakHelper___CatchLocation(l)
    endfunction
    
    function MemoryLeakHelper___SUP takes unit who,location l returns nothing
        call MemoryLeakHelper___CatchLocation(l)
    endfunction
    
    function MemoryLeakHelper___SUF takes unit who,location l,real dur returns nothing
        call MemoryLeakHelper___CatchLocation(l)
    endfunction
    
    function MemoryLeakHelper___GUR takes real radius,location l,boolexpr filter returns nothing
        call MemoryLeakHelper___CatchLocation(l)
    endfunction
    
    function MemoryLeakHelper___CUF takes integer count,integer unitId,player whichPlayer,location loc,location lookAt returns nothing
        call MemoryLeakHelper___CatchLocation(loc)
        call MemoryLeakHelper___CatchLocation(lookAt)
    endfunction
    
//processed hook:     hook PolarProjectionBJ MemoryLeakHelper___PP
//processed hook:     hook CreateNUnitsAtLoc MemoryLeakHelper___CU
//processed hook:     hook CreateNUnitsAtLocFacingLocBJ MemoryLeakHelper___CUF
//processed hook:     hook IssuePointOrderLocBJ MemoryLeakHelper___IPO
//processed hook:     hook SetUnitPositionLoc MemoryLeakHelper___SUP
//processed hook:     hook SetUnitFacingToFaceLocTimed MemoryLeakHelper___SUF
//processed hook:     hook GetUnitsInRangeOfLocMatching MemoryLeakHelper___GUR
//processed hook:     hook RemoveLocation MemoryLeakHelper___ReleaseLocation
    function MemoryLeakHelper___FG takes group g,code callback returns nothing
        call MemoryLeakHelper___CatchGroup(g)
    endfunction
    
//processed hook:     hook ForGroupBJ MemoryLeakHelper___FG // :D This should catch all GUI usages for groups.
//processed hook: hook GroupPickRandomUnit MemoryLeakHelper___CatchGroup
//processed hook:     hook CountUnitsInGroup MemoryLeakHelper___CatchGroup
    
//processed hook:     hook DestroyGroup MemoryLeakHelper___ReleaseGroup
    
    function MemoryLeakHelper___ASETU takes string bla,widget d,string blu returns nothing
        // We can not catch THIS effect, but the effect that was created before.
        // So we can destroy all SpecialEffects excpet one.
        call MemoryLeakHelper___CatchEffect(GetLastCreatedEffectBJ())
    endfunction
    
    function MemoryLeakHelper___ASE takes location where,string modelName returns nothing
        call MemoryLeakHelper___CatchLocation(where)
        call MemoryLeakHelper___CatchEffect(GetLastCreatedEffectBJ())
    endfunction
//processed hook:     hook AddSpecialEffectLocBJ MemoryLeakHelper___ASE
//processed hook:     hook AddSpecialEffectTargetUnitBJ MemoryLeakHelper___ASETU
//processed hook:     hook DestroyEffect MemoryLeakHelper___ReleaseEffect
//processed hook:     hook DestroyEffectBJ MemoryLeakHelper___ReleaseEffect
    
    // When I want to make the timer run the PassMemoryLeaks things, I have to use an .execute command which requires an extra func.
    function YDWEMemoryLeakStartPassTimer takes nothing returns nothing
        //call BJDebugMsg("Restarting PassTimer")
        call TimerStart(MemoryLeakHelper___PassTimer, MemoryLeakHelper___PASS_INTERVAL, true, function MemoryLeakHelper___PassMemoryLeaks)
    endfunction
    
	// 开启接口函数
    function YDWEMemoryLeakHelperMapIsOpenMemoryLeakHelper takes boolean IsOpenMemoryLeak returns nothing
        set MemoryLeakHelper___IsOpenMemoryLeakHelper=IsOpenMemoryLeak
        call PauseTimer(MemoryLeakHelper___PassTimer)
        if ( IsOpenMemoryLeak ) then
            call TimerStart(MemoryLeakHelper___PassTimer, MemoryLeakHelper___PASS_INTERVAL, true, function MemoryLeakHelper___PassMemoryLeaks) // INLINED!!
        endif
    endfunction
    
    function YDWEMemoryLeakHelperProtectLastCaughtHandle takes nothing returns nothing
        call SaveInteger(YDHT, (((MemoryLeakHelper___IsSaved)) ), ( (GetHandleId(((((MemoryLeakHelper___LastCaught)))))) ), ( ( 1))) // INLINED!!
    endfunction
    
    function YDWEMemoryLeakHelperProtectLocation takes location loc returns nothing
        call SaveInteger(YDHT, (((MemoryLeakHelper___IsSaved)) ), ( (GetHandleId((((loc))))) ), ( ( 1))) // INLINED!!
    endfunction
    function YDWEMemoryLeakHelperProtectGroup takes group g returns nothing
        call SaveInteger(YDHT, (((MemoryLeakHelper___IsSaved)) ), ( (GetHandleId((((g))))) ), ( ( 1))) // INLINED!!
    endfunction
    
    function YDWEMemoryLeakHelperProtectEffect takes effect e returns nothing
        call SaveInteger(YDHT, (((MemoryLeakHelper___IsSaved)) ), ( (GetHandleId((((e))))) ), ( ( 1))) // INLINED!!
    endfunction
        
    function MemoryLeakHelper___Init takes nothing returns nothing
        set MemoryLeakHelper___IndexData=s__MemoryLeakHelper___HandleTable__allocate()
        set MemoryLeakHelper___IsSaved=s__MemoryLeakHelper___HandleTable__allocate()
        
        //call YDWEMemoryLeakStartPassTimer()
        call TimerStart(MemoryLeakHelper___GameTimeTimer, MemoryLeakHelper___GAMETIME_TIMER_INTERVAL, true, function MemoryLeakHelper___UpdateGameTime)
    endfunction
    

//library MemoryLeakHelper ends
//library YDWEEnumDestructablesInCircleBJNull:
function YDWEEnumDestructablesInCircleBJNull takes real radius,location loc,code actionFunc returns nothing
    local rect r
    local real centerX= GetLocationX(loc)
    local real centerY= GetLocationY(loc)
    if radius >= 0 then
        set bj_enumDestructableCenter=loc
        set bj_enumDestructableRadius=radius
        set r=Rect(centerX - radius, centerY - radius, centerX + radius, centerY + radius)
        call EnumDestructablesInRect(r, Filter(function YDWEEnumDestructablesInCircleBJFilterNull), actionFunc)
        call RemoveRect(r)
    	set r=null
    endif
endfunction

//library YDWEEnumDestructablesInCircleBJNull ends
//library YDWEGetUnitsInRectAllNull:
function YDWEGetUnitsInRectAllNull takes rect r returns group
    return YDWEGetUnitsInRectMatchingNull(r , null)
endfunction

//library YDWEGetUnitsInRectAllNull ends
//library YDWESetUnitFacingToFaceUnitTimedNull:
function YDWESetUnitFacingToFaceUnitTimedNull takes unit whichUnit,unit target,real duration returns nothing
    local location unitLoc= GetUnitLoc(target)
    call YDWESetUnitFacingToFaceLocTimedNull(whichUnit , unitLoc , duration)
    call h__RemoveLocation(unitLoc)
    set unitLoc=null
endfunction

//library YDWESetUnitFacingToFaceUnitTimedNull ends
//library YDWETimerSystem:
function YDWETimerSystem___NewTaskIndex takes nothing returns integer
 local integer h= YDWETimerSystem___TaskListIdleHead
	if YDWETimerSystem___TaskListIdleHead < 0 then
		if YDWETimerSystem___TaskListIdleMax >= 8000 then
			return 8100
		else
			set YDWETimerSystem___TaskListIdleMax=YDWETimerSystem___TaskListIdleMax + 1
			return YDWETimerSystem___TaskListIdleMax
		endif
	endif
	set YDWETimerSystem___TaskListIdleHead=YDWETimerSystem___TaskListIdle[h]
	return h
endfunction
function YDWETimerSystem___DeleteTaskIndex takes integer index returns nothing
	set YDWETimerSystem___TaskListIdle[index]=YDWETimerSystem___TaskListIdleHead
	set YDWETimerSystem___TaskListIdleHead=index
endfunction
//�ú������д���
function YDWETimerSystem___NewTask takes real time,trigger proc returns integer
 local integer index= YDWETimerSystem___NewTaskIndex()
 local integer h= YDWETimerSystem___TaskListHead
 local integer t= R2I(100. * time) + YDWETimerSystem___CurrentTime
 local integer p
	set YDWETimerSystem___TaskListProc[index]=proc
	set YDWETimerSystem___TaskListTime[index]=t
	loop
		set p=YDWETimerSystem___TaskListNext[h]
		if p < 0 or YDWETimerSystem___TaskListTime[p] >= t then
		//	call BJDebugMsg("NewTask:"+I2S(index))
			set YDWETimerSystem___TaskListNext[h]=index
			set YDWETimerSystem___TaskListNext[index]=p
			return index
		endif
		set h=p
	endloop
	return index
endfunction
function YDWETimerSystemNewTask takes real time,trigger proc returns integer
	return YDWETimerSystem___NewTask(time , proc)
endfunction
function YDWETimerSystemGetCurrentTask takes nothing returns integer
	return YDWETimerSystem___CurrentIndex
endfunction
//ɾ����λ
function YDWETimerSystem___RemoveUnit_CallBack takes nothing returns nothing
    call RemoveUnit(LoadUnitHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___CurrentIndex))
    call RemoveSavedHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___CurrentIndex)
endfunction
function YDWETimerRemoveUnit takes real time,unit u returns nothing
    call SaveUnitHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___NewTask(time , YDWETimerSystem___fnRemoveUnit), u)
endfunction
//�ݻټ�ʱ��
function YDWETimerSystem___DestroyTimer_CallBack takes nothing returns nothing
    call DestroyTimer(LoadTimerHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___CurrentIndex))
    call RemoveSavedHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___CurrentIndex)
endfunction
function YDWETimerDestroyTimer takes real time,timer t returns nothing
    call SaveTimerHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___NewTask(time , YDWETimerSystem___fnDestroyTimer), t)
endfunction
//ɾ����Ʒ
function YDWETimerSystem___RemoveItem_CallBack takes nothing returns nothing
    call RemoveItem(LoadItemHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___CurrentIndex))
    call RemoveSavedHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___CurrentIndex)
endfunction
function YDWETimerRemoveItem takes real time,item it returns nothing
    call SaveItemHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___NewTask(time , YDWETimerSystem___fnRemoveItem), it)
endfunction
//ɾ����Ч
function YDWETimerSystem___DestroyEffect_CallBack takes nothing returns nothing
    call h__DestroyEffect(LoadEffectHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___CurrentIndex))
    call RemoveSavedHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___CurrentIndex)
endfunction
function YDWETimerDestroyEffect takes real time,effect e returns nothing
    call SaveEffectHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___NewTask(time , YDWETimerSystem___fnDestroyEffect), e)
endfunction
//ɾ��������Ч
function YDWETimerSystem___DestroyLightning_CallBack takes nothing returns nothing
    call DestroyLightning(LoadLightningHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___CurrentIndex))
    call RemoveSavedHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___CurrentIndex)
endfunction
function YDWETimerDestroyLightning takes real time,lightning lt returns nothing
 local integer i= YDWETimerSystem___NewTask(time , YDWETimerSystem___fnDestroyLightning)
    call SaveLightningHandle(YDHT, YDWETimerSystem___TimerHandle, i, lt)
endfunction
//���д�����
function YDWETimerSystem___RunTrigger_CallBack takes nothing returns nothing
    call TriggerExecute(LoadTriggerHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___CurrentIndex))
    call RemoveSavedHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___CurrentIndex)
endfunction
function YDWETimerRunTrigger takes real time,trigger trg returns nothing
    call SaveTriggerHandle(YDHT, YDWETimerSystem___TimerHandle, YDWETimerSystem___NewTask(time , YDWETimerSystem___fnRunTrigger), trg)
endfunction
//ɾ��Ư������
function YDWETimerDestroyTextTag takes real time,texttag tt returns nothing
    local integer N=0
    local integer i=0
    if time <= 0 then
        set time=0.01
    endif
    call SetTextTagPermanent(tt, false)
    call SetTextTagLifespan(tt, time)
    call SetTextTagFadepoint(tt, time)
endfunction
//���ļ�ʱ��������
function YDWETimerSystem___Main takes nothing returns nothing
 local integer h= YDWETimerSystem___TaskListHead
 local integer p
	loop
		set YDWETimerSystem___CurrentIndex=YDWETimerSystem___TaskListNext[h]
		exitwhen YDWETimerSystem___CurrentIndex < 0 or YDWETimerSystem___CurrentTime < YDWETimerSystem___TaskListTime[YDWETimerSystem___CurrentIndex]
		//call BJDebugMsg("Task:"+I2S(CurrentIndex))
		call TriggerEvaluate(YDWETimerSystem___TaskListProc[YDWETimerSystem___CurrentIndex])
		call YDWETimerSystem___DeleteTaskIndex(YDWETimerSystem___CurrentIndex)
		set YDWETimerSystem___TaskListNext[h]=YDWETimerSystem___TaskListNext[YDWETimerSystem___CurrentIndex]
	endloop
	set YDWETimerSystem___CurrentTime=YDWETimerSystem___CurrentTime + 1
endfunction
//��ʼ������
function YDWETimerSystem___Init takes nothing returns nothing
    set YDWETimerSystem___Timer=CreateTimer()
	set YDWETimerSystem___TimerHandle=GetHandleId(YDWETimerSystem___Timer)
	set YDWETimerSystem___CurrentTime=0
	set YDWETimerSystem___TaskListHead=0
	set YDWETimerSystem___TaskListNext[0]=- 1
	set YDWETimerSystem___TaskListIdleHead=1
	set YDWETimerSystem___TaskListIdleMax=1
	set YDWETimerSystem___TaskListIdle[1]=- 1
	
	set YDWETimerSystem___fnRemoveUnit=CreateTrigger()
	set YDWETimerSystem___fnDestroyTimer=CreateTrigger()
	set YDWETimerSystem___fnRemoveItem=CreateTrigger()
	set YDWETimerSystem___fnDestroyEffect=CreateTrigger()
	set YDWETimerSystem___fnDestroyLightning=CreateTrigger()
	set YDWETimerSystem___fnRunTrigger=CreateTrigger()
	call TriggerAddCondition(YDWETimerSystem___fnRemoveUnit, Condition(function YDWETimerSystem___RemoveUnit_CallBack))
	call TriggerAddCondition(YDWETimerSystem___fnDestroyTimer, Condition(function YDWETimerSystem___DestroyTimer_CallBack))
	call TriggerAddCondition(YDWETimerSystem___fnRemoveItem, Condition(function YDWETimerSystem___RemoveItem_CallBack))
	call TriggerAddCondition(YDWETimerSystem___fnDestroyEffect, Condition(function YDWETimerSystem___DestroyEffect_CallBack))
	call TriggerAddCondition(YDWETimerSystem___fnDestroyLightning, Condition(function YDWETimerSystem___DestroyLightning_CallBack))
	call TriggerAddCondition(YDWETimerSystem___fnRunTrigger, Condition(function YDWETimerSystem___RunTrigger_CallBack))
	
    call TimerStart(YDWETimerSystem___Timer, 0.01, true, function YDWETimerSystem___Main)
endfunction
//ѭ�������ö�����ʱ��
function YDWETimerSystemGetRunIndex takes nothing returns integer
    return YDWETimerSystem___TimerSystem_RunIndex
endfunction
function YDWETimerSystem___RunPeriodicTriggerFunction takes nothing returns nothing
    local integer tid= GetHandleId(GetExpiredTimer())
    local trigger trg= LoadTriggerHandle(YDHT, tid, $D0001)
	call SaveInteger(YDHT, StringHash(I2S(GetHandleId(trg))), StringHash("RunIndex"), LoadInteger(YDHT, tid, $D0002))
    if TriggerEvaluate(trg) then
        call TriggerExecute(trg)
    endif
    set trg=null
endfunction
function YDWETimerSystem___RunPeriodicTriggerFunctionByTimes takes nothing returns nothing
    local integer tid= GetHandleId(GetExpiredTimer())
    local trigger trg= LoadTriggerHandle(YDHT, tid, $D0001)
    local integer times= LoadInteger(YDHT, tid, $D0003)
	call SaveInteger(YDHT, StringHash(I2S(GetHandleId(trg))), StringHash("RunIndex"), LoadInteger(YDHT, tid, $D0002))
    if TriggerEvaluate(trg) then
        call TriggerExecute(trg)
    endif
    set times=times - 1
    if times > 0 then
		call SaveInteger(YDHT, tid, $D0003, times)
      else
        call DestroyTimer(GetExpiredTimer())
        call FlushChildHashtable(YDHT, tid)
    endif
    set trg=null
endfunction
function YDWETimerRunPeriodicTrigger takes real timeout,trigger trg,boolean b,integer times,integer data returns nothing
    local timer t
    local integer tid
    local integer index= 0
    if timeout < 0 then
        return
      else
        set t=CreateTimer()
		set tid=GetHandleId(t)
    endif
    set YDWETimerSystem___TimerSystem_RunIndex=YDWETimerSystem___TimerSystem_RunIndex + 1
	call SaveTriggerHandle(YDHT, tid, $D0001, trg)
	call SaveInteger(YDHT, tid, $D0002, YDWETimerSystem___TimerSystem_RunIndex)
	set index=LoadInteger(YDHT, GetHandleId(trg), 'YDTS' + data)
    set index=index + 1
	call SaveInteger(YDHT, GetHandleId(trg), 'YDTS' + data, index)
	call SaveTimerHandle(YDHT, GetHandleId(trg), ( 'YDTS' + data ) * index, t)
	
    if b == false then
		call SaveInteger(YDHT, tid, $D0003, times)
        call TimerStart(t, timeout, true, function YDWETimerSystem___RunPeriodicTriggerFunctionByTimes)
      else
        call TimerStart(t, timeout, true, function YDWETimerSystem___RunPeriodicTriggerFunction)
    endif
    set t=null
endfunction
function YDWETimerRunPeriodicTriggerOver takes trigger trg,integer data returns nothing
 local integer trgid= GetHandleId(trg)
    local integer index= LoadInteger(YDHT, trgid, 'YDTS' + data)
    local timer t
    loop
        exitwhen index <= 0
        set t=LoadTimerHandle(YDHT, trgid, ( 'YDTS' + data ) * index)
        call DestroyTimer(t)
        call FlushChildHashtable(YDHT, GetHandleId(t))
		call RemoveSavedHandle(YDHT, trgid, ( 'YDTS' + data ) * index)
        set index=index - 1
    endloop
	
    call RemoveSavedInteger(YDHT, trgid, 'YDTS' + data)
    set t=null
endfunction

//library YDWETimerSystem ends
//===========================================================================
// 
// 基佬之岛合作版v1.06
// 
//   Warcraft III map script
//   Generated by the Warcraft III World Editor
//   Date: Sat May 02 12:38:39 2020
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
    set udg_OE=CreateForce()
    set udg_HeroGroup=CreateGroup()
    set i=0
    loop
        exitwhen ( i > 10 )
        set udg_online[i]=false
        set i=i + 1
    endloop
    set udg_OffMovie=false
    set udg_DuoChongShiFa=false
    set udg_FovDummyGroup=CreateGroup()
    set udg_HanPiGuangHuan=false
    set udg_Hero10SiWangDWZ=CreateGroup()
    set udg_playernumber=0
    set i=0
    loop
        exitwhen ( i > 8 )
        set udg_DialogBox[i]=DialogCreate()
        set i=i + 1
    endloop
    set udg_booleanthreehero=false
    set i=0
    loop
        exitwhen ( i > 9 )
        set udg_BooleanChooseHero[i]=false
        set i=i + 1
    endloop
    set udg_choicemode=false
    set udg_booleanMovie=false
    set udg_booleanEscMovie=false
    set udg_BoosFangJian=false
    set udg_Hero10CunHuoDWZ=CreateGroup()
    set i=0
    loop
        exitwhen ( i > 10 )
        set udg_DiXBoos[i]=false
        set i=i + 1
    endloop
    set udg_StrartUnitGroup=CreateGroup()
    set udg_DummyGroup=CreateGroup()
    set udg_GetUnitX=0
    set udg_EggGroup=CreateGroup()
    set udg_SlkR=CreateRegion()
    set udg_testhandle=CreateTimer()
    set udg_handleId=0
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
    set gg_snd_PriestYesAttack3=CreateSound("Units\\Human\\Priest\\PriestYesAttack3.wav", false, true, true, 10, 10, "DefaultEAXON")
    call SetSoundParamsFromLabel(gg_snd_PriestYesAttack3, "PriestYesAttack")
    call SetSoundDuration(gg_snd_PriestYesAttack3, 2264)
    set gg_snd_ArthasYesAttack2=CreateSound("Units\\Human\\Arthas\\ArthasYesAttack2.wav", false, true, true, 10, 10, "HeroAcksEAX")
    call SetSoundParamsFromLabel(gg_snd_ArthasYesAttack2, "ArthasYesAttack")
    call SetSoundDuration(gg_snd_ArthasYesAttack2, 1245)
    set gg_snd_ArthasYesAttack5=CreateSound("Units\\Human\\Arthas\\ArthasYesAttack5.wav", false, true, true, 10, 10, "HeroAcksEAX")
    call SetSoundParamsFromLabel(gg_snd_ArthasYesAttack5, "ArthasYesAttack")
    call SetSoundDuration(gg_snd_ArthasYesAttack5, 1103)
    set gg_snd_ArthasPissed4=CreateSound("Units\\Human\\Arthas\\ArthasPissed4.wav", false, true, true, 10, 10, "HeroAcksEAX")
    call SetSoundParamsFromLabel(gg_snd_ArthasPissed4, "ArthasPissed")
    call SetSoundDuration(gg_snd_ArthasPissed4, 2000)
    set gg_snd_DemonHunterMorphedYesAttack1=CreateSound("Units\\NightElf\\HeroDemonHunter\\DemonHunterMorphedYesAttack1.wav", false, true, true, 10, 10, "HeroAcksEAX")
    call SetSoundParamsFromLabel(gg_snd_DemonHunterMorphedYesAttack1, "HeroDemonHunterMorphedYesAttack")
    call SetSoundDuration(gg_snd_DemonHunterMorphedYesAttack1, 2397)
    set gg_snd_H05Arthas10=CreateSound("Sound\\Dialogue\\HumanCampaign\\Human05\\H05Arthas10.mp3", false, false, false, 10, 10, "")
    call SetSoundParamsFromLabel(gg_snd_H05Arthas10, "H05Arthas10")
    call SetSoundDuration(gg_snd_H05Arthas10, 1384)
    set gg_snd_DemonHunterMorphedYesAttack3=CreateSound("Units\\NightElf\\HeroDemonHunter\\DemonHunterMorphedYesAttack3.wav", false, true, true, 10, 10, "HeroAcksEAX")
    call SetSoundParamsFromLabel(gg_snd_DemonHunterMorphedYesAttack3, "HeroDemonHunterMorphedYesAttack")
    call SetSoundDuration(gg_snd_DemonHunterMorphedYesAttack3, 1353)
    set gg_snd_DemonHunterMorphedPissed2=CreateSound("Units\\NightElf\\HeroDemonHunter\\DemonHunterMorphedPissed2.wav", false, true, true, 10, 10, "HeroAcksEAX")
    call SetSoundParamsFromLabel(gg_snd_DemonHunterMorphedPissed2, "HeroDemonHunterMorphedPissed")
    call SetSoundDuration(gg_snd_DemonHunterMorphedPissed2, 3297)
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
endfunction
//***************************************************************************
//*
//*  Unit Creation
//*
//***************************************************************************
//===========================================================================
function CreateUnitsForPlayer0 takes nothing returns nothing
    local player p= Player(0)
    local unit u
    local integer unitID
    local trigger t
    local real life
    set u=CreateUnit(p, 'hpea', - 9161.0, - 18216.6, 115.547)
    set gg_unit_Hart_0013=CreateUnit(p, 'Hart', - 24976.6, - 24878.5, 100.730)
    call SetHeroLevel(gg_unit_Hart_0013, 25, false)
endfunction
//===========================================================================
function CreatePlayerBuildings takes nothing returns nothing
endfunction
//===========================================================================
function CreatePlayerUnits takes nothing returns nothing
    call CreateUnitsForPlayer0()
endfunction
//===========================================================================
function CreateAllUnits takes nothing returns nothing
    call CreatePlayerBuildings()
    call CreateUnitsForPlayer0() // INLINED!!
endfunction
//***************************************************************************
//*
//*  Custom Script Code
//*
//***************************************************************************
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Zzzzz takes nothing returns boolean
	return true
endfunction
//给所有玩家注册事件
function BJRT takes trigger t,playerunitevent A0X returns nothing
 local integer i=0
	loop
		call TriggerRegisterPlayerUnitEvent(t, Player(i), A0X, Condition(function Zzzzz))
		set i=i + 1
	exitwhen i == 16
	endloop
endfunction
//
//⑧是玩家的盟友
function IPA takes player p returns boolean
	return ( ( IsPlayerAlly(p, Player(0)) == false ) )
endfunction
function AXY takes real x1,real y1,real x2,real y2 returns real
	return bj_RADTODEG * Atan2(y2 - y1, x2 - x1)
endfunction
function ZAE takes real x1,real y1,real x2,real y2 returns real
	return SquareRoot(( ( x1 - x2 ) * ( x1 - x2 ) ) + ( ( y1 - y2 ) * ( y1 - y2 ) ))
endfunction
function EAX takes trigger t returns nothing
	call DisableTrigger(t)
endfunction
function WGE takes unit u returns boolean
	return GetUnitTypeId(u) < 1 or IsUnitType(u, UNIT_TYPE_DEAD) or .405 > GetWidgetLife(u)
endfunction
function A4X takes real x,real y returns boolean
	return ( not ( IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY) ) )
endfunction
function V7X takes group g returns nothing
	call GroupClear(g)
	call h__DestroyGroup(g)
endfunction
function HeroNumber takes integer n returns nothing
 local integer i= 0
	loop
	exitwhen i > 9
		call SetPlayerTechMaxAllowed(Player(i), 'HERO', n)
		set i=i + 1
	endloop
endfunction
function GDS takes string gs returns nothing
 local integer i= 0
	loop
	exitwhen i > 9
		call DisplayTextToPlayer(Player(i), 0.00, 0.00, gs)
		set i=i + 1
	endloop
endfunction
function MovieStart takes nothing returns nothing
	call CinematicModeBJ(true, GetPlayersAll())
	call EnableSelect(false, true)
endfunction
function MovieEnd takes nothing returns nothing
	call CinematicModeBJ(false, GetPlayersAll())
	call EnableSelect(true, true)
endfunction
//test
function TestADDXP takes nothing returns nothing
	call AddHeroXP(GetEnumUnit(), 32400, false)
endfunction
//
function ADDXP takes unit u,integer i returns nothing
	call AddHeroXP(u, i, false)
endfunction
//隐藏
function showunitF takes nothing returns nothing
	call ShowUnit(GetEnumUnit(), false)
endfunction
function showunitT takes nothing returns nothing
	call ShowUnit(GetEnumUnit(), true)
endfunction
//睡眠
function Sleep takes nothing returns nothing
	call UnitAddAbility(GetEnumUnit(), 'A01C')
	call UnitAddSleepPerm(GetEnumUnit(), true)
endfunction
//菊花蛇棒
function Juhuasnake takes nothing returns nothing
 local integer i= 0
 local unit u
	loop
	exitwhen i > 10
		set u=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'osp4', - 25216.00, - 24544.00, 0.00)
		call IssueTargetOrder(u, "attack", udg_Dummy[4])
		set i=i + 1
	endloop
	set u=null
endfunction
//非魔免，敌对，生命值大于零
function BoosG1 takes nothing returns boolean
	return ( ( ( IsUnitType(GetFilterUnit(), UNIT_TYPE_MAGIC_IMMUNE) == false ) and ( ( IsUnitEnemy(GetFilterUnit(), Player(10)) == true ) and ( ( GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0.00 ) == true ) ) ) )
endfunction
function GPT takes unit u,real x,real y,real F returns nothing
	call SetUnitState(u, UNIT_STATE_LIFE, 50000)
	call SetUnitState(u, UNIT_STATE_MANA, 50000)
	call SetUnitPosition(u, x, y)
	call SetUnitFacing(u, F)
	call PauseUnit(u, true)
	call SetUnitInvulnerable(u, true)
endfunction
function GPF takes unit u returns nothing
	call PauseUnit(u, false)
	call SetUnitInvulnerable(u, false)
endfunction
//伤害
function R8D takes unit u,unit wu,integer DT,real D returns nothing
	if DT == 0 or D < 0 then
		return
	endif
	if DT == 1 then
		call UnitDamageTarget(u, wu, D, true, true, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_FIRE, WEAPON_TYPE_WHOKNOWS)
	elseif DT == 2 then
		call UnitDamageTarget(u, wu, D, true, true, ATTACK_TYPE_HERO, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
	elseif DT == 3 then
		call UnitDamageTarget(u, wu, D, true, true, ATTACK_TYPE_HERO, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
	elseif DT == 4 then
		call UnitDamageTarget(u, wu, D, true, true, ATTACK_TYPE_PIERCE, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
	elseif DT == 5 then
		call UnitDamageTarget(u, wu, D, true, true, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
	elseif DT == 6 then
		call UnitDamageTarget(u, wu, D, true, true, ATTACK_TYPE_HERO, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS)
	elseif DT == 7 then
		call UnitDamageTarget(u, wu, D, true, true, ATTACK_TYPE_HERO, DAMAGE_TYPE_ENHANCED, WEAPON_TYPE_WHOKNOWS)
	elseif DT == 8 then
		call UnitDamageTarget(u, wu, D, true, true, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_UNIVERSAL, WEAPON_TYPE_WHOKNOWS)
	endif
endfunction
function ESE takes nothing returns boolean
 local integer i= GetSpellAbilityId()
	if LoadStr(P, i, 0) != null then
		call ExecuteFunc(LoadStr(P, i, 0))
		call BJDebugMsg("运行" + ( LoadStr(P, i, 0) ))
	endif
	return false
endfunction
function HAB takes nothing returns nothing
	call SaveStr(P, 'AomE', 0, "SEOME")
	call SaveStr(P, 'ASlc', 0, "charge")
endfunction
function EPUS takes nothing returns boolean
	if ( ( GetUnitTypeId(GetSoldUnit()) == 'Oomg' ) ) then
		call ExecuteFunc("OgreMagi")
	endif
	
	return false
endfunction
function STAB takes nothing returns nothing
 local trigger t
	set t=CreateTrigger()
	call BJRT(t , EVENT_PLAYER_UNIT_SPELL_EFFECT)
	call TriggerAddCondition(t, Condition(function ESE))
	set t=CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ(t, EVENT_PLAYER_UNIT_SELL)
	call TriggerAddCondition(t, Condition(function EPUS))
	//set t = CreateTrigger()
	call DoNothing()
	set t=null
endfunction
//菊花击败boos
function JuHuaNiuBi takes real x1,real y1,integer Id,real x2,real y2 returns nothing
 local unit u
 local unit du= CreateUnit(Player(10), Id, x2, y2, 200.00)
	set u=udg_Dummy[0]
	call ShowUnit(u, true)
	call PanCameraToTimedWithZ(x1, y1, 0, 0)
	call UnitAddAbility(u, 'AomC')
	call SetUnitPosition(u, x1, y1)
	call IssueTargetOrder(u, "attack", du)
	set bj_lastCreatedUnit=du
    set du=null
	set u=null
endfunction
//屠夫肉钩
function Trig_1Conditions takes nothing returns boolean
    return ( ( GetSpellAbilityId() == 'ATft' ) )
endfunction
function D9X takes nothing returns boolean
    return ( ( ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false ) and ( IsUnitAliveBJ(GetFilterUnit()) == true ) ) )
endfunction
function V5A takes nothing returns nothing
local trigger t=GetTriggeringTrigger()
local integer h=GetHandleId(t)
local unit u=LoadUnitHandle(HY, h, 0)
if WGE(u) == false then
call SetUnitPathing(u, true)
endif
call FlushChildHashtable(HY, h)
call DisableTrigger((t)) // INLINED!!
set u=null
set t=null
endfunction
function V7A takes nothing returns boolean
local trigger t=GetTriggeringTrigger()
local integer h=GetHandleId(t)
local integer V8A=( LoadInteger(HY, h, 376) )
local boolean V9A=( LoadBoolean(HY, h, 377) )
local unit u=( LoadUnitHandle(HY, h, 17) )
local unit EVA=( LoadUnitHandle(HY, h, ( $834 + V8A )) )
local real x=0.00
local real y=0.00
local trigger tt
if V9A then
set x=GetUnitX(EVA)
set y=GetUnitY(EVA)
if ZAE(GetUnitX(EVA) , GetUnitY(EVA) , GetUnitX(u) , GetUnitY(u)) < $4B0 then
call SetUnitX(u, x)
call SetUnitY(u, y)
else
call SaveBoolean(HY, h, 377, false)
endif
if u == null then
call SaveBoolean(HY, h, 377, false)
endif
endif
call RemoveUnit(EVA)
set V8A=V8A - 1
call SaveInteger(HY, h, 376, ( V8A ))
if V8A == 0 then
call SetUnitPathing(u, true)
call FlushChildHashtable(HY, h)
call DisableTrigger((t)) // INLINED!!
endif
set t=null
set u=null
set EVA=null
return false
endfunction
function TMH takes nothing returns boolean
local trigger t=GetTriggeringTrigger()
local integer h=GetHandleId(t)
local integer i=( LoadInteger(HY, h, 376) )
local integer UAL=( LoadInteger(HY, h, 5) )
local real a=( LoadReal(HY, h, $D) )
local unit sau=( LoadUnitHandle(HY, h, $E) )
local trigger KUR=( LoadTriggerHandle(HY, h, $B) )
local integer KSR=GetHandleId(KUR)
local group g
local unit u
local real x
local real y
local real z
local integer hp=GetHandleId(GetOwningPlayer(sau))
local real QTR='n'
if i < 25 + 2.5 * UAL then
set i=i + 1
if i == 1 then
set QTR=50
elseif i == 2 then
set QTR=75
endif
call SaveInteger(HY, h, 376, ( i ))
set x=GetUnitX(sau) + i * 40 * Cos(a * bj_DEGTORAD)
set y=GetUnitY(sau) + i * 40 * Sin(a * bj_DEGTORAD)
call SaveUnitHandle(HY, ( KSR ), ( $834 + i ), ( CreateUnit(GetOwningPlayer(sau), 'h006', x, y, a) ))
set g=CreateGroup()
call GroupEnumUnitsInRange(g, x, y, QTR, Condition(function D9X))
call GroupRemoveUnit(g, sau)
set u=h__GroupPickRandomUnit(g)
call V7X(g)
if u != null then
call UnitDamageTarget(udg_Boos[0], u, 25.00, true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_MAGIC, WEAPON_TYPE_WHOKNOWS)
call FlushChildHashtable(HY, h)
call DisableTrigger((t)) // INLINED!!
call TriggerRegisterTimerEvent(KUR, .03, true)
call TriggerAddCondition(KUR, Condition(function V7A))
call SaveInteger(HY, ( KSR ), 376, ( i ))
call SaveBoolean(HY, ( KSR ), 377, ( true ))
call SaveUnitHandle(HY, ( KSR ), 17, ( u ))
call SetUnitPathing(u, false)
if IsUnitEnemy(u, GetOwningPlayer(sau)) then
call h__DestroyEffect(AddSpecialEffectTarget("Objects\\Spawnmodels\\Human\\HumanBlood\\BloodElfSpellThiefBlood.mdl", u, "origin"))
endif
endif
else
call FlushChildHashtable(HY, h)
call DisableTrigger((t)) // INLINED!!
call TriggerRegisterTimerEvent(KUR, .03, true)
call TriggerAddCondition(KUR, Condition(function V7A))
call SaveInteger(HY, ( KSR ), 376, ( i ))
call SaveBoolean(HY, ( KSR ), 377, ( false ))
endif
set t=null
set sau=null
set KUR=null
set g=null
set u=null
return false
endfunction
function Meathook takes unit sau,real x,real y returns nothing
local real a= AXY(GetUnitX(sau) , GetUnitY(sau) , x , y)
local integer UAL=GetUnitAbilityLevel(sau, 'ATft')
local trigger t=CreateTrigger()
local integer h=GetHandleId(t)
local integer hp=GetHandleId(GetOwningPlayer(sau))
call SaveUnitHandle(HY, h, $E, ( sau ))
call SaveInteger(HY, h, 5, ( UAL ))
call SaveReal(HY, h, $D, ( ( a ) * 1. ))
call SaveInteger(HY, h, 376, 0)
call SaveTriggerHandle(HY, h, $B, ( CreateTrigger() ))
call TriggerRegisterTimerEvent(t, .03, true)
call TriggerAddCondition(t, Condition(function TMH))
set sau=null
set t=null
endfunction
//肉钩结束
//冲刺
//
//
//
//
//
//***************************************************************************
//*
//*  Triggers
//*
//***************************************************************************
//===========================================================================
// Trigger: 简介
//===========================================================================
function Trig_______uActions takes nothing returns nothing
    call YDWEMemoryLeakHelperDisplayLeaks()
    // YDWE是《魔兽争霸III》地图编辑器的一个增强Mod。
    // 　　你可以从www.ydwe.net获取最新的YDWE。
    // 　　你可以由YDWE附带的演示地图开始，快速了解YDWE的功能。
    // 　　当你的地图意外损坏时，你可以在backups目录找到你最近26次保存的地图。
    // 　　当你的YDWE不能正常工作时，你可以前往www.ydwe.net联系我们。
endfunction
//===========================================================================
function InitTrig_______u takes nothing returns nothing
    set gg_trg_______u=CreateTrigger()
    call TriggerRegisterPlayerEventEndCinematic(gg_trg_______u, Player(0))
    call TriggerAddAction(gg_trg_______u, function Trig_______uActions)
endfunction
//===========================================================================
// Trigger: 123
//===========================================================================
function Trig_123Actions takes nothing returns nothing
    set udg_testhandle=CreateTimer()
    if ( ( (GetHandleId((udg_testhandle))) > udg_handleId ) ) then // INLINED!!
        set udg_handleId=(GetHandleId((udg_testhandle))) // INLINED!!
        call DisplayTextToPlayer(GetLocalPlayer(), 0, 0, I2S((GetHandleId((udg_testhandle))))) // INLINED!!
    else
    endif
    call DestroyTimer(udg_testhandle)
endfunction
//===========================================================================
function InitTrig_123 takes nothing returns nothing
    set gg_trg_123=CreateTrigger()
    call TriggerRegisterTimerEventPeriodic(gg_trg_123, 0.10)
    call TriggerAddAction(gg_trg_123, function Trig_123Actions)
endfunction
//===========================================================================
// Trigger: Test
//
// GetIssuedOrderId()
//===========================================================================
function Trig_TestFunc015Conditions takes nothing returns nothing
    if ( ( ( ( GetIssuedOrderId() == OrderId("smart") ) ) ) ) then
        call SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x9B1A6867, GetOrderPointLoc())
        call h__SetUnitPositionLoc(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1BF14788), LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x9B1A6867))
        call h__RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x9B1A6867))
    else
    endif
endfunction
function Trig_TestActions takes nothing returns nothing
    local trigger ydl_trigger
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call DisableTrigger(GetTriggeringTrigger())
    call ExecuteFunc("InitTrig_De_Orig")
    call CreateItem('ledg', - 25120.00, - 24544.00)
    call CreateUnit(Player(0), 'hTHP', - 25312.00, - 24544.00, bj_UNIT_FACING)
    call CreateUnit(Player(0), 'NSlk', - 25000.00, - 24000.00, bj_UNIT_FACING)
    call CreateUnit(Player(0), 'Uabo', - 25000.00, - 24000.00, bj_UNIT_FACING)
    call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'hTHP', - 25400.00, - 24600.00, bj_UNIT_FACING)
    call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'hTHP', - 25400.00, - 24600.00, bj_UNIT_FACING)
    call CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'hTHP', - 25400.00, - 24600.00, bj_UNIT_FACING)
    call CreateUnit(Player(PLAYER_NEUTRAL_AGGRESSIVE), 'hTHP', - 25500.00, - 24600.00, bj_UNIT_FACING)
    call CreateUnit(Player(PLAYER_NEUTRAL_AGGRESSIVE), 'hTHP', - 25500.00, - 24600.00, bj_UNIT_FACING)
    call CreateUnit(Player(PLAYER_NEUTRAL_AGGRESSIVE), 'hTHP', - 25500.00, - 24600.00, bj_UNIT_FACING)
    call ForGroup(udg_HeroGroup, function TestADDXP)
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1BF14788, CreateUnit(Player(0), 'Z000', - 24600.00, - 24944.00, 0))
    set ydl_trigger=CreateTrigger()
    call SaveLocationHandle(YDLOC, GetHandleId(ydl_trigger), 0x9B1A6867, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x9B1A6867))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_trigger), 0x1BF14788, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1BF14788))
    call TriggerRegisterUnitEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1BF14788), EVENT_UNIT_ISSUED_POINT_ORDER)
    call TriggerAddCondition(ydl_trigger, Condition(function Trig_TestFunc015Conditions))
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
    set ydl_trigger=null
endfunction
//===========================================================================
function InitTrig_Test_Orig takes nothing returns nothing
    set gg_trg_Test=CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_Test, Player(0), "Test", true)
    call TriggerAddAction(gg_trg_Test, function Trig_TestActions)
endfunction
function InitTrig_Test takes nothing returns nothing
endfunction
//===========================================================================
// Trigger: De
//===========================================================================
function Trig_DeActions takes nothing returns nothing
    call ExecuteFunc("InitTrig_123_Orig")
endfunction
//===========================================================================
function InitTrig_De_Orig takes nothing returns nothing
    set gg_trg_De=CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_De, Player(0), "-Handle", true)
    call TriggerAddAction(gg_trg_De, function Trig_DeActions)
endfunction
function InitTrig_De takes nothing returns nothing
endfunction
//===========================================================================
// Trigger: T_TrollWarlord
//===========================================================================
function Trig_T_TrollWarlordConditions takes nothing returns boolean
    return ( ( GetUnitTypeId(GetSoldUnit()) == 'Otwl' ) )
endfunction
function Trig_T_TrollWarlordFunc002Conditions takes nothing returns nothing
    if ( ( GetLearnedSkill() == 'A00K' ) ) then
        if ( ( GetUnitAbilityLevel(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xBC767A9E), 'A00K') == 1 ) ) then
            call SaveInteger(YDHT, GetHandleId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xBC767A9E)), 0xF1EC949F, 1)
            call UnitAddAbility(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xBC767A9E), 'ATl2')
            call UnitAddAbility(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xBC767A9E), 'ATlb')
            call UnitMakeAbilityPermanent(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xBC767A9E), true, 'ATl2')
            call UnitMakeAbilityPermanent(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xBC767A9E), true, 'ATlb')
        else
        endif
    else
    endif
endfunction
function Trig_T_TrollWarlordFunc003Func001Func003T takes nothing returns nothing
    call UnitRemoveAbility(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x458B7DE9), 'A00N')
    call UnitRemoveAbility(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x458B7DE9), 'A01M')
    // 排泄
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
endfunction
function Trig_T_TrollWarlordFunc003Conditions takes nothing returns nothing
    local timer ydl_timer
    if ( ( GetSpellAbilityId() == 'A00Q' ) ) then
        call UnitAddAbility(GetTriggerUnit(), 'A00N')
        call UnitAddAbility(GetTriggerUnit(), 'A01M')
        set ydl_timer=CreateTimer()
        call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x458B7DE9, GetTriggerUnit())
        call TimerStart(ydl_timer, 10.00, false, function Trig_T_TrollWarlordFunc003Func001Func003T)
    else
    endif
    set ydl_timer=null
endfunction
function Trig_T_TrollWarlordFunc004Func001Func004Func002T takes nothing returns nothing
    call UnitRemoveAbility(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xC303079D), 'ATl4')
    call UnitRemoveAbility(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xC303079D), 'ATl5')
    call UnitRemoveAbility(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xC303079D), 'ATl6')
    call SaveUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xC303079D, null)
    // 排泄
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
endfunction
function Trig_T_TrollWarlordFunc004Conditions takes nothing returns nothing
    local timer ydl_timer
    if ( ( GetSpellAbilityId() == 'A00R' ) ) then
        call SetUnitX(GetTriggerUnit(), GetUnitX(GetSpellTargetUnit()))
        call SetUnitY(GetTriggerUnit(), GetUnitY(GetSpellTargetUnit()))
        call UnitAddAbility(GetTriggerUnit(), 'ATlN')
        if ( ( IsUnitAliveBJ(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xBC767A9E)) == true ) ) then
            call SetUnitAbilityLevel(GetTriggerUnit(), 'ATlN', GetUnitAbilityLevel(GetTriggerUnit(), 'A00R'))
            set ydl_timer=CreateTimer()
            call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0xC303079D, GetTriggerUnit())
            call TimerStart(ydl_timer, 5.00, false, function Trig_T_TrollWarlordFunc004Func001Func004Func002T)
        else
        endif
    else
    endif
    set ydl_timer=null
endfunction
function Trig_T_TrollWarlordActions takes nothing returns nothing
    local trigger ydl_trigger
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xBC767A9E, GetSoldUnit())
    set ydl_trigger=CreateTrigger()
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_trigger), 0xBC767A9E, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xBC767A9E))
    call TriggerRegisterUnitEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xBC767A9E), EVENT_UNIT_HERO_SKILL)
    call TriggerAddCondition(ydl_trigger, Condition(function Trig_T_TrollWarlordFunc002Conditions))
    set ydl_trigger=CreateTrigger()
    call TriggerRegisterUnitEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xBC767A9E), EVENT_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(ydl_trigger, Condition(function Trig_T_TrollWarlordFunc003Conditions))
    set ydl_trigger=CreateTrigger()
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_trigger), 0xBC767A9E, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xBC767A9E))
    call TriggerRegisterUnitEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xBC767A9E), EVENT_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(ydl_trigger, Condition(function Trig_T_TrollWarlordFunc004Conditions))
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
    set ydl_trigger=null
endfunction
//===========================================================================
function InitTrig_T_TrollWarlord_Orig takes nothing returns nothing
    set gg_trg_T_TrollWarlord=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_T_TrollWarlord, EVENT_PLAYER_UNIT_SELL)
    call TriggerAddCondition(gg_trg_T_TrollWarlord, Condition(function Trig_T_TrollWarlordConditions))
    call TriggerAddAction(gg_trg_T_TrollWarlord, function Trig_T_TrollWarlordActions)
endfunction
function InitTrig_T_TrollWarlord takes nothing returns nothing
endfunction
//===========================================================================
// Trigger: T_Grunt
//===========================================================================
function Trig_T_GruntConditions takes nothing returns boolean
    return ( ( GetUnitTypeId(GetSoldUnit()) == 'Ogru' ) )
endfunction
function Trig_T_GruntFunc004Conditions takes nothing returns nothing
    if ( ( GetSpellAbilityId() == 'AgrQ' ) ) then
        call h__DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl", GetSpellTargetUnit(), "chest"))
        if ( ( GetUnitLifePercent(GetSpellTargetUnit()) < 50.00 ) ) then
            call UnitDamageTarget(GetTriggerUnit(), GetSpellTargetUnit(), ( ( ( ( 15.00 ) + ( 25.00 ) * ( I2R(GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId())) ) ) ) * ( I2R(GetHeroStr(GetTriggerUnit(), true)) ) * ( 0.20 ) ), false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
        else
            call UnitDamageTarget(GetTriggerUnit(), GetSpellTargetUnit(), ( ( ( ( 15.00 ) + ( 25.00 ) * ( I2R(GetUnitAbilityLevel(GetTriggerUnit(), GetSpellAbilityId())) ) ) ) * ( I2R(GetHeroStr(GetTriggerUnit(), true)) ) * ( 0.10 ) ), false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL, WEAPON_TYPE_WHOKNOWS)
        endif
    else
    endif
endfunction
function Trig_T_GruntFunc006Func001Func007005 takes nothing returns boolean
    return ( ( ( IsUnitAliveBJ(GetFilterUnit()) == true ) and ( ( IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1BF14788))) == true ) and ( ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false ) and ( IsUnitType(GetFilterUnit(), UNIT_TYPE_ANCIENT) == false ) ) ) ) )
endfunction
function Trig_T_GruntFunc006Func001Func008Func001Func001Func001Func007A takes nothing returns nothing
    if ( ( GetDestructableTypeId(GetEnumDestructable()) == 'ZTtw' ) ) then
        call KillDestructable(GetEnumDestructable())
    else
    endif
endfunction
function Trig_T_GruntFunc006Func001Func008Func001Func001A takes nothing returns nothing
    if ( true ) then
        call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x41713DA3, GetUnitX(GetEnumUnit()))
        call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x71CA3531, GetUnitY(GetEnumUnit()))
        call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x41713DA3, ( ( LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x41713DA3) ) - ( 20.00 ) * ( CosBJ(YDWEAngleBetweenUnits(GetEnumUnit() , LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x1BF14788))) ) ))
        call SaveReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x71CA3531, ( ( LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x71CA3531) ) - ( 20.00 ) * ( SinBJ(YDWEAngleBetweenUnits(GetEnumUnit() , LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x1BF14788))) ) ))
        call SaveLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xDD32DE12, GetUnitLoc(GetEnumUnit()))
        call YDWEEnumDestructablesInCircleBJNull(195.00 , LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xDD32DE12) , function Trig_T_GruntFunc006Func001Func008Func001Func001Func001Func007A)
        call h__RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xDD32DE12))
        if ( ( IsTerrainPathable(LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x41713DA3), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x71CA3531), PATHING_TYPE_WALKABILITY) == true ) ) then
            call GroupRemoveUnit(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xD42855DB), GetEnumUnit())
        else
            call SetUnitX(GetEnumUnit(), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x41713DA3))
            call SetUnitY(GetEnumUnit(), LoadReal(YDLOC, GetHandleId(GetExpiredTimer()), 0x71CA3531))
        endif
    else
        call h__DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xD42855DB))
        call h__RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x042BAD75))
        call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
        call DestroyTimer(GetExpiredTimer())
    endif
endfunction
function Trig_T_GruntFunc006Func001Func008Func001T takes nothing returns nothing
    local group ydl_group
    local unit ydl_unit
    call h__ForGroupBJ(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xD42855DB), function Trig_T_GruntFunc006Func001Func008Func001Func001A)
    set ydl_group=null
    set ydl_unit=null
endfunction
function Trig_T_GruntFunc006Conditions takes nothing returns nothing
    local timer ydl_timer
    if ( ( GetSpellAbilityId() == 'AgrR' ) ) then
        call SaveGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD42855DB, CreateGroup())
        call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1BF14788, GetTriggerUnit())
        call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x2392447A, GetUnitX(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1BF14788)))
        call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xB0897302, GetUnitY(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1BF14788)))
        call SaveReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x2CD54C6D, 300.00)
        call SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x042BAD75, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1BF14788)))
        call GroupEnumUnitsInRange(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD42855DB), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x2392447A), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xB0897302), LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x2CD54C6D), Condition(function Trig_T_GruntFunc006Func001Func007005))
        if ( ( h__CountUnitsInGroup(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD42855DB)) == 0 ) ) then
            call h__DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD42855DB))
            call h__RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x042BAD75))
        else
            set ydl_timer=CreateTimer()
            call SaveGroupHandle(YDLOC, GetHandleId(ydl_timer), 0xD42855DB, LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD42855DB))
            call SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 0x042BAD75, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x042BAD75))
            call SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 0xDD32DE12, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xDD32DE12))
            call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x1BF14788, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1BF14788))
            call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x41713DA3, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x41713DA3))
            call SaveReal(YDLOC, GetHandleId(ydl_timer), 0x71CA3531, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x71CA3531))
            call TimerStart(ydl_timer, 0.02, true, function Trig_T_GruntFunc006Func001Func008Func001T)
        endif
    else
    endif
    set ydl_timer=null
endfunction
function Trig_T_GruntActions takes nothing returns nothing
    local trigger ydl_trigger
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xD730CE18, GetSoldUnit())
    // 斩首
    set ydl_trigger=CreateTrigger()
    call TriggerRegisterUnitEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xD730CE18), EVENT_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(ydl_trigger, Condition(function Trig_T_GruntFunc004Conditions))
    // 咆哮
    set ydl_trigger=CreateTrigger()
    call SaveReal(YDLOC, GetHandleId(ydl_trigger), 0x2CD54C6D, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x2CD54C6D))
    call SaveGroupHandle(YDLOC, GetHandleId(ydl_trigger), 0xD42855DB, LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xD42855DB))
    call SaveLocationHandle(YDLOC, GetHandleId(ydl_trigger), 0x042BAD75, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x042BAD75))
    call SaveLocationHandle(YDLOC, GetHandleId(ydl_trigger), 0xDD32DE12, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDD32DE12))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_trigger), 0x1BF14788, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1BF14788))
    call SaveReal(YDLOC, GetHandleId(ydl_trigger), 0x2392447A, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x2392447A))
    call SaveReal(YDLOC, GetHandleId(ydl_trigger), 0x41713DA3, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x41713DA3))
    call SaveReal(YDLOC, GetHandleId(ydl_trigger), 0xB0897302, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB0897302))
    call SaveReal(YDLOC, GetHandleId(ydl_trigger), 0x71CA3531, LoadReal(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x71CA3531))
    call TriggerRegisterUnitEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xD730CE18), EVENT_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(ydl_trigger, Condition(function Trig_T_GruntFunc006Conditions))
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
    set ydl_trigger=null
endfunction
//===========================================================================
function InitTrig_T_Grunt_Orig takes nothing returns nothing
    set gg_trg_T_Grunt=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_T_Grunt, EVENT_PLAYER_UNIT_SELL)
    call TriggerAddCondition(gg_trg_T_Grunt, Condition(function Trig_T_GruntConditions))
    call TriggerAddAction(gg_trg_T_Grunt, function Trig_T_GruntActions)
endfunction
function InitTrig_T_Grunt takes nothing returns nothing
endfunction
//===========================================================================
// Trigger: T_Paladin
//===========================================================================
function Trig_T_PaladinConditions takes nothing returns boolean
    return ( ( GetUnitTypeId(GetSoldUnit()) == 'Hart' ) )
endfunction
function Trig_T_PaladinFunc003Func001Func005Func001Func001T takes nothing returns nothing
    call SelectUnitForPlayerSingle(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xC303079D), GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xC303079D)))
    call h__DestroyEffect(LoadEffectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x239F3A6E))
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
endfunction
function Trig_T_PaladinFunc003Func001Func005Conditions takes nothing returns nothing
    local timer ydl_timer
    if ( ( ( EVENT_UNIT_STATE_LIMIT == GetTriggerEventId() ) == true ) ) then
        set ydl_timer=CreateTimer()
        call SaveEffectHandle(YDLOC, GetHandleId(ydl_timer), 0x239F3A6E, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x239F3A6E))
        call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0xC303079D, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xC303079D))
        call TimerStart(ydl_timer, 0.01, false, function Trig_T_PaladinFunc003Func001Func005Func001Func001T)
        call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()))
        call DestroyTrigger(GetTriggeringTrigger())
    else
    endif
    if ( ( ( EVENT_GAME_TIMER_EXPIRED == GetTriggerEventId() ) == true ) ) then
        call h__DestroyEffect(LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x239F3A6E))
        call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()))
        call DestroyTrigger(GetTriggeringTrigger())
    else
    endif
    set ydl_timer=null
endfunction
function Trig_T_PaladinFunc003Func001Func006T takes nothing returns nothing
    call UnitRemoveAbility(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xC303079D), 'Adrb')
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
endfunction
function Trig_T_PaladinFunc003Conditions takes nothing returns nothing
    local trigger ydl_trigger
    local timer ydl_timer
    if ( ( GetSpellAbilityId() == 'ApdR' ) ) then
        call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xC303079D, GetSpellTargetUnit())
        call YDWETimerDestroyEffect(( ( I2R(GetUnitAbilityLevel(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x33B5DCC9), 'ApdR')) ) * ( 10.00 ) ) , bj_lastCreatedEffect)
        call SaveEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x239F3A6E, AddSpecialEffectTarget("Abilities\\Spells\\Human\\DivineShield\\DivineShieldTarget.mdl", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xC303079D), "origin"))
        call UnitAddAbility(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xC303079D), 'Adrb')
        set ydl_trigger=CreateTrigger()
        call SaveEffectHandle(YDLOC, GetHandleId(ydl_trigger), 0x239F3A6E, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x239F3A6E))
        call SaveUnitHandle(YDLOC, GetHandleId(ydl_trigger), 0xC303079D, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xC303079D))
        call TriggerRegisterUnitLifeEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xC303079D), LESS_THAN, ( 0.81 / 2.00 ))
        call TriggerRegisterTimerEventSingle(ydl_trigger, ( ( I2R(GetUnitAbilityLevel(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x33B5DCC9), 'ApdR')) ) * ( 10.00 ) ))
        call TriggerAddCondition(ydl_trigger, Condition(function Trig_T_PaladinFunc003Func001Func005Conditions))
        set ydl_timer=CreateTimer()
        call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0xC303079D, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xC303079D))
        call TimerStart(ydl_timer, ( I2R(GetUnitAbilityLevel(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x33B5DCC9), 'ApdR')) * 10.00 ), false, function Trig_T_PaladinFunc003Func001Func006T)
    else
    endif
    set ydl_trigger=null
    set ydl_timer=null
endfunction
function Trig_T_PaladinActions takes nothing returns nothing
    local trigger ydl_trigger
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x33B5DCC9, GetSoldUnit())
    call PlaySoundOnUnitBJ(gg_snd_ArthasPissed4, 100, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x33B5DCC9))
    set ydl_trigger=CreateTrigger()
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_trigger), 0x33B5DCC9, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x33B5DCC9))
    call SaveEffectHandle(YDLOC, GetHandleId(ydl_trigger), 0x239F3A6E, LoadEffectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x239F3A6E))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_trigger), 0xC303079D, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC303079D))
    call TriggerRegisterUnitEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x33B5DCC9), EVENT_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(ydl_trigger, Condition(function Trig_T_PaladinFunc003Conditions))
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
    set ydl_trigger=null
endfunction
//===========================================================================
function InitTrig_T_Paladin_Orig takes nothing returns nothing
    set gg_trg_T_Paladin=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_T_Paladin, EVENT_PLAYER_UNIT_SELL)
    call TriggerAddCondition(gg_trg_T_Paladin, Condition(function Trig_T_PaladinConditions))
    call TriggerAddAction(gg_trg_T_Paladin, function Trig_T_PaladinActions)
endfunction
function InitTrig_T_Paladin takes nothing returns nothing
endfunction
//===========================================================================
// Trigger: QQ
//===========================================================================
function Trig_QQActions takes nothing returns nothing
endfunction
//===========================================================================
function InitTrig_QQ takes nothing returns nothing
    set gg_trg_QQ=CreateTrigger()
    call TriggerAddAction(gg_trg_QQ, function Trig_QQActions)
endfunction
//===========================================================================
// Trigger: FovDummy
//===========================================================================
function Trig_FovDummyActions takes nothing returns nothing
    set bj_forLoopAIndex=0
    set bj_forLoopAIndexEnd=10
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        if ( ( udg_Hero[bj_forLoopAIndex] != null ) ) then
            call SetUnitPosition(udg_FovDummy[bj_forLoopAIndex], GetUnitX(udg_Hero[bj_forLoopAIndex]), GetUnitY(udg_Hero[bj_forLoopAIndex]))
        else
        endif
        set bj_forLoopAIndex=bj_forLoopAIndex + 1
    endloop
endfunction
//===========================================================================
function InitTrig_FovDummy_Orig takes nothing returns nothing
    set gg_trg_FovDummy=CreateTrigger()
    call TriggerRegisterTimerEventPeriodic(gg_trg_FovDummy, 0.03)
    call TriggerAddAction(gg_trg_FovDummy, function Trig_FovDummyActions)
endfunction
function InitTrig_FovDummy takes nothing returns nothing
endfunction
//===========================================================================
// Trigger: 初始化选项
//===========================================================================
function Trig________________uActions takes nothing returns nothing
    call CreateMultiboardBJ(3, 11, "游戏")
    set udg_DMB=bj_lastCreatedMultiboard
    call MultiboardSetItemsWidth(udg_DMB, 0.05)
    call MultiboardSetItemsStyle(udg_DMB, true, false)
    // 第一行
    call YDWEMultiboardSetItemValueBJNull(udg_DMB , 1 , 1 , "玩家")
    call YDWEMultiboardSetItemValueBJNull(udg_DMB , 2 , 1 , "英雄")
    call YDWEMultiboardSetItemValueBJNull(udg_DMB , 3 , 1 , "英雄")
    // 玩家名字
    call YDWEMultiboardSetItemValueBJNull(udg_DMB , 1 , 2 , ( "|c00ff0303" + ( GetPlayerName(udg_PG[0]) + "|r" ) ))
    call YDWEMultiboardSetItemValueBJNull(udg_DMB , 1 , 3 , ( "|c000042ff" + ( GetPlayerName(udg_PG[1]) + "|r" ) ))
    call YDWEMultiboardSetItemValueBJNull(udg_DMB , 1 , 4 , ( "|c001ce6b9" + ( GetPlayerName(udg_PG[2]) + "|r" ) ))
    call YDWEMultiboardSetItemValueBJNull(udg_DMB , 1 , 5 , ( "|c00540081" + ( GetPlayerName(udg_PG[3]) + "|r" ) ))
    call YDWEMultiboardSetItemValueBJNull(udg_DMB , 1 , 6 , ( "|c00fffc01" + ( GetPlayerName(udg_PG[4]) + "|r" ) ))
    call YDWEMultiboardSetItemValueBJNull(udg_DMB , 1 , 7 , ( "|c00ff8000" + ( GetPlayerName(udg_PG[5]) + "|r" ) ))
    call YDWEMultiboardSetItemValueBJNull(udg_DMB , 1 , 8 , ( "|c0020c000" + ( GetPlayerName(udg_PG[6]) + "|r" ) ))
    call YDWEMultiboardSetItemValueBJNull(udg_DMB , 1 , 9 , ( "|c00e55bb0" + ( GetPlayerName(udg_PG[8]) + "|r" ) ))
    call YDWEMultiboardSetItemValueBJNull(udg_DMB , 1 , 10 , ( "|c00959697" + ( GetPlayerName(udg_PG[8]) + "|r" ) ))
    call YDWEMultiboardSetItemValueBJNull(udg_DMB , 1 , 11 , ( "|c007ebff1" + ( GetPlayerName(udg_PG[9]) + "|r" ) ))
    // 玩家名字颜色
    call YDWEMultiboardSetItemColorBJNull(udg_DMB , 1 , 2 , 100 , 100.00 , 100.00 , 0)
    call YDWEMultiboardSetItemColorBJNull(udg_DMB , 1 , 3 , 100.00 , 100.00 , 100.00 , 0)
    call YDWEMultiboardSetItemColorBJNull(udg_DMB , 1 , 4 , 100.00 , 100.00 , 100.00 , 0)
    call YDWEMultiboardSetItemColorBJNull(udg_DMB , 1 , 5 , 100.00 , 100.00 , 100.00 , 0)
    call YDWEMultiboardSetItemColorBJNull(udg_DMB , 1 , 6 , 100.00 , 100.00 , 100.00 , 0)
    call YDWEMultiboardSetItemColorBJNull(udg_DMB , 1 , 7 , 100.00 , 100.00 , 100.00 , 0)
    call YDWEMultiboardSetItemColorBJNull(udg_DMB , 1 , 8 , 100.00 , 100.00 , 100.00 , 0)
    call YDWEMultiboardSetItemColorBJNull(udg_DMB , 1 , 9 , 100.00 , 100.00 , 100.00 , 0)
    call YDWEMultiboardSetItemColorBJNull(udg_DMB , 1 , 10 , 100.00 , 100.00 , 100.00 , 0)
    call YDWEMultiboardSetItemColorBJNull(udg_DMB , 1 , 11 , 100.00 , 100.00 , 100.00 , 0)
endfunction
//===========================================================================
function InitTrig________________u_Orig takes nothing returns nothing
    set gg_trg________________u=CreateTrigger()
    call TriggerRegisterTimerEventSingle(gg_trg________________u, 5.00)
    call TriggerAddAction(gg_trg________________u, function Trig________________uActions)
endfunction
function InitTrig________________u takes nothing returns nothing
endfunction
//===========================================================================
// Trigger: StartMovie
//===========================================================================
function Trig_StartMovieFunc006A takes nothing returns nothing
    call YDWESetUnitFacingToFaceUnitTimedNull(GetEnumUnit() , udg_StartTent , 0)
endfunction
function Trig_StartMovieFunc044T takes nothing returns nothing
    call Juhuasnake()
endfunction
function Trig_StartMovieFunc045T takes nothing returns nothing
    call Juhuasnake()
endfunction
function Trig_StartMovieFunc046T takes nothing returns nothing
    call Juhuasnake()
endfunction
function Trig_StartMovieFunc047T takes nothing returns nothing
    call Juhuasnake()
endfunction
function Trig_StartMovieFunc085A takes nothing returns nothing
    call ShowUnit(GetEnumUnit(), false)
endfunction
function Trig_StartMovieFunc089A takes nothing returns nothing
    call SelectUnitForPlayerSingle(udg_StartTent, GetEnumPlayer())
endfunction
function Trig_StartMovieActions takes nothing returns nothing
    local group ydl_group
    local unit ydl_unit
    local timer ydl_timer
    call ConditionalTriggerExecute(gg_trg_Music1)
    call ForGroup(udg_DummyGroup, function showunitT)
    // 设置镜头
    call ForGroup(udg_DummyGroup, function Sleep)
    call PanCameraToTimed(- 25248.00, - 24512.00, 0.00)
    call h__ForGroupBJ(udg_DummyGroup, function Trig_StartMovieFunc006A)
    // 电影准备
    call MovieStart()
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEOUT, 5.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 0, 0, 0, 0)
    call CinematicFadeBJ(bj_CINEFADETYPE_FADEIN, 5.00, "ReplaceableTextures\\CameraMasks\\Black_mask.blp", 0, 0, 0, 0)
    set udg_OffMovie=false
    call EnableTrigger(gg_trg_EscStartMovie)
    // 对话And镜头
    // 跳过剧情
    if ( ( udg_booleanEscMovie == true ) ) then
        call EnableTrigger(gg_trg_EscStartMovie)
    else
    endif
    if ( ( udg_booleanMovie == false ) ) then
        call ForceUICancelBJ(Player(0))
    else
    endif
    if ( ( udg_booleanEscMovie == true ) and ( udg_OffMovie == true ) ) then
        set ydl_group=null
        set ydl_unit=null
        set ydl_timer=null
        return
    else
    endif
    call UnitWakeUp(udg_Dummy[0])
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_Dummy[0], "菊花", null, "啊，这是怎么回事，我这是在哪儿？", bj_TIMETYPE_SET, 3.50, true)
    // 跳过剧情
    if ( ( udg_booleanEscMovie == true ) and ( udg_OffMovie == true ) ) then
        set ydl_group=null
        set ydl_unit=null
        set ydl_timer=null
        return
    else
    endif
    call YDWESetUnitFacingToFaceUnitTimedNull(udg_Dummy[0] , udg_Dummy[3] , 1.00)
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_Dummy[0], "菊花", null, "惹，这难道又是9d的诡计，这些人看起来也不是什么好鸟。", bj_TIMETYPE_SET, 5.00, true)
    // 跳过剧情
    if ( ( udg_booleanEscMovie == true ) and ( udg_OffMovie == true ) ) then
        set ydl_group=null
        set ydl_unit=null
        set ydl_timer=null
        return
    else
    endif
    call YDWESetUnitFacingToFaceUnitTimedNull(udg_Dummy[0] , udg_Dummy[7] , 1.00)
    call UnitWakeUp(udg_Dummy[4])
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_Dummy[0], "菊花", null, "他们可能是9d的人，先下手为强。把他们痧了。", bj_TIMETYPE_SET, 4.00, true)
    // 跳过剧情
    if ( ( udg_booleanEscMovie == true ) and ( udg_OffMovie == true ) ) then
        set ydl_group=null
        set ydl_unit=null
        set ydl_timer=null
        return
    else
    endif
    call YDWESetUnitFacingToFaceUnitTimedNull(udg_Dummy[4] , udg_Dummy[0] , 1.00)
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_Dummy[4], GetUnitName(udg_Dummy[4]), null, "嗨，你就是那个可以稳定控制多重的食人魔法师菊花？", bj_TIMETYPE_SET, 3.00, true)
    // 跳过剧情
    if ( ( udg_booleanEscMovie == true ) and ( udg_OffMovie == true ) ) then
        set ydl_group=null
        set ydl_unit=null
        set ydl_timer=null
        return
    else
    endif
    call YDWESetUnitFacingToFaceUnitTimedNull(udg_Dummy[0] , udg_Dummy[4] , 1.00)
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_Dummy[0], "菊花", null, "这人怎么还认识我？惹狗。", bj_TIMETYPE_SET, 3.00, true)
    // 跳过剧情
    if ( ( udg_booleanEscMovie == true ) and ( udg_OffMovie == true ) ) then
        set ydl_group=null
        set ydl_unit=null
        set ydl_timer=null
        return
    else
    endif
    call UnitWakeUp(udg_Dummy[10])
    call UnitAddAbility(udg_Dummy[10], 'ApdQ')
    call SetUnitAbilityLevel(udg_Dummy[10], 'ApdQ', 4)
    call SetUnitManaPercentBJ(udg_Dummy[10], 100)
    call IssueTargetOrder(udg_Dummy[10], "innerfire", udg_Dummy[4])
    set ydl_timer=CreateTimer()
    call TimerStart(ydl_timer, 0.20, false, function Trig_StartMovieFunc044T)
    set ydl_timer=CreateTimer()
    call TimerStart(ydl_timer, 0.40, false, function Trig_StartMovieFunc045T)
    set ydl_timer=CreateTimer()
    call TimerStart(ydl_timer, 0.60, false, function Trig_StartMovieFunc046T)
    set ydl_timer=CreateTimer()
    call TimerStart(ydl_timer, 0.80, false, function Trig_StartMovieFunc047T)
    call SetUnitAnimation(udg_Dummy[0], "spell")
    call CreateTextTagUnitBJ("|CFFFF00004x多重施法！！|r", udg_Dummy[0], 0, 15.00, 100, 100, 100, 0)
    // 跳过剧情
    if ( ( udg_booleanEscMovie == true ) and ( udg_OffMovie == true ) ) then
        set ydl_group=null
        set ydl_unit=null
        set ydl_timer=null
        return
    else
    endif
    call SetTextTagVisibility(bj_lastCreatedTextTag, true)
    call SetTextTagPermanent(bj_lastCreatedTextTag, false)
    call SetTextTagVelocityBJ(bj_lastCreatedTextTag, 64, 90)
    call SetTextTagLifespan(bj_lastCreatedTextTag, 3.00)
    call SetTextTagFadepoint(bj_lastCreatedTextTag, 2.00)
    call YDWETimerDestroyTextTag(3.00 , bj_lastCreatedTextTag)
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_Dummy[0], "菊花", gg_snd_ShouSiJuHua, "受死！", bj_TIMETYPE_SET, 2.00, false)
    call ResetUnitAnimation(udg_Dummy[0])
    // 跳过剧情
    if ( ( udg_booleanEscMovie == true ) and ( udg_OffMovie == true ) ) then
        set ydl_group=null
        set ydl_unit=null
        set ydl_timer=null
        return
    else
    endif
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_Dummy[10], GetUnitName(udg_Dummy[10]), null, "冷静一下，我们并不是敌对的，听我说，我之前所在的教堂已经沦为他的猪场了，我和贡菊人在走投无路下进入一个传送门，醒来后就在这个地方了。", bj_TIMETYPE_SET, 8.00, true)
    call UnitWakeUp(udg_Dummy[1])
    call UnitWakeUp(udg_Dummy[2])
    call UnitWakeUp(udg_Dummy[3])
    call UnitWakeUp(udg_Dummy[5])
    call UnitWakeUp(udg_Dummy[6])
    call UnitWakeUp(udg_Dummy[8])
    call UnitWakeUp(udg_Dummy[7])
    call UnitWakeUp(udg_Dummy[9])
    // 跳过剧情
    if ( ( udg_booleanEscMovie == true ) and ( udg_OffMovie == true ) ) then
        set ydl_group=null
        set ydl_unit=null
        set ydl_timer=null
        return
    else
    endif
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_Dummy[0], "菊花", null, "可是你们怎么证明你们不是9D派来的人？", bj_TIMETYPE_SET, 4.00, true)
    // 跳过剧情
    if ( ( udg_booleanEscMovie == true ) and ( udg_OffMovie == true ) ) then
        set ydl_group=null
        set ydl_unit=null
        set ydl_timer=null
        return
    else
    endif
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_Dummy[4], GetUnitName(udg_Dummy[4]), null, "我们像是同一个情况，我能感觉的到我们的力量都被削弱了，也许是那个传送门的原因。", bj_TIMETYPE_SET, 5.00, true)
    // 跳过剧情
    if ( ( udg_booleanEscMovie == true ) and ( udg_OffMovie == true ) ) then
        set ydl_group=null
        set ydl_unit=null
        set ydl_timer=null
        return
    else
    endif
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_Dummy[8], GetUnitName(udg_Dummy[8]), null, "食人魔，我们并无敌意。看在同为部落的份上给个面子。我认识贡菊人，他的人品是值得信任的。", bj_TIMETYPE_SET, 5.00, true)
    call DisableTrigger(gg_trg_EscStartMovie)
    // 跳过剧情
    if ( ( udg_booleanEscMovie == true ) and ( udg_OffMovie == true ) ) then
        set ydl_group=null
        set ydl_unit=null
        set ydl_timer=null
        return
    else
    endif
    // 电影结束
    call ForGroup(udg_DummyGroup, function showunitF)
    call h__ForGroupBJ(udg_DummyGroup, function Trig_StartMovieFunc085A)
    if ( ( udg_booleanEscMovie == true ) ) then
        call DisableTrigger(gg_trg_EscStartMovie)
    else
    endif
    call MovieEnd()
    call ForGroup(udg_StrartUnitGroup, function showunitT)
    call ForForce(udg_OE, function Trig_StartMovieFunc089A)
    // End
    call DestroyTrigger(GetTriggeringTrigger())
    set ydl_group=null
    set ydl_unit=null
    set ydl_timer=null
endfunction
//===========================================================================
function InitTrig_StartMovie_Orig takes nothing returns nothing
    set gg_trg_StartMovie=CreateTrigger()
    call TriggerAddAction(gg_trg_StartMovie, function Trig_StartMovieActions)
endfunction
function InitTrig_StartMovie takes nothing returns nothing
endfunction
//===========================================================================
// Trigger: EscStartMovie
//===========================================================================
function Trig_EscStartMovieConditions takes nothing returns boolean
    return ( ( udg_booleanEscMovie == true ) )
endfunction
function Trig_EscStartMovieFunc005A takes nothing returns nothing
    call ShowUnit(GetEnumUnit(), false)
endfunction
function Trig_EscStartMovieFunc007A takes nothing returns nothing
    call ShowUnit(GetEnumUnit(), true)
endfunction
function Trig_EscStartMovieFunc008A takes nothing returns nothing
    call SelectUnitForPlayerSingle(udg_StartTent, GetEnumPlayer())
endfunction
function Trig_EscStartMovieActions takes nothing returns nothing
    local group ydl_group
    local unit ydl_unit
    call DisableTrigger(GetTriggeringTrigger())
    call MovieEnd()
    set udg_OffMovie=true
    call h__ForGroupBJ(udg_DummyGroup, function Trig_EscStartMovieFunc005A)
    // 显示初始单位
    call h__ForGroupBJ(udg_StrartUnitGroup, function Trig_EscStartMovieFunc007A)
    call ForForce(udg_OE, function Trig_EscStartMovieFunc008A)
    // End
    call DestroyTrigger(gg_trg_StartMovie)
    call DestroyTrigger(GetTriggeringTrigger())
    set ydl_group=null
    set ydl_unit=null
endfunction
//===========================================================================
function InitTrig_EscStartMovie_Orig takes nothing returns nothing
    set gg_trg_EscStartMovie=CreateTrigger()
    call DisableTrigger(gg_trg_EscStartMovie)
    call TriggerRegisterPlayerEventEndCinematic(gg_trg_EscStartMovie, Player(0))
    call TriggerAddCondition(gg_trg_EscStartMovie, Condition(function Trig_EscStartMovieConditions))
    call TriggerAddAction(gg_trg_EscStartMovie, function Trig_EscStartMovieActions)
endfunction
function InitTrig_EscStartMovie takes nothing returns nothing
endfunction
//===========================================================================
// Trigger: Music1
//===========================================================================
function Trig_Music1Actions takes nothing returns nothing
    call StopMusic(false)
endfunction
//===========================================================================
function InitTrig_Music1_Orig takes nothing returns nothing
    set gg_trg_Music1=CreateTrigger()
    call TriggerAddAction(gg_trg_Music1, function Trig_Music1Actions)
endfunction
function InitTrig_Music1 takes nothing returns nothing
endfunction
//===========================================================================
// Trigger: Music2
//===========================================================================
function Trig_Music2Func003T takes nothing returns nothing
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
endfunction
function Trig_Music2Actions takes nothing returns nothing
    local timer ydl_timer
    call StopMusic(false)
    set ydl_timer=CreateTimer()
    call TimerStart(ydl_timer, 2.00, false, function Trig_Music2Func003T)
    set ydl_timer=null
endfunction
//===========================================================================
function InitTrig_Music2_Orig takes nothing returns nothing
    set gg_trg_Music2=CreateTrigger()
    call TriggerAddAction(gg_trg_Music2, function Trig_Music2Actions)
endfunction
function InitTrig_Music2 takes nothing returns nothing
endfunction
//===========================================================================
// Trigger: Sphere_Start
//===========================================================================
function Trig_Sphere_StartFunc003Conditions takes nothing returns nothing
    if ( ( ( EVENT_GAME_TIMER_EXPIRED == GetTriggerEventId() ) == true ) ) then
        call BJDebugMsg("伤害事件重建")
        call DestroyTrigger(udg_SphereStart)
        call ConditionalTriggerExecute(gg_trg_Sphere_Start)
        call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()))
        call DestroyTrigger(GetTriggeringTrigger())
    else
    endif
endfunction
function Trig_Sphere_StartActions takes nothing returns nothing
    local trigger ydl_trigger
    set udg_SphereStart=CreateTrigger()
    set ydl_trigger=udg_SphereStart
    call TriggerRegisterTimerEventSingle(ydl_trigger, 600.00)
    call YDWESyStemAnyUnitDamagedRegistTrigger(ydl_trigger)
    call TriggerAddCondition(ydl_trigger, Condition(function Trig_Sphere_StartFunc003Conditions))
    set ydl_trigger=null
endfunction
//===========================================================================
function InitTrig_Sphere_Start_Orig takes nothing returns nothing
    set gg_trg_Sphere_Start=CreateTrigger()
    call TriggerAddAction(gg_trg_Sphere_Start, function Trig_Sphere_StartActions)
endfunction
function InitTrig_Sphere_Start takes nothing returns nothing
endfunction
//===========================================================================
// Trigger: Heihei
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_HeiheiFunc001A takes nothing returns nothing
    call AdjustPlayerStateBJ(1000, GetEnumPlayer(), PLAYER_STATE_RESOURCE_LUMBER)
endfunction
function Trig_HeiheiActions takes nothing returns nothing
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call ForForce(GetPlayersAll(), function Trig_HeiheiFunc001A)
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1BF14788, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'zsmc', - 24640.00, - 27104.00, 0))
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x2D5DEA42, CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'zshv', - 24608.00, - 27104.00, 0))
    call UnitAddAbility(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1BF14788), 'Asud')
    call UnitAddAbility(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x2D5DEA42), 'Asud')
    call UnitAddAbility(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1BF14788), 'Avul')
    call UnitAddAbility(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x2D5DEA42), 'Avul')
    call UnitAddAbility(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1BF14788), 'Ane2')
    call UnitAddAbility(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x2D5DEA42), 'Ane2')
    call AddUnitToStockBJ('zsmc', LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1BF14788), 100, 100)
    call AddUnitToStockBJ('zshv', LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x2D5DEA42), 100, 100)
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_Heihei_Orig takes nothing returns nothing
    set gg_trg_Heihei=CreateTrigger()
    call TriggerRegisterTimerEventSingle(gg_trg_Heihei, 1.00)
    call TriggerAddAction(gg_trg_Heihei, function Trig_HeiheiActions)
endfunction
//===========================================================================
// Trigger: HideEgg
//===========================================================================
function Trig_HideEggConditions takes nothing returns boolean
    return ( ( ( GetUnitTypeId(GetSellingUnit()) == 'zsmc' ) or ( GetUnitTypeId(GetSellingUnit()) == 'zshv' ) ) )
endfunction
function Trig_HideEggFunc005Conditions takes nothing returns nothing
    call RemoveSavedHandle(YDHT, GetHandleId(GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xC303079D))), 0x1139E929)
    call GroupRemoveUnit(udg_EggGroup, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xC303079D))
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()))
    call DestroyTrigger(GetTriggeringTrigger())
endfunction
function Trig_HideEggActions takes nothing returns nothing
    local trigger ydl_trigger
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC303079D, GetSoldUnit())
    call SetUnitPosition(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC303079D), - 25312.00, - 24544.00)
    call GroupAddUnit(udg_EggGroup, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC303079D))
    call SaveUnitHandle(YDHT, GetHandleId(GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC303079D))), 0x1139E929, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC303079D))
    set ydl_trigger=CreateTrigger()
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_trigger), 0xC303079D, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC303079D))
    call TriggerRegisterUnitEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC303079D), EVENT_UNIT_DEATH)
    call TriggerAddCondition(ydl_trigger, Condition(function Trig_HideEggFunc005Conditions))
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
    set ydl_trigger=null
endfunction
//===========================================================================
function InitTrig_HideEgg_Orig takes nothing returns nothing
    set gg_trg_HideEgg=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_HideEgg, EVENT_PLAYER_UNIT_SELL)
    call TriggerAddCondition(gg_trg_HideEgg, Condition(function Trig_HideEggConditions))
    call TriggerAddAction(gg_trg_HideEgg, function Trig_HideEggActions)
endfunction
function InitTrig_HideEgg takes nothing returns nothing
endfunction
//===========================================================================
// Trigger: Black shadow
//===========================================================================
function Trig_Black_shadowConditions takes nothing returns boolean
    return ( ( GetItemTypeId(GetManipulatedItem()) == 'ledg' ) )
endfunction
function Trig_Black_shadowActions takes nothing returns nothing
    call FogMaskEnable(false)
    call FogEnable(false)
endfunction
//===========================================================================
function InitTrig_Black_shadow takes nothing returns nothing
    set gg_trg_Black_shadow=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Black_shadow, EVENT_PLAYER_UNIT_PICKUP_ITEM)
    call TriggerAddCondition(gg_trg_Black_shadow, Condition(function Trig_Black_shadowConditions))
    call TriggerAddAction(gg_trg_Black_shadow, function Trig_Black_shadowActions)
endfunction
//===========================================================================
// Trigger: Open Black shadow
//===========================================================================
function Trig_Open_Black_shadowConditions takes nothing returns boolean
    return ( ( GetItemTypeId(GetManipulatedItem()) == 'ledg' ) )
endfunction
function Trig_Open_Black_shadowActions takes nothing returns nothing
    call FogMaskEnable(true)
    call FogEnable(true)
endfunction
//===========================================================================
function InitTrig_Open_Black_shadow takes nothing returns nothing
    set gg_trg_Open_Black_shadow=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Open_Black_shadow, EVENT_PLAYER_UNIT_DROP_ITEM)
    call TriggerAddCondition(gg_trg_Open_Black_shadow, Condition(function Trig_Open_Black_shadowConditions))
    call TriggerAddAction(gg_trg_Open_Black_shadow, function Trig_Open_Black_shadowActions)
endfunction
//===========================================================================
// Trigger: Fog of war
//===========================================================================
function Trig_Fog_of_warActions takes nothing returns nothing
    call FogEnable(false)
endfunction
//===========================================================================
function InitTrig_Fog_of_war_Orig takes nothing returns nothing
    set gg_trg_Fog_of_war=CreateTrigger()
    call TriggerAddAction(gg_trg_Fog_of_war, function Trig_Fog_of_warActions)
endfunction
function InitTrig_Fog_of_war takes nothing returns nothing
endfunction
//===========================================================================
// Trigger: Open the fog of war
//===========================================================================
function Trig_Open_the_fog_of_warActions takes nothing returns nothing
    call FogEnable(true)
endfunction
//===========================================================================
function InitTrig_Open_the_fog_of_war_Orig takes nothing returns nothing
    set gg_trg_Open_the_fog_of_war=CreateTrigger()
    call TriggerAddAction(gg_trg_Open_the_fog_of_war, function Trig_Open_the_fog_of_warActions)
endfunction
function InitTrig_Open_the_fog_of_war takes nothing returns nothing
endfunction
//===========================================================================
// Trigger: Item_superposition
//===========================================================================
function Trig_Item_superpositionConditions takes nothing returns boolean
    return ( ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) )
endfunction
function Trig_Item_superpositionActions takes nothing returns nothing
    local integer ydul_Item
    if ( ( GetItemType(GetManipulatedItem()) == ITEM_TYPE_CHARGED ) ) then
        set ydul_Item=0
        loop
            exitwhen ydul_Item > 5
            if ( ( GetItemTypeId(UnitItemInSlot(GetTriggerUnit(), ydul_Item)) == GetItemTypeId(GetManipulatedItem()) ) and ( UnitItemInSlot(GetTriggerUnit(), ydul_Item) != GetManipulatedItem() ) ) then
                call SetItemCharges(UnitItemInSlot(GetTriggerUnit(), ydul_Item), ( GetItemCharges(UnitItemInSlot(GetTriggerUnit(), ydul_Item)) + GetItemCharges(GetManipulatedItem()) ))
                call RemoveItem(GetManipulatedItem())
            else
            endif
            set ydul_Item=ydul_Item + 1
        endloop
    else
        if ( ( GetItemType(GetManipulatedItem()) == ITEM_TYPE_POWERUP ) ) then
            call SetWidgetLife(GetManipulatedItem(), 1.00)
            call RemoveItem(GetManipulatedItem())
        else
        endif
    endif
endfunction
//===========================================================================
function InitTrig_Item_superposition_Orig takes nothing returns nothing
    set gg_trg_Item_superposition=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Item_superposition, EVENT_PLAYER_UNIT_PICKUP_ITEM)
    call TriggerAddCondition(gg_trg_Item_superposition, Condition(function Trig_Item_superpositionConditions))
    call TriggerAddAction(gg_trg_Item_superposition, function Trig_Item_superpositionActions)
endfunction
function InitTrig_Item_superposition takes nothing returns nothing
endfunction
//===========================================================================
// Trigger: Discard Items
//===========================================================================
function Trig_Discard_ItemsFunc006T takes nothing returns nothing
    // 设置整数（最后移动的物品的位置）为最后移动的物品现在位置，即移动物品事件发生后的0.01s
    call SaveInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0xBC843B1F, YDWEGetInventoryIndexOfItemTypeBJNull(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x458B7DE9) , GetItemTypeId(LoadItemHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xC4D7CFDD))))
    if ( ( LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0x8473D6A7) == LoadInteger(YDLOC, GetHandleId(GetExpiredTimer()), 0xBC843B1F) ) and ( GetItemType((bj_lastMovedItemInItemSlot)) == ITEM_TYPE_CHARGED ) and ( GetItemCharges((bj_lastMovedItemInItemSlot)) > 1 ) ) then // INLINED!!
        call DisplayTextToForce(GetPlayersAll(), ( ( GetPlayerName(GetOwningPlayer(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x458B7DE9))) ) + ( "丢弃了" ) + ( ( ( "一个" ) + ( GetItemName((bj_lastMovedItemInItemSlot)) ) + ( "在英雄脚下。" ) ) ) )) // INLINED!!
        call CreateItem(GetItemTypeId((bj_lastMovedItemInItemSlot)), GetUnitX(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x458B7DE9)), GetUnitY(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x458B7DE9))) // INLINED!!
        call SetItemCharges(LoadItemHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xC4D7CFDD), ( GetItemCharges(LoadItemHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xC4D7CFDD)) - 1 ))
        call SetItemCharges(GetLastCreatedItem(), 1)
        call SaveItemHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xC4D7CFDD, null)
    else
    endif
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
endfunction
function Trig_Discard_ItemsActions takes nothing returns nothing
    local timer ydl_timer
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    // 捕捉最后移动的物品
    call SaveItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC4D7CFDD, YDWEGetItemOfTypeFromUnitBJNull(GetTriggerUnit() , GetItemTypeId((bj_lastMovedItemInItemSlot)))) // INLINED!!
    call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x8473D6A7, YDWEGetInventoryIndexOfItemTypeBJNull(GetTriggerUnit() , GetItemTypeId((bj_lastMovedItemInItemSlot)))) // INLINED!!
    // 为了获取移动后的物品位置 延迟触发0.01s
    set ydl_timer=CreateTimer()
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x458B7DE9, GetTriggerUnit())
    call SaveInteger(YDLOC, GetHandleId(ydl_timer), 0x8473D6A7, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x8473D6A7))
    call SaveItemHandle(YDLOC, GetHandleId(ydl_timer), 0xC4D7CFDD, LoadItemHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC4D7CFDD))
    call SaveInteger(YDLOC, GetHandleId(ydl_timer), 0xBC843B1F, LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xBC843B1F))
    call TimerStart(ydl_timer, 0.01, false, function Trig_Discard_ItemsFunc006T)
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
    set ydl_timer=null
endfunction
//===========================================================================
function InitTrig_Discard_Items_Orig takes nothing returns nothing
    set gg_trg_Discard_Items=CreateTrigger()
    call YDWESyStemItemUnmovableRegistTrigger(gg_trg_Discard_Items)
    call TriggerAddAction(gg_trg_Discard_Items, function Trig_Discard_ItemsActions)
endfunction
function InitTrig_Discard_Items takes nothing returns nothing
endfunction
//===========================================================================
// Trigger: Dialog_Tf
//===========================================================================
function Trig_Dialog_TfFunc003A takes nothing returns nothing
    if ( ( GetUnitTypeId(GetEnumUnit()) == 'Hpri' ) ) then
        call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7), 0x25DAB820, ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7), 0x25DAB820) + 1 ))
        call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7), 0x87517155, GetEnumUnit())
    else
    endif
    if ( ( GetUnitTypeId(GetEnumUnit()) == 'Hart' ) ) then
        call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7), 0x25DAB820, ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7), 0x25DAB820) + 1 ))
        call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7), 0x33B5DCC9, GetEnumUnit())
    else
    endif
endfunction
function Trig_Dialog_TfActions takes nothing returns nothing
    local group ydl_group
    local unit ydl_unit
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x25DAB820, 0)
    call h__ForGroupBJ(udg_HeroGroup, function Trig_Dialog_TfFunc003A)
    if ( ( LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x25DAB820) == 2 ) ) then
        if ( ( GetRandomInt(1, 2) == 1 ) ) then
            call TransmissionFromUnitWithNameBJ(GetPlayersAll(), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x87517155), GetUnitName(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x87517155)), null, "- Be gone spawn of Darkness! 
- 消失吧，黑暗之子！", bj_TIMETYPE_SET, 2.27, false)
            call PlaySoundOnUnitBJ(gg_snd_PriestYesAttack1, 100, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x87517155))
        else
            call PlaySoundOnUnitBJ(gg_snd_ArthasYesAttack2, 100, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x33B5DCC9))
            call TransmissionFromUnitWithNameBJ(GetPlayersAll(), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x33B5DCC9), GetUnitName(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x33B5DCC9)), null, "- Betrayer of the light.
- 圣光的背叛者。", bj_TIMETYPE_SET, 1.40, true)
            call TransmissionFromUnitWithNameBJ(GetPlayersAll(), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x33B5DCC9), GetUnitName(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x33B5DCC9)), null, "- Feel my wrath!
- 感受我的愤怒！", bj_TIMETYPE_SET, 1.25, false)
            call PlaySoundOnUnitBJ(gg_snd_ArthasYesAttack5, 100, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x33B5DCC9))
        endif
    else
        if ( ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x87517155) == null ) and ( GetUnitTypeId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x33B5DCC9)) == 'Hart' ) ) then
            call PlaySoundOnUnitBJ(gg_snd_ArthasYesAttack2, 100, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x33B5DCC9))
            call TransmissionFromUnitWithNameBJ(GetPlayersAll(), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x33B5DCC9), GetUnitName(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x33B5DCC9)), null, "- Betrayer of the light.
- 圣光的背叛者。", bj_TIMETYPE_SET, 1.40, true)
            call TransmissionFromUnitWithNameBJ(GetPlayersAll(), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x33B5DCC9), GetUnitName(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x33B5DCC9)), null, "- Feel my wrath!
- 感受我的愤怒！", bj_TIMETYPE_SET, 1.25, false)
            call PlaySoundOnUnitBJ(gg_snd_ArthasYesAttack5, 100, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x33B5DCC9))
        else
            if ( ( LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x33B5DCC9) == null ) and ( GetUnitTypeId(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x87517155)) == 'Hpri' ) ) then
                call TransmissionFromUnitWithNameBJ(GetPlayersAll(), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x87517155), GetUnitName(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x87517155)), null, "- Be gone spawn of Darkness! 
- 消失吧，黑暗之子！", bj_TIMETYPE_SET, 2.27, false)
                call PlaySoundOnUnitBJ(gg_snd_PriestYesAttack1, 100, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x87517155))
            else
            endif
        endif
    endif
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
    set ydl_group=null
    set ydl_unit=null
endfunction
//===========================================================================
function InitTrig_Dialog_Tf_Orig takes nothing returns nothing
    set gg_trg_Dialog_Tf=CreateTrigger()
    call TriggerAddAction(gg_trg_Dialog_Tf, function Trig_Dialog_TfActions)
endfunction
function InitTrig_Dialog_Tf takes nothing returns nothing
endfunction
//===========================================================================
// Trigger: Boos_Tf
//
// call GDS("Flesh Heap")
//===========================================================================
function Trig_Boos_TfFunc016A takes nothing returns nothing
    call SetUnitLifePercentBJ(GetEnumUnit(), 100)
    call SetUnitManaPercentBJ(GetEnumUnit(), 100)
    call SetUnitPosition(GetEnumUnit(), - 15500.00, - 26780.00)
    call SetUnitFacing(GetEnumUnit(), YDWEAngleBetweenUnits(GetEnumUnit() , udg_Boos[0]))
    call IssuePointOrderById(GetEnumUnit(), 851983, - 13580.00, - 26820.00)
    call SetUnitInvulnerable(GetEnumUnit(), true)
endfunction
function Trig_Boos_TfFunc017A takes nothing returns nothing
    call SetUnitLifePercentBJ(GetEnumUnit(), 100)
    call SetUnitManaPercentBJ(GetEnumUnit(), 100)
    call SetUnitPosition(GetEnumUnit(), - 15104.00, - 26848.00)
    call PauseUnit(GetEnumUnit(), true)
    call SetUnitInvulnerable(GetEnumUnit(), true)
endfunction
function Trig_Boos_TfFunc025T takes nothing returns nothing
    call SetUnitAnimation(udg_Boos[0], "Attack")
    call SaveUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x535B7E08, CreateUnit(Player(10), 'dBmt', - 13650.00, - 26880.00, 0))
    call UnitAddAbility(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x535B7E08), 'ATft')
    call IssueNeutralPointOrderById(Player(10), LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x535B7E08), String2OrderIdBJ("channel"), GetUnitX(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x512DC35A)), GetUnitY(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x512DC35A)))
    call Meathook(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x535B7E08) , - 15500.00 , - 26880.00)
    call SetUnitInvulnerable(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x512DC35A), false)
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
endfunction
function Trig_Boos_TfFunc026T takes nothing returns nothing
    call IssueTargetOrder(udg_Boos[0], "magicleash", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x512DC35A))
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_Boos[0], GetUnitName(udg_Boos[0]), null, "Ahhhh....fresh meat!", bj_TIMETYPE_SET, 4.00, false)
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
endfunction
function Trig_Boos_TfFunc028Func003A takes nothing returns nothing
    call PauseUnit(GetEnumUnit(), false)
    call SetUnitInvulnerable(GetEnumUnit(), false)
endfunction
function Trig_Boos_TfFunc028Func004A takes nothing returns nothing
    call PauseUnit(GetEnumUnit(), false)
    call SetUnitInvulnerable(GetEnumUnit(), false)
endfunction
function Trig_Boos_TfFunc028T takes nothing returns nothing
    local group ydl_group
    local unit ydl_unit
    call ResetToGameCamera(0)
    call SetUnitAnimation(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x512DC35A), "Walk")
    call h__ForGroupBJ(udg_HeroGroup, function Trig_Boos_TfFunc028Func003A)
    call h__ForGroupBJ(udg_EggGroup, function Trig_Boos_TfFunc028Func004A)
    call EnableSelect(true, true)
    call EnableUserControl(true)
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
    set ydl_group=null
    set ydl_unit=null
endfunction
function Trig_Boos_TfFunc029T takes nothing returns nothing
    call ExecuteFunc("InitTrig_Dialog_Tf_Orig")
    call ConditionalTriggerExecute(gg_trg_Dialog_Tf)
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
endfunction
function Trig_Boos_TfFunc033Func001Func002003002 takes nothing returns boolean
    return ( ( ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false ) and ( ( IsUnitType(GetFilterUnit(), UNIT_TYPE_MAGIC_IMMUNE) == false ) and ( ( IsUnitAliveBJ(GetFilterUnit()) == true ) and ( IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_Boos[0])) == true ) ) ) ) )
endfunction
function Trig_Boos_TfFunc033Func001Func004Func002Func002T takes nothing returns nothing
    if ( ( GetUnitCurrentOrder(udg_Boos[0]) != String2OrderIdBJ("magicleash") ) ) then
        call SaveUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xC43E936C, h__GroupPickRandomUnit(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xD42855DB)))
        call IssueNeutralPointOrderById(Player(10), udg_Boos[0], 852600, GetUnitX(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xC43E936C)), GetUnitY(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xC43E936C)))
        call GDS("Meathook")
        call h__DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xD42855DB))
        call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
        call DestroyTimer(GetExpiredTimer())
    else
    endif
endfunction
function Trig_Boos_TfFunc033T takes nothing returns nothing
    local timer ydl_timer
    if ( ( IsUnitAliveBJ(udg_Boos[0]) == true ) ) then
        call SaveGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xD42855DB, YDWEGetUnitsInRectMatchingNull(LoadRectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF1939A83) , Condition(function Trig_Boos_TfFunc033Func001Func002003002)))
        call GroupRemoveUnit(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xD42855DB), udg_Boos[0])
        if ( ( h__CountUnitsInGroup(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xD42855DB)) != 0 ) ) then
            if ( ( GetUnitCurrentOrder(udg_Boos[0]) != String2OrderIdBJ("magicleash") ) ) then
                call SaveUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x1BF14788, h__GroupPickRandomUnit(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xD42855DB)))
                call IssueNeutralPointOrderById(Player(10), udg_Boos[0], 852600, GetUnitX(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x1BF14788)), GetUnitY(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x1BF14788)))
                call GDS("Meathook")
                call h__DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xD42855DB))
            else
                set ydl_timer=CreateTimer()
                call SaveGroupHandle(YDLOC, GetHandleId(ydl_timer), 0xD42855DB, LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xD42855DB))
                call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0xC43E936C, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xC43E936C))
                call TimerStart(ydl_timer, 0.10, true, function Trig_Boos_TfFunc033Func001Func004Func002Func002T)
            endif
        else
            call h__DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xD42855DB))
        endif
    else
        call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
        call DestroyTimer(GetExpiredTimer())
    endif
    set ydl_timer=null
endfunction
function Trig_Boos_TfFunc034Func001Func002003002 takes nothing returns boolean
    return ( ( ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false ) and ( ( IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_Boos[0])) == true ) and ( IsUnitAliveBJ(GetFilterUnit()) == true ) ) ) )
endfunction
function Trig_Boos_TfFunc034Func001Func004Func003Func001T takes nothing returns nothing
    if ( ( GetUnitCurrentOrder(udg_Boos[0]) != String2OrderIdBJ("magicleash") ) ) then
        call GroupRemoveUnit(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x7C24209D), udg_Boos[0])
        call SaveUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x09C8E5E0, h__GroupPickRandomUnit(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x7C24209D)))
        call IssuePointOrder(udg_Boos[0], "attack", GetUnitX(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x09C8E5E0)), GetUnitY(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x09C8E5E0)))
        call GDS("attack")
        call h__DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x7C24209D))
        call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
        call DestroyTimer(GetExpiredTimer())
    else
    endif
endfunction
function Trig_Boos_TfFunc034T takes nothing returns nothing
    local timer ydl_timer
    if ( ( IsUnitAliveBJ(udg_Boos[0]) == true ) ) then
        call SaveGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x7C24209D, YDWEGetUnitsInRectMatchingNull(LoadRectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF1939A83) , Condition(function Trig_Boos_TfFunc034Func001Func002003002)))
        call GroupRemoveUnit(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x7C24209D), udg_Boos[0])
        if ( ( h__CountUnitsInGroup(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x7C24209D)) != 0 ) ) then
            if ( ( GetUnitCurrentOrder(udg_Boos[0]) != String2OrderIdBJ("magicleash") ) ) then
                call SaveUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x2D5DEA42, h__GroupPickRandomUnit(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x7C24209D)))
                call IssuePointOrder(udg_Boos[0], "attack", GetUnitX(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x2D5DEA42)), GetUnitY(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x2D5DEA42)))
                call GDS("attack")
                call h__DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x7C24209D))
            else
                set ydl_timer=CreateTimer()
                call SaveGroupHandle(YDLOC, GetHandleId(ydl_timer), 0x7C24209D, LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x7C24209D))
                call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x09C8E5E0, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x09C8E5E0))
                call TimerStart(ydl_timer, 0.10, true, function Trig_Boos_TfFunc034Func001Func004Func003Func001T)
            endif
        else
            call h__DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x7C24209D))
        endif
    else
        call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
        call DestroyTimer(GetExpiredTimer())
    endif
    set ydl_timer=null
endfunction
function Trig_Boos_TfFunc035Conditions takes nothing returns nothing
    if ( ( GetUnitLifePercent(udg_Boos[0]) <= 35.00 ) ) then
        call DisableTrigger(GetTriggeringTrigger())
        call UnitAddAbility(udg_Boos[0], 'BTf2')
        call UnitAddAbility(udg_Boos[0], 'AbT2')
        call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()))
        call DestroyTrigger(GetTriggeringTrigger())
    else
    endif
endfunction
function Trig_Boos_TfFunc036Func002Func005003002 takes nothing returns boolean
    return ( ( ( IsUnitType(GetFilterUnit(), UNIT_TYPE_MAGIC_IMMUNE) == false ) and ( ( IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_Boos[0])) == true ) and ( IsUnitAliveBJ(GetFilterUnit()) == true ) ) ) )
endfunction
function Trig_Boos_TfFunc036Conditions takes nothing returns nothing
    if ( ( ( EVENT_UNIT_SPELL_EFFECT == GetTriggerEventId() ) == true ) and ( GetSpellAbilityId() == 'A00J' ) ) then
        call GDS("Flesh Heap")
    else
    endif
    if ( ( GetRandomInt(1, 3) == 2 ) and ( ( EVENT_UNIT_DEATH == GetTriggerEventId() ) == false ) and ( GetUnitCurrentOrder(udg_Boos[0]) != 852600 ) ) then
        call SaveGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE0DD2139, YDWEGetUnitsInRectMatchingNull(LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xF1939A83) , Condition(function Trig_Boos_TfFunc036Func002Func005003002)))
        if ( ( h__CountUnitsInGroup(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE0DD2139)) != 0 ) ) then
            call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x3A064C76, h__GroupPickRandomUnit(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE0DD2139)))
            call IssueTargetOrder(udg_Boos[0], "magicleash", LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x3A064C76))
            call h__DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE0DD2139))
        else
            call h__DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE0DD2139))
        endif
    else
        if ( ( ( EVENT_UNIT_DEATH == GetTriggerEventId() ) == true ) and ( IsUnit(GetTriggerUnit(), udg_Boos[0]) == true ) ) then
            call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()))
            call DestroyTrigger(GetTriggeringTrigger())
        else
        endif
    endif
endfunction
function Trig_Boos_TfFunc037Func001Func003T takes nothing returns nothing
    call SetUnitAnimation(udg_Boos[0], "Attack")
    call PauseUnit(udg_Boos[0], true)
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
endfunction
function Trig_Boos_TfFunc037Func001Func004Func004003002 takes nothing returns boolean
    return ( ( ( IsUnitType(GetFilterUnit(), UNIT_TYPE_STRUCTURE) == false ) and ( ( IsUnitEnemy(GetFilterUnit(), GetOwningPlayer(udg_Boos[0])) == true ) and ( IsUnitAliveBJ(GetFilterUnit()) == true ) ) ) )
endfunction
function Trig_Boos_TfFunc037Func001Func004T takes nothing returns nothing
    call PauseUnit(udg_Boos[0], false)
    call SetUnitTimeScale(udg_Boos[0], 1.00)
    call ResetUnitAnimation(udg_Boos[0])
    call SaveGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFEB1DADA, YDWEGetUnitsInRectMatchingNull(LoadRectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF1939A83) , Condition(function Trig_Boos_TfFunc037Func001Func004Func004003002)))
    call GroupRemoveUnit(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFEB1DADA), udg_Boos[0])
    call SaveUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x7236CAF6, h__GroupPickRandomUnit(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFEB1DADA)))
    call IssuePointOrder(udg_Boos[0], "attack", GetUnitX(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x7236CAF6)), GetUnitY(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x7236CAF6)))
    call h__DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFEB1DADA))
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
endfunction
function Trig_Boos_TfFunc037Func001Func005T takes nothing returns nothing
    call YDWEMeatHook(udg_Boos[0] , LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xFD70D3B9) , 'h006' , 'h006' , 1500.00 , 35.00 , 400.00 , 0.03)
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
endfunction
function Trig_Boos_TfFunc037Func002Func010Func001T takes nothing returns nothing
    call YDWETimerDestroyEffect(2 , AddSpecialEffect("Objects\\Spawnmodels\\Undead\\UndeadBlood\\UndeadBloodCryptFiend.mdl", GetUnitX(udg_Boos[0]), GetUnitY(udg_Boos[0])))
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
endfunction
function Trig_Boos_TfFunc037Conditions takes nothing returns nothing
    local timer ydl_timer
    local integer ydul_Blood
    if ( ( ( EVENT_UNIT_SPELL_CAST == GetTriggerEventId() ) == true ) and ( GetSpellAbilityId() == 'ATft' ) ) then
        call Meathook(GetTriggerUnit() , GetSpellTargetX() , GetSpellTargetY())
        call SetUnitTimeScale(udg_Boos[0], 0.35)
        set ydl_timer=CreateTimer()
        call TimerStart(ydl_timer, 0.00, false, function Trig_Boos_TfFunc037Func001Func003T)
        set ydl_timer=CreateTimer()
        call SaveRectHandle(YDLOC, GetHandleId(ydl_timer), 0xF1939A83, LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xF1939A83))
        call SaveGroupHandle(YDLOC, GetHandleId(ydl_timer), 0xFEB1DADA, LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xFEB1DADA))
        call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x7236CAF6, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x7236CAF6))
        call TimerStart(ydl_timer, 4.35, false, function Trig_Boos_TfFunc037Func001Func004T)
        set ydl_timer=CreateTimer()
        call SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 0xFD70D3B9, GetSpellTargetLoc())
        call TimerStart(ydl_timer, 1.85, false, function Trig_Boos_TfFunc037Func001Func005T)
    else
    endif
    if ( ( ( EVENT_UNIT_DEATH == GetTriggerEventId() ) == true ) and ( IsUnit(GetTriggerUnit(), udg_Boos[0]) == true ) ) then
        call DisableTrigger(GetTriggeringTrigger())
        call DestroyTimer(LoadTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x3B44AAED))
        call DestroyTimer(LoadTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x6859183B))
        call SetUnitAnimation(udg_Boos[0], "Death")
        call ConditionalTriggerExecute(gg_trg_Music1)
        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), GetKillingUnitBJ(), GetUnitName(GetKillingUnitBJ()), null, "既然这里出现了憎恶这种生物，这森林里面肯定还有一个亡灵法师。而且看起来附近还有人族的村庄。", bj_TIMETYPE_SET, 5.00, false)
        call SaveBoolean(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1CA61CEC, false)
        set ydul_Blood=0
        loop
            exitwhen ydul_Blood > 30
            set ydl_timer=CreateTimer()
            call TimerStart(ydl_timer, 0.30, false, function Trig_Boos_TfFunc037Func002Func010Func001T)
            set ydul_Blood=ydul_Blood + 1
        endloop
        call KillDestructable(LoadDestructableHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x0DEED68D))
        call KillDestructable(LoadDestructableHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xF14A4A38))
        call RemoveRect(LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xF1939A83))
        call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()))
        call DestroyTrigger(GetTriggeringTrigger())
    else
    endif
    set ydl_timer=null
endfunction
function Trig_Boos_TfFunc038Func001A takes nothing returns nothing
    call ShowUnit(GetEnumUnit(), false)
endfunction
function Trig_Boos_TfFunc038Func004Func001A takes nothing returns nothing
    call ShowUnit(GetEnumUnit(), true)
endfunction
function Trig_Boos_TfFunc038Func004T takes nothing returns nothing
    local group ydl_group
    local unit ydl_unit
    call h__ForGroupBJ(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x5B56D1E7), function Trig_Boos_TfFunc038Func004Func001A)
    call ShowUnit(udg_Dummy[0], false)
    call RemoveUnit(bj_lastCreatedUnit)
    call MovieEnd()
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
    set ydl_group=null
    set ydl_unit=null
endfunction
function Trig_Boos_TfFunc038Conditions takes nothing returns nothing
    local group ydl_group
    local unit ydl_unit
    local timer ydl_timer
    call h__ForGroupBJ(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x5B56D1E7), function Trig_Boos_TfFunc038Func001A)
    call MovieStart()
    call JuHuaNiuBi(- 13670.00 , - 26850.00 , 'Uabo' , - 13580.00 , - 26820.00)
    set ydl_timer=CreateTimer()
    call SaveGroupHandle(YDLOC, GetHandleId(ydl_timer), 0x5B56D1E7, LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x5B56D1E7))
    call TimerStart(ydl_timer, 1.20, false, function Trig_Boos_TfFunc038Func004T)
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()))
    call DestroyTrigger(GetTriggeringTrigger())
    set ydl_group=null
    set ydl_unit=null
    set ydl_timer=null
endfunction
function Trig_Boos_TfActions takes nothing returns nothing
    local group ydl_group
    local unit ydl_unit
    local timer ydl_timer
    local trigger ydl_trigger
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call DisableTrigger(GetTriggeringTrigger())
    call EnableSelect(false, true)
    call EnableUserControl(false)
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x9134E1DF, udg_Boos[0])
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x512DC35A, CreateUnit(Player(0), 'nvl2', - 14000.00, - 26880.00, 0))
    call SaveDestructableHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x0DEED68D, CreateDestructableZ('Dofw', - 15712.00, - 26688.00, 0, 180.00, 1, 0))
    call SaveDestructableHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xF14A4A38, CreateDestructableZ('Dofw', - 12672.00, - 25248.00, 0, 270.00, 1, 0))
    call SaveRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xF1939A83, Rect(- 15680.00, - 28000.00, - 11872.00, - 25312.00))
    call RemoveGuardPosition(udg_Boos[0])
    // 播放音乐
    call ConditionalTriggerExecute(gg_trg_Music2)
    // 移动和复活暂停玩家
    call ResetToGameCamera(0)
    call PanCameraToTimedWithZ(- 14150.00, - 27000.00, 800.00, 0)
    call h__ForGroupBJ(udg_HeroGroup, function Trig_Boos_TfFunc016A)
    call h__ForGroupBJ(udg_EggGroup, function Trig_Boos_TfFunc017A)
    // 设置在boos房间
    set udg_BoosFangJian=true
    // 修正玩家和敌对单位视野
    call SetUnitInvulnerable(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x512DC35A), true)
    call PlaySoundOnUnitBJ(gg_snd_PeasantPissed3, 100, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x512DC35A))
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x512DC35A), GetUnitName(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x512DC35A)), null, "请帮帮我！", bj_TIMETYPE_SET, 3.00, false)
    call IssuePointOrder(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x512DC35A), "move", - 15500.00, - 26850.00)
    set ydl_timer=CreateTimer()
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x535B7E08, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x535B7E08))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x512DC35A, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x512DC35A))
    call TimerStart(ydl_timer, 1.50, false, function Trig_Boos_TfFunc025T)
    set ydl_timer=CreateTimer()
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x512DC35A, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x512DC35A))
    call TimerStart(ydl_timer, 1.85, false, function Trig_Boos_TfFunc026T)
    // 恢复玩家
    set ydl_timer=CreateTimer()
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x512DC35A, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x512DC35A))
    call TimerStart(ydl_timer, 2.20, false, function Trig_Boos_TfFunc028T)
    set ydl_timer=CreateTimer()
    call TimerStart(ydl_timer, 4.00, false, function Trig_Boos_TfFunc029T)
    // 屠夫AI
    call SaveTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x3B44AAED, CreateTimer())
    call SaveTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x6859183B, CreateTimer())
    set ydl_timer=LoadTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x3B44AAED)
    call SaveRectHandle(YDLOC, GetHandleId(ydl_timer), 0xF1939A83, LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xF1939A83))
    call SaveGroupHandle(YDLOC, GetHandleId(ydl_timer), 0xD42855DB, LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xD42855DB))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x1BF14788, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1BF14788))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0xC43E936C, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xC43E936C))
    call TimerStart(ydl_timer, 15.00, true, function Trig_Boos_TfFunc033T)
    set ydl_timer=LoadTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x6859183B)
    call SaveRectHandle(YDLOC, GetHandleId(ydl_timer), 0xF1939A83, LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xF1939A83))
    call SaveGroupHandle(YDLOC, GetHandleId(ydl_timer), 0x7C24209D, LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x7C24209D))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x2D5DEA42, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x2D5DEA42))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x09C8E5E0, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x09C8E5E0))
    call TimerStart(ydl_timer, 7.00, true, function Trig_Boos_TfFunc034T)
    set ydl_trigger=CreateTrigger()
    call TriggerRegisterUnitEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x9134E1DF), EVENT_UNIT_DAMAGED)
    call TriggerAddCondition(ydl_trigger, Condition(function Trig_Boos_TfFunc035Conditions))
    set ydl_trigger=CreateTrigger()
    call SaveRectHandle(YDLOC, GetHandleId(ydl_trigger), 0xF1939A83, LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xF1939A83))
    call SaveGroupHandle(YDLOC, GetHandleId(ydl_trigger), 0xE0DD2139, LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE0DD2139))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_trigger), 0x3A064C76, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x3A064C76))
    call TriggerRegisterUnitEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x9134E1DF), EVENT_UNIT_DAMAGED)
    call TriggerRegisterUnitEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x9134E1DF), EVENT_UNIT_ISSUED_POINT_ORDER)
    call TriggerRegisterUnitEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x9134E1DF), EVENT_UNIT_ISSUED_TARGET_ORDER)
    call TriggerRegisterUnitEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x9134E1DF), EVENT_UNIT_SPELL_EFFECT)
    call TriggerRegisterUnitEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x9134E1DF), EVENT_UNIT_DEATH)
    call TriggerAddCondition(ydl_trigger, Condition(function Trig_Boos_TfFunc036Conditions))
    set ydl_trigger=CreateTrigger()
    call SaveRectHandle(YDLOC, GetHandleId(ydl_trigger), 0xF1939A83, LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xF1939A83))
    call SaveTimerHandle(YDLOC, GetHandleId(ydl_trigger), 0x3B44AAED, LoadTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x3B44AAED))
    call SaveTimerHandle(YDLOC, GetHandleId(ydl_trigger), 0x6859183B, LoadTimerHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x6859183B))
    call SaveGroupHandle(YDLOC, GetHandleId(ydl_trigger), 0xFEB1DADA, LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xFEB1DADA))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_trigger), 0x7236CAF6, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x7236CAF6))
    call SaveDestructableHandle(YDLOC, GetHandleId(ydl_trigger), 0x0DEED68D, LoadDestructableHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x0DEED68D))
    call SaveDestructableHandle(YDLOC, GetHandleId(ydl_trigger), 0xF14A4A38, LoadDestructableHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xF14A4A38))
    call TriggerRegisterUnitEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x9134E1DF), EVENT_UNIT_SPELL_CAST)
    call TriggerRegisterUnitEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x9134E1DF), EVENT_UNIT_DEATH)
    call TriggerAddCondition(ydl_trigger, Condition(function Trig_Boos_TfFunc037Conditions))
    set ydl_trigger=CreateTrigger()
    call SaveGroupHandle(YDLOC, GetHandleId(ydl_trigger), 0x5B56D1E7, (YDWEGetUnitsInRectMatchingNull((LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xF1939A83)) , null))) // INLINED!!
    call TriggerRegisterUnitEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x9134E1DF), EVENT_UNIT_DEATH)
    call TriggerAddCondition(ydl_trigger, Condition(function Trig_Boos_TfFunc038Conditions))
    call DestroyTrigger(GetTriggeringTrigger())
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
    set ydl_group=null
    set ydl_unit=null
    set ydl_timer=null
    set ydl_trigger=null
endfunction
//===========================================================================
function InitTrig_Boos_Tf_Orig takes nothing returns nothing
    set gg_trg_Boos_Tf=CreateTrigger()
    call TriggerAddAction(gg_trg_Boos_Tf, function Trig_Boos_TfActions)
endfunction
function InitTrig_Boos_Tf takes nothing returns nothing
endfunction
//===========================================================================
// Trigger: Boos_Slk
//===========================================================================
function Trig_Boos_SlkFunc015A takes nothing returns nothing
    call SetUnitLifePercentBJ(GetEnumUnit(), 100)
    call SetUnitManaPercentBJ(GetEnumUnit(), 100)
    call SetUnitPosition(GetEnumUnit(), - 15072.00, - 24896.00)
    call SetUnitFacing(GetEnumUnit(), 315.00)
    call PauseUnit(GetEnumUnit(), true)
    call SetUnitInvulnerable(GetEnumUnit(), true)
endfunction
function Trig_Boos_SlkFunc016A takes nothing returns nothing
    call SetUnitLifePercentBJ(GetEnumUnit(), 100)
    call SetUnitManaPercentBJ(GetEnumUnit(), 100)
    call SetUnitPosition(GetEnumUnit(), - 15104.00, - 24896.00)
    call PauseUnit(GetEnumUnit(), true)
    call SetUnitInvulnerable(GetEnumUnit(), true)
endfunction
function Trig_Boos_SlkFunc025Func004A takes nothing returns nothing
    call PauseUnit(GetEnumUnit(), false)
    call SetUnitInvulnerable(GetEnumUnit(), false)
endfunction
function Trig_Boos_SlkFunc025Func005A takes nothing returns nothing
    call PauseUnit(GetEnumUnit(), false)
    call SetUnitInvulnerable(GetEnumUnit(), false)
endfunction
function Trig_Boos_SlkFunc025T takes nothing returns nothing
    local group ydl_group
    local unit ydl_unit
    call SetUnitTimeScale(udg_Boos[1], 1.00)
    call IssuePointOrder(udg_Boos[1], "attack", - 15072.00, - 24896.00)
    call ResetToGameCamera(0)
    call h__ForGroupBJ(udg_HeroGroup, function Trig_Boos_SlkFunc025Func004A)
    call h__ForGroupBJ(udg_EggGroup, function Trig_Boos_SlkFunc025Func005A)
    call EnableSelect(true, true)
    call EnableUserControl(true)
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
    set ydl_group=null
    set ydl_unit=null
endfunction
function Trig_Boos_SlkFunc026Func001Func002003002 takes nothing returns boolean
    return ( ( ( IsUnitType(GetFilterUnit(), UNIT_TYPE_MAGIC_IMMUNE) == false ) and ( ( IsUnitEnemy(GetFilterUnit(), Player(10)) == true ) and ( IsUnitAliveBJ(GetFilterUnit()) == true ) ) ) )
endfunction
function Trig_Boos_SlkFunc026T takes nothing returns nothing
    if ( ( udg_BoosFangJian == true ) ) then
        call SaveGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xD42855DB, YDWEGetUnitsInRectMatchingNull(LoadRectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF1939A83) , Condition(function Trig_Boos_SlkFunc026Func001Func002003002)))
        if ( ( h__CountUnitsInGroup(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xD42855DB)) != 0 ) ) then
            if ( ( GetUnitState(udg_Boos[1], UNIT_STATE_LIFE) > ( 0.81 / 2.00 ) ) and ( GetUnitCurrentOrder(udg_Boos[1]) != 852095 ) and ( GetUnitCurrentOrder(udg_Boos[1]) != String2OrderIdBJ("shockwave") ) ) then
                call SaveUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x1BF14788, h__GroupPickRandomUnit(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xD42855DB)))
                call IssuePointOrder(udg_Boos[1], "attack", GetUnitX(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x1BF14788)), GetUnitY(LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x1BF14788)))
                call GDS("attack")
                call h__DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xD42855DB))
            else
                call h__DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xD42855DB))
            endif
        else
            call h__DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xD42855DB))
        endif
    else
        call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
        call DestroyTimer(GetExpiredTimer())
    endif
endfunction
function Trig_Boos_SlkFunc027Func001Func002003002 takes nothing returns boolean
    return ( ( ( IsUnitType(GetFilterUnit(), UNIT_TYPE_MAGIC_IMMUNE) == false ) and ( ( IsUnitEnemy(GetFilterUnit(), Player(10)) == true ) and ( IsUnitAliveBJ(GetFilterUnit()) == true ) ) ) )
endfunction
function Trig_Boos_SlkFunc027Func001Func003Func003Func002Func001Func007Func001Func001T takes nothing returns nothing
    call IssueTargetOrder(udg_Boos[1], "attack", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x2D5DEA42))
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
endfunction
function Trig_Boos_SlkFunc027Func001Func003Func003Func002Func001Func007Conditions takes nothing returns nothing
    local timer ydl_timer
    if ( ( GetSpellAbilityId() == 'ASlT' ) ) then
        set ydl_timer=CreateTimer()
        call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x2D5DEA42, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x2D5DEA42))
        call TimerStart(ydl_timer, 0.55, false, function Trig_Boos_SlkFunc027Func001Func003Func003Func002Func001Func007Func001Func001T)
        call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()))
        call DestroyTrigger(GetTriggeringTrigger())
    else
    endif
    set ydl_timer=null
endfunction
function Trig_Boos_SlkFunc027Func001Func003Func003Func002T takes nothing returns nothing
    local trigger ydl_trigger
    if ( ( GetUnitState(udg_Boos[1], UNIT_STATE_LIFE) > ( 0.81 / 2.00 ) ) and ( GetUnitCurrentOrder(udg_Boos[1]) != 852095 ) and ( GetUnitCurrentOrder(udg_Boos[1]) != String2OrderIdBJ("shockwave") ) ) then
        call SaveUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x2D5DEA42, h__GroupPickRandomUnit(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x7C24209D)))
        call IssueTargetOrder(udg_Boos[1], "thunderbolt", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x2D5DEA42))
        call GDS("Wraithfire Blast")
        set ydl_trigger=CreateTrigger()
        call SaveUnitHandle(YDLOC, GetHandleId(ydl_trigger), 0x2D5DEA42, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x2D5DEA42))
        call TriggerRegisterUnitEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x72038D0D), EVENT_UNIT_SPELL_EFFECT)
        call TriggerAddCondition(ydl_trigger, Condition(function Trig_Boos_SlkFunc027Func001Func003Func003Func002Func001Func007Conditions))
        call h__DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x7C24209D))
        call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
        call DestroyTimer(GetExpiredTimer())
    else
    endif
    set ydl_trigger=null
endfunction
function Trig_Boos_SlkFunc027Func001Func003Func003Func008Func001Func001T takes nothing returns nothing
    call IssueTargetOrder(udg_Boos[1], "attack", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x2D5DEA42))
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
endfunction
function Trig_Boos_SlkFunc027Func001Func003Func003Func008Conditions takes nothing returns nothing
    local timer ydl_timer
    if ( ( GetSpellAbilityId() == 'ASlT' ) ) then
        set ydl_timer=CreateTimer()
        call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x2D5DEA42, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x2D5DEA42))
        call TimerStart(ydl_timer, 0.55, false, function Trig_Boos_SlkFunc027Func001Func003Func003Func008Func001Func001T)
        call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()))
        call DestroyTrigger(GetTriggeringTrigger())
    else
    endif
    set ydl_timer=null
endfunction
function Trig_Boos_SlkFunc027T takes nothing returns nothing
    local timer ydl_timer
    local trigger ydl_trigger
    if ( ( udg_BoosFangJian == true ) ) then
        call SaveGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x7C24209D, YDWEGetUnitsInRectMatchingNull(LoadRectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF1939A83) , Condition(function Trig_Boos_SlkFunc027Func001Func002003002)))
        if ( ( h__CountUnitsInGroup(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x7C24209D)) != 0 ) ) then
            if ( ( GetUnitState(udg_Boos[1], UNIT_STATE_LIFE) > ( 0.81 / 2.00 ) ) and ( GetUnitCurrentOrder(udg_Boos[1]) != 852095 ) and ( GetUnitCurrentOrder(udg_Boos[1]) != String2OrderIdBJ("shockwave") ) ) then
                call SaveUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x2D5DEA42, h__GroupPickRandomUnit(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x7C24209D)))
                call IssueTargetOrder(udg_Boos[1], "thunderbolt", LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x2D5DEA42))
                call GDS("Wraithfire Blast")
                set ydl_trigger=CreateTrigger()
                call SaveUnitHandle(YDLOC, GetHandleId(ydl_trigger), 0x2D5DEA42, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x2D5DEA42))
                call TriggerRegisterUnitEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x72038D0D), EVENT_UNIT_SPELL_EFFECT)
                call TriggerAddCondition(ydl_trigger, Condition(function Trig_Boos_SlkFunc027Func001Func003Func003Func008Conditions))
                call h__DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x7C24209D))
            else
                set ydl_timer=CreateTimer()
                call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x72038D0D, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x72038D0D))
                call SaveGroupHandle(YDLOC, GetHandleId(ydl_timer), 0x7C24209D, LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x7C24209D))
                call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x2D5DEA42, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x2D5DEA42))
                call TimerStart(ydl_timer, 0.10, true, function Trig_Boos_SlkFunc027Func001Func003Func003Func002T)
            endif
        else
            call h__DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x7C24209D))
        endif
    else
        call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
        call DestroyTimer(GetExpiredTimer())
    endif
    set ydl_timer=null
    set ydl_trigger=null
endfunction
function Trig_Boos_SlkFunc028Func005Func007T takes nothing returns nothing
    call IssueImmediateOrder(udg_Boos[1], "stop")
    call PlaySoundOnUnitBJ(gg_snd_DemonHunterMorphedYesAttack3, 100, udg_Boos[1])
    call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_Boos[1], GetUnitName(udg_Boos[1]), null, "- Run for your life! 
- 快逃命吧！", bj_TIMETYPE_SET, 2.00, false)
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
endfunction
function Trig_Boos_SlkFunc028Func005Func009Conditions takes nothing returns nothing
    call ConditionalTriggerExecute(gg_trg_Music1)
    call KillDestructable(LoadDestructableHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x0DEED68D))
    set udg_BoosFangJian=false
    call RemoveRect(LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xF1939A83))
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()))
    call DestroyTrigger(GetTriggeringTrigger())
endfunction
function Trig_Boos_SlkFunc028Func005Func010Func001Func003Func005Func002003002 takes nothing returns boolean
    return ( ( ( IsUnitType(GetFilterUnit(), UNIT_TYPE_MAGIC_IMMUNE) == false ) and ( ( IsUnitEnemy(GetFilterUnit(), Player(10)) == true ) and ( IsUnitAliveBJ(GetFilterUnit()) == true ) ) ) )
endfunction
function Trig_Boos_SlkFunc028Func005Func010Conditions takes nothing returns nothing
    if ( ( ( EVENT_UNIT_STATE_LIMIT == GetTriggerEventId() ) == false ) ) then
        if ( ( IsUnitPausedBJ(udg_Boos[1]) == false ) and ( GetUnitCurrentOrder(udg_Boos[1]) != String2OrderIdBJ("shockwave") ) and ( GetUnitCurrentOrder(udg_Boos[1]) != 852095 ) ) then
            call SaveReal(YDHT, GetHandleId(udg_Boos[1]), 0x07C93ED7, ( LoadReal(YDHT, GetHandleId(udg_Boos[1]), 0x07C93ED7) + GetEventDamage() ))
            if ( ( LoadReal(YDHT, GetHandleId(udg_Boos[1]), 0x07C93ED7) >= 350.00 ) ) then
                call SaveReal(YDHT, GetHandleId(udg_Boos[1]), 0x07C93ED7, 0.00)
                call SaveGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x04C63E5E, YDWEGetUnitsInRectMatchingNull(LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xF1939A83) , Condition(function Trig_Boos_SlkFunc028Func005Func010Func001Func003Func005Func002003002)))
                call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD6A79FB0, h__GroupPickRandomUnit(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x04C63E5E)))
                call SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD75FBE52, GetUnitLoc(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD6A79FB0)))
                call SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x84BE6B25, h__PolarProjectionBJ(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD75FBE52), 345.00, YDWEAngleBetweenUnits(udg_Boos[1] , LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD6A79FB0))))
                call IssuePointOrderLoc(udg_Boos[1], "carrionswarm", LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x84BE6B25))
                call GDS("charge")
                call h__RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD75FBE52))
                call h__RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x84BE6B25))
            else
            endif
        else
        endif
    else
        call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()))
        call DestroyTrigger(GetTriggeringTrigger())
    endif
endfunction
function Trig_Boos_SlkFunc028Func005Func011Func006Func002003002 takes nothing returns boolean
    return ( ( ( IsUnitType(GetFilterUnit(), UNIT_TYPE_MAGIC_IMMUNE) == false ) and ( ( IsUnitEnemy(GetFilterUnit(), Player(10)) == true ) and ( IsUnitAliveBJ(GetFilterUnit()) == true ) ) ) )
endfunction
function Trig_Boos_SlkFunc028Func005Func011Func006Func003003003 takes nothing returns boolean
    return ( ( ( IsUnitType(GetFilterUnit(), UNIT_TYPE_MAGIC_IMMUNE) == false ) and ( ( IsPlayerEnemy(GetOwningPlayer(GetFilterUnit()), Player(10)) == true ) and ( GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0.00 ) ) ) )
endfunction
function Trig_Boos_SlkFunc028Func005Func011Func006Func004A takes nothing returns nothing
    call GroupRemoveUnit(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1E6D6D2F), GetEnumUnit())
endfunction
function Trig_Boos_SlkFunc028Func005Func011Func006Func005Func006T takes nothing returns nothing
    call SetUnitTimeScale(udg_Boos[1], 1.00)
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
endfunction
function Trig_Boos_SlkFunc028Func005Func011Func006Func005Func010T takes nothing returns nothing
    call SaveBoolean(YDHT, GetHandleId(udg_Boos[1]), 0xE6CE7FBC, true)
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
endfunction
function Trig_Boos_SlkFunc028Func005Func011Conditions takes nothing returns nothing
    local group ydl_group
    local unit ydl_unit
    local timer ydl_timer
    if ( ( GetUnitCurrentOrder(udg_Boos[1]) != 852095 ) and ( LoadBoolean(YDHT, GetHandleId(udg_Boos[1]), 0xE6CE7FBC) == true ) and ( GetUnitState(udg_Boos[1], UNIT_STATE_LIFE) > ( 0.81 / 2.00 ) ) and ( GetRandomInt(1, 5) == 1 ) ) then
        call SaveLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x65288C82, GetUnitLoc(udg_Boos[1]))
        call SaveGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1E6D6D2F, YDWEGetUnitsInRectMatchingNull(LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xF1939A83) , Condition(function Trig_Boos_SlkFunc028Func005Func011Func006Func002003002)))
        call SaveGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCC8EDB60, YDWEGetUnitsInRangeOfLocMatchingNull(300.00 , LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x65288C82) , Condition(function Trig_Boos_SlkFunc028Func005Func011Func006Func003003003)))
        call h__ForGroupBJ(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCC8EDB60), function Trig_Boos_SlkFunc028Func005Func011Func006Func004A)
        if ( ( h__CountUnitsInGroup(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1E6D6D2F)) > 0 ) ) then
            call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE612FD25, h__GroupPickRandomUnit(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1E6D6D2F)))
            call SetUnitTimeScale(udg_Boos[1], 0.45)
            set ydl_timer=CreateTimer()
            call TimerStart(ydl_timer, 2.00, false, function Trig_Boos_SlkFunc028Func005Func011Func006Func005Func006T)
            call SetUnitAnimationByIndex(udg_Boos[1], 5)
            call IssuePointOrderById(udg_Boos[1], 852125, GetUnitX(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE612FD25)), GetUnitY(LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE612FD25)))
            call SaveBoolean(YDHT, GetHandleId(udg_Boos[1]), 0xE6CE7FBC, false)
            set ydl_timer=CreateTimer()
            call TimerStart(ydl_timer, 8.50, false, function Trig_Boos_SlkFunc028Func005Func011Func006Func005Func010T)
            call h__DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1E6D6D2F))
            call h__DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCC8EDB60))
            call h__RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x65288C82))
        else
            call h__DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1E6D6D2F))
            call h__DestroyGroup(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCC8EDB60))
            call h__RemoveLocation(LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x65288C82))
        endif
    else
    endif
    if ( ( ( EVENT_UNIT_STATE_LIMIT == GetTriggerEventId() ) == true ) ) then
        call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()))
        call DestroyTrigger(GetTriggeringTrigger())
    else
    endif
    set ydl_group=null
    set ydl_unit=null
    set ydl_timer=null
endfunction
function Trig_Boos_SlkFunc028Func005Func012Conditions takes nothing returns nothing
    if ( ( GetSpellAbilityId() == 'ASlw' ) ) then
        call GDS("Shock Wave")
        call PlaySoundOnUnitBJ(gg_snd_DemonHunterMorphedPissed2, 100, udg_Boos[1])
        call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_Boos[1], GetUnitName(udg_Boos[1]), null, "- 挡我者死！", bj_TIMETYPE_SET, 2.00, false)
    else
    endif
endfunction
function Trig_Boos_SlkFunc028Func005Func013Func001A takes nothing returns nothing
    call ShowUnit(GetEnumUnit(), false)
endfunction
function Trig_Boos_SlkFunc028Func005Func013Func004Func001A takes nothing returns nothing
    call ShowUnit(GetEnumUnit(), true)
endfunction
function Trig_Boos_SlkFunc028Func005Func013Func004T takes nothing returns nothing
    local group ydl_group
    local unit ydl_unit
    call h__ForGroupBJ(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x5B56D1E7), function Trig_Boos_SlkFunc028Func005Func013Func004Func001A)
    call ShowUnit(udg_Dummy[0], false)
    call RemoveUnit(bj_lastCreatedUnit)
    call MovieEnd()
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
    set ydl_group=null
    set ydl_unit=null
endfunction
function Trig_Boos_SlkFunc028Func005Func013Conditions takes nothing returns nothing
    local group ydl_group
    local unit ydl_unit
    local timer ydl_timer
    call h__ForGroupBJ(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x5B56D1E7), function Trig_Boos_SlkFunc028Func005Func013Func001A)
    call MovieStart()
        call JuHuaNiuBi(- 13860.00 , - 24470.00 , 'NSlk' , - 13700.00 , - 24450.00)
    set ydl_timer=CreateTimer()
    call SaveGroupHandle(YDLOC, GetHandleId(ydl_timer), 0x5B56D1E7, LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x5B56D1E7))
    call TimerStart(ydl_timer, 1.20, false, function Trig_Boos_SlkFunc028Func005Func013Func004T)
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()))
    call DestroyTrigger(GetTriggeringTrigger())
    set ydl_group=null
    set ydl_unit=null
    set ydl_timer=null
endfunction
function Trig_Boos_SlkFunc028Func005T takes nothing returns nothing
    local timer ydl_timer
    local trigger ydl_trigger
    call IssueImmediateOrder(udg_Boos[1], "stop")
    call DisplayTextToPlayer(Player(0), 0, 0, OrderId2StringBJ(GetUnitCurrentOrder(udg_Boos[1])))
    call SaveUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x72038D0D, udg_Boos[1])
    call UnitRemoveAbility(udg_Boos[1], 'ASlr')
    call UnitAddAbility(udg_Boos[1], 'ASl2')
    call RemoveGuardPosition(udg_Boos[1])
    set ydl_timer=CreateTimer()
    call TimerStart(ydl_timer, 2.00, false, function Trig_Boos_SlkFunc028Func005Func007T)
    call SetUnitState(udg_Boos[1], UNIT_STATE_LIFE, 2880.00)
    set ydl_trigger=CreateTrigger()
    call SaveRectHandle(YDLOC, GetHandleId(ydl_trigger), 0xF1939A83, LoadRectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF1939A83))
    call SaveDestructableHandle(YDLOC, GetHandleId(ydl_trigger), 0x0DEED68D, LoadDestructableHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x0DEED68D))
    call TriggerRegisterUnitEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x72038D0D), EVENT_UNIT_DEATH)
    call TriggerAddCondition(ydl_trigger, Condition(function Trig_Boos_SlkFunc028Func005Func009Conditions))
    set ydl_trigger=CreateTrigger()
    call SaveRectHandle(YDLOC, GetHandleId(ydl_trigger), 0xF1939A83, LoadRectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF1939A83))
    call SaveGroupHandle(YDLOC, GetHandleId(ydl_trigger), 0x04C63E5E, LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x04C63E5E))
    call SaveLocationHandle(YDLOC, GetHandleId(ydl_trigger), 0xD75FBE52, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xD75FBE52))
    call SaveLocationHandle(YDLOC, GetHandleId(ydl_trigger), 0x84BE6B25, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x84BE6B25))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_trigger), 0xD6A79FB0, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xD6A79FB0))
    call TriggerRegisterUnitLifeEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x72038D0D), LESS_THAN, ( 0.81 / 2.00 ))
    call TriggerRegisterUnitEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x72038D0D), EVENT_UNIT_DAMAGED)
    call TriggerAddCondition(ydl_trigger, Condition(function Trig_Boos_SlkFunc028Func005Func010Conditions))
    set ydl_trigger=CreateTrigger()
    call SaveRectHandle(YDLOC, GetHandleId(ydl_trigger), 0xF1939A83, LoadRectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF1939A83))
    call SaveGroupHandle(YDLOC, GetHandleId(ydl_trigger), 0xCC8EDB60, LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xCC8EDB60))
    call SaveLocationHandle(YDLOC, GetHandleId(ydl_trigger), 0x65288C82, LoadLocationHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x65288C82))
    call SaveGroupHandle(YDLOC, GetHandleId(ydl_trigger), 0x1E6D6D2F, LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x1E6D6D2F))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_trigger), 0xE612FD25, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE612FD25))
    call TriggerRegisterUnitLifeEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x72038D0D), LESS_THAN, ( 0.81 / 2.00 ))
    call TriggerRegisterUnitEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x72038D0D), EVENT_UNIT_TARGET_IN_RANGE)
    call TriggerRegisterUnitEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x72038D0D), EVENT_UNIT_ACQUIRED_TARGET)
    call TriggerRegisterUnitEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x72038D0D), EVENT_UNIT_ISSUED_TARGET_ORDER)
    call TriggerRegisterUnitEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x72038D0D), EVENT_UNIT_DAMAGED)
    call TriggerAddCondition(ydl_trigger, Condition(function Trig_Boos_SlkFunc028Func005Func011Conditions))
    set ydl_trigger=CreateTrigger()
    call TriggerRegisterUnitEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x72038D0D), EVENT_UNIT_SPELL_EFFECT)
    call TriggerAddCondition(ydl_trigger, Condition(function Trig_Boos_SlkFunc028Func005Func012Conditions))
    set ydl_trigger=CreateTrigger()
    call SaveGroupHandle(YDLOC, GetHandleId(ydl_trigger), 0x5B56D1E7, (YDWEGetUnitsInRectMatchingNull((LoadRectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF1939A83)) , null))) // INLINED!!
    call SaveRectHandle(YDLOC, GetHandleId(ydl_trigger), 0xF1939A83, LoadRectHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xF1939A83))
    call TriggerRegisterUnitEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0x72038D0D), EVENT_UNIT_DEATH)
    call TriggerAddCondition(ydl_trigger, Condition(function Trig_Boos_SlkFunc028Func005Func013Conditions))
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
    set ydl_timer=null
    set ydl_trigger=null
endfunction
function Trig_Boos_SlkFunc028Conditions takes nothing returns nothing
    local timer ydl_timer
    call DisableTrigger(GetTriggeringTrigger())
    call UnitAddAbility(udg_Boos[1], 'ASll')
    call UnitAddAbility(udg_Boos[1], 'ASlc')
    call DisplayTextToPlayer(Player(0), 0, 0, OrderId2StringBJ(GetUnitCurrentOrder(udg_Boos[1])))
    set ydl_timer=CreateTimer()
    call SaveRectHandle(YDLOC, GetHandleId(ydl_timer), 0xF1939A83, LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xF1939A83))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x72038D0D, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x72038D0D))
    call SaveGroupHandle(YDLOC, GetHandleId(ydl_timer), 0xCC8EDB60, LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCC8EDB60))
    call SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 0x65288C82, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x65288C82))
    call SaveGroupHandle(YDLOC, GetHandleId(ydl_timer), 0x04C63E5E, LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x04C63E5E))
    call SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 0xD75FBE52, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD75FBE52))
    call SaveLocationHandle(YDLOC, GetHandleId(ydl_timer), 0x84BE6B25, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x84BE6B25))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0xD6A79FB0, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD6A79FB0))
    call SaveDestructableHandle(YDLOC, GetHandleId(ydl_timer), 0x0DEED68D, LoadDestructableHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x0DEED68D))
    call SaveGroupHandle(YDLOC, GetHandleId(ydl_timer), 0x1E6D6D2F, LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1E6D6D2F))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0xE612FD25, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE612FD25))
    call TimerStart(ydl_timer, 6.00, false, function Trig_Boos_SlkFunc028Func005T)
    set ydl_timer=null
endfunction
function Trig_Boos_SlkActions takes nothing returns nothing
    local group ydl_group
    local unit ydl_unit
    local timer ydl_timer
    local trigger ydl_trigger
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call DisableTrigger(GetTriggeringTrigger())
    call EnableSelect(false, true)
    call EnableUserControl(false)
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x72038D0D, udg_Boos[1])
    call SaveDestructableHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x0DEED68D, CreateDestructableZ('Dofv', - 15300.00, - 24768.00, 0, 270.00, 1, 0))
    call SaveRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xF1939A83, Rect(- 15776.00, - 25536.00, - 12832.00, - 23520.00))
    call RemoveGuardPosition(udg_Boos[1])
    // 播放音乐
    call ConditionalTriggerExecute(gg_trg_Music2)
    // 移动和复活暂停玩家
    call SaveBoolean(YDHT, GetHandleId(udg_Boos[1]), 0xE6CE7FBC, true)
    call ResetToGameCamera(0)
    call PanCameraToTimed(- 13888.00, - 24640.00, 1.00)
    call h__ForGroupBJ(udg_HeroGroup, function Trig_Boos_SlkFunc015A)
    call h__ForGroupBJ(udg_EggGroup, function Trig_Boos_SlkFunc016A)
    call SetUnitPosition(LoadUnitHandle(YDHT, StringHash("TriggerSlk"), 0xA3A26CBA), - 14112.00, - 24864.00)
    call SetUnitFacing(LoadUnitHandle(YDHT, StringHash("TriggerSlk"), 0xA3A26CBA), 45.00)
    call SetUnitTimeScale(udg_Boos[1], 0.50)
    call SetUnitAnimation(udg_Boos[1], "Birth")
    call PlaySoundOnUnitBJ(gg_snd_SkeletonYes1, 100, udg_Boos[1])
    call FlushChildHashtable(YDHT, StringHash("TriggerSlk"))
    // 设置在boos房间
    set udg_BoosFangJian=true
    set ydl_timer=CreateTimer()
    call TimerStart(ydl_timer, 4.67, false, function Trig_Boos_SlkFunc025T)
    set ydl_timer=CreateTimer()
    call SaveRectHandle(YDLOC, GetHandleId(ydl_timer), 0xF1939A83, LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xF1939A83))
    call SaveGroupHandle(YDLOC, GetHandleId(ydl_timer), 0xD42855DB, LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xD42855DB))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x1BF14788, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1BF14788))
    call TimerStart(ydl_timer, 7.00, true, function Trig_Boos_SlkFunc026T)
    set ydl_timer=CreateTimer()
    call SaveRectHandle(YDLOC, GetHandleId(ydl_timer), 0xF1939A83, LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xF1939A83))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x72038D0D, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x72038D0D))
    call SaveGroupHandle(YDLOC, GetHandleId(ydl_timer), 0x7C24209D, LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x7C24209D))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_timer), 0x2D5DEA42, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x2D5DEA42))
    call TimerStart(ydl_timer, 10.00, true, function Trig_Boos_SlkFunc027T)
    set ydl_trigger=CreateTrigger()
    call SaveRectHandle(YDLOC, GetHandleId(ydl_trigger), 0xF1939A83, LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xF1939A83))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_trigger), 0x72038D0D, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x72038D0D))
    call SaveGroupHandle(YDLOC, GetHandleId(ydl_trigger), 0xCC8EDB60, LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xCC8EDB60))
    call SaveLocationHandle(YDLOC, GetHandleId(ydl_trigger), 0x65288C82, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x65288C82))
    call SaveGroupHandle(YDLOC, GetHandleId(ydl_trigger), 0x04C63E5E, LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x04C63E5E))
    call SaveLocationHandle(YDLOC, GetHandleId(ydl_trigger), 0xD75FBE52, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xD75FBE52))
    call SaveLocationHandle(YDLOC, GetHandleId(ydl_trigger), 0x84BE6B25, LoadLocationHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x84BE6B25))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_trigger), 0xD6A79FB0, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xD6A79FB0))
    call SaveDestructableHandle(YDLOC, GetHandleId(ydl_trigger), 0x0DEED68D, LoadDestructableHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x0DEED68D))
    call SaveGroupHandle(YDLOC, GetHandleId(ydl_trigger), 0x1E6D6D2F, LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1E6D6D2F))
    call SaveUnitHandle(YDLOC, GetHandleId(ydl_trigger), 0xE612FD25, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xE612FD25))
    call TriggerRegisterUnitLifeEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x72038D0D), LESS_THAN, ( 0.81 / 2.00 ))
    call TriggerAddCondition(ydl_trigger, Condition(function Trig_Boos_SlkFunc028Conditions))
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
    set ydl_group=null
    set ydl_unit=null
    set ydl_timer=null
    set ydl_trigger=null
endfunction
//===========================================================================
function InitTrig_Boos_Slk_Orig takes nothing returns nothing
    set gg_trg_Boos_Slk=CreateTrigger()
    call TriggerAddAction(gg_trg_Boos_Slk, function Trig_Boos_SlkActions)
endfunction
function InitTrig_Boos_Slk takes nothing returns nothing
endfunction
//===========================================================================
// Trigger: Boos_Nec
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function necs takes nothing returns nothing
	call GPT(GetEnumUnit() , - 9024.00 , - 18496.00 , 0.00)
	call PauseUnit(GetEnumUnit(), false)
	call IssuePointOrder(GetEnumUnit(), "move", - 8200.00, - 18496.00)
endfunction
function GPFtd takes nothing returns nothing
local trigger t= GetTriggeringTrigger()
 local group g= udg_HeroGroup
 local unit u
	call PlaySoundOnUnitBJ(gg_snd_NecromancerPissed4, 100, udg_Boos[2])
	call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_Boos[2], GetUnitName(udg_Boos[2]), null, "你闻到什么东西了吗？啊，这就是军队！", bj_TIMETYPE_SET, 4.00, false)
	call SetUnitInvulnerable(udg_Boos[2], false) //解除无敌
call EnableSelect(true, true) //取消控制权和选择圈
call EnableUserControl(true)
	call ForGroup(g, function necs)
	call DestroyTrigger(t)
	set t=null
	set u=null
	set g=null
endfunction
function NHD takes nothing returns nothing
 local unit u= GetEnumUnit()
 local real maxhp= GetUnitState(u, UNIT_STATE_MAX_LIFE)
 local real d= maxhp * 0.0030
	call R8D(udg_Boos[2] , u , 3 , d)
	set u=null
	//call GDS(GetUnitName(u))
endfunction
function NHA takes nothing returns nothing
local integer h= GetHandleId(GetExpiredTimer())
 local unit u= udg_Boos[2]
 local group g= CreateGroup()
	if ( GetUnitState(u, UNIT_STATE_LIFE) > 0.00 ) == true then
		call GroupEnumUnitsInRange(g, GetUnitX(u), GetUnitY(u), 1200.00, Condition(function BoosG1))
		call ForGroup(g, function NHD)
		call h__DestroyGroup(g)
	else
		//call GDS("HAHAHA")
		call PauseTimer(GetExpiredTimer())
		call DestroyTimer(GetExpiredTimer())
	endif
	set g=null
	set u=null
endfunction
function NRT takes nothing returns nothing
local integer h= GetHandleId(GetExpiredTimer())
 local group g= LoadGroupHandle(HY, h, 1)
 local unit u
	loop
	exitwhen FirstOfGroup(g) == null
		call IssueTargetOrder(FirstOfGroup(g), "attack", h__GroupPickRandomUnit(udg_HeroGroup))
		call GroupRemoveUnit(g, FirstOfGroup(g))
	endloop
	call h__DestroyGroup(g)
	call FlushChildHashtable(HY, h)
	call DestroyTimer(GetExpiredTimer())
	set g=null
endfunction
function NRA takes nothing returns nothing
local timer t1= GetExpiredTimer()
 local integer rh= GetHandleId(t1)
 local unit array slk
 local integer i= 0
 local integer ii
 local timer t2= CreateTimer()
 local group g= CreateGroup()
 local integer h= GetHandleId(t2)
	if ( GetUnitState(udg_Boos[2], UNIT_STATE_LIFE) > 0.00 ) == true then
		call SetUnitAnimationByIndex(udg_Boos[2], 3)
		set slk[0]=CreateUnit(Player(10), 'u003', - 7776.00, - 17472.00, GetRandomDirectionDeg())
		set slk[1]=CreateUnit(Player(10), 'slAc', - 7584.00, - 17632.00, GetRandomDirectionDeg())
		set slk[2]=CreateUnit(Player(10), 'uslm', - 7424.00, - 17824.00, GetRandomDirectionDeg())
		call PlaySoundOnUnitBJ(gg_snd_NecromancerWhat1, 100, udg_Boos[2])
		call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_Boos[2], GetUnitName(udg_Boos[2]), null, "死者服从于我！", bj_TIMETYPE_SET, 4.00, false)
		loop
		exitwhen i > 2
			set ii=GetRandomInt(1, 10)
			call SetUnitAnimation(slk[i], "Birth")
			call GroupAddUnit(g, slk[i])
			call UnitApplyTimedLife(slk[i], 'Brai', 40.00 + ii)
			set slk[i]=null
			set i=i + 1
		endloop
		call SaveGroupHandle(HY, h, 1, g)
		call TimerStart(t2, 2.00, false, function NRT)
	else
		call FlushChildHashtable(HY, rh)
		//call GDS("召唤骷髅计时器清除")
		call PauseTimer(GetExpiredTimer())
		call DestroyTimer(GetExpiredTimer())
	endif
	set t1=null
	set t2=null
	set g=null
	//(-7776.00,-17472.00) //骷髅战士
	//(-7584.00,-17632.00) //骷髅射手
	//(-7424.00,-17824.00) //骷髅魔法师
endfunction
function Trig_Boos_NecActions takes nothing returns nothing
 local unit Nec= udg_Boos[2]
local unit GPU
 local timer Raise= CreateTimer()
local integer Rh= GetHandleId(Raise)
 local timer GPFt= CreateTimer()
local timer NecHa= CreateTimer()
local rect r1= Rect(- 9600.00, - 20288.00, - 6752.00, - 16736.00)
 local group PlayerHeroG= udg_HeroGroup
 local group EggG= udg_EggGroup
	call DisableTrigger(GetTriggeringTrigger())
	call SetUnitInvulnerable(Nec, true) //设置boos无敌 5秒后关闭
call EnableSelect(false, true) //取消控制权和选择圈
call EnableUserControl(false)
	call RemoveGuardPosition(udg_Boos[2]) //警戒点
call ResetToGameCamera(0)
	call PanCameraToTimed(- 8032.00, - 18464.00, 1.00) //镜头
call ForGroup(PlayerHeroG, function necs)
	set PlayerHeroG=null
	call TimerStart(GPFt, 3.00, false, function GPFtd) //计时器 解除暂停并且重新获得控制权
call TimerStart(NecHa, .5, true, function NHA) //Nec光环
//call SaveRectHandle(HY,Rh,1,r1)
call TimerStart(Raise, 30.00, true, function NRA) //召唤骷髅
//call SaveRectHandle(HY,Rh,1,slk1)
//call SaveRectHandle(HY,Rh,2,slk2)
//call SaveRectHandle(HY,Rh,3,Slk3)
endfunction
//===========================================================================
function InitTrig_Boos_Nec_Orig takes nothing returns nothing
	set gg_trg_Boos_Nec=CreateTrigger()
	call TriggerAddAction(gg_trg_Boos_Nec, function Trig_Boos_NecActions)
endfunction
function InitTrig_Boos_Nec takes nothing returns nothing
endfunction// Trigger: Boos_Nect
//===========================================================================
function Trig_Boos_NectFunc009Func001A takes nothing returns nothing
    call ShowUnit(GetEnumUnit(), false)
endfunction
function Trig_Boos_NectFunc009Func004Func001A takes nothing returns nothing
    call ShowUnit(GetEnumUnit(), true)
endfunction
function Trig_Boos_NectFunc009Func004T takes nothing returns nothing
    local group ydl_group
    local unit ydl_unit
    call h__ForGroupBJ(LoadGroupHandle(YDLOC, GetHandleId(GetExpiredTimer()), 0xE0C7445A), function Trig_Boos_NectFunc009Func004Func001A)
    call ShowUnit(udg_Dummy[0], false)
    call RemoveUnit(bj_lastCreatedUnit)
    call MovieEnd()
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
    set ydl_group=null
    set ydl_unit=null
endfunction
function Trig_Boos_NectFunc009Conditions takes nothing returns nothing
    local group ydl_group
    local unit ydl_unit
    local timer ydl_timer
    call h__ForGroupBJ(LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE0C7445A), function Trig_Boos_NectFunc009Func001A)
    call MovieStart()
    call JuHuaNiuBi(- 7800.00 , - 18500.00 , 'Unec' , - 7600.00 , - 18464.00)
    set ydl_timer=CreateTimer()
    call SaveGroupHandle(YDLOC, GetHandleId(ydl_timer), 0xE0C7445A, LoadGroupHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xE0C7445A))
    call TimerStart(ydl_timer, 1.20, false, function Trig_Boos_NectFunc009Func004T)
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()))
    call DestroyTrigger(GetTriggeringTrigger())
    set ydl_group=null
    set ydl_unit=null
    set ydl_timer=null
endfunction
function Trig_Boos_NectActions takes nothing returns nothing
    local trigger ydl_trigger
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    // jass已写 - 召唤骷髅 - 竭心光环
    call DisableTrigger(GetTriggeringTrigger())
    call SaveUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x11E59A63, udg_Boos[2])
    call SaveRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xF1939A83, Rect(- 9600.00, - 20288.00, - 6752.00, - 16736.00))
    call SaveDestructableHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x0DEED68D, CreateDestructableZ('Dofw', - 9280.00, - 18112.00, 0.00, 0.00, 1, 0))
    call SaveDestructableHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xF14A4A38, CreateDestructableZ('Dofw', - 9280.00, - 18880.00, 0.00, 0.00, 1, 0))
    // ---------
    set ydl_trigger=CreateTrigger()
    call SaveGroupHandle(YDLOC, GetHandleId(ydl_trigger), 0xE0C7445A, (YDWEGetUnitsInRectMatchingNull((LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xF1939A83)) , null))) // INLINED!!
    call TriggerRegisterUnitEvent(ydl_trigger, LoadUnitHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x11E59A63), EVENT_UNIT_DEATH)
    call TriggerAddCondition(ydl_trigger, Condition(function Trig_Boos_NectFunc009Conditions))
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
    set ydl_trigger=null
endfunction
//===========================================================================
function InitTrig_Boos_Nect_Orig takes nothing returns nothing
    set gg_trg_Boos_Nect=CreateTrigger()
    call TriggerAddAction(gg_trg_Boos_Nect, function Trig_Boos_NectActions)
endfunction
function InitTrig_Boos_Nect takes nothing returns nothing
endfunction
//===========================================================================
// Trigger: Zzzzzzzzz
//===========================================================================
function Trig_ZzzzzzzzzActions takes nothing returns nothing
    call IssuePointOrder(GetTriggerUnit(), "move", GetSpellTargetX(), 0)
endfunction
//===========================================================================
function InitTrig_Zzzzzzzzz takes nothing returns nothing
    set gg_trg_Zzzzzzzzz=CreateTrigger()
    call TriggerAddAction(gg_trg_Zzzzzzzzz, function Trig_ZzzzzzzzzActions)
endfunction
//===========================================================================
// Trigger: Rect
//===========================================================================
function Trig_RectFunc006Func003Func007Conditions takes nothing returns nothing
    local integer h
    local unit u
    if ( ( GetUnitTypeId(GetTriggerUnit()) == 'ugho' ) ) then
        call DisableTrigger(GetTriggeringTrigger())
        set u=GetKillingUnit()
        set h=GetUnitTypeId(u)
        call SetCinematicScene(h, ConvertPlayerColor($C), GetUnitName(u), "这种黑色的食尸鬼竟然没有尸体，死后直接化为一滩血了。", 5.00, 0.00)
        call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()))
        call DestroyTrigger(GetTriggeringTrigger())
    else
    endif
    set u=null
endfunction
function Trig_RectFunc006Conditions takes nothing returns nothing
    local trigger ydl_trigger
    local integer h
    local unit u
    if ( ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) and ( IsUnitInGroup(GetTriggerUnit(), udg_HeroGroup) == true ) ) then
        call DisableTrigger(GetTriggeringTrigger())
        set u=GetTriggerUnit()
        set h=GetUnitTypeId(u)
        call SetCinematicScene(h, ConvertPlayerColor($C), GetUnitName(u), "看来这里已经被不死族污染了，但是食尸鬼为什么会是黑色的？", 5.00, 0.00)
        set u=null
        set ydl_trigger=CreateTrigger()
        call TriggerRegisterAnyUnitEventBJ(ydl_trigger, EVENT_PLAYER_UNIT_DEATH)
        call TriggerAddCondition(ydl_trigger, Condition(function Trig_RectFunc006Func003Func007Conditions))
        call DestroyTrigger(GetTriggeringTrigger())
        call RemoveRegion(LoadRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x50F266F5))
        call RemoveRect(LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xB2850A19))
        call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()))
        call DestroyTrigger(GetTriggeringTrigger())
    else
        set u=null
    endif
    set ydl_trigger=null
endfunction
function Trig_RectFunc011Conditions takes nothing returns nothing
    local integer h
    local unit u
    if ( ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) and ( IsUnitInGroup(GetTriggerUnit(), udg_HeroGroup) == true ) ) then
        call DisableTrigger(GetTriggeringTrigger())
        set u=GetTriggerUnit()
        set h=GetUnitTypeId(u)
        call SetCinematicScene(h, ConvertPlayerColor($C), GetUnitName(u), "这里有一个木桥，这样式……看起来附近有人类的活动。", 6.00, 0.00)
        set u=null
        call RemoveRegion(LoadRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x9DF22041))
        call RemoveRect(LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x7231CA97))
        call DestroyTrigger(GetTriggeringTrigger())
    else
        set u=null
    endif
endfunction
function Trig_RectFunc016Conditions takes nothing returns nothing
    local integer h
    local unit u
    if ( ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) and ( IsUnitInGroup(GetTriggerUnit(), udg_HeroGroup) == true ) ) then
        call DisableTrigger(GetTriggeringTrigger())
        set u=GetTriggerUnit()
        set h=GetUnitTypeId(u)
        call SetCinematicScene(h, ConvertPlayerColor($C), GetUnitName(u), "大量的砍伐木材的痕迹，看来之前的猜测是没有错的了。", 6.00, 0.00)
        set u=null
        call RemoveRegion(LoadRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCECECD43))
        call RemoveRect(LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xDBD4FB2A))
        call DestroyTrigger(GetTriggeringTrigger())
    else
        set u=null
    endif
endfunction
function Trig_RectFunc021Conditions takes nothing returns nothing
    if ( ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) ) then
        call TriggerExecute(gg_trg_Boos_Tf)
        call RemoveRegion(LoadRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xB6582AE4))
        call RemoveRect(LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x388FCDBB))
        call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()))
        call DestroyTrigger(GetTriggeringTrigger())
    else
    endif
endfunction
function Trig_RectFunc030Conditions takes nothing returns nothing
    if ( ( IsUnitType(GetTriggerUnit(), UNIT_TYPE_HERO) == true ) ) then
        call SaveUnitHandle(YDHT, StringHash("TriggerSlk"), 0xA3A26CBA, GetEnteringUnit())
        call TriggerExecute(gg_trg_Boos_Slk)
        call RemoveRegion(LoadRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x25B34215))
        call RemoveRect(LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xD0439FBD))
        call RemoveRect(LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x39DEB200))
        call RemoveRect(LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x0D59BE9D))
        call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()))
        call DestroyTrigger(GetTriggeringTrigger())
    else
    endif
endfunction
function Trig_RectFunc035Conditions takes nothing returns nothing
    call TriggerExecute(gg_trg_Boos_Nec)
    call TriggerExecute(gg_trg_Boos_Nect)
    call RemoveRegion(LoadRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0x1FB3E634))
    call RemoveRect(LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xDFC2FD23))
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()))
    call DestroyTrigger(GetTriggeringTrigger())
endfunction
function Trig_RectActions takes nothing returns nothing
    local trigger ydl_trigger
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    // 食尸鬼
    call SaveRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x50F266F5, CreateRegion())
    call SaveRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB2850A19, Rect(- 24480.00, - 25696.00, - 24032.00, - 23680.00))
    call RegionAddRect(LoadRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x50F266F5), LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB2850A19))
    set ydl_trigger=CreateTrigger()
    call SaveRegionHandle(YDLOC, GetHandleId(ydl_trigger), 0x50F266F5, LoadRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x50F266F5))
    call SaveRectHandle(YDLOC, GetHandleId(ydl_trigger), 0xB2850A19, LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB2850A19))
    call TriggerRegisterEnterRegionSimple(ydl_trigger, LoadRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x50F266F5))
    call TriggerAddCondition(ydl_trigger, Condition(function Trig_RectFunc006Conditions))
    // 桥
    call SaveRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x9DF22041, CreateRegion())
    call SaveRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x7231CA97, Rect(- 21312.00, - 27744.00, - 20960.00, - 27104.00))
    call RegionAddRect(LoadRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x9DF22041), LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x7231CA97))
    set ydl_trigger=CreateTrigger()
    call SaveRectHandle(YDLOC, GetHandleId(ydl_trigger), 0x7231CA97, LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x7231CA97))
    call SaveRegionHandle(YDLOC, GetHandleId(ydl_trigger), 0x9DF22041, LoadRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x9DF22041))
    call TriggerRegisterEnterRegionSimple(ydl_trigger, LoadRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x9DF22041))
    call TriggerAddCondition(ydl_trigger, Condition(function Trig_RectFunc011Conditions))
    // 树木
    call SaveRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xCECECD43, CreateRegion())
    call SaveRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDBD4FB2A, Rect(- 19072.00, - 27584.00, - 18624.00, - 27072.00))
    call RegionAddRect(LoadRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xCECECD43), LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDBD4FB2A))
    set ydl_trigger=CreateTrigger()
    call SaveRegionHandle(YDLOC, GetHandleId(ydl_trigger), 0xCECECD43, LoadRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xCECECD43))
    call SaveRectHandle(YDLOC, GetHandleId(ydl_trigger), 0xDBD4FB2A, LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDBD4FB2A))
    call TriggerRegisterEnterRegionSimple(ydl_trigger, LoadRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xCECECD43))
    call TriggerAddCondition(ydl_trigger, Condition(function Trig_RectFunc016Conditions))
    // 屠夫
    call SaveRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6582AE4, CreateRegion())
    call SaveRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x388FCDBB, Rect(- 15744.00, - 27360.00, - 15648.00, - 25984.00))
    call RegionAddRect(LoadRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6582AE4), LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x388FCDBB))
    set ydl_trigger=CreateTrigger()
    call SaveRectHandle(YDLOC, GetHandleId(ydl_trigger), 0x388FCDBB, LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x388FCDBB))
    call SaveRegionHandle(YDLOC, GetHandleId(ydl_trigger), 0xB6582AE4, LoadRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6582AE4))
    call TriggerRegisterEnterRegionSimple(ydl_trigger, LoadRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6582AE4))
    call TriggerAddCondition(ydl_trigger, Condition(function Trig_RectFunc021Conditions))
    // 骷髅王
    call SaveRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x25B34215, CreateRegion())
    call SaveRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xD0439FBD, Rect(- 14432.00, - 24928.00, - 14272.00, - 24800.00))
    call SaveRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x39DEB200, Rect(- 14336.00, - 25056.00, - 14176.00, - 24928.00))
    call SaveRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x0D59BE9D, Rect(- 14208.00, - 25184.00, - 14048.00, - 25056.00))
    call RegionAddRect(LoadRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x25B34215), LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xD0439FBD))
    call RegionAddRect(LoadRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x25B34215), LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x39DEB200))
    call RegionAddRect(LoadRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x25B34215), LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x0D59BE9D))
    set ydl_trigger=CreateTrigger()
    call SaveRectHandle(YDLOC, GetHandleId(ydl_trigger), 0xD0439FBD, LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xD0439FBD))
    call SaveRectHandle(YDLOC, GetHandleId(ydl_trigger), 0x39DEB200, LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x39DEB200))
    call SaveRectHandle(YDLOC, GetHandleId(ydl_trigger), 0x0D59BE9D, LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x0D59BE9D))
    call SaveRegionHandle(YDLOC, GetHandleId(ydl_trigger), 0x25B34215, LoadRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x25B34215))
    call TriggerRegisterEnterRegionSimple(ydl_trigger, LoadRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x25B34215))
    call TriggerAddCondition(ydl_trigger, Condition(function Trig_RectFunc030Conditions))
    // 死灵法师
    call SaveRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1FB3E634, CreateRegion())
    call SaveRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDFC2FD23, Rect(- 9440.00, - 18304.00, - 9376.00, - 17728.00))
    call RegionAddRect(LoadRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1FB3E634), LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDFC2FD23))
    set ydl_trigger=CreateTrigger()
    call SaveRectHandle(YDLOC, GetHandleId(ydl_trigger), 0xDFC2FD23, LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xDFC2FD23))
    call SaveRegionHandle(YDLOC, GetHandleId(ydl_trigger), 0x1FB3E634, LoadRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1FB3E634))
    call TriggerRegisterEnterRegionSimple(ydl_trigger, LoadRegionHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x1FB3E634))
    call TriggerAddCondition(ydl_trigger, Condition(function Trig_RectFunc035Conditions))
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
    set ydl_trigger=null
endfunction
//===========================================================================
function InitTrig_Rect_Orig takes nothing returns nothing
    set gg_trg_Rect=CreateTrigger()
    call TriggerAddAction(gg_trg_Rect, function Trig_RectActions)
endfunction
function InitTrig_Rect takes nothing returns nothing
endfunction
//===========================================================================
// Trigger: OgreMagi
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function OMET takes nothing returns boolean
 local trigger t= GetTriggeringTrigger()
 local unit u
 local integer h= GetHandleId(t)
 local integer TEC= GetTriggerEvalCount(t)
	set u=LoadUnitHandle(HY, h, 0)
	if TEC < 50 then
		call SetUnitFlyHeight(u, 700 * TEC / 50, 0)
	elseif TEC < 100 then
		call SetUnitFlyHeight(u, 700 - 700 * ( TEC - 50 ) / 50, 0)
	else
		//call GDS("结束神拳")
		call h__DestroyEffect(LoadEffectHandle(HY, h, 2))
		call FlushChildHashtable(HY, h)
		call DisableTrigger(t)
		call DestroyTrigger(t)
	endif
	set t=null
	set u=null
	return false
endfunction
function EEEE takes nothing returns nothing
	call DoNothing()
endfunction
function OME takes nothing returns nothing
 local trigger t
 local integer h
 local unit u= GetTriggerUnit()
 local unit du
 local player p= GetOwningPlayer(u)
	if ( ( ( (0 != EXGetEventDamageData(YDWEEventDamageData___EVENT_DAMAGE_DATA_IS_ATTACK)) == true ) and ( GetUnitAbilityLevel(GetEventDamageSource(), 'AomC') > 0 ) ) ) and (IsPlayerAlly((p), Player(0)) == false) then // INLINED!!
		set t=CreateTrigger()
		set h=GetHandleId(t)
		//set u = GetTriggerUnit()
		set du=GetEventDamageSource()
		call UnitRemoveAbility(du, 'AomC')
		call UnitAddAbility(u, 'Amrf')
		call UnitRemoveAbility(u, 'Amrf')
		call h__DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\FrostBolt\\FrostBoltMissile.mdl", u, "overhead"))
		call h__DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\FrostBolt\\FrostBoltMissile.mdl", u, "head"))
		call h__DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\FrostBolt\\FrostBoltMissile.mdl", u, "left,hand"))
		call h__DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\FrostBolt\\FrostBoltMissile.mdl", u, "right,hand"))
		call h__DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\FrostBolt\\FrostBoltMissile.mdl", u, "chest"))
		call h__DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\FrostBolt\\FrostBoltMissile.mdl", u, "origin"))
		call TriggerRegisterTimerEvent(t, 0.01, true)
		call TriggerAddCondition(t, Condition(function OMET))
		call SaveUnitHandle(HY, h, 0, u)
		call SaveEffectHandle(HY, h, 2, AddSpecialEffectTarget("war3mapImported\\WalrusPunchWeaponFX.mdx", du, "weapon"))
	endif
	set t=null
	set u=null
	set du=null
endfunction
function OgreMagiAG takes nothing returns nothing
 local timer t= GetExpiredTimer()
	//local integer h = GetHandleId(t)
	//local trigger tt = LoadTriggerHandle(HY,h,1)
	call GDS("清除事件")
	call ExecuteFunc("OgreMagi")
	//call FlushChildHashtable(HY,h)
	call DisableTrigger(AudtOM)
	call DestroyTrigger(AudtOM)
	call DestroyTimer(t)
	set t=null
	//set tt = null
	
endfunction
function OgreMagi takes nothing returns nothing
	//local trigger t = CreateTrigger()
 local timer tt= CreateTimer()
	//local integer th = GetHandleId(t)
    //local integer tth = GetHandleId(tt)
    set AudtOM=null
	set AudtOM=CreateTrigger()
	call YDWESyStemAnyUnitDamagedRegistTrigger(AudtOM)
	call TriggerAddAction(AudtOM, function OME)
	//call SaveTriggerHandle(HY,tth,1,t)
	call TimerStart(tt, 600.00, false, function OgreMagiAG)
	call GDS("注册事件")
	//set t = null
	set tt=null
endfunction
function SEOME takes nothing returns nothing
 local unit u= GetTriggerUnit()
 local integer Lv= GetUnitAbilityLevel(u, 'AomE')
	if GetUnitAbilityLevel(u, 'AomC') == 0 then
		 call UnitAddAbility(u, 'AomC')
		 call SetUnitAbilityLevel(u, 'AomC', Lv)
	endif
	set u=null
endfunction
// Trigger: StartSet
//===========================================================================
function Trig_StartSetFunc002A takes nothing returns nothing
    call SetPlayerAbilityAvailable(GetEnumPlayer(), 'A008', false)
    call SetPlayerAbilityAvailable(GetEnumPlayer(), 'ATlN', false)
endfunction
function Trig_StartSetActions takes nothing returns nothing
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call SetPlayerHandicapXP(Player(10), 0.00)
    call ForForce(bj_FORCE_ALL_PLAYERS, function Trig_StartSetFunc002A)
    call CreateFogModifierRectBJ(true, Player(10), FOG_OF_WAR_VISIBLE, GetPlayableMapRect())
    // End
    call SaveRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xD3FCBFB3, Rect(- 14976.00, - 24608.00, - 14848.00, - 24480.00))
    call SaveRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6EBBBCC, Rect(- 15104.00, - 24736.00, - 14976.00, - 24608.00))
    call SaveRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB3C7E815, Rect(- 15232.00, - 24832.00, - 15104.00, - 24704.00))
    call SaveRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB160C146, Rect(- 15360.00, - 24960.00, - 15232.00, - 24832.00))
    call SaveRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x9ECDCF02, Rect(- 15488.00, - 25088.00, - 15360.00, - 24960.00))
    call RegionAddRect(udg_SlkR, LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xD3FCBFB3))
    call RegionAddRect(udg_SlkR, LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6EBBBCC))
    call RegionAddRect(udg_SlkR, LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB3C7E815))
    call RegionAddRect(udg_SlkR, LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB160C146))
    call RegionAddRect(udg_SlkR, LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x9ECDCF02))
    call RemoveRect(LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xD3FCBFB3))
    call RemoveRect(LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB6EBBBCC))
    call RemoveRect(LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB3C7E815))
    call RemoveRect(LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0xB160C146))
    call RemoveRect(LoadRectHandle(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step, 0x9ECDCF02))
    call HAB()
    call STAB()
    call DestroyTrigger(GetTriggeringTrigger())
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_StartSet_Orig takes nothing returns nothing
    set gg_trg_StartSet=CreateTrigger()
    call TriggerAddAction(gg_trg_StartSet, function Trig_StartSetActions)
endfunction
function InitTrig_StartSet takes nothing returns nothing
endfunction
//===========================================================================
// Trigger: StarUnit
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function Trig_StarUnitActions takes nothing returns nothing
    //屠夫
    set udg_Boos[0]=CreateUnit(Player(10), 'Uabo', - 13580.00, - 26820.00, 180.00)
    call UnitAddAbility(udg_Boos[0], 'A00J') //肢解
call UnitAddAbility(udg_Boos[0], 'AHHH') //碾压
call UnitAddAbility(udg_Boos[0], 'ATft') //肉钩
call AddHeroXP((udg_Boos[0] ), ( 5400), false) //10级 // INLINED!!
call SetUnitAnimation(udg_Boos[1], "Death")
    //骷髅王
    set udg_Boos[1]=CreateUnit(Player(10), 'NSlk', - 13700.00, - 24450.00, 220.00)
    call UnitAddAbility(udg_Boos[1], 'AHHH') //碾压
call UnitAddAbility(udg_Boos[1], 'ASlT') //冥火暴击
call UnitAddAbility(udg_Boos[1], 'ASlb') //重击
call UnitAddAbility(udg_Boos[1], 'ASlr') //重生
call UnitAddAbility(udg_Boos[1], 'ASlw') //震荡波
call SetUnitAbilityLevel(udg_Boos[1], 'AHHH', 2) //二级碾压
call AddHeroXP((udg_Boos[1] ), ( 9000), false) //13级 // INLINED!!
//死灵法师
set udg_Boos[2]=CreateUnit(Player(10), 'Unec', - 7600.00, - 18464.00, 200.00)
    call AddHeroXP((udg_Boos[2] ), ( 11900), false) //15级 // INLINED!!
call UnitAddAbility(udg_Boos[2], 'ANeh') //竭心光环
// Ghoul
call CreateUnit(Player(10), 'ugho', - 24000.00, - 23800.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'ugho', - 23900.00, - 25200.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'ugho', - 23450.00, - 25000.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'ugho', - 23450.00, - 25000.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'ugho', - 23000.00, - 25184.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'ugho', - 23744.00, - 25888.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'ugho', - 24128.00, - 26368.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'ugho', - 22240.00, - 24672.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'ugho', - 21216.00, - 23872.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'ugho', - 21376.00, - 26400.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'ugho', - 21408.00, - 27072.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'ugho', - 22752.00, - 26016.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'ugho', - 18384.00, - 27264.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'ugho', - 16256.00, - 20800.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'ugho', - 16000.00, - 20512.00, GetRandomDirectionDeg())
    // Ghoul
    // 屠夫前
    call CreateUnit(Player(10), 'u003', - 21312.00, - 22720.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'u003', - 22272.00, - 25920.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'ugho', - 18336.00, - 27136.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'ugho', - 18240.00, - 27392.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'ugho', - 16960.00, - 26880.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'u003', - 17152.00, - 27104.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'ugho', - 21120.00, - 22272.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'ugho', - 20928.00, - 22336.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'ugho', - 22304.00, - 25792.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'ugho', - 18000.00, - 27104.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'ugho', - 18000.00, - 27360.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'slAc', - 16928.00, - 27296.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'uslm', - 16768.00, - 27040.00, GetRandomDirectionDeg())
    // Skeleton
    call CreateUnit(Player(10), 'u003', - 13280.00, - 23648.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'u003', - 13440.00, - 23040.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'u003', - 13696.00, - 23104.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'u003', - 13120.00, - 23392.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'slAc', - 13632.00, - 22880.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'ugho', - 14176.00, - 21984.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'ugho', - 14304.00, - 21856.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'slAc', - 14432.00, - 21664.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'uslm', - 14592.00, - 21824.00, GetRandomDirectionDeg())
    call CreateUnit(Player(10), 'uslm', - 16096.00, - 20672.00, GetRandomDirectionDeg())
    // End
    call DestroyTrigger(GetTriggeringTrigger())
endfunction
//===========================================================================
function InitTrig_StarUnit_Orig takes nothing returns nothing
    set gg_trg_StarUnit=CreateTrigger()
    call TriggerAddAction(gg_trg_StarUnit, function Trig_StarUnitActions)
endfunction
function InitTrig_StarUnit takes nothing returns nothing
endfunction
// Trigger: PlayerGroup
//===========================================================================
//TESH.scrollpos=0
//TESH.alwaysfold=0
function OFC takes nothing returns nothing
	if ( ( GetPlayerController(GetEnumPlayer()) != ConvertMapControl(1) ) and ( GetPlayerSlotState(GetEnumPlayer()) == ConvertPlayerSlotState(1) ) ) then
		set udg_online[GetPlayerId(GetEnumPlayer())]=true
		set udg_playernumber=( udg_playernumber + 1 )
		call ForceAddPlayer(udg_OE, ( GetEnumPlayer() ))
		call DisplayTextToPlayer(Player(0), 0.00, 0.00, "玩家" + ( GetPlayerName(GetEnumPlayer()) ) + "在线")
	endif
endfunction
function SDG takes nothing returns nothing
	// 对话框标题
	call DialogSetMessage(udg_DialogBox[0], "玩家数量少于或等于3，是否多操？")
	call DialogSetMessage(udg_DialogBox[1], "是否允许播放过场动画？")
	call DialogSetMessage(udg_DialogBox[2], "是否允许跳过过场动画？")
	// 对话框按钮
	set udg_TH[0]=DialogAddButton(udg_DialogBox[0], "允许使用多个英雄(|cffffcc00E|r)", 'E') //TH==是否三英雄
set udg_TH[1]=DialogAddButton(udg_DialogBox[0], "禁止使用多个英雄(|cffffcc00R|r)", 'R')
	set udg_BM[0]=DialogAddButton(udg_DialogBox[1], "允许播放过场电影(|cffffcc00E|r)", 'E') //BM==是否允许播放动画
set udg_BM[1]=DialogAddButton(udg_DialogBox[1], "禁止播放过场电影(|cffffcc00R|r)", 'R')
	set udg_BEM[0]=DialogAddButton(udg_DialogBox[2], "允许跳过过场电影(|cffffcc00E|r)", 'E') //BEM==是否能跳过动画
set udg_BEM[1]=DialogAddButton(udg_DialogBox[2], "禁止跳过过场电影(|cffffcc00R|r)", 'R')
	set udg_BEM[2]=DialogAddButton(udg_DialogBox[2], "返回上级(|cffffcc00F|r)", 'F')
endfunction
function TDL takes nothing returns nothing
	call PauseGame(true)
	// 对话框 是否多操
	if ( ( udg_playernumber <= 3 ) ) then
		call GDS("当前玩家数量少于或等于3")
		call DialogDisplay(udg_Host, udg_DialogBox[0], true)
		set udg_BM[2]=DialogAddButton(udg_DialogBox[1], "返回上级(|cffffcc00F|r)", 'F')
	else
		call DialogDisplay(udg_Host, udg_DialogBox[1], true)
		call GDS("当前玩家数量大于3")
		call GDS("关闭多选英雄")
        call HeroNumber(1)
	endif
endfunction
function DLA takes nothing returns nothing
	// 是否允许多操
	if GetClickedButton() == udg_TH[0] then
		call DialogDisplay(udg_Host, udg_DialogBox[0], false)
		call DialogDisplay(udg_Host, udg_DialogBox[1], true)
		call HeroNumber(3)
		set udg_booleanthreehero=true
		call GDS("主机选择了允许选择多个英雄")
	else
		if GetClickedButton() == udg_TH[1] then
			call DialogDisplay(udg_Host, udg_DialogBox[0], false)
			call DialogDisplay(udg_Host, udg_DialogBox[1], true)
			call HeroNumber(1)
			set udg_booleanthreehero=false
			call GDS("主机选择了禁止选择多个英雄")
		endif
	endif
	if GetClickedButton() == udg_BM[0] then
		call DialogDisplay(udg_Host, udg_DialogBox[1], false)
		call DialogDisplay(udg_Host, udg_DialogBox[2], true)
		set udg_booleanMovie=true
		call GDS("主机选择了允许播放过场动画")
	else
		if GetClickedButton() == udg_BM[1] then
			set udg_choicemode=false
			set udg_booleanMovie=false
			set udg_booleanEscMovie=true
			call GDS("主机选择了禁止播放过场动画")
			call PauseGame(false)
			call MovieEnd()
            call InitTrig_EscStartMovie_Orig()
            call InitTrig_StartMovie_Orig()
            call TriggerExecute(gg_trg_StartMovie)
		else
			if GetClickedButton() == udg_BM[2] then
				call DialogDisplay(udg_Host, udg_DialogBox[1], false)
				call DialogDisplay(udg_Host, udg_DialogBox[0], true)
			endif
		endif
	endif
	if GetClickedButton() == udg_BEM[0] then
		set udg_choicemode=false
		set udg_booleanEscMovie=true
		call GDS("主机选择了允许跳过过场动画")
		call PauseGame(false)
		call MovieEnd()
        call InitTrig_EscStartMovie_Orig()
        call InitTrig_StartMovie_Orig()
        call TriggerExecute(gg_trg_StartMovie)
	else
		if GetClickedButton() == udg_BEM[1] then
			set udg_choicemode=false
		    set udg_booleanEscMovie=false
			call GDS("主机选择了禁止跳过过场动画")
			call PauseGame(false)
            call MovieEnd()
            call InitTrig_EscStartMovie_Orig()
            call InitTrig_StartMovie_Orig()
            call TriggerExecute(gg_trg_StartMovie)
		else
			if GetClickedButton() == udg_BEM[2] then
				call DialogDisplay(udg_Host, udg_DialogBox[2], false)
				call DialogDisplay(udg_Host, udg_DialogBox[1], true)
			endif
		endif
	endif
endfunction
function PGA takes nothing returns nothing
 local trigger t= GetTriggeringTrigger()
 local trigger ct= CreateTrigger()
 local integer A
 local integer B
 local timer tt=CreateTimer()
    set udg_PG[0]=Player(0)
	set udg_PG[1]=Player(1)
	set udg_PG[2]=Player(2)
	set udg_PG[3]=Player(3)
	set udg_PG[4]=Player(4)
	set udg_PG[5]=Player(5)
	set udg_PG[6]=Player(6)
	set udg_PG[7]=Player(7)
	set udg_PG[8]=Player(8)
	set udg_PG[9]=Player(9)
	set udg_PD=Player($A)
	set udg_OE=CreateForce()
	call ForForce(GetPlayersAll(), function OFC)
	// 主机
	set B=0
	loop
	exitwhen B > 9
		if ( ( udg_online[B] == true ) ) then
			set udg_Host=udg_PG[B]
		exitwhen true
		endif
		set B=B + 1
	endloop
	call DisplayTextToPlayer(Player(0), 0.00, 0.00, "现在主机为" + GetPlayerName(udg_Host))
	// 选择模式
	set udg_choicemode=true
	call GDS("|cffffff00主机在选择模式|r")
	//新建对话框
	set A=0
	loop
	exitwhen ( A > 8 )
		set udg_DialogBox[A]=DialogCreate()
		set A=A + 1
	endloop
	
	call SDG()
	//注册对话框事件
	call TriggerRegisterDialogEvent(ct, udg_DialogBox[0])
	call TriggerRegisterDialogEvent(ct, udg_DialogBox[1])
	call TriggerRegisterDialogEvent(ct, udg_DialogBox[2])
	call TriggerAddAction(ct, function DLA)
	call TimerStart(tt, 5.00, false, function TDL)
	// 对话框 是否跳过电影
	// End
	call DestroyTrigger(GetTriggeringTrigger())
	set t=null
	set ct=null
endfunction
//===========================================================================
function InitTrig_PlayerGroup_Orig takes nothing returns nothing
    set gg_trg_PlayerGroup=CreateTrigger()
    call TriggerAddAction(gg_trg_PlayerGroup, function PGA)
endfunction
function InitTrig_PlayerGroup takes nothing returns nothing
endfunction
//===========================================================================
// Trigger: Player Hero
//===========================================================================
function Trig_Player_HeroConditions takes nothing returns boolean
    return ( ( GetSellingUnit() == udg_StartTent ) )
endfunction
function Trig_Player_HeroActions takes nothing returns nothing
    call RemoveUnitFromStock(udg_StartTent, GetUnitTypeId(GetSoldUnit()))
    // 添加玩家英雄单位
    set bj_forLoopAIndex=0
    set bj_forLoopAIndexEnd=9
    loop
        exitwhen bj_forLoopAIndex > bj_forLoopAIndexEnd
        if ( ( udg_booleanthreehero == true ) ) then
            // 多选英雄
            if ( ( udg_BooleanChooseHero[GetForLoopIndexA()] == false ) ) then
                set udg_BooleanChooseHero[GetForLoopIndexA()]=true
                call SaveInteger(YDHT, GetHandleId(GetSoldUnit()), 0x39D9EE11, GetForLoopIndexA())
                call YDWEMultiboardSetItemValueBJNull(udg_DMB , 1 , ( GetForLoopIndexA() + 2 ) , YDWEGetPlayerColorString(udg_PG[GetPlayerId(GetOwningPlayer(GetSoldUnit()))] , GetPlayerName(GetOwningPlayer(GetSoldUnit()))))
                set udg_Hero[GetForLoopIndexA()]=GetSoldUnit()
                call GroupAddUnit(udg_HeroGroup, GetSoldUnit())
                call GroupAddUnit(udg_Hero10CunHuoDWZ, GetSoldUnit())
                set udg_FovDummy[GetForLoopIndexA()]=CreateUnit(GetOwningPlayer(GetSoldUnit()), 'e000', GetUnitX(GetSoldUnit()), GetUnitY(GetSoldUnit()), 0)
                call GroupAddUnit(udg_FovDummyGroup, udg_FovDummy[bj_forLoopAIndex])
                call DoNothing()
 exitwhen true //(  )
            else
            endif
        else
            // 单选英雄
            call SaveInteger(YDHT, GetHandleId(GetSoldUnit()), 0x39D9EE11, GetPlayerId(GetOwningPlayer(GetSoldUnit())))
            set udg_Hero[GetPlayerId(GetOwningPlayer(GetSoldUnit()))]=GetSoldUnit()
            set udg_BooleanChooseHero[GetPlayerId(GetOwningPlayer(GetSoldUnit()))]=true
            call GroupAddUnit(udg_HeroGroup, GetSoldUnit())
            call GroupAddUnit(udg_Hero10CunHuoDWZ, GetSoldUnit())
            set udg_FovDummy[GetForLoopIndexA()]=CreateUnit(GetOwningPlayer(GetSoldUnit()), 'e000', GetUnitX(GetSoldUnit()), GetUnitY(GetSoldUnit()), 0)
            call GroupAddUnit(udg_FovDummyGroup, udg_FovDummy[bj_forLoopAIndex])
        endif
        set bj_forLoopAIndex=bj_forLoopAIndex + 1
    endloop
    // 英雄名字
    set bj_forLoopBIndex=0
    set bj_forLoopBIndexEnd=9
    loop
        exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
        call YDWEMultiboardSetItemValueBJNull(udg_DMB , 2 , ( GetForLoopIndexA() + 2 ) , YDWEGetPlayerColorString(udg_PG[GetPlayerId(GetOwningPlayer(GetSoldUnit()))] , GetHeroProperName(udg_Hero[GetForLoopIndexA()])))
        set bj_forLoopBIndex=bj_forLoopBIndex + 1
    endloop
endfunction
//===========================================================================
function InitTrig_Player_Hero_Orig takes nothing returns nothing
    set gg_trg_Player_Hero=CreateTrigger()
    call TriggerRegisterAnyUnitEventBJ(gg_trg_Player_Hero, EVENT_PLAYER_UNIT_SELL)
    call TriggerAddCondition(gg_trg_Player_Hero, Condition(function Trig_Player_HeroConditions))
    call TriggerAddAction(gg_trg_Player_Hero, function Trig_Player_HeroActions)
endfunction
function InitTrig_Player_Hero takes nothing returns nothing
endfunction
//===========================================================================
// Trigger: Host
//===========================================================================
function Trig_HostActions takes nothing returns nothing
    set udg_online[GetPlayerId(GetTriggerPlayer())]=false
    if ( ( udg_Host == GetTriggerPlayer() ) ) then
        call DisplayTextToForce(GetPlayersAll(), ( "队长" + ( GetPlayerName(GetTriggerPlayer()) + "退出了游戏" ) ))
        set bj_forLoopBIndex=0
        set bj_forLoopBIndexEnd=9
        loop
            exitwhen bj_forLoopBIndex > bj_forLoopBIndexEnd
            if ( ( udg_online[bj_forLoopBIndex] == true ) ) then
                set udg_Host=udg_PG[bj_forLoopBIndex]
                call DoNothing()
 exitwhen true //(  )
            else
            endif
            set bj_forLoopBIndex=bj_forLoopBIndex + 1
        endloop
        call DisplayTextToForce(GetPlayersAll(), ( "现在队长为" + GetPlayerName(udg_Host) ))
    else
    endif
    set udg_playernumber=( udg_playernumber - 1 )
    call DisplayTextToForce(GetPlayersAll(), ( "玩家" + ( GetPlayerName(GetTriggerPlayer()) + "退出了游戏" ) ))
    // 转让主机如果发生在选择模式时
    if ( ( udg_choicemode == true ) and ( udg_Host == GetTriggerPlayer() ) ) then
        call PauseGame(false)
        call DialogDisplay(udg_Host, udg_DialogBox[0], true)
        call PauseGame(true)
    else
    endif
    // 在线数量
    call DisplayTextToForce(GetPlayersAll(), ( "在线玩家数量为" + I2S(udg_playernumber) ))
endfunction
//===========================================================================
function InitTrig_Host_Orig takes nothing returns nothing
    set gg_trg_Host=CreateTrigger()

        call TriggerRegisterPlayerEventLeave(gg_trg_Host, Player(0))
        call TriggerRegisterPlayerEventLeave(gg_trg_Host, Player(1))
        call TriggerRegisterPlayerEventLeave(gg_trg_Host, Player(2))
        call TriggerRegisterPlayerEventLeave(gg_trg_Host, Player(3))
        call TriggerRegisterPlayerEventLeave(gg_trg_Host, Player(4))
        call TriggerRegisterPlayerEventLeave(gg_trg_Host, Player(5))
        call TriggerRegisterPlayerEventLeave(gg_trg_Host, Player(6))
        call TriggerRegisterPlayerEventLeave(gg_trg_Host, Player(7))
        call TriggerRegisterPlayerEventLeave(gg_trg_Host, Player(8))
        call TriggerRegisterPlayerEventLeave(gg_trg_Host, Player(9))
        call TriggerRegisterPlayerEventLeave(gg_trg_Host, Player(10))
        call TriggerRegisterPlayerEventLeave(gg_trg_Host, Player(11))
        call TriggerRegisterPlayerEventLeave(gg_trg_Host, Player(12))
        call TriggerRegisterPlayerEventLeave(gg_trg_Host, Player(13))
        call TriggerRegisterPlayerEventLeave(gg_trg_Host, Player(14))
        call TriggerRegisterPlayerEventLeave(gg_trg_Host, Player(15))
    call TriggerAddAction(gg_trg_Host, function Trig_HostActions)
endfunction
function InitTrig_Host takes nothing returns nothing
endfunction
//===========================================================================
// Trigger: Dummy And Start
//
// 'Odoc', -24832.00, -24480.00, 0)
// 'Hpri', -24928.00, -24928.00, 0)
// -24928.00, -24928.00
//===========================================================================
//TESH.scrollpos=39
//TESH.alwaysfold=0
function Trig_Dummy_And_StartActions takes nothing returns nothing
    local integer S
    local integer G
    local integer D
    // 初始单位组
    set udg_StartTent=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'n000', - 25000.00, - 24500.00, 0)
    set udg_Circle[0]=CreateUnit(Player(0), 'n001', - 25100.00, - 24200.00, 0)
    set udg_Circle[1]=CreateUnit(Player(1), 'n001', - 24900.00, - 24200.00, 0)
    set udg_Circle[2]=CreateUnit(Player(2), 'n001', - 25300.00, - 24300.00, 0)
    set udg_Circle[3]=CreateUnit(Player(3), 'n001', - 24700.00, - 24300.00, 0)
    set udg_Circle[4]=CreateUnit(Player(4), 'n001', - 25300.00, - 24500.00, 0)
    set udg_Circle[5]=CreateUnit(Player(5), 'n001', - 24700.00, - 24500.00, 0)
    set udg_Circle[6]=CreateUnit(Player(6), 'n001', - 25300.00, - 24700.00, 0)
    set udg_Circle[7]=CreateUnit(Player(7), 'n001', - 24700.00, - 24700.00, 0)
    set udg_Circle[8]=CreateUnit(Player(8), 'n001', - 25100.00, - 24800.00, 0)
    set udg_Circle[9]=CreateUnit(Player(9), 'n001', - 24900.00, - 24800.00, 0)
    call GroupAddUnit(udg_StrartUnitGroup, udg_StartTent)
    set S=0
    loop
        exitwhen S > 9
        call GroupAddUnit(udg_StrartUnitGroup, udg_Circle[S])
        set S=S + 1
    endloop
    call AddUnitToStock(udg_StartTent, 'Hart', 1, 1)
    call AddUnitToStock(udg_StartTent, 'Hpri', 1, 1)
    call AddUnitToStock(udg_StartTent, 'Hsrr', 1, 1)
    call AddUnitToStock(udg_StartTent, 'Hvwd', 1, 1)
    call AddUnitToStock(udg_StartTent, 'Hspt', 1, 1)
    call AddUnitToStock(udg_StartTent, 'Otwl', 1, 1)
    call AddUnitToStock(udg_StartTent, 'Ogru', 1, 1)
    call AddUnitToStock(udg_StartTent, 'Odoc', 1, 1)
    call AddUnitToStock(udg_StartTent, 'Oomg', 1, 1)
    call AddUnitToStock(udg_StartTent, 'Nalc', 1, 1)
    call AddUnitToStock(udg_StartTent, 'Nvil', 1, 1)
    // 演员Dummy
    set udg_Dummy[0]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'Oomg', - 25184.00, - 24416.00, 0)
    set udg_Dummy[1]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'Nalc', - 25408.00, - 24288.00, 0)
    set udg_Dummy[2]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'Hvwd', - 25504.00, - 24480.00, 0)
    set udg_Dummy[3]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'Hspt', - 24960.00, - 24320.00, 0)
    set udg_Dummy[4]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'Hpri', - 24768.00, - 24448.00, 0)
    set udg_Dummy[5]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'Hsrr', - 24928.00, - 24928.00, 0)
    set udg_Dummy[6]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'Otwl', - 25536.00, - 24672.00, 0)
    set udg_Dummy[7]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'Ogru', - 25408.00, - 24896.00, 0)
    set udg_Dummy[8]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'Odoc', - 25184.00, - 24992.00, 0)
    set udg_Dummy[9]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'Nvil', - 25312.00, - 24960.00, 0)
    set udg_Dummy[10]=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'Hart', - 24800.00, - 24736.00, 0)
    set G=0
    loop
        exitwhen G > 10
        call GroupAddUnit(udg_DummyGroup, udg_Dummy[G])
        set G=G + 1
    endloop
    set D=0
    loop
        exitwhen D > 10
        call GroupAddUnit(udg_DummyGroup, udg_Dummy[D])
        set D=D + 1
    endloop
    call ForGroup(udg_StrartUnitGroup, function showunitF)
    // 注册
    call ExecuteFunc("InitTrig_Register_Orig")
    call ConditionalTriggerExecute(gg_trg_Register)
    // End
    call DestroyTrigger(GetTriggeringTrigger())
endfunction
//===========================================================================
function InitTrig_Dummy_And_Start takes nothing returns nothing
    set gg_trg_Dummy_And_Start=CreateTrigger()
    call TriggerRegisterTimerEventSingle(gg_trg_Dummy_And_Start, 0.00)
    call TriggerAddAction(gg_trg_Dummy_And_Start, function Trig_Dummy_And_StartActions)
endfunction
//===========================================================================
// Trigger: Register
//===========================================================================
function Trig_RegisterActions takes nothing returns nothing
    local unit u
    local integer h
    call MovieStart()
    set u=CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'Oomg', - 25400.00, - 25800.00, 230.00)
    set h=GetUnitTypeId(u)
    call SetCinematicScene(h, ConvertPlayerColor($C), "菊花", "初始化", 5.00, 0.00)
    call RemoveUnit(u)
    set u=null
    call InitTrig_Test_Orig()
    // Start
    call InitTrig________________u_Orig()
    call InitTrig_StartSet_Orig()
    call InitTrig_StarUnit_Orig()
    call InitTrig_Player_Hero_Orig()
    call InitTrig_PlayerGroup_Orig()
    call InitTrig_Host_Orig()
    call InitTrig_FovDummy_Orig()
    call InitTrig_Fog_of_war_Orig()
    call InitTrig_Open_the_fog_of_war_Orig()
    call InitTrig_Item_superposition_Orig()
    call InitTrig_Discard_Items_Orig()
    call InitTrig_FovDummy_Orig()
    call InitTrig_HideEgg_Orig()
    call InitTrig_Heihei_Orig()
    // Movie
    // Ablility
    call InitTrig_Sphere_Start_Orig()
    call InitTrig_T_Grunt_Orig()
    call InitTrig_T_TrollWarlord_Orig()
    call ExecuteFunc("InitTrig_T_Paladin_Orig")
    // Music
    call InitTrig_Music1_Orig()
    call InitTrig_Music2_Orig()
    // Boos
    call ExecuteFunc("InitTrig_Boos_Tf_Orig")
    call ExecuteFunc("InitTrig_Boos_Slk_Orig")
    call ExecuteFunc("InitTrig_Boos_Nec_Orig")
    call ExecuteFunc("InitTrig_Boos_Nect_Orig")
    // Rect and Dialog
    call ExecuteFunc("InitTrig_Rect_Orig")
    // Function
    call ConditionalTriggerExecute(gg_trg_Rect)
    call ConditionalTriggerExecute(gg_trg_Sphere_Start)
    call ConditionalTriggerExecute(gg_trg_StartSet)
    call ConditionalTriggerExecute(gg_trg_StarUnit)
    call ConditionalTriggerExecute(gg_trg_HideEgg)
    call ConditionalTriggerExecute(gg_trg_PlayerGroup)
    // End
    call DestroyTrigger(GetTriggeringTrigger())
endfunction
//===========================================================================
function InitTrig_Register_Orig takes nothing returns nothing
    set gg_trg_Register=CreateTrigger()
    call TriggerAddAction(gg_trg_Register, function Trig_RegisterActions)
endfunction
function InitTrig_Register takes nothing returns nothing
endfunction
//===========================================================================
// Trigger: EEEEE
//===========================================================================
function Trig_EEEEEFunc003Func005T takes nothing returns nothing
    call SetUserControlForceOn(bj_FORCE_PLAYER[0])
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
endfunction
function Trig_EEEEEFunc003FT takes nothing returns nothing
    local timer ydl_timer
    call SetUserControlForceOff(bj_FORCE_PLAYER[0])
    call DisplayTextToPlayer(Player(0), 0, 0, R2S(YDWEGetUnitAbilityState(gg_unit_Hart_0013 , 'ApdW' , 1)))
    set ydl_timer=CreateTimer()
    call TimerStart(ydl_timer, 0.00, false, function Trig_EEEEEFunc003Func005T)
    set ydl_timer=null
endfunction
function Trig_EEEEEFunc004Func006T takes nothing returns nothing
    call SetUserControlForceOn(bj_FORCE_PLAYER[0])
    call FlushChildHashtable(YDLOC, GetHandleId(GetExpiredTimer()))
    call DestroyTimer(GetExpiredTimer())
endfunction
function Trig_EEEEEFunc004FT takes nothing returns nothing
    local timer ydl_timer
    call SetUserControlForceOff(bj_FORCE_PLAYER[0])
    call DisplayTextToPlayer(Player(0), 0, 0, R2S(YDWEGetUnitAbilityState(gg_unit_Hart_0013 , 'ApdW' , 1)))
    set ydl_timer=CreateTimer()
    call TimerStart(ydl_timer, 0.00, false, function Trig_EEEEEFunc004Func006T)
    set ydl_timer=null
endfunction
function Trig_EEEEEActions takes nothing returns nothing
    local integer ydl_localvar_step= LoadInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76)
 set ydl_localvar_step=ydl_localvar_step + 3
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xCFDE6C76, ydl_localvar_step)
 call SaveInteger(YDLOC, GetHandleId(GetTriggeringTrigger()), 0xECE825E7, ydl_localvar_step)
    call DzSetUnitPosition(GetEventDamageSource(), 0, 0)
    call DisableTrigger(GetTriggeringTrigger())
    if GetLocalPlayer() == Player(0) then
    	call DzFrameSetScriptByCode(DzFrameGetCommandBarButton(2, 0), 1, function Trig_EEEEEFunc003FT, false)
    endif
    if GetLocalPlayer() == Player(0) then
    	call DzFrameSetScriptByCode(DzFrameGetCommandBarButton(2, 1), 1, function Trig_EEEEEFunc004FT, false)
    endif
    call FlushChildHashtable(YDLOC, GetHandleId(GetTriggeringTrigger()) * ydl_localvar_step)
endfunction
//===========================================================================
function InitTrig_EEEEE takes nothing returns nothing
    set gg_trg_EEEEE=CreateTrigger()
    call TriggerRegisterPlayerChatEvent(gg_trg_EEEEE, Player(0), "1", true)
    call TriggerAddAction(gg_trg_EEEEE, function Trig_EEEEEActions)
endfunction
//===========================================================================
// Trigger: WWWWWWWWWW
//===========================================================================
function Trig_WWWWWWWWWWActions takes nothing returns nothing
    if ( ( ( (0 != EXGetEventDamageData(YDWEEventDamageData___EVENT_DAMAGE_DATA_IS_ATTACK)) == true ) and ( GetUnitAbilityLevel(GetEventDamageSource(), 'Alc3') > 0 ) ) ) then // INLINED!!
    else
    endif
endfunction
//===========================================================================
function InitTrig_WWWWWWWWWW takes nothing returns nothing
    set gg_trg_WWWWWWWWWW=CreateTrigger()
    call TriggerAddAction(gg_trg_WWWWWWWWWW, function Trig_WWWWWWWWWWActions)
endfunction
//===========================================================================
// Trigger: Zzzzzzzzzzz
//===========================================================================
function Trig_ZzzzzzzzzzzActions takes nothing returns nothing
    call PanCameraToTimedWithZ(- 7600.00, - 18464.00, 0, 0)
endfunction
//===========================================================================
function InitTrig_Zzzzzzzzzzz takes nothing returns nothing
    set gg_trg_Zzzzzzzzzzz=CreateTrigger()
    call TriggerAddAction(gg_trg_Zzzzzzzzzzz, function Trig_ZzzzzzzzzzzActions)
endfunction
//===========================================================================
function InitCustomTriggers takes nothing returns nothing
    call InitTrig_______u()
    call InitTrig_123()
    call InitTrig_Test()
    call InitTrig_De()
    call InitTrig_T_TrollWarlord()
    call InitTrig_T_Grunt()
    call InitTrig_T_Paladin()
    call InitTrig_QQ()
    call InitTrig_FovDummy()
    call InitTrig________________u()
    call InitTrig_StartMovie()
    call InitTrig_EscStartMovie()
    call InitTrig_Music1()
    call InitTrig_Music2()
    call InitTrig_Sphere_Start()
    //Function not found: call InitTrig_Heihei()
    call InitTrig_HideEgg()
    call InitTrig_Black_shadow()
    call InitTrig_Open_Black_shadow()
    call InitTrig_Fog_of_war()
    call InitTrig_Open_the_fog_of_war()
    call InitTrig_Item_superposition()
    call InitTrig_Discard_Items()
    call InitTrig_Dialog_Tf()
    call InitTrig_Boos_Tf()
    call InitTrig_Boos_Slk()
    call InitTrig_Boos_Nec()
    call InitTrig_Boos_Nect()
    call InitTrig_Zzzzzzzzz()
    call InitTrig_Rect()
    //Function not found: call InitTrig_OgreMagi()
    call InitTrig_StartSet()
    call InitTrig_StarUnit()
    call InitTrig_PlayerGroup()
    call InitTrig_Player_Hero()
    call InitTrig_Host()
    call InitTrig_Dummy_And_Start()
    call InitTrig_Register()
    call InitTrig_EEEEE()
    call InitTrig_WWWWWWWWWW()
    call InitTrig_Zzzzzzzzzzz()
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
    call SetPlayerRacePreference(Player(0), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(0), true)
    call SetPlayerController(Player(0), MAP_CONTROL_USER)
    // Player 1
    call SetPlayerStartLocation(Player(1), 1)
    call ForcePlayerStartLocation(Player(1), 1)
    call SetPlayerColor(Player(1), ConvertPlayerColor(1))
    call SetPlayerRacePreference(Player(1), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(1), true)
    call SetPlayerController(Player(1), MAP_CONTROL_USER)
    // Player 2
    call SetPlayerStartLocation(Player(2), 2)
    call ForcePlayerStartLocation(Player(2), 2)
    call SetPlayerColor(Player(2), ConvertPlayerColor(2))
    call SetPlayerRacePreference(Player(2), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(2), true)
    call SetPlayerController(Player(2), MAP_CONTROL_USER)
    // Player 3
    call SetPlayerStartLocation(Player(3), 3)
    call ForcePlayerStartLocation(Player(3), 3)
    call SetPlayerColor(Player(3), ConvertPlayerColor(3))
    call SetPlayerRacePreference(Player(3), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(3), true)
    call SetPlayerController(Player(3), MAP_CONTROL_USER)
    // Player 4
    call SetPlayerStartLocation(Player(4), 4)
    call ForcePlayerStartLocation(Player(4), 4)
    call SetPlayerColor(Player(4), ConvertPlayerColor(4))
    call SetPlayerRacePreference(Player(4), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(4), true)
    call SetPlayerController(Player(4), MAP_CONTROL_USER)
    // Player 5
    call SetPlayerStartLocation(Player(5), 5)
    call ForcePlayerStartLocation(Player(5), 5)
    call SetPlayerColor(Player(5), ConvertPlayerColor(5))
    call SetPlayerRacePreference(Player(5), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(5), true)
    call SetPlayerController(Player(5), MAP_CONTROL_USER)
    // Player 6
    call SetPlayerStartLocation(Player(6), 6)
    call ForcePlayerStartLocation(Player(6), 6)
    call SetPlayerColor(Player(6), ConvertPlayerColor(6))
    call SetPlayerRacePreference(Player(6), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(6), true)
    call SetPlayerController(Player(6), MAP_CONTROL_USER)
    // Player 7
    call SetPlayerStartLocation(Player(7), 7)
    call ForcePlayerStartLocation(Player(7), 7)
    call SetPlayerColor(Player(7), ConvertPlayerColor(7))
    call SetPlayerRacePreference(Player(7), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(7), true)
    call SetPlayerController(Player(7), MAP_CONTROL_USER)
    // Player 8
    call SetPlayerStartLocation(Player(8), 8)
    call ForcePlayerStartLocation(Player(8), 8)
    call SetPlayerColor(Player(8), ConvertPlayerColor(8))
    call SetPlayerRacePreference(Player(8), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(8), true)
    call SetPlayerController(Player(8), MAP_CONTROL_USER)
    // Player 9
    call SetPlayerStartLocation(Player(9), 9)
    call ForcePlayerStartLocation(Player(9), 9)
    call SetPlayerColor(Player(9), ConvertPlayerColor(9))
    call SetPlayerRacePreference(Player(9), RACE_PREF_HUMAN)
    call SetPlayerRaceSelectable(Player(9), true)
    call SetPlayerController(Player(9), MAP_CONTROL_USER)
    // Player 10
    call SetPlayerStartLocation(Player(10), 10)
    call ForcePlayerStartLocation(Player(10), 10)
    call SetPlayerColor(Player(10), ConvertPlayerColor(10))
    call SetPlayerRacePreference(Player(10), RACE_PREF_UNDEAD)
    call SetPlayerRaceSelectable(Player(10), true)
    call SetPlayerController(Player(10), MAP_CONTROL_COMPUTER)
    // Player 11
    call SetPlayerStartLocation(Player(11), 11)
    call ForcePlayerStartLocation(Player(11), 11)
    call SetPlayerColor(Player(11), ConvertPlayerColor(11))
    call SetPlayerRacePreference(Player(11), RACE_PREF_UNDEAD)
    call SetPlayerRaceSelectable(Player(11), true)
    call SetPlayerController(Player(11), MAP_CONTROL_COMPUTER)
endfunction
function InitCustomTeams takes nothing returns nothing
    // Force: TRIGSTR_2430
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
    call SetPlayerTeam(Player(7), 0)
    call SetPlayerState(Player(7), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(8), 0)
    call SetPlayerState(Player(8), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(9), 0)
    call SetPlayerState(Player(9), PLAYER_STATE_ALLIED_VICTORY, 1)
    //   Allied
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(0), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(1), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(2), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(3), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(4), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(5), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(6), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(8), true)
    call SetPlayerAllianceStateAllyBJ(Player(7), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(8), Player(9), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(0), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(1), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(2), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(3), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(4), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(5), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(6), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(7), true)
    call SetPlayerAllianceStateAllyBJ(Player(9), Player(8), true)
    //   Shared Vision
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(0), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(1), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(2), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(3), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(4), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(5), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(6), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(8), true)
    call SetPlayerAllianceStateVisionBJ(Player(7), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(8), Player(9), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(0), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(1), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(2), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(3), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(4), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(5), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(6), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(7), true)
    call SetPlayerAllianceStateVisionBJ(Player(9), Player(8), true)
    // Force: TRIGSTR_2431
    call SetPlayerTeam(Player(10), 1)
    call SetPlayerState(Player(10), PLAYER_STATE_ALLIED_VICTORY, 1)
    call SetPlayerTeam(Player(11), 1)
    call SetPlayerState(Player(11), PLAYER_STATE_ALLIED_VICTORY, 1)
    //   Allied
    call SetPlayerAllianceStateAllyBJ(Player(10), Player(11), true)
    call SetPlayerAllianceStateAllyBJ(Player(11), Player(10), true)
    //   Shared Vision
    call SetPlayerAllianceStateVisionBJ(Player(10), Player(11), true)
    call SetPlayerAllianceStateVisionBJ(Player(11), Player(10), true)
endfunction
function InitAllyPriorities takes nothing returns nothing
    call SetStartLocPrioCount(0, 9)
    call SetStartLocPrio(0, 0, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 1, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 2, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 3, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 4, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 5, 6, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 6, 7, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 7, 8, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(0, 8, 9, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(1, 9)
    call SetStartLocPrio(1, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 1, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 2, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 3, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 4, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 5, 6, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 6, 7, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 7, 8, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(1, 8, 9, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(2, 9)
    call SetStartLocPrio(2, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 2, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 3, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 4, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 5, 6, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 6, 7, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 7, 8, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(2, 8, 9, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(3, 9)
    call SetStartLocPrio(3, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 2, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 3, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 4, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 5, 6, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 6, 7, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 7, 8, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(3, 8, 9, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(4, 9)
    call SetStartLocPrio(4, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 2, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 3, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 4, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 5, 6, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 6, 7, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 7, 8, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(4, 8, 9, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(5, 9)
    call SetStartLocPrio(5, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(5, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(5, 2, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(5, 3, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(5, 4, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(5, 5, 6, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(5, 6, 7, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(5, 7, 8, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(5, 8, 9, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(6, 9)
    call SetStartLocPrio(6, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(6, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(6, 2, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(6, 3, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(6, 4, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(6, 5, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(6, 6, 7, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(6, 7, 8, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(6, 8, 9, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(7, 9)
    call SetStartLocPrio(7, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(7, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(7, 2, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(7, 3, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(7, 4, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(7, 5, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(7, 6, 6, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(7, 7, 8, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(7, 8, 9, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(8, 9)
    call SetStartLocPrio(8, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(8, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(8, 2, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(8, 3, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(8, 4, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(8, 5, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(8, 6, 6, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(8, 7, 7, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(8, 8, 9, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(9, 9)
    call SetStartLocPrio(9, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(9, 1, 1, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(9, 2, 2, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(9, 3, 3, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(9, 4, 4, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(9, 5, 5, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(9, 6, 6, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(9, 7, 7, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(9, 8, 8, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrioCount(11, 2)
    call SetStartLocPrio(11, 0, 0, MAP_LOC_PRIO_HIGH)
    call SetStartLocPrio(11, 1, 1, MAP_LOC_PRIO_HIGH)
endfunction
//***************************************************************************
//*
//*  Main Initialization
//*
//***************************************************************************
//===========================================================================
function main takes nothing returns nothing
    call SetCameraBounds(- 27776.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 28160.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 32256.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 32256.0 - GetCameraMargin(CAMERA_MARGIN_TOP), - 27776.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 32256.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 32256.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 28160.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    call SetTerrainFogEx(0, 1400.0, 2600.0, 0.500, 0.808, 0.796, 0.941)
    call NewSoundEnvironment("Default")
    call SetAmbientDaySound("SunkenRuinsDay")
    call SetAmbientNightSound("SunkenRuinsNight")
    call SetMapMusic("Music", true, 0)
    call InitSounds()
    call CreateAllUnits()
    call InitBlizzard()

call ExecuteFunc("jasshelper__initstructs8123546")
call ExecuteFunc("YDTriggerSaveLoadSystem___Init")
call ExecuteFunc("InitializeYD")
call ExecuteFunc("MemoryLeakHelper___Init")
call ExecuteFunc("YDWETimerSystem___Init")

    call InitGlobals()
    call InitCustomTriggers()
endfunction
//***************************************************************************
//*
//*  Map Configuration
//*
//***************************************************************************
function config takes nothing returns nothing
    call SetMapName("基佬之岛合作版v1.06")
    call SetMapDescription("t和j的混合大作
即为t里面加了一堆自定义代码j
大部分技能均为j制作
简称TJ大作")
    call SetPlayers(12)
    call SetTeams(12)
    call SetGamePlacement(MAP_PLACEMENT_TEAMS_TOGETHER)
    call DefineStartLocation(0, - 25408.0, - 25856.0)
    call DefineStartLocation(1, - 25408.0, - 25856.0)
    call DefineStartLocation(2, - 25408.0, - 25856.0)
    call DefineStartLocation(3, - 25408.0, - 25856.0)
    call DefineStartLocation(4, - 25408.0, - 25856.0)
    call DefineStartLocation(5, - 25408.0, - 25856.0)
    call DefineStartLocation(6, - 25408.0, - 25856.0)
    call DefineStartLocation(7, - 25408.0, - 25856.0)
    call DefineStartLocation(8, - 25408.0, - 25856.0)
    call DefineStartLocation(9, - 25408.0, - 25856.0)
    call DefineStartLocation(10, - 25408.0, - 25856.0)
    call DefineStartLocation(11, - 25408.0, - 25856.0)
    // Player setup
    call InitCustomPlayerSlots()
    call InitCustomTeams()
    call InitAllyPriorities()
endfunction
//===========================================================================
//ϵͳ-TimerSystem
//===========================================================================
//library ValueIndexing initializer Init requires YDWEBase
//===========================================================================  
//===========================================================================  
//�Զ����¼� 
//===========================================================================
//===========================================================================   




//Struct method generated initializers/callers:

//Functions for BigArrays:
function sa__MemoryLeakHelper___GTable_onDestroy takes nothing returns boolean
local integer this=f__arg_this
            call s__MemoryLeakHelper___GTable_reset(this)
   return true
endfunction
function sa___prototype185_MemoryLeakHelper___GetElapsedGameTime takes nothing returns boolean

    set f__result_real= MemoryLeakHelper___GameTime + TimerGetElapsed(MemoryLeakHelper___GameTimeTimer)
    return true
endfunction
function sa___prototype189_MemoryLeakHelper___ReleaseLocation takes nothing returns boolean
    call MemoryLeakHelper___ReleaseLocation(f__arg_location1)
    return true
endfunction
function sa___prototype190_MemoryLeakHelper___CatchGroup takes nothing returns boolean
    call MemoryLeakHelper___CatchGroup(f__arg_group1)
    return true
endfunction
function sa___prototype190_MemoryLeakHelper___ReleaseGroup takes nothing returns boolean
    call MemoryLeakHelper___ReleaseGroup(f__arg_group1)
    return true
endfunction
function sa___prototype191_MemoryLeakHelper___ReleaseEffect takes nothing returns boolean
    call MemoryLeakHelper___ReleaseEffect(f__arg_effect1)
    return true
endfunction
function sa___prototype192_MemoryLeakHelper___PP takes nothing returns boolean
    call MemoryLeakHelper___PP(f__arg_location1,f__arg_real1,f__arg_real2)
    return true
endfunction
function sa___prototype193_MemoryLeakHelper___CU takes nothing returns boolean
    call MemoryLeakHelper___CU(f__arg_integer1,f__arg_integer2,f__arg_player1,f__arg_location1,f__arg_real1)
    return true
endfunction
function sa___prototype194_MemoryLeakHelper___IPO takes nothing returns boolean
    call MemoryLeakHelper___IPO(f__arg_unit1,f__arg_string1,f__arg_location1)
    return true
endfunction
function sa___prototype195_MemoryLeakHelper___SUP takes nothing returns boolean
    call MemoryLeakHelper___SUP(f__arg_unit1,f__arg_location1)
    return true
endfunction
function sa___prototype181_MemoryLeakHelper___SUF takes nothing returns boolean
    call MemoryLeakHelper___SUF(f__arg_unit1,f__arg_location1,f__arg_real1)
    return true
endfunction
function sa___prototype196_MemoryLeakHelper___GUR takes nothing returns boolean
    call MemoryLeakHelper___GUR(f__arg_real1,f__arg_location1,f__arg_boolexpr1)
    return true
endfunction
function sa___prototype197_MemoryLeakHelper___CUF takes nothing returns boolean
    call MemoryLeakHelper___CUF(f__arg_integer1,f__arg_integer2,f__arg_player1,f__arg_location1,f__arg_location2)
    return true
endfunction
function sa___prototype198_MemoryLeakHelper___FG takes nothing returns boolean
    call MemoryLeakHelper___FG(f__arg_group1,f__arg_code1)
    return true
endfunction
function sa___prototype199_MemoryLeakHelper___ASETU takes nothing returns boolean
    call MemoryLeakHelper___ASETU(f__arg_string1,f__arg_widget1,f__arg_string2)
    return true
endfunction
function sa___prototype200_MemoryLeakHelper___ASE takes nothing returns boolean
    call MemoryLeakHelper___ASE(f__arg_location1,f__arg_string1)
    return true
endfunction

function jasshelper__initstructs8123546 takes nothing returns nothing
    set st__MemoryLeakHelper___GTable_onDestroy[2]=CreateTrigger()
    set st__MemoryLeakHelper___GTable_onDestroy[3]=st__MemoryLeakHelper___GTable_onDestroy[2]
    call TriggerAddCondition(st__MemoryLeakHelper___GTable_onDestroy[2],Condition( function sa__MemoryLeakHelper___GTable_onDestroy))
    set st___prototype185[1]=CreateTrigger()
    call TriggerAddAction(st___prototype185[1],function sa___prototype185_MemoryLeakHelper___GetElapsedGameTime)
    call TriggerAddCondition(st___prototype185[1],Condition(function sa___prototype185_MemoryLeakHelper___GetElapsedGameTime))
    set st___prototype189[1]=CreateTrigger()
    call TriggerAddAction(st___prototype189[1],function sa___prototype189_MemoryLeakHelper___ReleaseLocation)
    call TriggerAddCondition(st___prototype189[1],Condition(function sa___prototype189_MemoryLeakHelper___ReleaseLocation))
    set st___prototype190[1]=CreateTrigger()
    call TriggerAddAction(st___prototype190[1],function sa___prototype190_MemoryLeakHelper___CatchGroup)
    call TriggerAddCondition(st___prototype190[1],Condition(function sa___prototype190_MemoryLeakHelper___CatchGroup))
    set st___prototype190[2]=CreateTrigger()
    call TriggerAddAction(st___prototype190[2],function sa___prototype190_MemoryLeakHelper___ReleaseGroup)
    call TriggerAddCondition(st___prototype190[2],Condition(function sa___prototype190_MemoryLeakHelper___ReleaseGroup))
    set st___prototype191[1]=CreateTrigger()
    call TriggerAddAction(st___prototype191[1],function sa___prototype191_MemoryLeakHelper___ReleaseEffect)
    call TriggerAddCondition(st___prototype191[1],Condition(function sa___prototype191_MemoryLeakHelper___ReleaseEffect))
    set st___prototype192[1]=CreateTrigger()
    call TriggerAddAction(st___prototype192[1],function sa___prototype192_MemoryLeakHelper___PP)
    call TriggerAddCondition(st___prototype192[1],Condition(function sa___prototype192_MemoryLeakHelper___PP))
    set st___prototype193[1]=CreateTrigger()
    call TriggerAddAction(st___prototype193[1],function sa___prototype193_MemoryLeakHelper___CU)
    call TriggerAddCondition(st___prototype193[1],Condition(function sa___prototype193_MemoryLeakHelper___CU))
    set st___prototype194[1]=CreateTrigger()
    call TriggerAddAction(st___prototype194[1],function sa___prototype194_MemoryLeakHelper___IPO)
    call TriggerAddCondition(st___prototype194[1],Condition(function sa___prototype194_MemoryLeakHelper___IPO))
    set st___prototype195[1]=CreateTrigger()
    call TriggerAddAction(st___prototype195[1],function sa___prototype195_MemoryLeakHelper___SUP)
    call TriggerAddCondition(st___prototype195[1],Condition(function sa___prototype195_MemoryLeakHelper___SUP))
    set st___prototype181[1]=CreateTrigger()
    call TriggerAddAction(st___prototype181[1],function sa___prototype181_MemoryLeakHelper___SUF)
    call TriggerAddCondition(st___prototype181[1],Condition(function sa___prototype181_MemoryLeakHelper___SUF))
    set st___prototype196[1]=CreateTrigger()
    call TriggerAddAction(st___prototype196[1],function sa___prototype196_MemoryLeakHelper___GUR)
    call TriggerAddCondition(st___prototype196[1],Condition(function sa___prototype196_MemoryLeakHelper___GUR))
    set st___prototype197[1]=CreateTrigger()
    call TriggerAddAction(st___prototype197[1],function sa___prototype197_MemoryLeakHelper___CUF)
    call TriggerAddCondition(st___prototype197[1],Condition(function sa___prototype197_MemoryLeakHelper___CUF))
    set st___prototype198[1]=CreateTrigger()
    call TriggerAddAction(st___prototype198[1],function sa___prototype198_MemoryLeakHelper___FG)
    call TriggerAddCondition(st___prototype198[1],Condition(function sa___prototype198_MemoryLeakHelper___FG))
    set st___prototype199[1]=CreateTrigger()
    call TriggerAddAction(st___prototype199[1],function sa___prototype199_MemoryLeakHelper___ASETU)
    call TriggerAddCondition(st___prototype199[1],Condition(function sa___prototype199_MemoryLeakHelper___ASETU))
    set st___prototype200[1]=CreateTrigger()
    call TriggerAddAction(st___prototype200[1],function sa___prototype200_MemoryLeakHelper___ASE)
    call TriggerAddCondition(st___prototype200[1],Condition(function sa___prototype200_MemoryLeakHelper___ASE))




endfunction

