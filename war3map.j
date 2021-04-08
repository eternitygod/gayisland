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
	camerasetup gg_cam_1_0_Movie_cam1 = null
	camerasetup gg_cam_1_0_Movie_cam2 = null
	camerasetup gg_cam_1_0_Movie_cam3 = null
	camerasetup gg_cam_1_0_Movie_cam4 = null
	camerasetup gg_cam_1_0_Movie_cam5 = null
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
	unit gg_unit_nvde_0068 = null
	unit gg_unit_Hpal_0268 = null
	unit gg_unit_ospw_0050 = null
	unit gg_unit_hbew_0052 = null
	
	boolean IsMirage = true //是否要DeBug
	region WorldRegion = null
	
	timer GameTimer = null //中心计时器，游戏运行时间
	unit U2 = null
	unit W2 = null
	player P2 = null
	player LocalPlayer = null
	
	//循环利用Group
	constant integer MaxGroupValue = 145 //单位组最大值
	integer OverflowValue = 0
	integer GroupIdleValue = 0
	group array MainGroup
	boolean array GroupInUse
	integer MaxGroupHandle = 0
	
	//定期清除Trigger
	integer DestroyQueueNumber = 0
	trigger array DestroyQueue
	real array ElapsedTime
	
	//JAPI常量
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
	
	//YDWE的伤害事件 1.33带排泄事件
	trigger DamageEventTrigger = null
	constant integer DAMAGE_EVENT_SWAP_TIMEOUT = 600  // 每隔这个时间(秒), DAMAGE_EVENT_SWAP_ENABLE 会被移入销毁队列
	constant boolean DAMAGE_EVENT_SWAP_ENABLE = true  // 若为 false 则不启用销毁机制
	trigger DamageEventTriggerToDestory = null
	trigger array DamageEventQueue
	integer DamageEventNumber = 0
	
	//物品属性
	trigger ItemAttrTrg = null
	hashtable HT_Item = InitHashtable()
	hashtable UnitData = InitHashtable()
	
	//使用JAPI修改 单位额外属性
	constant integer ITEM_DAMAGE = 0   //攻击
	constant integer ITEM_ARMOR = 1 //护甲
	constant integer ITEM_ATTACK = 2    //攻速
	constant integer ITEM_LIFE = 3 //最大生命
	constant integer ITEM_MANA = 4 //最大魔法
	constant integer ITEM_STR = 5
	constant integer ITEM_AGI = 6
	constant integer ITEM_INT = 7
	
endglobals

//单位存活
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


function destroy_error takes string s returns nothing
	if IsMirage then
		call DisplayTimedTextToPlayer(LocalPlayer, 0, 0, 120, "|c00ff0303内部检验失败|r")
		call DisplayTimedTextToPlayer(LocalPlayer, 0, 0, 120, "|c00ff0303这可能不是一个严重的故障，但对我来说这个信息十分重要|r")
		call DisplayTimedTextToPlayer(LocalPlayer, 0, 0, 120, "|c00ff0303错误代码: " + s + "|r")
	endif
endfunction

function ClearTrigger takes trigger t returns nothing
	call DisableTrigger(t)
	set DestroyQueueNumber = DestroyQueueNumber + 1
	set DestroyQueue[DestroyQueueNumber]= t
	set ElapsedTime[DestroyQueueNumber]= (TimerGetElapsed(GameTimer) ) + 60
	if DestroyQueueNumber > 8000 then
		call destroy_error("8k")
	endif
endfunction

function setnil takes integer i returns nothing
	if i != DestroyQueueNumber then
		set DestroyQueue[i]= DestroyQueue[DestroyQueueNumber]
		set ElapsedTime[i]= ElapsedTime[DestroyQueueNumber]
	endif
	set DestroyQueue[DestroyQueueNumber]= null
	set ElapsedTime[DestroyQueueNumber]= 0
	set DestroyQueueNumber = DestroyQueueNumber - 1
endfunction

function destroytrigger_actions takes nothing returns boolean
	local real r = TimerGetElapsed(GameTimer) 
	local integer i
	set i = 1
	loop
	exitwhen i > DestroyQueueNumber
		if ElapsedTime[i] < r then
			if DestroyQueue[i] == null then
				call destroy_error("nil")
			elseif IsTriggerEnabled(DestroyQueue[i]) then
				call destroy_error(I2S(GetHandleId(DestroyQueue[i] ) ) )
			else
				call DestroyTrigger(DestroyQueue[i])
			endif
			call setnil(i)
		else
			set i = i + 1
		endif
	endloop
	return false
endfunction

function LogoutGroup takes group g returns nothing
	local integer i = GetHandleId(g)-MaxGroupHandle
	if i < 0 or i > 240 then
	else
		call GroupClear(g)
		set GroupInUse[i]= false
		set GroupIdleValue = i
	endif
endfunction
function LoginGroup takes nothing returns group
	local integer i = GroupIdleValue
	loop
	exitwhen i == GroupIdleValue -1
		if GroupInUse[i]== false then
			set GroupIdleValue = i + 1
			if GroupIdleValue == MaxGroupValue then
				set GroupIdleValue = 1
			endif
			set GroupInUse[i]= true
			return MainGroup[i]
		endif
		set i = i + 1
		if i == MaxGroupValue then
			set i = 0
		endif
	endloop
	set OverflowValue = OverflowValue + 1
	if ModuloInteger(OverflowValue, 100)== 1 then
		call DisplayTimedTextToPlayer(LocalPlayer, 0, 0, 20, "|c00ff0303出错啦！")
	endif
	return CreateGroup()
endfunction

function CreateMainGroup takes nothing returns nothing
	local integer i = 0
	set MainGroup[i]= CreateGroup()
	set i = i + 1
	set MaxGroupHandle = GetHandleId(MainGroup[0])
	loop
	exitwhen i == MaxGroupValue
		set MainGroup[i]= CreateGroup()
		set i = i + 1
	endloop
endfunction


function RegisterTriggerDoNothing takes nothing returns boolean//啥都不干
	return true
endfunction

//给所有玩家注册玩家单位事件
function TriggerRegisterPlayerUnitEventBJ takes trigger t, playerunitevent prie returns nothing
	local integer i = 0
	loop
		call TriggerRegisterPlayerUnitEvent(t, Player(i), prie, null)
		set i = i + 1 //Condition(function RegisterTriggerDoNothing) 不知道为什么不填null
	exitwhen i == 16
	endloop
endfunction
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
function InitGlobals takes nothing returns nothing
endfunction
//***************************************************************************
//*
//*  Sounds
//*
//***************************************************************************
function InitSounds takes nothing returns nothing
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
	call CreateItem('I001', -25046.8, -24059.8)
	call CreateItem('I003', -276.5, -2164.4)
	call CreateItem('I004', -239.8, -2252.8)
	call CreateItem('I005', -323.7, -2372.3)
	call CreateItem('I005', -383.8, -2036.8)
	call CreateItem('I005', -326.7, -1969.7)
	call CreateItem('I005', -497.6, -2193.0)
	call CreateItem('I005', -177.1, -2007.2)
	call CreateItem('I009', -25302.5, -25075.7)
	call CreateItem('P001', -25045.5, -24233.3)
	call CreateItem('P002', -24946.6, -24950.2)
	call CreateItem('P003', -25423.8, -24662.4)
	call CreateItem('ciri', -24673.7, -24307.0)
	call CreateItem('ckng', 113.8, -3036.3)
	call CreateItem('ckng', 141.8, -3205.1)
	call CreateItem('ckng', 161.8, -3242.6)
	call CreateItem('ckng', 121.3, -3125.0)
	call CreateItem('ckng', 202.8, -3279.1)
	call CreateItem('ckng', 235.4, -3305.4)
	call CreateItem('cnob', -24548.7, -24271.0)
	call CreateItem('cnob', -24681.3, -24124.8)
	call CreateItem('cnob', -24855.9, -24284.7)
	call CreateItem('cnob', -24801.0, -24297.8)
	call CreateItem('tkno', 332.8, -2236.8)
	call CreateItem('tkno', 393.0, -2354.3)
	call CreateItem('tkno', 396.8, -2421.0)
	call CreateItem('tkno', 447.0, -2432.0)
	call CreateItem('tkno', 367.5, -2323.8)
	call CreateItem('tkno', 279.0, -2319.5)
	call CreateItem('tkno', 317.1, -2289.7)
	call CreateItem('tkno', 255.9, -2549.3)
	call CreateItem('tkno', 168.7, -2494.4)
	call CreateItem('tkno', 487.3, -2643.3)
	call CreateItem('tkno', 414.4, -2632.9)
	call CreateItem('tkno', 277.3, -2460.6)
	call CreateItem('tkno', 374.3, -2269.2)
	call CreateItem('tkno', 431.5, -2359.3)
	call CreateItem('tkno', 348.2, -2364.0)
	call CreateItem('tkno', -24826.3, -24444.4)
	call CreateItem('tkno', -24800.2, -24529.6)
	call CreateItem('tkno', -24744.3, -24649.9)
	call CreateItem('tkno', -24711.4, -24715.9)
	call CreateItem('tkno', -24666.6, -24768.7)
	call CreateItem('tkno', -24639.7, -24801.3)
	call CreateItem('tkno', -24586.5, -24791.5)
	call CreateItem('tkno', -24558.0, -24732.3)
	call CreateItem('tkno', -24573.5, -24656.1)
	call CreateItem('tkno', -24618.0, -24609.9)
	call CreateItem('tkno', -24676.9, -24543.3)
	call CreateItem('tkno', -24743.3, -24480.6)
	call CreateItem('tkno', -24775.2, -24438.9)
	call CreateItem('tkno', -24687.9, -24587.0)
	call CreateItem('tkno', -24670.6, -24618.0)
	call CreateItem('tkno', -24649.7, -24665.5)
	call CreateItem('tkno', 323.8, -2399.6)
	call CreateItem('tkno', -24627.6, -24720.4)
	call CreateItem('tkno', 352.5, -2455.5)
endfunction
//***************************************************************************
//*
//*  Unit Creation
//*
//***************************************************************************
//===========================================================================
function CreateUnitsForPlayer0 takes nothing returns nothing
	local player p = Player(0)
	local unit u
	local integer unitID
	local trigger t
	local real life
	set u = CreateUnit(p, 'uskw', -18254.5, -26769.6, 87.564)
	set u = CreateUnit(p, 'uskw', -17301.5, -27300.7, 165.031)
	set u = CreateUnit(p, 'uslm', -16917.9, -26850.9, 302.155)
	set u = CreateUnit(p, 'uslm', -16953.9, -27257.5, 182.390)
	set u = CreateUnit(p, 'slAc', -16642.4, -27019.8, 75.489)
	set u = CreateUnit(p, 'uskw', -18461.0, -26720.3, 9.163)
	set u = CreateUnit(p, 'ugho', -16484.2, -25536.6, 80.367)
	set u = CreateUnit(p, 'ugho', -16242.9, -25587.4, 211.032)
	set u = CreateUnit(p, 'ugho', -17121.3, -25837.3, 192.530)
	set u = CreateUnit(p, 'ugho', -17836.8, -26125.4, 12.085)
	set u = CreateUnit(p, 'ugho', -15865.4, -26692.8, 60.734)
	set u = CreateUnit(p, 'ugho', -15837.1, -26931.1, 122.260)
	set u = CreateUnit(p, 'ugho', -15368.6, -26602.6, 62.239)
	set u = CreateUnit(p, 'uslm', -15527.3, -26562.7, 260.065)
	set u = CreateUnit(p, 'uslm', -15582.4, -26785.6, 163.932)
	set u = CreateUnit(p, 'slAc', -15387.1, -26871.3, 190.860)
	set u = CreateUnit(p, 'slAc', -15345.3, -26460.0, 343.828)
	set u = CreateUnit(p, 'slAc', -16313.3, -26746.9, 357.154)
	set u = CreateUnit(p, 'slAc', -17536.7, -25820.9, 166.415)
	set u = CreateUnit(p, 'uskw', -17395.6, -26163.6, 182.258)
	set u = CreateUnit(p, 'uskw', -16908.8, -25895.4, 212.823)
	set u = CreateUnit(p, 'nvdg', -16767.3, -16524.1, 103.769)
	set u = CreateUnit(p, 'nvdg', -17014.4, -17618.1, 171.623)
	set u = CreateUnit(p, 'nvdg', -16202.2, -15650.2, 122.227)
	set u = CreateUnit(p, 'nvdl', -16947.7, -18689.2, 152.308)
	set u = CreateUnit(p, 'nvdl', -16728.1, -18698.7, 118.964)
	set u = CreateUnit(p, 'nvdl', -16713.7, -18989.1, 168.942)
	set u = CreateUnit(p, 'nvdl', -16832.2, -19354.9, 34.201)
	set u = CreateUnit(p, 'HS02', -24940.0, -25225.7, 89.893)
	set u = CreateUnit(p, 'Hpal', -25089.1, -24952.0, 304.100)
endfunction
//===========================================================================
function CreateUnitsForPlayer8 takes nothing returns nothing
	local player p = Player(8)
	local unit u
	local integer unitID
	local trigger t
	local real life
	set u = CreateUnit(p, 'utes', 970.7, -2351.6, 133.719)
	set u = CreateUnit(p, 'utes', 1093.5, -2492.4, 238.367)
	set u = CreateUnit(p, 'utes', 1188.2, -2600.6, 142.343)
	set u = CreateUnit(p, 'utes', 1244.5, -2654.9, 226.007)
	set u = CreateUnit(p, 'utes', 1289.5, -2714.9, 145.112)
	set u = CreateUnit(p, 'utes', 1358.8, -2790.6, 318.229)
	set u = CreateUnit(p, 'utes', 1428.6, -2850.8, 288.158)
	set u = CreateUnit(p, 'utes', 1479.9, -2890.2, 42.727)
	set u = CreateUnit(p, 'utes', 1081.3, -2068.1, 48.363)
	set u = CreateUnit(p, 'utes', 1201.0, -2286.5, 107.581)
	set u = CreateUnit(p, 'utes', 1454.0, -2626.1, 87.080)
	set u = CreateUnit(p, 'nmed', -8199.6, -9148.2, 187.880)
	set u = CreateUnit(p, 'utes', 1537.3, -2704.4, 219.733)
	set u = CreateUnit(p, 'utes', 1589.1, -2749.6, 110.888)
	set u = CreateUnit(p, 'utes', 1622.2, -2797.4, 219.426)
	set u = CreateUnit(p, 'utes', 1676.3, -2857.4, 311.219)
	set u = CreateUnit(p, 'utes', 1696.7, -2886.9, 98.605)
	set u = CreateUnit(p, 'utes', 1115.8, -2108.2, 219.052)
	set u = CreateUnit(p, 'utes', 1244.0, -2271.8, 10.218)
	set u = CreateUnit(p, 'utes', 1275.6, -2312.3, 133.290)
	set u = CreateUnit(p, 'utes', 1317.8, -2360.0, 296.069)
	set u = CreateUnit(p, 'utes', 1378.2, -2418.5, 208.670)
	set u = CreateUnit(p, 'utes', 1397.2, -2445.3, 40.717)
	set u = CreateUnit(p, 'utes', 1429.3, -2490.7, 67.667)
	set u = CreateUnit(p, 'utes', 1442.6, -2527.9, 219.217)
	set u = CreateUnit(p, 'utes', 1481.5, -2582.8, 114.382)
	set u = CreateUnit(p, 'utes', 1029.6, -1672.8, 210.252)
	set u = CreateUnit(p, 'utes', 1232.6, -1811.5, 153.440)
	set u = CreateUnit(p, 'utes', 1356.6, -1956.1, 33.443)
	set u = CreateUnit(p, 'utes', 1482.5, -2085.4, 347.497)
	set u = CreateUnit(p, 'utes', 1515.1, -2132.4, 288.114)
	set u = CreateUnit(p, 'utes', 1568.4, -2186.1, 169.326)
	set u = CreateUnit(p, 'utes', 1596.9, -2231.3, 198.518)
	set u = CreateUnit(p, 'utes', 1657.9, -2315.8, 319.261)
	set u = CreateUnit(p, 'utes', 1698.0, -2355.2, 191.377)
	set u = CreateUnit(p, 'utes', 1746.3, -2425.4, 90.739)
	set u = CreateUnit(p, 'utes', 1788.6, -2486.8, 345.454)
	set u = CreateUnit(p, 'utes', 1828.9, -2523.7, 122.919)
	set u = CreateUnit(p, 'utes', 1854.9, -2579.5, 86.828)
	set u = CreateUnit(p, 'utes', 1884.8, -2637.3, 242.706)
	set u = CreateUnit(p, 'utes', 1929.9, -2706.0, 22.819)
	set u = CreateUnit(p, 'utes', 1938.3, -2745.7, 117.755)
	set u = CreateUnit(p, 'utes', 1975.4, -2826.0, 64.052)
	set u = CreateUnit(p, 'utes', 1999.7, -2860.8, 265.537)
	set u = CreateUnit(p, 'utes', 2029.5, -2903.6, 155.318)
	set u = CreateUnit(p, 'utes', 2049.5, -2928.8, 240.883)
	set u = CreateUnit(p, 'utes', 2066.6, -2956.6, 293.663)
	set u = CreateUnit(p, 'utes', 1061.0, -1663.6, 276.578)
	set u = CreateUnit(p, 'utes', 1416.1, -2013.4, 129.434)
	set u = CreateUnit(p, 'utes', 1016.3, -1286.5, 287.873)
	set u = CreateUnit(p, 'utes', 1260.2, -1478.1, 64.569)
	set u = CreateUnit(p, 'utes', 1381.0, -1591.8, 236.147)
	set u = CreateUnit(p, 'utes', 1463.5, -1705.3, 248.903)
	set u = CreateUnit(p, 'utes', 1638.1, -1923.1, 86.487)
	set u = CreateUnit(p, 'utes', 1732.9, -2054.0, 289.224)
	set u = CreateUnit(p, 'utes', 1781.0, -2098.6, 105.714)
	set u = CreateUnit(p, 'utes', 1882.2, -2203.5, 244.805)
	set u = CreateUnit(p, 'utes', 1957.5, -2276.8, 239.740)
	set u = CreateUnit(p, 'utes', 2026.0, -2337.9, 214.240)
	set u = CreateUnit(p, 'utes', 2095.8, -2433.3, 134.400)
	set u = CreateUnit(p, 'utes', 2142.9, -2500.1, 336.302)
	set u = CreateUnit(p, 'utes', 2189.7, -2583.3, 191.937)
	set u = CreateUnit(p, 'utes', 2201.3, -2616.4, 263.702)
	set u = CreateUnit(p, 'utes', 2226.8, -2648.9, 354.913)
	set u = CreateUnit(p, 'utes', 2288.1, -2738.4, 36.695)
	set u = CreateUnit(p, 'utes', 2343.4, -2816.2, 337.631)
	set u = CreateUnit(p, 'utes', 2370.2, -2872.8, 218.250)
	set u = CreateUnit(p, 'utes', 2410.1, -2940.9, 118.370)
	set u = CreateUnit(p, 'utes', 2443.0, -2986.9, 166.382)
	set u = CreateUnit(p, 'utes', 2463.1, -3012.0, 140.245)
	set u = CreateUnit(p, 'utes', 2477.6, -3044.1, 158.735)
	set u = CreateUnit(p, 'utes', 804.7, -2667.3, 115.514)
	set u = CreateUnit(p, 'utes', 916.5, -2755.2, 32.817)
	set u = CreateUnit(p, 'utes', 974.7, -2816.8, 266.899)
	set u = CreateUnit(p, 'utes', 1001.8, -2845.5, 192.948)
	set u = CreateUnit(p, 'utes', 1047.3, -2893.6, 236.026)
	set u = CreateUnit(p, 'utes', 1072.6, -2932.4, 232.676)
	set u = CreateUnit(p, 'utes', 1126.6, -2989.4, 358.275)
	set u = CreateUnit(p, 'utes', 1165.4, -3039.7, 218.536)
	set u = CreateUnit(p, 'utes', 756.1, -2849.9, 32.630)
	set u = CreateUnit(p, 'utes', 841.6, -2918.0, 272.546)
	set u = CreateUnit(p, 'utes', 884.8, -2953.0, 273.041)
	set u = CreateUnit(p, 'utes', 918.2, -2990.5, 279.600)
	set u = CreateUnit(p, 'utes', 952.1, -3015.2, 325.304)
	set u = CreateUnit(p, 'utes', 984.2, -3048.7, 50.275)
endfunction
//===========================================================================
function CreateUnitsForPlayer10 takes nothing returns nothing
	local player p = Player(10)
	local unit u
	local integer unitID
	local trigger t
	local real life
	set u = CreateUnit(p, 'nvde', -13747.5, -18059.0, 290.147)
	set u = CreateUnit(p, 'nvdg', -14126.1, -17415.0, 236.026)
	set u = CreateUnit(p, 'nvdg', -14639.9, -17611.8, 153.857)
	set u = CreateUnit(p, 'npfl', -11869.7, -15096.0, 203.572)
	set u = CreateUnit(p, 'npfl', -11379.3, -15523.9, 212.427)
	set u = CreateUnit(p, 'nvdl', -11651.4, -14759.9, 121.260)
	set u = CreateUnit(p, 'nvdl', -11355.8, -14976.9, 160.636)
	set u = CreateUnit(p, 'nvdl', -10492.3, -14954.5, 261.966)
	set u = CreateUnit(p, 'nvdw', -10890.9, -14668.3, 63.756)
	set u = CreateUnit(p, 'uabo', -8889.3, -12436.4, 243.486)
	set u = CreateUnit(p, 'uabo', -9007.4, -12809.5, 317.723)
	set u = CreateUnit(p, 'ugho', -9462.7, -12408.3, 167.832)
	set u = CreateUnit(p, 'ugho', -9692.7, -12727.0, 338.851)
	set u = CreateUnit(p, 'ugho', -9777.7, -13229.9, 44.946)
	set u = CreateUnit(p, 'uabo', -9726.9, -17207.1, 17.689)
	set u = CreateUnit(p, 'uabo', -10156.0, -17776.9, 17.282)
	set u = CreateUnit(p, 'nvde', -9857.6, -17594.6, 317.756)
	set u = CreateUnit(p, 'nvdg', -13523.6, -17604.4, 40.991)
	set u = CreateUnit(p, 'nvdl', -13829.1, -14859.9, 106.329)
	set u = CreateUnit(p, 'nvdl', -13472.8, -14795.4, 261.944)
	set u = CreateUnit(p, 'nvdw', -13927.4, -15368.0, 63.283)
endfunction
//===========================================================================
function CreateNeutralHostileBuildings takes nothing returns nothing
	local player p = Player(PLAYER_NEUTRAL_AGGRESSIVE)
	local unit u
	local integer unitID
	local trigger t
	local real life
	set u = CreateUnit(p, 'nnsg', -16960.0, -23424.0, 270.000)
	set u = CreateUnit(p, 'nnfm', -16480.0, -22944.0, 270.000)
	set u = CreateUnit(p, 'nnfm', -17632.0, -23072.0, 270.000)
	set u = CreateUnit(p, 'nnfm', -17184.0, -24096.0, 270.000)
endfunction
//===========================================================================
function CreateNeutralHostile takes nothing returns nothing
	local player p = Player(PLAYER_NEUTRAL_AGGRESSIVE)
	local unit u
	local integer unitID
	local trigger t
	local real life
	set u = CreateUnit(p, 'nmsn', -24827.7, -19072.1, 280.582)
	set u = CreateUnit(p, 'nmtw', -23281.0, -21093.4, 272.766)
	set u = CreateUnit(p, 'nmsn', -24424.0, -19241.5, 280.313)
	set u = CreateUnit(p, 'nmsn', -25227.2, -19630.9, 256.967)
	set u = CreateUnit(p, 'nmsn', -24252.4, -18896.9, 6.240)
	set u = CreateUnit(p, 'nmbg', -24337.8, -19106.3, 280.812)
	set u = CreateUnit(p, 'nmbg', -25012.2, -19286.9, 306.513)
	set u = CreateUnit(p, 'nmtw', -22803.2, -21141.7, 213.680)
	set u = CreateUnit(p, 'nmsn', -23099.5, -20825.9, 200.781)
	set u = CreateUnit(p, 'nmbg', -22928.2, -20928.8, 227.204)
	set u = CreateUnit(p, 'nmbg', -25695.7, -21170.7, 299.970)
	set u = CreateUnit(p, 'nmsn', -25935.1, -21073.8, 290.950)
	set u = CreateUnit(p, 'nnmg', -17137.8, -23009.4, 315.869)
	set u = CreateUnit(p, 'nnmg', -17466.7, -23428.0, 322.395)
	set u = CreateUnit(p, 'nnmg', -16688.0, -23275.1, 288.828)
	set u = CreateUnit(p, 'nmcf', -25099.2, -21480.8, 315.188)
	set u = CreateUnit(p, 'nmcf', -23593.8, -21068.5, 254.713)
	set u = CreateUnit(p, 'nmcf', -23354.6, -21403.2, 251.462)
	set u = CreateUnit(p, 'nmcf', -25243.2, -21764.7, 302.427)
	set u = CreateUnit(p, 'nmcf', -23038.7, -21447.3, 256.580)
	set u = CreateUnit(p, 'nmcf', -24939.7, -21262.0, 310.270)
	set u = CreateUnit(p, 'ntrt', -20923.4, -25682.0, 171.923)
	set u = CreateUnit(p, 'nmsc', -18696.3, -19446.5, 185.353)
	set u = CreateUnit(p, 'nvde', -12364.6, -12768.4, 35.380)
	set u = CreateUnit(p, 'nvde', -12800.7, -12253.1, 148.551)
	call SetUnitState(u, UNIT_STATE_MANA, 0)
	set u = CreateUnit(p, 'nvdw', -12555.2, -11962.1, 33.070)
	call SetUnitState(u, UNIT_STATE_MANA, 0)
	set u = CreateUnit(p, 'nfov', -12375.9, -11880.3, 24.621)
	call SetUnitState(u, UNIT_STATE_MANA, 0)
	set u = CreateUnit(p, 'nmsn', -19056.0, -19564.3, 132.532)
	set u = CreateUnit(p, 'nmsn', -18956.5, -19185.7, 328.776)
	set u = CreateUnit(p, 'ntrs', -20751.6, -25514.6, 183.652)
	set u = CreateUnit(p, 'nmyr', -16781.6, -24061.9, 299.540)
	set u = CreateUnit(p, 'nmsn', -25473.9, -20981.6, 293.383)
	set u = CreateUnit(p, 'nmtw', -25560.5, -21398.7, 281.602)
	set u = CreateUnit(p, 'nmtw', -25372.2, -21201.0, 236.224)
	set u = CreateUnit(p, 'nmtw', -25890.8, -21427.5, 195.310)
	set u = CreateUnit(p, 'ntrs', -20719.3, -25826.0, 161.646)
	set u = CreateUnit(p, 'nrel', -26055.8, -25829.7, 18.571)
	set u = CreateUnit(p, 'nrel', -25346.1, -26340.1, 77.495)
	set u = CreateUnit(p, 'nrel', -25696.9, -26177.4, 336.565)
	set u = CreateUnit(p, 'nsoc', -18564.4, -24896.6, 351.594)
	set u = CreateUnit(p, 'ngrk', -21518.9, -27026.3, 37.410)
	set u = CreateUnit(p, 'ngrk', -21258.8, -27070.1, 108.658)
	set u = CreateUnit(p, 'ngst', -21442.4, -27246.6, 87.688)
	set u = CreateUnit(p, 'nsbs', -17217.3, -23884.2, 307.357)
	set u = CreateUnit(p, 'nsbs', -16587.0, -23612.2, 278.701)
endfunction
//===========================================================================
function CreateNeutralPassiveBuildings takes nothing returns nothing
	local player p = Player(PLAYER_NEUTRAL_PASSIVE)
	local unit u
	local integer unitID
	local trigger t
	local real life
	set u = CreateUnit(p, 'nfoh', -24704.0, -19264.0, 270.000)
	set u = CreateUnit(p, 'nmg0', -23392.0, -20704.0, 270.000)
	set u = CreateUnit(p, 'nmg1', -22752.0, -20832.0, 270.000)
	set u = CreateUnit(p, 'nmg0', -25632.0, -20000.0, 270.000)
	set u = CreateUnit(p, 'nmg1', -23712.0, -18848.0, 270.000)
	set u = CreateUnit(p, 'nmg1', -25696.0, -20960.0, 270.000)
	set u = CreateUnit(p, 'nmg0', -24288.0, -20576.0, 270.000)
	set u = CreateUnit(p, 'osld', -15680.0, -27968.0, 270.000)
	set u = CreateUnit(p, 'eaoe', -27200.0, -17856.0, 270.000)
	set u = CreateUnit(p, 'nmg1', -19744.0, -19744.0, 270.000)
	set u = CreateUnit(p, 'nmg0', -20384.0, -18912.0, 270.000)
	set u = CreateUnit(p, 'ngme', -23936.0, -25024.0, 270.000)
endfunction
//===========================================================================
function CreateNeutralPassive takes nothing returns nothing
	local player p = Player(PLAYER_NEUTRAL_PASSIVE)
	local unit u
	local integer unitID
	local trigger t
	local real life
	set u = CreateUnit(p, 'Hblm', 649.9, -3251.0, 44.815)
	set u = CreateUnit(p, 'Obla', -261.9, -2715.7, 198.170)
	call SetHeroLevel(u, 10, false)
	set u = CreateUnit(p, 'ospw', -15905.3, -27875.1, 178.289)
	set u = CreateUnit(p, 'hbew', -16056.8, -28023.8, 357.160)
	set u = CreateUnit(p, 'Udre', -143.7, -2885.5, 54.630)
	call SetHeroLevel(u, 10, false)
endfunction
//===========================================================================
function CreatePlayerBuildings takes nothing returns nothing
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
//*  Regions
//*
//***************************************************************************
function CreateRegions takes nothing returns nothing
	local weathereffect we
	set gg_rct_TriggerTiny = Rect(-13248.0, -14208.0, -12896.0, -13920.0)
	set gg_rct_1_0_Movie_OgreMagi1 = Rect(-24896.0, -24512.0, -24800.0, -24416.0)
	set gg_rct_1_0_Movie_InitSt = Rect(-24544.0, -25248.0, -24384.0, -25088.0)
	set gg_rct_1_0_Movie_Portal1 = Rect(-24896.0, -25536.0, -24768.0, -25408.0)
	set gg_rct_1_0_Movie_Portal2 = Rect(-25344.0, -25184.0, -25216.0, -25056.0)
	set gg_rct_1_0_Movie_OgreMagi2 = Rect(-24512.0, -24384.0, -24416.0, -24288.0)
	set gg_rct_1_0_Movie_TrollWarlord1 = Rect(-24864.0, -25216.0, -24768.0, -25120.0)
	set gg_rct_1_0_Movie_LCQY1 = Rect(-25152.0, -25024.0, -25056.0, -24928.0)
	set gg_rct_1_0_Movie_PAL1 = Rect(-24640.0, -24800.0, -24544.0, -24704.0)
	set gg_rct_1_0_Movie_Portal3 = Rect(-25472.0, -24512.0, -25376.0, -24416.0)
	set gg_rct_1_0_Movie_Portal4 = Rect(-23968.0, -24992.0, -23872.0, -24896.0)
	set gg_rct_1_0_Movie_Portal5 = Rect(-24288.0, -25600.0, -24192.0, -25504.0)
	set gg_rct_1_0_Movie_Portal6 = Rect(-25472.0, -26048.0, -25376.0, -25952.0)
	set gg_rct_1_0_Movie_Init = Rect(-22752.0, -25472.0, -22560.0, -25344.0)
	set gg_rct_1_0_Movie_injoker1 = Rect(-22720.0, -25952.0, -22592.0, -25824.0)
	set gg_rct_1_0_Movie_injoker2 = Rect(-23488.0, -25216.0, -23360.0, -25088.0)
	set gg_rct_SB = Rect(-16640.0, -27584.0, -16128.0, -27392.0)
endfunction
//***************************************************************************
//*
//*  Cameras
//*
//***************************************************************************
function CreateCameras takes nothing returns nothing
	set gg_cam_1_0_Movie_cam1 = CreateCameraSetup()
	call CameraSetupSetField(gg_cam_1_0_Movie_cam1, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam1, CAMERA_FIELD_ROTATION, 90.0, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam1, CAMERA_FIELD_ANGLE_OF_ATTACK, 300.0, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam1, CAMERA_FIELD_TARGET_DISTANCE, 2196.2, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam1, CAMERA_FIELD_ROLL, 0.0, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam1, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam1, CAMERA_FIELD_FARZ, 5000.0, 0.0)
	call CameraSetupSetDestPosition(gg_cam_1_0_Movie_cam1, -22656.9, -25476.6, 0.0)
	set gg_cam_1_0_Movie_cam2 = CreateCameraSetup()
	call CameraSetupSetField(gg_cam_1_0_Movie_cam2, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam2, CAMERA_FIELD_ROTATION, 232.9, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam2, CAMERA_FIELD_ANGLE_OF_ATTACK, 270.0, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam2, CAMERA_FIELD_TARGET_DISTANCE, 2415.0, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam2, CAMERA_FIELD_ROLL, 0.0, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam2, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam2, CAMERA_FIELD_FARZ, 5000.0, 0.0)
	call CameraSetupSetDestPosition(gg_cam_1_0_Movie_cam2, -24883.9, -24681.3, 0.0)
	set gg_cam_1_0_Movie_cam3 = CreateCameraSetup()
	call CameraSetupSetField(gg_cam_1_0_Movie_cam3, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam3, CAMERA_FIELD_ROTATION, 270.4, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam3, CAMERA_FIELD_ANGLE_OF_ATTACK, 296.7, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam3, CAMERA_FIELD_TARGET_DISTANCE, 2415.0, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam3, CAMERA_FIELD_ROLL, 0.0, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam3, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam3, CAMERA_FIELD_FARZ, 5000.0, 0.0)
	call CameraSetupSetDestPosition(gg_cam_1_0_Movie_cam3, -24671.5, -24882.2, 0.0)
	set gg_cam_1_0_Movie_cam4 = CreateCameraSetup()
	call CameraSetupSetField(gg_cam_1_0_Movie_cam4, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam4, CAMERA_FIELD_ROTATION, 229.3, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam4, CAMERA_FIELD_ANGLE_OF_ATTACK, 293.9, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam4, CAMERA_FIELD_TARGET_DISTANCE, 3535.8, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam4, CAMERA_FIELD_ROLL, 0.0, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam4, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam4, CAMERA_FIELD_FARZ, 5000.0, 0.0)
	call CameraSetupSetDestPosition(gg_cam_1_0_Movie_cam4, -24873.3, -24944.2, 0.0)
	set gg_cam_1_0_Movie_cam5 = CreateCameraSetup()
	call CameraSetupSetField(gg_cam_1_0_Movie_cam5, CAMERA_FIELD_ZOFFSET, 0.0, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam5, CAMERA_FIELD_ROTATION, 90.0, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam5, CAMERA_FIELD_ANGLE_OF_ATTACK, 304.0, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam5, CAMERA_FIELD_TARGET_DISTANCE, 2657.3, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam5, CAMERA_FIELD_ROLL, 0.0, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam5, CAMERA_FIELD_FIELD_OF_VIEW, 70.0, 0.0)
	call CameraSetupSetField(gg_cam_1_0_Movie_cam5, CAMERA_FIELD_FARZ, 5000.0, 0.0)
	call CameraSetupSetDestPosition(gg_cam_1_0_Movie_cam5, -24994.5, -24596.1, 0.0)
endfunction
//***************************************************************************
//*
//*  Custom Script Code
//*
//***************************************************************************
//TESH.scrollpos=0
//TESH.alwaysfold=0

function SaveItemHeroAttribute takes integer whichType, integer str, integer agi, integer int returns nothing
	if str != 0 then
		call SaveInteger(HT_Item, whichType, ITEM_STR, str)
	endif
	if agi != 0 then
		call SaveInteger(HT_Item, whichType, ITEM_AGI, agi)
	endif
	if int != 0 then
		call SaveInteger(HT_Item, whichType, ITEM_INT, int)
	endif
endfunction

function SaveItemAttribute takes integer whichType, integer damage, integer life, integer mana, real armor, real attack returns nothing
	if damage != 0 then
		call SaveInteger(HT_Item, whichType, ITEM_DAMAGE, damage)
	endif
	if life != 0 then
		call SaveInteger(HT_Item, whichType, ITEM_LIFE, life)
	endif
	if mana != 0 then
		call SaveInteger(HT_Item, whichType, ITEM_MANA, mana)
	endif
	if armor != 0 then
		call SaveReal(HT_Item, whichType, ITEM_ARMOR, armor)
	endif
	if attack != 0 then
		call SaveReal(HT_Item, whichType, ITEM_ATTACK, attack)
	endif
endfunction

//初始化物品属性 - 英雄三围
function InitItemHeroAttribute takes nothing returns nothing
	call SaveItemHeroAttribute('cnob', 5, 5, 5)  //贵族圆环
	call SaveItemHeroAttribute('Idms', 0, 0, 0) //幻影斧
endfunction
//初始化物品属性 - 攻击防御生命魔法攻速
function InitItemAttribute takes nothing returns nothing
	call SaveItemAttribute('cnob', 10, 200, 100 , 5 , 0.15)  //贵族圆环
	//call SaveItemAttribute('Idms', 0, 0, 0, 0, 12) //幻影斧
	//call SaveInteger(HT_Item, 'Idms', ITEM_ATTACK, 12)  //攻速
endfunction

//JAPI修改技能数据，并且刷新。
//*额外 攻击 防御 攻速*/
//升级并降低技能等级以此达到刷新属性的目的
function UnitAddAttackSpeedBonus takes unit whichUnit, real value returns nothing
	local integer h = GetHandleId(whichUnit)
	set value = LoadReal(UnitData, ITEM_ATTACK, h) + value
	call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIsx'), 1, ABILITY_DATA_DATA_A, value)
	call IncUnitAbilityLevel(whichUnit, 'AIsx' ) 
	call DecUnitAbilityLevel(whichUnit, 'AIsx' )
	call SaveReal(UnitData, ITEM_ATTACK, h, value)
endfunction
function UnitReduceAttackSpeedBonus takes unit whichUnit, real value returns nothing
	local integer h = GetHandleId(whichUnit)
	set value = LoadReal(UnitData, ITEM_ATTACK, h) - value
	call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIsx'), 1, ABILITY_DATA_DATA_A, value)
	call IncUnitAbilityLevel(whichUnit, 'AIsx' ) 
	call DecUnitAbilityLevel(whichUnit, 'AIsx' )
	call SaveReal(UnitData, ITEM_ATTACK, h, value)
endfunction
function UnitSetAttackSpeedBonus takes unit whichUnit, real newValue returns nothing
	call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIsx'), 1, ABILITY_DATA_DATA_A, newValue)
	call IncUnitAbilityLevel(whichUnit, 'AIsx' )
	call DecUnitAbilityLevel(whichUnit, 'AIsx' )
	call SaveReal(UnitData, ITEM_ATTACK, GetHandleId(whichUnit), newValue)
endfunction


function UnitAddArmorBonus takes unit whichUnit, real value returns nothing
	local integer h = GetHandleId(whichUnit)
	set value = LoadReal(UnitData, ITEM_ARMOR, h) + value
	call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AId1'), 1, ABILITY_DATA_DATA_A, value)
	call IncUnitAbilityLevel(whichUnit, 'AId1' ) 
	call DecUnitAbilityLevel(whichUnit, 'AId1' )
	call SaveReal(UnitData, ITEM_ARMOR, h, value)
endfunction
function UnitReduceArmorBonus takes unit whichUnit, real value returns nothing
	local integer h = GetHandleId(whichUnit)
	set value = LoadReal(UnitData, ITEM_ARMOR, h) - value
	call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AId1'), 1, ABILITY_DATA_DATA_A, value)
	call IncUnitAbilityLevel(whichUnit, 'AId1' ) 
	call DecUnitAbilityLevel(whichUnit, 'AId1' )
	call SaveReal(UnitData, ITEM_ARMOR, h, value)
endfunction
function UnitSetArmorBonus takes unit whichUnit, real newValue returns nothing
	call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AId1'), 1, ABILITY_DATA_DATA_A, newValue)
	call IncUnitAbilityLevel(whichUnit, 'AId1' )
	call DecUnitAbilityLevel(whichUnit, 'AId1' )
	call SaveReal(UnitData, ITEM_ARMOR, GetHandleId(whichUnit), newValue)
endfunction


function UnitAddDamageBonus takes unit whichUnit, real value returns nothing
	local integer h = GetHandleId(whichUnit)
	set value = LoadReal(UnitData, ITEM_DAMAGE, h) + value
	call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIat'), 1, ABILITY_DATA_DATA_A, value)
	call IncUnitAbilityLevel(whichUnit, 'AIat' ) 
	call DecUnitAbilityLevel(whichUnit, 'AIat' )
	call SaveReal(UnitData, ITEM_DAMAGE, h, value)
endfunction
function UnitReduceDamageBonus takes unit whichUnit, real value returns nothing
	local integer h = GetHandleId(whichUnit)
	set value = LoadReal(UnitData, ITEM_DAMAGE, h) - value
	call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIat'), 1, ABILITY_DATA_DATA_A, value)
	call IncUnitAbilityLevel(whichUnit, 'AIat' ) 
	call DecUnitAbilityLevel(whichUnit, 'AIat' )
	call SaveReal(UnitData, ITEM_DAMAGE, h, value)
endfunction
function UnitSetDamageBonus takes unit whichUnit, integer newValue returns nothing
	call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'AIat'), 1, ABILITY_DATA_DATA_A, newValue)
	call IncUnitAbilityLevel(whichUnit, 'AIat' )
	call DecUnitAbilityLevel(whichUnit, 'AIat' )
	call SaveInteger(UnitData, ITEM_DAMAGE, GetHandleId(whichUnit), newValue)
endfunction

//设置单位最大生命值 会按当前比例改变
function UnitAddMaxLife takes unit whichUnit, real value returns nothing
	local real maxlife = GetUnitState(whichUnit, UNIT_STATE_MAX_LIFE)
	set value = maxlife + value
	call SetUnitState(whichUnit, UNIT_STATE_MAX_LIFE, value)
	if UnitAlive(whichUnit) then
		call SetWidgetLife(whichUnit, GetWidgetLife(whichUnit) * (value / maxlife) )
	endif
endfunction
function UnitReduceMaxLife takes unit whichUnit, real value returns nothing
	local real maxlife = GetUnitState(whichUnit, UNIT_STATE_MAX_LIFE)
	local real life = GetWidgetLife(whichUnit)
	set value = maxlife - value
	call SetUnitState(whichUnit, UNIT_STATE_MAX_LIFE, value)
	if UnitAlive(whichUnit) and maxlife != life then
		call SetWidgetLife(whichUnit, life * (value / maxlife) )
	endif
endfunction
function UnitSetMaxLife takes unit whichUnit, real newVal returns nothing
	local real maxlife = GetUnitState(whichUnit, UNIT_STATE_MAX_LIFE)
	call SetUnitState(whichUnit, UNIT_STATE_MAX_LIFE, newVal)
	if UnitAlive(whichUnit) then
		call SetWidgetLife(whichUnit, GetWidgetLife(whichUnit) * (newVal / maxlife) ) //按比例改变血量
	endif
endfunction

//设置单位最大魔法值 会按当前比例改变
function UnitAddMaxMana takes unit whichUnit, real value returns nothing
	local real maxmana = GetUnitState(whichUnit, UNIT_STATE_MAX_MANA)
	set value = maxmana + value
	call SetUnitState(whichUnit, UNIT_STATE_MAX_MANA, value)
	if UnitAlive(whichUnit) then
		call SetUnitState(whichUnit, UNIT_STATE_MANA, GetUnitState(whichUnit, UNIT_STATE_MANA) * (value / maxmana) )
	endif
endfunction
function UnitReduceMaxMana takes unit whichUnit, real value returns nothing
	local real maxmana = GetUnitState(whichUnit, UNIT_STATE_MAX_MANA)
	local real mana = GetUnitState(whichUnit, UNIT_STATE_MANA)
	set value = maxmana - value
	call SetUnitState(whichUnit, UNIT_STATE_MAX_MANA, value)
	if UnitAlive(whichUnit) and maxmana != mana then
		call SetUnitState(whichUnit, UNIT_STATE_MANA, mana * (value / maxmana) )
	endif
endfunction
function UnitSetMaxMana takes unit whichUnit, real newVal returns nothing
	local real maxmana = GetUnitState(whichUnit, UNIT_STATE_MAX_MANA)
	call SetUnitState(whichUnit, UNIT_STATE_MAX_MANA, newVal)
	if UnitAlive(whichUnit) then
		call SetUnitState(whichUnit, UNIT_STATE_MANA, GetUnitState(whichUnit, UNIT_STATE_MANA) * (newVal / maxmana) )
	endif
endfunction

//仅用作物品刷新属性
function UnitAddAttribute takes unit whichUnit, integer itemId returns nothing
	local integer h = GetHandleId(whichUnit)
	local integer str = LoadInteger(UnitData, ITEM_STR, h) + LoadInteger(HT_Item, itemId, ITEM_STR)
	local integer agi = LoadInteger(UnitData, ITEM_AGI, h) + LoadInteger(HT_Item, itemId, ITEM_AGI)
	local integer int = LoadInteger(UnitData, ITEM_INT, h) + LoadInteger(HT_Item, itemId, ITEM_INT)
	call SaveInteger(UnitData, ITEM_STR, h, str)
	call SaveInteger(UnitData, ITEM_AGI, h, agi)
	call SaveInteger(UnitData, ITEM_INT, h, int)
	call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'Aamk'), 1, ABILITY_DATA_DATA_C, str)
	call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'Aamk'), 1, ABILITY_DATA_DATA_B, int)
	call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'Aamk'), 1, ABILITY_DATA_DATA_A, agi)
	call IncUnitAbilityLevel(whichUnit, 'Aamk' )
	call DecUnitAbilityLevel(whichUnit, 'Aamk' )
endfunction
function UnitReduceAttribute takes unit whichUnit, integer itemId returns nothing
	local integer h = GetHandleId(whichUnit)
	local integer str = LoadInteger(UnitData, ITEM_STR, h) - LoadInteger(HT_Item, itemId, ITEM_STR)
	local integer agi = LoadInteger(UnitData, ITEM_AGI, h) - LoadInteger(HT_Item, itemId, ITEM_AGI)
	local integer int = LoadInteger(UnitData, ITEM_INT, h) - LoadInteger(HT_Item, itemId, ITEM_INT)
	call SaveInteger(UnitData, ITEM_STR, h, str)
	call SaveInteger(UnitData, ITEM_AGI, h, agi)
	call SaveInteger(UnitData, ITEM_INT, h, int)
	call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'Aamk'), 1, ABILITY_DATA_DATA_C, str)
	call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'Aamk'), 1, ABILITY_DATA_DATA_B, int)
	call EXSetAbilityDataReal(EXGetUnitAbility(whichUnit, 'Aamk'), 1, ABILITY_DATA_DATA_A, agi)
	call IncUnitAbilityLevel(whichUnit, 'Aamk' )
	call DecUnitAbilityLevel(whichUnit, 'Aamk' )
endfunction

function AddUntiItemState takes unit whichUnit, integer itemId returns nothing
	local real data = 0
	call UnitAddAttribute(whichUnit, itemId)
	if HaveSavedInteger(HT_Item, itemId, ITEM_DAMAGE) then
		set data = LoadInteger(HT_Item, itemId, ITEM_DAMAGE)
		call UnitAddDamageBonus(whichUnit, data)
	endif
	if HaveSavedReal(HT_Item, itemId, ITEM_ARMOR) then
		set data = LoadReal(HT_Item, itemId, ITEM_ARMOR)
		call UnitAddArmorBonus(whichUnit, data)
	endif
	if HaveSavedReal(HT_Item, itemId, ITEM_ATTACK) then
		set data = LoadReal(HT_Item, itemId, ITEM_ATTACK)
		call UnitAddAttackSpeedBonus(whichUnit, data)
	endif
	if HaveSavedInteger(HT_Item, itemId, ITEM_LIFE) then
		set data = LoadInteger(HT_Item, itemId, ITEM_LIFE)
		call UnitAddMaxLife(whichUnit, data)
	endif
	if HaveSavedInteger(HT_Item, itemId, ITEM_MANA) then
		set data = LoadInteger(HT_Item, itemId, ITEM_MANA)
		call UnitAddMaxMana(whichUnit, data)
	endif
endfunction

function ReduceUnitItemState takes unit whichUnit, integer itemId returns nothing
	local real data = 0
	call UnitReduceAttribute(whichUnit, itemId)
	if HaveSavedInteger(HT_Item, itemId, ITEM_DAMAGE) then
		set data = LoadInteger(HT_Item, itemId, ITEM_DAMAGE)
		call UnitReduceDamageBonus(whichUnit, data)
	endif
	if HaveSavedReal(HT_Item, itemId, ITEM_ARMOR) then
		set data = LoadReal(HT_Item, itemId, ITEM_ARMOR)
		call UnitReduceArmorBonus(whichUnit, data)
	endif
	if HaveSavedReal(HT_Item, itemId, ITEM_ATTACK) then
		set data = LoadReal(HT_Item, itemId, ITEM_ATTACK)
		call UnitReduceAttackSpeedBonus(whichUnit, data)
	endif
	if HaveSavedInteger(HT_Item, itemId, ITEM_LIFE) then
		set data = LoadInteger(HT_Item, itemId, ITEM_LIFE)
		call UnitReduceMaxLife(whichUnit, data)
	endif
	if HaveSavedInteger(HT_Item, itemId, ITEM_MANA) then
		set data = LoadInteger(HT_Item, itemId, ITEM_MANA)
		call UnitReduceMaxMana(whichUnit, data)
	endif
endfunction
function itemtrigger_actions takes nothing returns boolean
	local unit u = GetTriggerUnit()
	local integer itemId = GetItemTypeId(GetManipulatedItem())
	if IsUnitType(u, UNIT_TYPE_HERO) then
		if GetTriggerEventId()== EVENT_PLAYER_UNIT_PICKUP_ITEM then	//获得物品
			call AddUntiItemState(u, itemId)
		elseif GetTriggerEventId()== EVENT_PLAYER_UNIT_DROP_ITEM then	//丢弃物品
			call ReduceUnitItemState(u, itemId)
		elseif GetTriggerEventId()== EVENT_PLAYER_UNIT_PAWN_ITEM then	//抵押物品
			
		endif
	endif
	set u = null
	return false
endfunction

function InitItemSystem takes nothing returns nothing
	set ItemAttrTrg = CreateTrigger()
	call TriggerRegisterPlayerUnitEventBJ(ItemAttrTrg, EVENT_PLAYER_UNIT_PICKUP_ITEM)	//获得物品
	call TriggerRegisterPlayerUnitEventBJ(ItemAttrTrg, EVENT_PLAYER_UNIT_DROP_ITEM)	//丢弃物品
	call TriggerRegisterPlayerUnitEventBJ(ItemAttrTrg, EVENT_PLAYER_UNIT_PAWN_ITEM)	//抵押物品
	call TriggerAddCondition(ItemAttrTrg, Condition(function itemtrigger_actions)) 
	
	call InitItemHeroAttribute() //初始化物品英雄三围属性
	call InitItemAttribute()    //初始化物品属性
endfunction

//任意单位受伤动作
function YDWEAnyUnitDamagedTriggerAction takes nothing returns boolean
	local integer i = 0
	loop
	exitwhen i >= DamageEventNumber
		if DamageEventQueue[i] != null and IsTriggerEnabled(DamageEventQueue[i]) then
			call TriggerEvaluate(DamageEventQueue[i])
		endif
		set i = i + 1  
	endloop
	return false
endfunction

function YDWEAnyUnitDamagedFilter takes nothing returns boolean     
	if GetUnitAbilityLevel(GetFilterUnit(), 'Aloc') <= 0 then 
		call TriggerRegisterUnitEvent(DamageEventTrigger, GetFilterUnit(), EVENT_UNIT_DAMAGED)
	endif
	return false
endfunction

function YDWEAnyUnitDamagedEnumUnit takes nothing returns nothing
	local group g = LoginGroup()
	local integer i = 0
	loop
		call GroupEnumUnitsOfPlayer(g, Player(i), Condition(function YDWEAnyUnitDamagedFilter))
		set i = i + 1
	exitwhen i >= bj_MAX_PLAYER_SLOTS
	endloop
	call LogoutGroup(g)
	set g = null
endfunction
// 将 DamageEventTrigger 移入销毁队列, 从而排泄触发器事件
function YDWESyStemAnyUnitDamagedSwap takes nothing returns nothing
	local boolean isEnabled = IsTriggerEnabled(DamageEventTrigger)
	if DamageEventTriggerToDestory != null then
		call ClearTrigger(DamageEventTriggerToDestory)
	endif
	
	set DamageEventTriggerToDestory = DamageEventTrigger
	set DamageEventTrigger = CreateTrigger()
	if not isEnabled then
		call DisableTrigger(DamageEventTrigger)
	endif
	call TriggerAddCondition(DamageEventTrigger, Condition(function YDWEAnyUnitDamagedTriggerAction)) 
	call YDWEAnyUnitDamagedEnumUnit()
endfunction
//改装了一下YDWE的任意单位受伤。
function YDWESyStemAnyUnitDamagedRegistTrigger takes nothing returns nothing
	if DamageEventNumber == 0 then
		set DamageEventTrigger = CreateTrigger()
		call TriggerAddAction(DamageEventTrigger, function YDWEAnyUnitDamagedTriggerAction) 
		call YDWEAnyUnitDamagedEnumUnit()
		call TriggerRegisterEnterRegion(CreateTrigger(), WorldRegion, Condition(function YDWEAnyUnitDamagedFilter))
		if DAMAGE_EVENT_SWAP_ENABLE then
			// 每隔 DAMAGE_EVENT_SWAP_TIMEOUT 秒, 将正在使用的 DamageEventTrigger 移入销毁队列
			call TimerStart(CreateTimer(), DAMAGE_EVENT_SWAP_TIMEOUT, true, function YDWESyStemAnyUnitDamagedSwap)
		endif
	endif
endfunction
//给触发器注册任意单位受伤事件
function TriggerRegisterAnyUnitDamagedEvent takes trigger trg returns nothing
	if trg == null then
		return
	endif
	set DamageEventQueue[DamageEventNumber] = trg
	set DamageEventNumber = DamageEventNumber + 1
endfunction

function SetWorldRegion takes nothing returns nothing
	local rect world = GetWorldBounds()
	set WorldRegion = CreateRegion()
	call RegionAddRect(WorldRegion, world)
	call RemoveRect(world)
	set world = null
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
	call SetPlayerRacePreference(Player(1), RACE_PREF_HUMAN)
	call SetPlayerRaceSelectable(Player(1), false)
	call SetPlayerController(Player(1), MAP_CONTROL_USER)
	// Player 2
	call SetPlayerStartLocation(Player(2), 2)
	call ForcePlayerStartLocation(Player(2), 2)
	call SetPlayerColor(Player(2), ConvertPlayerColor(2))
	call SetPlayerRacePreference(Player(2), RACE_PREF_HUMAN)
	call SetPlayerRaceSelectable(Player(2), false)
	call SetPlayerController(Player(2), MAP_CONTROL_COMPUTER)
	// Player 3
	call SetPlayerStartLocation(Player(3), 3)
	call ForcePlayerStartLocation(Player(3), 3)
	call SetPlayerColor(Player(3), ConvertPlayerColor(3))
	call SetPlayerRacePreference(Player(3), RACE_PREF_HUMAN)
	call SetPlayerRaceSelectable(Player(3), false)
	call SetPlayerController(Player(3), MAP_CONTROL_COMPUTER)
	// Player 4
	call SetPlayerStartLocation(Player(4), 4)
	call ForcePlayerStartLocation(Player(4), 4)
	call SetPlayerColor(Player(4), ConvertPlayerColor(4))
	call SetPlayerRacePreference(Player(4), RACE_PREF_HUMAN)
	call SetPlayerRaceSelectable(Player(4), false)
	call SetPlayerController(Player(4), MAP_CONTROL_COMPUTER)
	// Player 5
	call SetPlayerStartLocation(Player(5), 5)
	call ForcePlayerStartLocation(Player(5), 5)
	call SetPlayerColor(Player(5), ConvertPlayerColor(5))
	call SetPlayerRacePreference(Player(5), RACE_PREF_HUMAN)
	call SetPlayerRaceSelectable(Player(5), false)
	call SetPlayerController(Player(5), MAP_CONTROL_COMPUTER)
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
	// Force: TRIGSTR_024
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
	// Force: TRIGSTR_025
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
	call SetStartLocPrioCount(0, 1)
	call SetStartLocPrio(0, 0, 1, MAP_LOC_PRIO_HIGH)
	call SetStartLocPrioCount(1, 1)
	call SetStartLocPrio(1, 0, 0, MAP_LOC_PRIO_HIGH)
	call SetStartLocPrioCount(2, 1)
	call SetStartLocPrio(2, 0, 1, MAP_LOC_PRIO_HIGH)
	call SetStartLocPrioCount(3, 6)
	call SetStartLocPrio(3, 0, 1, MAP_LOC_PRIO_HIGH)
	call SetStartLocPrio(3, 1, 2, MAP_LOC_PRIO_HIGH)
	call SetStartLocPrio(3, 2, 4, MAP_LOC_PRIO_HIGH)
	call SetStartLocPrio(3, 3, 5, MAP_LOC_PRIO_HIGH)
	call SetStartLocPrio(3, 4, 6, MAP_LOC_PRIO_HIGH)
	call SetStartLocPrio(3, 5, 7, MAP_LOC_PRIO_HIGH)
	call SetStartLocPrioCount(4, 6)
	call SetStartLocPrio(4, 0, 1, MAP_LOC_PRIO_HIGH)
	call SetStartLocPrio(4, 1, 2, MAP_LOC_PRIO_HIGH)
	call SetStartLocPrio(4, 2, 3, MAP_LOC_PRIO_HIGH)
	call SetStartLocPrio(4, 3, 5, MAP_LOC_PRIO_HIGH)
	call SetStartLocPrio(4, 4, 6, MAP_LOC_PRIO_HIGH)
	call SetStartLocPrio(4, 5, 7, MAP_LOC_PRIO_HIGH)
	call SetStartLocPrioCount(5, 6)
	call SetStartLocPrio(5, 0, 1, MAP_LOC_PRIO_HIGH)
	call SetStartLocPrio(5, 1, 2, MAP_LOC_PRIO_HIGH)
	call SetStartLocPrio(5, 2, 3, MAP_LOC_PRIO_HIGH)
	call SetStartLocPrio(5, 3, 4, MAP_LOC_PRIO_HIGH)
	call SetStartLocPrio(5, 4, 6, MAP_LOC_PRIO_HIGH)
	call SetStartLocPrio(5, 5, 7, MAP_LOC_PRIO_HIGH)
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
	local trigger trg
	call SetCameraBounds(-28416.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), -28544.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 18176.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 18048.0 - GetCameraMargin(CAMERA_MARGIN_TOP), -28416.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 18048.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 18176.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), -28544.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
	call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
	call NewSoundEnvironment("Default")
	call SetAmbientDaySound("SunkenRuinsDay")
	call SetAmbientNightSound("SunkenRuinsNight")
	call SetMapMusic("Music", true, 0)
	call InitSounds()
	call CreateRegions()
	call CreateCameras()
	call CreateAllItems()
	call CreateAllUnits()
	call InitBlizzard()
	call InitItemSystem()	//初始化物品系统
	call CreateMainGroup()	//预先创建单位组
	set LocalPlayer = GetLocalPlayer()	//本地玩家
	set GameTimer = CreateTimer()
	call TimerStart(GameTimer, 99999., false, null)	//获取游戏时间
	set trg = CreateTrigger()
	call TriggerRegisterTimerEvent(trg, 15, true)
	call TriggerAddCondition(trg, Condition(function destroytrigger_actions))
	call SetWorldRegion()
	call YDWESyStemAnyUnitDamagedRegistTrigger()
	//call InitGlobals()
endfunction
//***************************************************************************
//*
//*  Map Configuration
//*
//***************************************************************************
function config takes nothing returns nothing
	call SetMapName("基佬之岛v1.15")
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

