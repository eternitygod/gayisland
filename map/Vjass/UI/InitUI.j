
globals
	//ui的frame
	integer GameUI
	//控制台UI
	integer ConsoleUI
endglobals

globals
	unit LocalPlayerSelectUnit = null
	integer UpdateCallbackCount = 0
	//移动速度的Frame
	integer SimpleInfoPanelIconArmor2
	integer MoveSpeedFrame
	integer MoveSpeedTextValue
	
	integer AttackSpeed1Frame
	integer AttackSpeed1TextValue
	
	integer AttackSpeed2Frame
	integer AttackSpeed2TextValue
	
	//这些布尔是异步使用的，不要在会同步的地方使用。
	boolean NewUnitStateUIIsEnable = false
	boolean MoveSpeedUIVisible = false
	boolean AttackSpeed1UIVisible = false
	boolean AttackSpeed2UIVisible = false
endglobals


//每帧回调函数 切换选择单位时立即刷新, 否则是30次回调刷新一次
function Update_Callback takes nothing returns nothing

	local unit selectUnit = GetDetectedUnit()
	set UpdateCallbackCount = UpdateCallbackCount + 1
	if LocalPlayerSelectUnit != selectUnit then
		set LocalPlayerSelectUnit = selectUnit
		call UnitStateUpdateCallback()
	elseif UpdateCallbackCount > 30 then
		set UpdateCallbackCount = 0
		call UnitStateUpdateCallback()
	endif
	set selectUnit = null
	
endfunction

library UITips
	
	globals
		integer TipsFrameMaxAmount = 0
		integer array TipsBackDrop
		integer array TipsText
		integer array UberTipsText
	endglobals

	//创建提示信息
	function CreateFrameTooltip takes integer frame, string tip, string ubertip returns integer
		set TipsFrameMaxAmount = TipsFrameMaxAmount + 1
		set TipsBackDrop[TipsFrameMaxAmount] = DzCreateFrameByTagName("BACKDROP", null, GameUI, "TooltipBackDrop", 0)
		set TipsText[TipsFrameMaxAmount] = DzCreateFrameByTagName("TEXT", null, TipsBackDrop[TipsFrameMaxAmount], "TipText", 0)
		set UberTipsText[TipsFrameMaxAmount] = DzCreateFrameByTagName("TEXT", null, TipsBackDrop[TipsFrameMaxAmount], "TipText", 0)
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

endlibrary

scope SetHeroVariable initializer SetHeroVariable

	function SetHeroVariable takes nothing returns nothing
		set StrHeroTypeId[1] = 'HS01'
		set StrHeroTypeId[2] = 'HS02'
		set StrHeroTypeId[3] = 'HS03'
		set StrHeroTypeId[4] = 'HS04'
	
		set AgiHeroTypeId[1] = 'HA01'
		set AgiHeroTypeId[2] = 'HA02'
		
		set IntHeroTypeId[1] = 'HI01'
		set IntHeroTypeId[2] = 'HI02'
		set IntHeroTypeId[3] = 'HI03'
		set IntHeroTypeId[4] = 'HI04'
		set IntHeroTypeId[5] = 'HI05'
		set IntHeroTypeId[6] = 'HI06'
	endfunction

endscope

function SetInit__GameEndFrame takes nothing returns nothing
	
endfunction

//! import "UI\PickHeroUI.j"

function InitUIFrame takes nothing returns boolean
	local integer i = 0
	local integer da
	local integer db
	call DzLoadToc("UI\\path.toc")
	set GameUI = DzGetGameUI()
	set ConsoleUI = DzSimpleFrameFindByName("ConsoleUI", 0)
	
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
	call DzFrameSetUpdateCallbackByCode( function Update_Callback)
	call DzFrameSetScriptByCode(DzFrameFindByName("QuitButton",0), 1,function SetInit__GameEndFrame,false)
	call ClearTrigger(GetTriggeringTrigger())
	return false
endfunction


