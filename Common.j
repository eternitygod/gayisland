globals  //call CreateQuestBJ
	unit array Elevator 
	hashtable HT=InitHashtable()
	hashtable HY=InitHashtable()
	hashtable P=InitHashtable()
	hashtable Item=InitHashtable()
	hashtable L=InitHashtable()
	hashtable HeroAbility=InitHashtable()
	hashtable Chat=InitHashtable()
	//trigger AudtOM = null
	//trigger AudtLC = null
	//trigger StormSpiritDamageTrigger = null
	unit LC = null
	boolean test = false
	sound ifes = CreateSoundFromLabel("InterfaceError",false,false,false,$A,$A)
	boolean LichSurvival = true
	constant integer IC=StringHash("color")
	
endglobals

function Zzzzz takes nothing returns boolean
	return true
endfunction

//容错机制 抄dota的
function IMX takes real x returns real
	local real dx=GetRectMinX(bj_mapInitialPlayableArea)+75
	if(x<dx)then
		return dx
	endif
	set dx=GetRectMaxX(bj_mapInitialPlayableArea)-75
	if(x>dx)then
		return dx
	endif
	return x
endfunction
function IMY takes real y returns real
	local real dy=GetRectMinY(bj_mapInitialPlayableArea)+50
	if(y<dy)then
		return dy
	endif
	set dy=GetRectMaxY(bj_mapInitialPlayableArea)-50
	if(y>dy)then
		return dy
	endif
	return y
endfunction

//漂浮文字
function FT takes string FTS,real FL,unit U,real FS,integer r,integer g,integer b,integer a, integer dt returns nothing
	local texttag tt=CreateTextTag()
	call SetTextTagText(tt,FTS,FS)
	call SetTextTagPosUnit(tt,U,dt)
	call SetTextTagColor(tt,r,g,b,a)
	call SetTextTagVelocity(tt,0,.0355)
	call SetTextTagFadepoint(tt,2)
	call SetTextTagPermanent(tt,false)
	call SetTextTagLifespan(tt,FL)
	//call SetTextTagVisibility(tt,TYV(U,GetLocalPlayer())or RBX(GetLocalPlayer()))
	set tt=null
endfunction

//给所有玩家注册事件
function BJRT takes trigger t,playerunitevent prie returns nothing
	local integer i=0
	loop
		call TriggerRegisterPlayerUnitEvent(t,Player(i),prie,Condition(function Zzzzz))
		set i=i+1
	exitwhen i==16
	endloop
endfunction

//得到XY之间的角度
function AngleBetweenXY takes real x1,real y1, real x2, real y2 returns real
	return bj_RADTODEG * Atan2(y2 - y1, x2 - x1)
endfunction

//单位之间的角度
function AngleBetweenUnit takes unit u1, unit u2 returns real
	return bj_RADTODEG * Atan2(GetUnitY(u2) - GetUnitY(u1), GetUnitX(u2) - GetUnitX(u1))
endfunction

//
//⑧是玩家的盟友
function IPA takes player p returns boolean
	return ((IsPlayerAlly(p, Player(0)) == false))
endfunction

function AXY takes real x1,real y1,real x2,real y2 returns real
	return bj_RADTODEG*Atan2(y2-y1,x2-x1)
endfunction
//xy距离
function XYDistance takes real x1,real y1,real x2,real y2 returns real
	return SquareRoot(((x1-x2)*(x1-x2))+((y1-y2)*(y1-y2)))
endfunction

//改变单位RGB和透明度
function ChangeRGBA takes unit u,integer r,integer g,integer b,integer a returns nothing
	local integer UTYE=GetUnitTypeId(u)
	local integer h=GetHandleId(u)
	if r==-1 then
		if HaveSavedInteger(P,h,IC+0)then
			set r=LoadInteger(P,h,IC+0)
		elseif HaveSavedInteger(L,UTYE,0)then
			set r=LoadInteger(L,UTYE,0)
		else
			set r=$FF
		endif
	endif
	if g==-1 then
		if HaveSavedInteger(P,h,IC+1)then
			set g=LoadInteger(P,h,IC+1)
		elseif HaveSavedInteger(L,UTYE,1)then
			set g=LoadInteger(L,UTYE,1)
		else
			set g=$FF
		endif
	endif
	if b==-1 then
		if HaveSavedInteger(P,h,IC+2)then
			set b=LoadInteger(P,h,IC+2)
		elseif HaveSavedInteger(L,UTYE,2)then
			set b=LoadInteger(L,UTYE,2)
		else
			set b=$FF
		endif
	endif
	if a==-1 then
		if HaveSavedInteger(P,h,'ALPH')then
			set a=LoadInteger(P,h,'ALPH')
		else
			set a=$FF
		endif
	endif
	call SetUnitVertexColor(u,r,g,b,a)
	call SaveInteger(P,h,IC+0,r)
	call SaveInteger(P,h,IC+1,g)
	call SaveInteger(P,h,IC+2,b)
	call SaveInteger(P,h,'ALPH',a)
endfunction

function EAX takes trigger t returns nothing
	call DisableTrigger(t)
	call DestroyTrigger(t)
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


//对比大小
function ContrastSize takes integer a,integer b returns integer
	if(a<b)then
		return b
	else
		return a
	endif
endfunction
//生命值＞0且不魔免敌对 

function GeneralUnitselection takes nothing returns boolean
	return ((GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0.00) and (IsUnitEnemy(GetFilterUnit(), Player(0)) == true) and (IsUnitType(GetFilterUnit(), UNIT_TYPE_MAGIC_IMMUNE) == false))
endfunction

//非魔免，玩家10敌对，生命值大于零
function BoosG1 takes nothing returns boolean
	return (((IsUnitType(GetFilterUnit(), UNIT_TYPE_MAGIC_IMMUNE) == false) and ((IsUnitEnemy(GetFilterUnit(), Player(10)) == true) and ((GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0.00) == true))))
endfunction

//玩家10敌对，生命值大于零
function GBV1 takes nothing returns boolean
	return ((GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0.00) == true) and (IsUnitEnemy(GetFilterUnit(), Player(10)) == true)
endfunction

function GPT takes unit u,real x,real y,real F returns nothing
	call SetUnitState(u, UNIT_STATE_LIFE, 50000)
	call SetUnitState(u, UNIT_STATE_MANA, 50000)
	call SetUnitPosition(u, x, y)
	call SetUnitFacing(u, F)
	call PauseUnit(u, true)
	//call SetUnitInvulnerable(u, true)
endfunction

function GPF takes unit u returns nothing
	call PauseUnit(u, false)
	call SetUnitInvulnerable(u, false)
endfunction



//伤害类型文字提示
function Damagetypestr takes integer DT returns string
	local string s
	if DT==0 then
		set s = ("未知_未知伤害")
	endif
	if DT==1 then   //法术,火焰伤害
		set s = ("法术_火焰伤害")
	elseif DT==2 then //英雄,普通伤害
		set s = ("英雄_普通伤害")
	elseif DT==3 then //英雄,魔法伤害
		set s = ("英雄_魔法伤害")
	elseif DT==4 then //穿刺，普通伤害
		set s = ("穿刺_普通伤害")
	elseif DT==5 then //法术，普通伤害
		set s = ("法术_普通伤害")
	elseif DT==6 then //英雄，通用伤害
		set s = ("英雄_通用伤害")
	elseif DT==7 then //英雄，加强伤害
		set s = ("英雄_加强伤害")
	elseif DT==8 then //法术，通用伤害
		set s = ("法术_通用伤害")
	endif
	return "|cffff99cc"+(s)+"|r"
endfunction

//伤害
function R8D takes unit du,unit u,integer DT,real D returns nothing
	if DT==0 or D<0 then
		return
	endif
	if DT==1 then   //法术,火焰伤害
		call UnitDamageTarget(du,u,D,true,true,ATTACK_TYPE_NORMAL,DAMAGE_TYPE_FIRE,WEAPON_TYPE_WHOKNOWS)
	elseif DT==2 then //英雄,普通伤害
		call UnitDamageTarget(du,u,D,true,true,ATTACK_TYPE_HERO,DAMAGE_TYPE_NORMAL,WEAPON_TYPE_WHOKNOWS)
	elseif DT==3 then //英雄,魔法伤害
		call UnitDamageTarget(du,u,D,true,true,ATTACK_TYPE_HERO,DAMAGE_TYPE_MAGIC,WEAPON_TYPE_WHOKNOWS)
	elseif DT==4 then //穿刺，普通伤害
		call UnitDamageTarget(du,u,D,true,true,ATTACK_TYPE_PIERCE,DAMAGE_TYPE_NORMAL,WEAPON_TYPE_WHOKNOWS)
	elseif DT==5 then //法术，普通伤害
		call UnitDamageTarget(du,u,D,true,true,ATTACK_TYPE_NORMAL,DAMAGE_TYPE_NORMAL,WEAPON_TYPE_WHOKNOWS)
	elseif DT==6 then //英雄，通用伤害
		call UnitDamageTarget(du,u,D,true,true,ATTACK_TYPE_HERO,DAMAGE_TYPE_UNIVERSAL,WEAPON_TYPE_WHOKNOWS)
	elseif DT==7 then //英雄，加强伤害
		call UnitDamageTarget(du,u,D,true,true,ATTACK_TYPE_HERO,DAMAGE_TYPE_ENHANCED,WEAPON_TYPE_WHOKNOWS)
	elseif DT==8 then //法术，通用伤害
		call UnitDamageTarget(du,u,D,true,true,ATTACK_TYPE_NORMAL,DAMAGE_TYPE_UNIVERSAL,WEAPON_TYPE_WHOKNOWS)
	endif
endfunction

//测试提示伤害
function TestTipsDamage takes unit u,unit du,integer id, real Damage,integer DamageType returns nothing
	call BJDebugMsg("|cffff6800"+GetUnitName(u)+"|r对"+"|cffff6800"+GetUnitName(du)+"|r使用|cffffcc99"+GetObjectName(id)+"|r造成|cffffffcc"+R2S(Damage)+"|r点"+Damagetypestr(DamageType))
endfunction

//测试提示
function TestTipsBuff takes unit u,unit du,integer id returns nothing
	call BJDebugMsg("|cffff6800"+GetUnitName(u)+"|r对"+"|cffff6800"+GetUnitName(du)+"|r释放|cffffcc99"+GetObjectName(id)+"Buff|r")
endfunction

function ESE takes nothing returns boolean
	local integer i = GetSpellAbilityId()
	if LoadStr(P,i,0) != null then
		call ExecuteFunc(LoadStr(P,i,0))
		//call BJDebugMsg("运行"+(LoadStr(P,i,0)))
	endif
	return false
endfunction

function EHS takes nothing returns boolean
	local integer i = GetLearnedSkill()
	if LoadStr(P,i,1) != null then
		call ExecuteFunc(LoadStr(P,i,1))
		//call BJDebugMsg("运行"+(LoadStr(P,i,1)))
	endif
	return false
endfunction

function USC takes nothing returns boolean
	local integer i = GetSpellAbilityId()
	if LoadStr(P,i,2) != null then
		call ExecuteFunc(LoadStr(P,i,2))
		//call BJDebugMsg("运行"+(LoadStr(P,i,2)))
	endif
	return false
endfunction

function USF takes nothing returns boolean
	local integer i = GetSpellAbilityId()
	if LoadStr(P,i,3) != null then
		call ExecuteFunc(LoadStr(P,i,3))
		call BJDebugMsg("运行"+(LoadStr(P,i,3)))
	endif
	return false
endfunction

function HAB takes nothing returns nothing
	//技能
	//0==发动技能效果
	//1==学习技能
	//2==开始释放技能
	//boos
	call SaveStr(P,'Aner',0,"NecRaiseSkeleton")
	//菊花
	call SaveStr(P,'AomQ',0,"OMQ")
	call SaveStr(P,'AomE',0,"SEOME")
	//call SaveStr(P,'ASlc',0,"charge")
	call SaveStr(P,'AomR',1,"OMR")
	//零重祈愿
	call SaveStr(P,'Alc1',0,"LC10")
	call SaveStr(P,'Alc1',2,"LC12")
	call SaveStr(P,'Alc2',0,"LC20")
	call SaveStr(P,'Alc2',1,"LC21")
	call SaveStr(P,'Alc4',0,"LC40")
	//蓝猫
	call SaveStr(P,'ASt1',0,"StormSpiritRemnantShadow")
	call SaveStr(P,'ASt2',0,"StormSpiritElectricVortex")
	call SaveStr(P,'ASt3',1,"SkillStormSpiritOverload")
	call SaveStr(P,'ASt4',0,"StormSpiritBallLightning")
	call SaveStr(P,'ASt4',2,"StormSpiritBallLightningCast")
	
	call SaveStr(P,'ASto',0,"StormSpiritChooseON")
	
	//斯温
	call SaveStr(P,'Svet',0,"StormBolt")
	call SaveStr(P,'Svet',2,"StormBoltEffect")
	call SaveStr(P,'Warc',0,"Warcry")

	call SaveStr(P,'Asgs',3,"SvenGodisStrength")
	
	
	//物品
	//获得
	call SaveStr(Item,'Isui',0,"OMIsuit") //菊花工具箱
	call SaveStr(Item,'Icap',0,"OMIcap") //菊花披风
	call SaveStr(Item,'mlst',0,"OMWrench") //扳手
endfunction

function SetChatEvent takes nothing returns nothing
	call SaveStr(Chat,StringHash("-Elevator"),0,"Elevatorposition")
	
endfunction

//function SetHeroAbility takes nothing returns nothing
	//call SaveInteger(HeroAbility,'Oomg','inte','AomQ')
//	call SaveInteger(HeroAbility,'Oomg',1,'AomQ')
//	call SaveInteger(HeroAbility,'Oomg',2,'AomW')
//	call SaveInteger(HeroAbility,'Oomg',3,'AomE')
	//call SaveBoolean(HeroAbility,'Oomg',4,false) //不是主动则为fasle
//	call SaveInteger(HeroAbility,'Oomg',4,'AomR')
	
	//圣骑士
//	call SaveInteger(HeroAbility,'Hart',1,'ApdQ')
//	call SaveInteger(HeroAbility,'Hart',2,'ApdW')
//	call SaveInteger(HeroAbility,'Hart',3,'ApdE')
//	call SaveInteger(HeroAbility,'Hart',4,'ApdR')
//endfunction

function EPUS takes nothing returns boolean
	if GetUnitAbilityLevel(udg_Circle[GetPlayerId(GetOwningPlayer(GetSoldUnit()))],'ACiT') == 0 then
		call DisplayTimedTextToPlayer(GetOwningPlayer(GetSoldUnit()), 0, 0, bj_TEXT_DELAY_ALWAYSHINT, " ")
		call DisplayTimedTextToPlayer(GetOwningPlayer(GetSoldUnit()), 0, 0, bj_TEXT_DELAY_ALWAYSHINT, "|cff32CD32提示|r - 在能量圈更改游戏设置来使得操作方式符合你的需求。")
		if GetOwningPlayer(GetSoldUnit()) == GetLocalPlayer() then
			call StartSound(bj_questHintSound)
		endif
		call UnitAddAbility(udg_Circle[GetPlayerId(GetOwningPlayer(GetSoldUnit()))],'ACiT')
	endif
	if((GetUnitTypeId(GetSoldUnit()) == 'Oomg')) then
		call QuestSetEnabled(MainQuest[2], true)
		set OM = GetSoldUnit()
		call ExecuteFunc("OgreMagiTrigger")
	endif
	if((GetUnitTypeId(GetSoldUnit()) == 'Hbel')) then
		
		set LC = GetSoldUnit()
	endif
	if((GetUnitTypeId(GetSoldUnit()) == 'Nsto')) then
		
		set Storm = GetSoldUnit()
		call UnitAddAbility(udg_Circle[GetPlayerId(GetOwningPlayer(GetSoldUnit()))],'ASto')
	endif
	return false
endfunction

function UPI takes nothing returns boolean
	local integer i = GetItemTypeId(GetManipulatedItem())
	if LoadStr(Item,i,0) != null then
		call ExecuteFunc(LoadStr(Item,i,0))
		//call BJDebugMsg("运行"+(LoadStr(Item,i,0)))
	endif
	return false
endfunction


//任意单位被攻击
function UnitAttacked takes nothing returns boolean
	local unit u = GetAttacker()
	if GetUnitAbilityLevel( u, 'AIll') > 0 then
		call IssueTargetOrder(GetAttacker(), "attack", GetTriggerUnit())
		
	endif
	set u = null
	return false
endfunction

//发布无目标指令
function UunitIssuedOrder takes nothing returns nothing
	local player p = GetOwningPlayer(GetTriggerUnit())
	if GetIssuedOrderId() == 852590 then
		
		call DisplayTimedTextToPlayer(p,0,0,$A,"球状闪电滚动自动选择：|cff00ff00开|r")
		
		set StormSpiritChoose = true
	endif
	set p = null
endfunction



function ChatEvent takes nothing returns nothing
	local string s=StringCase(GetEventPlayerChatString(),false)
	local integer h=StringHash(s)
	if HaveSavedString(Chat,h,0)then
		call ExecuteFunc(LoadStr(Chat,h,0))
	endif
endfunction

function STAB takes nothing returns nothing
	local trigger t
	
	local rect rec
	
	set t = CreateTrigger()
	call BJRT(t,EVENT_PLAYER_UNIT_SPELL_EFFECT) //发动技能效果
	call TriggerAddCondition(t,Condition(function ESE))
	set t = CreateTrigger()
	call TriggerRegisterAnyUnitEventBJ( t, EVENT_PLAYER_UNIT_SELL ) //出售单位
	call TriggerAddCondition(t,Condition(function EPUS))
	set t = CreateTrigger()
	call BJRT(t,EVENT_PLAYER_HERO_SKILL)
	call TriggerAddCondition(t,Condition(function EHS)) //学习技能
	set t = CreateTrigger()
	call BJRT(t,EVENT_PLAYER_UNIT_SPELL_CAST)
	call TriggerAddCondition(t,Condition(function USC)) //开始释放技能
	set t = CreateTrigger()
	call BJRT(t,EVENT_PLAYER_UNIT_SPELL_FINISH)
	call TriggerAddCondition(t,Condition(function USF)) //释放技能结束
	set t = CreateTrigger()
	call BJRT(t,EVENT_PLAYER_UNIT_ATTACKED)
	call TriggerAddCondition(t,Condition(function UnitAttacked)) //被攻击
	set t = CreateTrigger()
	call BJRT(t,EVENT_PLAYER_UNIT_PICKUP_ITEM)
	call TriggerAddCondition(t,Condition(function UPI)) //获得物品
	
	set t = CreateTrigger()
	
	call BJRT(t,EVENT_PLAYER_UNIT_ISSUED_ORDER)
	call TriggerAddCondition(t,Condition(function UunitIssuedOrder)) //发布无目标指令
	
	set t = CreateTrigger()
	call TriggerRegisterPlayerChatEvent(t,Player(0),"",false)
	call TriggerRegisterPlayerChatEvent(t,Player(2),"",false)
	call TriggerRegisterPlayerChatEvent(t,Player(3),"",false)
	call TriggerRegisterPlayerChatEvent(t,Player(4),"",false)
	call TriggerAddAction(t,function ChatEvent)
	//山洞埋伏
	set rec = Rect(-17568,-17472,-16480,-17248)
	set t = CreateTrigger()
	call TriggerRegisterEnterRectSimple(t, rec)
	call TriggerAddCondition(t,Condition(function CaveAmbush))
	call RemoveRect(rec)
	
	//神秘通道
	set rec = Rect(-21600,-18816,-21344,-18272)
	set t = CreateTrigger()
	call TriggerRegisterEnterRectSimple(t, rec)
	//call TriggerRegisterTimerEvent(t,3.00,false)
	call TriggerAddCondition(t,Condition(function ElevatorRect))
	call RemoveRect(rec)
	set rec = null
	set t = null
endfunction


//菊花击败boos
function JuHuaNiuBi takes real x1, real y1,integer Id,real x2, real y2 returns nothing
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

