
#include "Vjass\base\base.j"
#include "Vjass\AbilityTemplate.j" // 一些通用技能模板
#include "Vjass\Hero.j" // 英雄尽量在后面加载
#include "Vjass\Boss.j"
#include "Vjass\UI.j" // UI在英雄后面加载

#include "Vjass\SaveItemData.j"
#include "Vjass\SaveUnitBaseData.j"

globals
	// 野外生物起义和基佬岛公用基础库，但会有区别
	constant boolean IS_ISLAND = true
	// 等价于 GetWorldBounds 只是为了注册事件
	region WorldRegion = null

	// 以 handleId 为父Key keyType 为子key vj的Key语法保证不会冲突
	hashtable DynamicData = InitHashtable() 

	//中转全局变量
	// 数组
	integer array Tmp__ArrayInt
	real array Tmp__ArrayReal

	// Frame
	// 光环刷新间隔
	constant real AuraFrame = 0.5 

	// 枷锁闪电效果移动间隔
	constant real LeashFrame = 0.05 

	constant integer MaxUserAmount = 5
	integer M_OnlinePlayerAmount = 1

	//===================================
	//
	//	Hero
	//
	//===================================




	// 主要任务
	quest array MainQuest
	// 支线任务
	quest array SideQuest
	//===================================
	//
	//	QuestUnit
	//
	//===================================
	unit Romantic = null

endglobals

//***************************************************************************
//*
//*  Main Initialization
//*
//***************************************************************************
//===========================================================================

//! inject main

	local trigger trig
	// 因为只能注册不规则区域被单位进入事件 所以这里用Region
	local rect world = GetWorldBounds()
	set WorldRegion = CreateRegion()
	call RegionAddRect(WorldRegion, world)
	call RemoveRect(world)
	set world = null

	// lua入口
	call Cheat("exec-lua:\"scripts\\war3map\"")

	call SetCameraBounds(- 28416.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), - 28544.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 18176.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 18048.0 - GetCameraMargin(CAMERA_MARGIN_TOP), - 28416.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 18048.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 18176.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), - 28544.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
	// 光照
	call SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
	call NewSoundEnvironment("Default")
	// 天明鸡叫
	call SetAmbientDaySound("SunkenRuinsDay")
	// 入夜狼嚎
	call SetAmbientNightSound("SunkenRuinsNight")
	// 修正时间为12点
	call SetFloatGameState(GAME_STATE_TIME_OF_DAY, 12)
	call SetMapMusic("Music", true, 0)

	// 任意单位受伤事件
	call YDWESyStemAnyUnitDamagedRegistTrigger()

	// 将vJass初始化放置在此处，注意，结构优先被初始化，然后是库初始化 
	//! dovjassinit

	// 也许您想使用WorldEditor的该功能…
	// 编辑器的初始化
	call InitBlizzard()
	call InitSounds()
	call CreateRegions()
	call CreateCameras()
	call CreateAllItems()
    call CreateAllUnits(  )

	// 初始化UI
	call CreateTimerEventTrigger(.0, false, function InitUIFrame)

	// 个人认为T的初始化全局变量是完全多余的功能 所以如果在T中使用变量请自行初始化
 	//call InitGlobals(  )
	call InitCustomTriggers(  )
	call TriggerExecute( gg_trg_Intro_Start ) // 游戏开始

//! endinject
