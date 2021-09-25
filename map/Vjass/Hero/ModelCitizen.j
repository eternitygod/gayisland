
function TaxStealerAddGold takes unit taxStealer, integer addGold returns nothing
	local string gold
	set TaxStealerGoldAmount = TaxStealerGoldAmount + addGold
	set gold = I2S(TaxStealerGoldAmount)
	call DzFrameSetText(TaxStealerGoldFrameText, gold)
	call DzFrameSetText(TaxStealerGoldTipTextTitle, "黄金： " + gold)
	if TaxStealerGoldAmount < 0 then
		call UnitAddPermanentAbility(taxStealer, 'Ab11')
		call UnitRemoveAbility(taxStealer, 'Ats5')
		call UnitRemoveAbility(taxStealer, 'Ats0')
	elseif GetUnitAbilityLevel(taxStealer , 'Ab11') == 1 then
		call UnitAddPermanentAbility(taxStealer, 'Ats5')
		call UnitAddPermanentAbility(taxStealer, 'Ats0')
		call UnitRemoveAbility(taxStealer, 'Ab11')
		call UnitRemoveAbility(taxStealer, 'B011')
	endif
endfunction

function Shinyboy takes nothing returns nothing
	local integer gold = IMinBJ(TaxStealerGoldAmount, 300)
	local unit spellUnit = M_GetSpellAbilityUnit()
	
	call TaxStealerAddGold(spellUnit, - gold)
	call DamageUnit(spellUnit, M_GetSpellAbilityUnit(), 1, gold)
	set spellUnit = null
endfunction


function Transmute takes nothing returns nothing
	local unit spellUnit = M_GetSpellAbilityUnit()
	local unit targetUnit = M_GetSpellAbilityUnit()
	local integer level = M_GetSpellAbilityLevel()
	local integer addGold = 40 + level * 20
	if TaxStealerGoldAmount >= 0 then
		if GetUnitAbilityLevel(targetUnit, 'AHer') == 0 then
			call DamageUnit(spellUnit, targetUnit, 3, 99999)
		else
			call M_UnitSetStun(targetUnit, 2., 2., false)
		endif
	endif
	call DestroyEffect(AddSpecialEffect("Abilities\\Spells\\Other\\Transmute\\PileofGold.mdl", GetUnitX(targetUnit), GetUnitY(targetUnit)))
	call TaxStealerAddGold(spellUnit, addGold)
	call GoldTextTag(GetOwningPlayer(spellUnit), targetUnit, addGold)
	set targetUnit = null
	set spellUnit = null
endfunction

function WeMediaDeath takes nothing returns nothing
	local trigger trig = GetTriggeringTrigger()
	local integer iHandleId = GetHandleId(trig)
	local unit boomUnit = LoadUnitHandle(HT, iHandleId, 0)
	local integer level = LoadInteger(HT, iHandleId, 0)
	local group targetGroup = LoginGroup()
	local unit firstUnit
	local real damage = 100 + 50 * level
	local real unitX = GetUnitX(boomUnit)
	local real unitY = GetUnitY(boomUnit)

	local string effectPath = "Objects\\Spawnmodels\\Other\\NeutralBuildingExplosion\\NeutralBuildingExplosion.mdl"
	call DestroyEffect(AddSpecialEffect(effectPath, unitX, unitY))

	call KillDestructablesInCircle(unitX, unitY, 350)

	call GroupEnumUnitsInRange(targetGroup, unitX, unitY, 350, null)
	set P2 = GetOwningPlayer(boomUnit)
	loop
		set firstUnit = FirstOfGroup(targetGroup)
		exitwhen firstUnit == null
		if Enemy_Alive_NotFly(firstUnit) then

			call DamageUnit(boomUnit, firstUnit, 3, damage)

		endif
		call GroupRemoveUnit(targetGroup, firstUnit)
	endloop

	//call RemoveUnit(boomUnit)

	set firstUnit = null
	call LogoutGroup(targetGroup)
	set targetGroup = null

	call FlushChildHashtable(HT, iHandleId)
	call ClearTrigger(trig)

	set boomUnit = null
	set trig = null
endfunction

function WeMedia takes nothing returns nothing
	local unit spellUnit = M_GetSpellAbilityUnit()
	local integer level = M_GetSpellAbilityLevel()
	local real face = GetUnitFacing(spellUnit)
	local real unitX = GetUnitX(spellUnit) + 150 * Cos(face * bj_DEGTORAD)
	local real unitY = GetUnitY(spellUnit) + 150 * Sin(face * bj_DEGTORAD)

	local unit media = CreateUnit(GetOwningPlayer(spellUnit), 'nvil', unitX, unitY, face)
	local trigger trig = CreateTrigger()
	local integer iHandleId = GetHandleId(trig)

	call TaxStealerAddGold( spellUnit, - 100)

	call SetUnitExploded(media, true)
	call IssueImmediateOrderById(media, Order_Taunt)

	call UnitApplyTimedLife(media, 'BTLF', 5)
	call TriggerRegisterDeathEvent(trig, media)
	call TriggerAddCondition( trig, Condition( function WeMediaDeath))
	call SaveUnitHandle(HT, iHandleId, 0, media)
	call SaveInteger(HT, iHandleId, 0, level)

	set trig = null
	set media = null
	set spellUnit = null
endfunction

//宏大叙事
function GrandNarrative takes nothing returns nothing
	local unit spellUnit = M_GetSpellAbilityUnit()
	local integer addGold = 100 + M_GetSpellAbilityLevel() * 100
	call DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\Transmute\\PileofGold.mdl", spellUnit, "origin"))
	call TaxStealerAddGold(spellUnit, addGold)
	call GoldTextTag(GetOwningPlayer(spellUnit), spellUnit, addGold)
	set spellUnit = null
endfunction

globals
	
	//TaxStealer Gold UI
	integer TaxStealerGoldAmount = 0
	integer TaxStealerResourceBarFrame
	integer TaxStealerGoldFrameText
	integer TaxStealerGoldTipBoxedFrame
	integer TaxStealerGoldTipTextTitle
endglobals



function CreateTaxStealerGoldBarUI takes unit taxStealerUnit returns nothing
	local integer taxStealerGoldTipFrameId
	local integer taxStealerGoldFrameIcon
	local integer taxStealerGoldTipTextValue
	set TaxStealerResourceBarFrame = DzCreateSimpleFrame("TaxStealerResourceBarFrame", ConsoleUI, 0)
	
	call DzFrameSetAbsolutePoint(TaxStealerResourceBarFrame, 4, 0.18, 0.18)
	//很奇怪 这里需要这样操作才能隐藏
	call DzFrameShow(TaxStealerResourceBarFrame, false)
	if GetOwningPlayer(taxStealerUnit) != LocalPlayer then
		call DzFrameShow(TaxStealerResourceBarFrame, true)
	endif
	
	set TaxStealerGoldFrameText = DzSimpleFontStringFindByName("TaxStealerResourceBarGoldText", 0)
	set taxStealerGoldFrameIcon = DzSimpleTextureFindByName("TaxStealerResourceBarIcon", 0)

	set TaxStealerGoldTipBoxedFrame = DzCreateFrameByTagName("BUTTON", null, GameUI, null, 0)
	call DzFrameSetPoint(TaxStealerGoldTipBoxedFrame, 6, taxStealerGoldFrameIcon, 6, 0, 0)
	call DzFrameSetPoint(TaxStealerGoldTipBoxedFrame, 2, TaxStealerGoldFrameText, 2, 0, 0)

	set taxStealerGoldTipFrameId = CreateFrameTooltip(TaxStealerGoldTipBoxedFrame, "黄金： 0", "特殊的资源类型，模范公民大部分技能与此相关。")
	set TaxStealerGoldTipTextTitle = TipsText[taxStealerGoldTipFrameId]
	set taxStealerGoldTipTextValue = UberTipsText[taxStealerGoldTipFrameId]
	call TaxStealerAddGold( taxStealerUnit, 500)
endfunction




