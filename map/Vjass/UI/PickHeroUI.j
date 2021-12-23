
globals
	//选英雄的背景
	group AllHerosGroup = CreateGroup()
	integer PickHeroFrame
	integer PickHeroReturnFrame
	integer PickHeroBackDrop
	
	integer array HeroButton
	integer array HeroBackDrop
	boolean array HeroIsSelected
	
	integer array PlayerHeroAmount
	integer PlayerMaxHeroAmount = 1

	integer array StrHeroTypeId
	integer array IntHeroTypeId
	integer array AgiHeroTypeId
	integer array AllHeroTypeId


	unit array TavernUnit 	// 酒馆
	unit array PlayerHeroUnit //玩家英雄
endglobals

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

function DisableHeroUI takes integer frameId, boolean enable returns nothing
	local string artPath = GetUnitSlkData(AllHeroTypeId[frameId], "Art")
	set artPath = "ReplaceableTextures\\CommandButtonsDisabled\\DIS" + SubString(artPath, 35, StringLength(artPath))
	call DzFrameSetTexture(HeroBackDrop[frameId], artPath, 0)
	set HeroIsSelected[frameId] = true
endfunction


function InitHeroTriggerById takes unit whichUnit returns nothing
	local integer typeId = GetUnitTypeId(whichUnit)
	if typeId == 'HI04' then
		call LolitaComplex(whichUnit)
	elseif typeId == 'HA02' then
		call DeterminedExterminator(whichUnit)
		call EnabledAttackEffect(2, 0)
	elseif typeId == 'HI06' then
		call CreateTaxStealerGoldBarUI(whichUnit)
	endif
endfunction

function PickHeroSync takes nothing returns boolean
	local string syncData = DzGetTriggerSyncData()
	local player syncPlayer = DzGetTriggerSyncPlayer()
	local integer syncPlayerId = GetPlayerId(syncPlayer)
	local integer frameId = S2I(syncData)
	local integer residueDegree
	local unit newHero
	if HeroIsSelected[frameId] or PlayerHeroAmount[syncPlayerId] == PlayerMaxHeroAmount then
		return false
	endif
	if AllHeroTypeId[frameId] > 0 then

		set newHero = CreateUnit(syncPlayer, AllHeroTypeId[frameId], GetRectCenterX( udg_TavernHeroBirthRect[1] ), GetRectCenterY( udg_TavernHeroBirthRect[1] ), 90)
		if LocalPlayer == syncPlayer then
			call SelectUnit(newHero, true)
		endif
		call InitHeroTriggerById(newHero)
		set PlayerHeroUnit[GetUnitPointValue(newHero)] = newHero
		call GroupAddUnit( AllHerosGroup, newHero )
		set newHero = null
	endif
	call DisableHeroUI(frameId, true)
	set PlayerHeroAmount[syncPlayerId] = PlayerHeroAmount[syncPlayerId] + 1
	set residueDegree = PlayerMaxHeroAmount - PlayerHeroAmount[syncPlayerId]
	if ( residueDegree ) > 0 then
		call DisplayTextToPlayer(syncPlayer, 0, 0, "你还能选择" + I2S( residueDegree )+ "个英雄")
	endif
	set syncPlayer = null
	return false
endfunction

function ClickHeroButton takes nothing returns nothing
	local integer trigFrame = DzGetTriggerUIEventFrame()
	local integer trigPlayerId = GetPlayerId(DzGetTriggerUIEventPlayer())
	local integer i = 0
	if PlayerHeroAmount[trigPlayerId] == PlayerMaxHeroAmount then
		return
	endif
	loop
		exitwhen trigFrame == HeroButton[i]
		set i = i + 1
	endloop
	//call Debug("log", "Click" + I2S(i) + " "+ GetObjectName(HeroTypeId[i]))
	if not HeroIsSelected[i] then
		call DzSyncData("PickHero", I2S(i))
	endif
endfunction

function CreatePickHeroButton takes integer attributeId, integer frameId, integer heroTypeId, real x, real y returns nothing
	local real frameX = x + 0.05 * attributeId
	local real frameY = y
	local string heroArt = GetUnitSlkData(heroTypeId, "Art")
	local string tip = GetUnitSlkData(heroTypeId, "Tip")
	local string ubertip = GetUnitSlkData(heroTypeId, "UberTip")
	if heroArt == null then
		call Debug("log", "error, HeroArt=null id:" + I2S(attributeId))
	endif
	call Debug("log", "frameId=" + I2S(frameId))
	if frameId == 7 then 
		//搞不明白为什么第八个创建的button设置ToolTip会失败
		//如果这里不删除新建一个Button,这个新建的Button在SetToolTIp时会导致游戏崩溃
		call DzDestroyFrame(DzCreateFrameByTagName("GLUETEXTBUTTON", null, PickHeroBackDrop, null, 0))
	elseif frameId == 8 then 
		//搞不明白为什么第八个创建的button设置ToolTip会失败
		//如果这里不删除新建一个Button,这个新建的Button在SetToolTIp时会导致游戏崩溃
		call DzDestroyFrame(DzCreateFrameByTagName("BUTTON", null, PickHeroBackDrop, null, 0))
	endif
	set AllHeroTypeId[frameId] = heroTypeId
	set HeroBackDrop[frameId] = DzCreateFrameByTagName("BACKDROP", null, PickHeroBackDrop, null, 0)
	call DzFrameSetTexture(HeroBackDrop[frameId], heroArt, 0)
	call DzFrameSetAbsolutePoint(HeroBackDrop[frameId], 4, frameX, frameY)
	call DzFrameSetSize(HeroBackDrop[frameId], 0.038, 0.038)
	set HeroButton[frameId] = DzCreateFrameByTagName("BUTTON", null, HeroBackDrop[frameId], null, 0)
	call DzFrameSetScriptByCode(HeroButton[frameId], 1, function ClickHeroButton, false)
	call DzFrameSetAbsolutePoint(HeroButton[frameId], 4, frameX, frameY)
	call DzFrameSetSize(HeroButton[frameId], 0.038, 0.038)

	call CreateFrameTooltip(HeroButton[frameId], tip, ubertip)
endfunction


function InitPickHerosUI takes nothing returns nothing
	local real frameX
	local real frameY
	local integer attributeId = 1
	local integer heroCount = 1
	local trigger syncTrig = CreateTrigger()
	call DzTriggerRegisterSyncData(syncTrig, "PickHero", false)
	call TriggerAddCondition(syncTrig, Condition( function PickHeroSync))
	
	set PickHeroBackDrop = DzCreateFrameByTagName("BACKDROP", null, GameUI, "EscMenuBackdrop",0)
	call DzFrameSetPoint( PickHeroBackDrop, 4, GameUI, 4, 0, 0.06 )
	call DzFrameSetSize( PickHeroBackDrop, 0.58, 0.384)
	call DzFrameShow(PickHeroBackDrop, false)
	set PickHeroReturnFrame = DzCreateFrame("PuckHeroReturnButtonFrame", PickHeroBackDrop, 0)
	call DzFrameShow(PickHeroReturnFrame , false)
	call DzFrameShow(PickHeroReturnFrame , true)
	call DzFrameSetScriptByCode(DzFrameFindByName("PuckHeroReturnGlueTextButton", 0), 1, function ClickReturnButton, false)
	call DzFrameSetAbsolutePoint(PickHeroReturnFrame, 4, 0.42, 0.15)

	set frameX = 0.14
	set frameY = 0.47
	loop
		exitwhen StrHeroTypeId[attributeId] == 0
		call CreatePickHeroButton(attributeId, heroCount, StrHeroTypeId[attributeId], frameX, frameY)
		set attributeId = attributeId + 1
		set heroCount = attributeId
	endloop
	set frameX = 0.14
	set frameY = 0.37
	set attributeId = 1
	loop
		exitwhen AgiHeroTypeId[attributeId] == 0
		call CreatePickHeroButton(attributeId, heroCount, AgiHeroTypeId[attributeId], frameX, frameY)
		set attributeId = attributeId + 1
		set heroCount = heroCount + 1
	endloop
	set frameX = 0.14
	set frameY = 0.27
	set attributeId = 1
	loop
		exitwhen IntHeroTypeId[attributeId] == 0
		call CreatePickHeroButton(attributeId, heroCount, IntHeroTypeId[attributeId], frameX, frameY)
		set attributeId = attributeId + 1
		set heroCount = heroCount + 1
	endloop

	set PickHeroFrame = DzCreateSimpleFrame("PickHeroButtonTemplate", ConsoleUI, 0)
	call DzFrameSetAbsolutePoint(PickHeroFrame, 4, 0.42, 0.15)
	call DzFrameShow(PickHeroFrame , false)
	call DzFrameShow(PickHeroFrame , true)
	call DzFrameSetSize(PickHeroFrame, 0.13, 0.035)
	call DzFrameSetScriptByCode(PickHeroFrame, 1, function ClickPickHeroButton, false)

endfunction


