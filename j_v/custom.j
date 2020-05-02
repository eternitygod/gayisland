globals  
	hashtable HT=InitHashtable()
	hashtable HY=InitHashtable()
	hashtable P=InitHashtable()
	trigger AudtOM = null
endglobals

function Zzzzz takes nothing returns boolean
	return true
endfunction

//给所有玩家注册事件
function BJRT takes trigger t,playerunitevent A0X returns nothing
	local integer i=0
	loop
		call TriggerRegisterPlayerUnitEvent(t,Player(i),A0X,Condition(function Zzzzz))
		set i=i+1
	exitwhen i==16
	endloop
endfunction

//
//⑧是玩家的盟友
function IPA takes player p returns boolean
	return ((IsPlayerAlly(p, Player(0)) == false))
endfunction

function AXY takes real x1,real y1,real x2,real y2 returns real
	return bj_RADTODEG*Atan2(y2-y1,x2-x1)
endfunction

function ZAE takes real x1,real y1,real x2,real y2 returns real
	return SquareRoot(((x1-x2)*(x1-x2))+((y1-y2)*(y1-y2)))
endfunction

function EAX takes trigger t returns nothing
	call DisableTrigger(t)
endfunction

function WGE takes unit u returns boolean
	return GetUnitTypeId(u)<1 or IsUnitType(u,UNIT_TYPE_DEAD)or .405>GetWidgetLife(u)
endfunction

function A4X takes real x,real y returns boolean
	return(not(IsTerrainPathable(x,y,PATHING_TYPE_WALKABILITY)))
endfunction

function V7X takes group g returns nothing
	call GroupClear(g)
	call DestroyGroup(g)
endfunction

function HeroNumber takes integer n returns nothing
	local integer i = 0
	loop 
	exitwhen i > 9
		call SetPlayerTechMaxAllowed(Player(i), 'HERO', n)
		set i = i + 1
	endloop
endfunction

function GDS takes string gs returns nothing
	local integer i = 0
	loop
	exitwhen i > 9
		call DisplayTextToPlayer(Player(i),0.00,0.00,gs)
		set i = i + 1
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
	local integer i = 0
	local unit u
	loop
	exitwhen i > 10
		set u = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), 'osp4', -25216.00, -24544.00, 0.00)
		call IssueTargetOrder(u, "attack", udg_Dummy[4])
		set i = i + 1
	endloop
	set u=null
endfunction
//非魔免，敌对，生命值大于零
function BoosG1 takes nothing returns boolean
	return (((IsUnitType(GetFilterUnit(), UNIT_TYPE_MAGIC_IMMUNE) == false) and ((IsUnitEnemy(GetFilterUnit(), Player(10)) == true) and ((GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0.00) == true))))
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
	if DT==0 or D<0 then
		return
	endif
	if DT==1 then
		call UnitDamageTarget(u,wu,D,true,true,ATTACK_TYPE_NORMAL,DAMAGE_TYPE_FIRE,WEAPON_TYPE_WHOKNOWS)
	elseif DT==2 then
		call UnitDamageTarget(u,wu,D,true,true,ATTACK_TYPE_HERO,DAMAGE_TYPE_NORMAL,WEAPON_TYPE_WHOKNOWS)
	elseif DT==3 then
		call UnitDamageTarget(u,wu,D,true,true,ATTACK_TYPE_HERO,DAMAGE_TYPE_MAGIC,WEAPON_TYPE_WHOKNOWS)
	elseif DT==4 then
		call UnitDamageTarget(u,wu,D,true,true,ATTACK_TYPE_PIERCE,DAMAGE_TYPE_NORMAL,WEAPON_TYPE_WHOKNOWS)
	elseif DT==5 then
		call UnitDamageTarget(u,wu,D,true,true,ATTACK_TYPE_NORMAL,DAMAGE_TYPE_NORMAL,WEAPON_TYPE_WHOKNOWS)
	elseif DT==6 then
		call UnitDamageTarget(u,wu,D,true,true,ATTACK_TYPE_HERO,DAMAGE_TYPE_UNIVERSAL,WEAPON_TYPE_WHOKNOWS)
	elseif DT==7 then
		call UnitDamageTarget(u,wu,D,true,true,ATTACK_TYPE_HERO,DAMAGE_TYPE_ENHANCED,WEAPON_TYPE_WHOKNOWS)
	elseif DT==8 then
		call UnitDamageTarget(u,wu,D,true,true,ATTACK_TYPE_NORMAL,DAMAGE_TYPE_UNIVERSAL,WEAPON_TYPE_WHOKNOWS)
	endif
endfunction

function ESE takes nothing returns boolean
	local integer i = GetSpellAbilityId()
	if LoadStr(P,i,0) != null then
		call ExecuteFunc(LoadStr(P,i,0))
		call BJDebugMsg("运行"+(LoadStr(P,i,0)))
	endif
	return false
endfunction

function HAB takes nothing returns nothing
	call SaveStr(P,'AomE',0,"SEOME")
	call SaveStr(P,'ASlc',0,"charge")
endfunction

function EPUS takes nothing returns boolean
	if ((GetUnitTypeId(GetSoldUnit()) == 'Oomg')) then
		call ExecuteFunc("OgreMagi")
	endif
	
	return false
endfunction

function STAB takes nothing returns nothing
	local trigger t
	set t = CreateTrigger()
	call BJRT(t,EVENT_PLAYER_UNIT_SPELL_EFFECT)
	call TriggerAddCondition(t,Condition(function ESE))
	set t = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ( t, EVENT_PLAYER_UNIT_SELL )
	call TriggerAddCondition(t,Condition(function EPUS))
	//set t = CreateTrigger()
	call DoNothing()
	set t = null
endfunction


//菊花击败boos
function JuHuaNiuBi takes real x1, real y1 ,integer Id ,real x2, real y2 returns nothing
	local unit u
	local unit du = CreateUnit(Player(10),Id,x2,y2,200.00)
	set u = udg_Dummy[0]
	call ShowUnit( u, true )
	call PanCameraToTimedWithZ( x1, y1, 0, 0 )
	call UnitAddAbility(u,'AomC')
	call SetUnitPosition(u,x1,y1)
	call IssueTargetOrder( u, "attack", du )
	set bj_lastCreatedUnit = du
    set du = null
	set u = null
endfunction

