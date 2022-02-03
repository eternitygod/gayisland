

//非常奇怪 SimpleFrame的Show似乎是颠倒的
function UnitStateUpdateCallback takes nothing returns nothing
	local real value = 0.
	local real rateOfFire = 0.
	if not NewUnitStateUIIsEnable or LocalPlayerSelectUnit == null then
		return
	endif
	//移速
	set value = GetUnitMoveSpeed(LocalPlayerSelectUnit)
	//将移动速度UI置父控制台UI再隐藏
	if value == 0. then
		if not MoveSpeedUIVisible then
			call DzFrameSetParent(MoveSpeedFrame, ConsoleUI)
			set MoveSpeedUIVisible = true
			call DzFrameShow(MoveSpeedFrame, MoveSpeedUIVisible)
			call DzFrameSetText(MoveSpeedTextValue, null)
		endif
	else
		call DzFrameSetParent(MoveSpeedFrame, SimpleInfoPanelIconArmor2)
		call DzFrameSetText(MoveSpeedTextValue, I2S(R2I(value)))
		if MoveSpeedUIVisible then
			set MoveSpeedUIVisible = false
			call DzFrameShow(MoveSpeedFrame, MoveSpeedUIVisible)
		endif
	endif

	//当前攻击速度
	set rateOfFire = GetUnitState(LocalPlayerSelectUnit, UNIT_STATE_RATE_OF_FIRE)
	//如果没有攻速,说明两个攻击类型都没有
	if rateOfFire == 0. then
		if not AttackSpeed1UIVisible then
			set AttackSpeed1UIVisible = true
			call DzFrameShow(AttackSpeed1Frame, AttackSpeed1UIVisible)
			call DzFrameSetText(AttackSpeed1TextValue, null)
		endif
		if not AttackSpeed2UIVisible then
			set AttackSpeed2UIVisible = true
			call DzFrameShow(AttackSpeed2Frame, AttackSpeed2UIVisible)
			call DzFrameSetText(AttackSpeed2TextValue, null)
		endif
		return 
	endif

	//攻击方式1
	set value = GetUnitState(LocalPlayerSelectUnit, UNIT_STATE_ATTACK1_INTERVAL)
	//被除数不能为0 所以在下面再计算
	if value == 0. then
		if not AttackSpeed1UIVisible then
			set AttackSpeed1UIVisible = true
			call DzFrameShow(AttackSpeed1Frame, AttackSpeed1UIVisible)
			call DzFrameSetText(AttackSpeed1TextValue, null)
		endif
	else
		//最高攻击速度为 5.
		set value = value / RMinBJ(5., rateOfFire)
		call DzFrameSetText(AttackSpeed1TextValue, R2SW(value, 0, 2))
		if AttackSpeed1UIVisible then
			set AttackSpeed1UIVisible = false
			call DzFrameShow(AttackSpeed1Frame, AttackSpeed1UIVisible)
		endif
	endif

	//英雄单位不必显示攻击方式2
	//if GetUnitAbilityLevel(LocalPlayerSelectUnit, 'AHer') == 0 then
	//攻击方式2
	set value = GetUnitState(LocalPlayerSelectUnit, UNIT_STATE_ATTACK2_INTERVAL)
	if value == 0. then
		if not AttackSpeed2UIVisible then
			set AttackSpeed2UIVisible = true
			call DzFrameShow(AttackSpeed2Frame, AttackSpeed2UIVisible)
			call DzFrameSetText(AttackSpeed2TextValue, null)
		endif
	else
		//最高攻击速度为 5.
		set value = value / RMinBJ(5., rateOfFire)
		call DzFrameSetText(AttackSpeed2TextValue, R2SW(value, 0, 2))
		if AttackSpeed2UIVisible then
			set AttackSpeed2UIVisible = false
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

	set NewUnitStateUIIsEnable = enable
	set index = 0

	//call Debug("log", I2S(GetLocalizedHotkey("QuickSave")))
	loop

		set backDropFrame = DzSimpleTextureFindByName("InfoPanelIconBackdrop", index)
		set lableFrame = DzSimpleFontStringFindByName("InfoPanelIconLabel", index)
		set valueFrame = DzSimpleFontStringFindByName("InfoPanelIconValue", index)
		set levelFrame = DzSimpleFontStringFindByName("InfoPanelIconLevel", index)
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
		set index = index + 1
	endloop

	//需要更改UI的父窗口再隐藏他们。
	//if LocalPlayerSelectUnit == null then
	if enable then

		//如果已经被置父为控制台，那么要更改回去。
		if DzFrameGetParent(AttackSpeed1Frame) == ConsoleUI then
			set whichFrame = DzSimpleFrameFindByName("SimpleInfoPanelIconDamage", 0)
			call DzFrameSetParent(AttackSpeed1Frame, whichFrame)
			set whichFrame = DzSimpleFrameFindByName("SimpleInfoPanelIconDamage", 1)
			call DzFrameSetParent(AttackSpeed2Frame, whichFrame)
			set whichFrame = DzSimpleFrameFindByName("SimpleInfoPanelIconArmor", 2)
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

	set whichFrame = DzSimpleFrameFindByName("SimpleInfoPanelIconDamage", 0)

	if enable then
		call DzFrameSetAbsolutePoint(whichFrame, 4, 0.363, 0.062)
	else
		call DzFrameSetAbsolutePoint(whichFrame, 4, 0.357, 0.067)
	endif



	//很奇怪 这里要反着来才行
	//似乎SimpleFrame都需要先隐藏再显示,然后反着填enable.
	set enable = not enable
	call DzFrameShow(MoveSpeedFrame, enable)
	set MoveSpeedUIVisible = enable
	call DzFrameShow(AttackSpeed1Frame, enable)
	set AttackSpeed1UIVisible = enable
	call DzFrameShow(AttackSpeed2Frame, enable)
	set AttackSpeed2UIVisible = enable

endfunction


//攻击方式1 - 0, 攻击方式2 - 1, 护甲 - 2, 魔法升级 - 3, 食物 - 4
function CreateUnitStateFrame takes nothing returns nothing
	local integer whichFrame
	local integer parentFrame 

	set SimpleInfoPanelIconArmor2 = DzSimpleFrameFindByName("SimpleInfoPanelIconArmor", 2)
	set MoveSpeedFrame = DzCreateSimpleFrame("SimpleInfoPanelIconMoveSpeed", SimpleInfoPanelIconArmor2, 0)
	set MoveSpeedTextValue = DzSimpleFontStringFindByName("InfoPanelMoveSpeedIconValue", 0)

	set parentFrame = DzSimpleFrameFindByName("SimpleInfoPanelIconDamage", 0)
	set AttackSpeed1Frame = DzCreateSimpleFrame("SimpleInfoPanelIconAttackSpeed", parentFrame, 0)
	set AttackSpeed1TextValue = DzSimpleFontStringFindByName("InfoPanelAttackSpeedIconValue", 0)

	set parentFrame = DzSimpleFrameFindByName("SimpleInfoPanelIconDamage", 1)
	set AttackSpeed2Frame = DzCreateSimpleFrame("SimpleInfoPanelIconAttackSpeed", parentFrame, 1)
	set AttackSpeed2TextValue = DzSimpleFontStringFindByName("InfoPanelAttackSpeedIconValue", 1)

	set whichFrame = DzSimpleTextureFindByName("InfoPanelIconMoveSpeedBackdrop", 0)
	call DzFrameSetSize(whichFrame, 0.02, 0.02)
	call DzFrameSetTexture(whichFrame, "UI\\Widgets\\Console\\Human\\infocard-MoveSpeed.blp", 0)

	set whichFrame = DzSimpleTextureFindByName("InfoPanelIconAttackSpeedBackdrop", 0)
	call DzFrameSetSize(whichFrame, 0.02, 0.02)
	call DzFrameSetTexture(whichFrame, "UI\\Widgets\\Console\\Human\\infocard-AttackSpeed.blp", 0)

	set whichFrame = DzSimpleTextureFindByName("InfoPanelIconAttackSpeedBackdrop", 1)
	call DzFrameSetSize(whichFrame, 0.02, 0.02)
	call DzFrameSetTexture(whichFrame, "UI\\Widgets\\Console\\Human\\infocard-AttackSpeed.blp", 0)

	set whichFrame = DzSimpleTextureFindByName("InfoPanelIconBackdrop", 0)
	call DzFrameSetPoint(AttackSpeed1Frame, 0, whichFrame, 6, - 0.0040, 0)

	set whichFrame = DzSimpleTextureFindByName("InfoPanelIconBackdrop", 1)
	call DzFrameSetPoint(AttackSpeed2Frame, 0, whichFrame, 6, - 0.0040, 0)

	set whichFrame = DzSimpleTextureFindByName("InfoPanelIconBackdrop", 2)
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


