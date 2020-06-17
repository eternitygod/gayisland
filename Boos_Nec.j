
function NecAttackAIEnumUnits takes nothing returns boolean
	return (GetUnitState(GetFilterUnit(), UNIT_STATE_LIFE) > 0.00) and (IsUnitType(GetFilterUnit(), UNIT_TYPE_MAGIC_IMMUNE) == false) and (IsUnitType(GetFilterUnit(), UNIT_TYPE_MAGIC_IMMUNE) == false) and (GetUnitAbilityLevel(GetFilterUnit(), 'Avul') == 0) and (IsUnitEnemy(GetFilterUnit(), Player(10)) == true)
endfunction


function necs takes nothing returns nothing
	call GPT(GetEnumUnit(),-9024.00,-18496.00,0.00)
	call PauseUnit(GetEnumUnit(), false)
	call IssuePointOrder(GetEnumUnit(), "move", -8200.00, -18496.00)
	call SuspendHeroXP( GetEnumUnit(), true ) //禁止获得经验
endfunction

function GPFtd takes nothing returns nothing //顺便装逼
	local trigger t = GetTriggeringTrigger()
	local group g = udg_HeroGroup
	local unit u
	call PlaySoundOnUnitBJ(gg_snd_NecromancerPissed4, 100, udg_Boos[2])
	call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_Boos[2], GetUnitName(udg_Boos[2]), null, "你闻到什么东西了吗？啊，这就是军队！", bj_TIMETYPE_SET, 4.00, false)
	call SetUnitInvulnerable(udg_Boos[2], false) //解除无敌
	call EnableSelect(true,true) //取消控制权和选择圈
	call EnableUserControl(true)
	//call ForGroup(g,function necs)
	call DestroyTrigger(t)
	set t = null
	set u = null
	set g = null
endfunction

function NHD takes nothing returns nothing
	local unit u = GetEnumUnit()
	local real maxhp = GetUnitState(u,UNIT_STATE_MAX_LIFE)
	local real d = maxhp*0.0020
	call R8D(udg_Boos[2],u,3,d)
	set u = null
	//call BJDebugMsg(GetUnitName(u))
endfunction

function NHA takes nothing returns nothing //竭心光环
	local integer h = GetHandleId(GetExpiredTimer())
	local unit  u = udg_Boos[2]
	local group g
	local boolexpr b
	if (GetUnitState(u, UNIT_STATE_LIFE) > 0.00) == true then
		set g = CreateGroup()
		set b = Condition (function BoosG1)
		call GroupEnumUnitsInRange(g,GetUnitX(u),GetUnitY(u),1200.00,b)
		call DestroyBoolExpr(b)
		call ForGroup(g,function NHD)
		call DestroyGroup(g)
	elseif LichSurvival == false then
		call PauseTimer(GetExpiredTimer())
		call DestroyTimer(GetExpiredTimer())
	endif
	set g = null
	set u = null
	set b = null
endfunction

function NRT takes nothing returns nothing //骷髅计时器攻击
	local integer h = GetHandleId(GetExpiredTimer())
	local group g = LoadGroupHandle(HY,h,1)
	loop
	exitwhen FirstOfGroup(g) == null
		call IssueTargetOrder(FirstOfGroup(g), "attack", GroupPickRandomUnit(udg_HeroGroup))
		call GroupRemoveUnit(g,FirstOfGroup(g))
	endloop
	call DestroyGroup(g)
	call FlushChildHashtable(HY,h)
	call DestroyTimer(GetExpiredTimer())
	set g = null
endfunction

function RaiseSkeletonStop takes nothing returns nothing
	local timer t = GetExpiredTimer()
	if GetUnitCurrentOrder( udg_Boos[2] ) != String2OrderIdBJ("deathcoil") then
		call IssueImmediateOrder( udg_Boos[2], "stop" )
	endif
	call DestroyTimer(t)
	set t = null
endfunction

function NecRaiseSkeleton takes nothing returns nothing
	local unit array slk
	local integer i = 0
	local integer ii
	local timer t = CreateTimer()
	local group g = CreateGroup()
	local integer h = GetHandleId(t)
	//call SetUnitAnimationByIndex(udg_Boos[2], 3)
	set slk[0] = CreateUnit(Player(10),'uskw',-7776.00,-17472.00,GetRandomDirectionDeg())
	set slk[1] = CreateUnit(Player(10),'slAc',-7584.00,-17632.00,GetRandomDirectionDeg())
	set slk[2] = CreateUnit(Player(10),'uslm',-7424.00,-17824.00,GetRandomDirectionDeg())
	loop
	exitwhen i>2
		set ii = GetRandomInt(1, 10)
		call SetUnitAnimation(slk[i], "Birth")
		call GroupAddUnit(g,slk[i])
		call UnitApplyTimedLife(slk[i], 'Brai', 40.00+ii)
		set slk[i] = null
		set i = i + 1
	endloop
	call SaveGroupHandle(HY,h,1,g)
	call TimerStart(t,2.00,false,function NRT)
	set t = null
	set g = null
	//(-7776.00,-17472.00) //骷髅战士
	//(-7584.00,-17632.00) //骷髅射手
	//(-7424.00,-17824.00) //骷髅魔法师
endfunction

function NRA takes nothing returns nothing //召唤骷髅
	local timer t1 = GetExpiredTimer()
	local integer rh = GetHandleId(t1)
	local timer Stop
	if (GetUnitState(udg_Boos[2], UNIT_STATE_LIFE) > 0.00) == true then 
		if (GetUnitTypeId(udg_Boos[2]) == 'Ulic') then//前者不需要施法则直接召唤，后者需要施法。
			//call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_Boos[2], GetUnitName(udg_Boos[2]), null, "死者服从于我！", bj_TIMETYPE_SET, 4.00, false)
			call NecRaiseSkeleton()
		else
			call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_Boos[2], GetUnitName(udg_Boos[2]), null, "死者服从于我！", bj_TIMETYPE_SET, 4.00, false)
			call PlaySoundOnUnitBJ(gg_snd_NecromancerWhat1, 100, udg_Boos[2])
			call IssueImmediateOrder( udg_Boos[2], "channel" )
			set Stop = CreateTimer()
			call TimerStart(Stop,6.25,false,function RaiseSkeletonStop )
		endif
	elseif LichSurvival == false then
		call FlushChildHashtable(HY,rh)
		//call BJDebugMsg("召唤骷髅计时器清除")
		call PauseTimer(GetExpiredTimer())
		call DestroyTimer(GetExpiredTimer())
	endif
	set t1 = null
	set Stop = null
endfunction


function GroupExpF takes nothing returns nothing
	call SuspendHeroXP( GetEnumUnit(), false )
endfunction


function CreateLichTimer takes nothing returns nothing
	local timer t = GetExpiredTimer()
	local unit u
	set u = CreateUnit(Player(10),'Ulic',GetUnitX(udg_Boos[2]),GetUnitY(udg_Boos[2]),GetUnitFacing(udg_Boos[2]))
	call PlaySoundOnUnitBJ( gg_snd_HeroLichReady1, 100, udg_Boos[2] )
	set udg_Boos[2] = u
	call ADDXP(udg_Boos[2],11900) //15级
	call SetUnitAnimation( udg_Boos[2], "spell" )
	call ForGroup(udg_HeroGroup,function GroupExpF) //允许单位组经验获取
	call AddPlayerTechResearched( Player(10), 'Rusl', 1 )
	call DestroyTimer(t)
	set u = null
	set t = null
endfunction



function CreateLichEffect takes nothing returns nothing
	local timer t = GetExpiredTimer()
	local integer h = GetHandleId(t)
	local integer I = LoadInteger(HY,h,'Effe')
	local real X = GetUnitX(udg_Boos[2])
	local real Y = GetUnitY(udg_Boos[2])
	call DestroyEffect( AddSpecialEffect("Objects\\Spawnmodels\\Undead\\UndeadDissipate\\UndeadDissipate.mdl", X , Y ) )
	set I = I + 1 
	call SaveInteger(HY,h,'Effe',I)
	if I > 6 then
		call FlushChildHashtable(HY,h)
		call DestroyTimer(t)
	endif
	set t = null
endfunction


function NecDeathConditions takes nothing returns nothing
	local trigger t = GetTriggeringTrigger()
	local timer CreateLich = CreateTimer()
	local timer LichEffect = CreateTimer()
	local integer LichEffectH = GetHandleId(LichEffect)
	call SetUnitTimeScale( udg_Boos[2], 0.40 )
	//set udg_Boos[2] = null
	//call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_Boos[2], GetUnitName(udg_Boos[2]), null, "", bj_TIMETYPE_SET, 4.00, false)
	call TimerStart(CreateLich,6.00,false,function CreateLichTimer)
	call TimerStart(LichEffect,0.90,true,function CreateLichEffect)
	call SaveInteger(HY,LichEffectH,'Effe',0)
	call DestroyTrigger(t)
	set t = null
	set CreateLich = null
	set LichEffect = null
endfunction


function NecAttackAI takes nothing returns nothing
	local timer t = GetExpiredTimer()
	local integer h = GetHandleId(t)
	local rect r
	local group g
	local unit u = udg_Boos[2]
	local unit NecAttackunit
	local boolexpr b
	if (GetUnitState(udg_Boos[2], UNIT_STATE_LIFE) > 0.00) == true then 
		if (GetUnitCurrentOrder( udg_Boos[2] ) == String2OrderIdBJ("stop")) then
			set r = LoadRectHandle( HY, h, 'real')
			set b = Condition (function NecAttackAIEnumUnits)
			set g = GetUnitsInRectMatching(r,b)
			call DestroyBoolExpr(b)
			set NecAttackunit = GroupPickRandomUnit(g)
			call IssuePointOrderById( u, 851983, GetUnitX(NecAttackunit), GetUnitY(NecAttackunit) )
			call DestroyGroup(g)
			call BJDebugMsg("AttackMove " + GetUnitName(NecAttackunit))
		elseif GetUnitCurrentOrder( udg_Boos[2])  == String2OrderIdBJ("") then
			set r = LoadRectHandle( HY, h, 'real')
			set g = GetUnitsInRectMatching(r,b)
			set b = Condition (function NecAttackAIEnumUnits)
			call DestroyBoolExpr(b)
			set NecAttackunit = GroupPickRandomUnit(g)
			call IssuePointOrderById( u, 851983, GetUnitX(NecAttackunit), GetUnitY(NecAttackunit) )
			call DestroyGroup(g)
			call BJDebugMsg("AttackMove " + GetUnitName(NecAttackunit))
		endif
	elseif LichSurvival == false then
		call FlushChildHashtable(HY,h)
		call BJDebugMsg("Nec空闲自动攻击计时器清除")
		call PauseTimer(GetExpiredTimer())
		call DestroyTimer(GetExpiredTimer())
	endif
	set t = null
	set r = null
	set g = null
	set u = null
	set b = null
	set NecAttackunit = null
endfunction

function NecDeatHcoilConditions takes nothing returns nothing
	local real cd = YDWEGetUnitAbilityState(udg_Boos[2], 'AUdc', 1)
	//call BJDebugMsg("DeatehCoil Cd  = "+ R2S(cd))
	if cd == 0.00 then
		if GetUnitState(udg_Boos[2], UNIT_STATE_LIFE) <= 1200.00 then
			if GetUnitCurrentOrder( udg_Boos[2] ) != String2OrderIdBJ("channel") then
			call IssueTargetOrder( udg_Boos[2], "deathcoil", udg_Boos[2] )
			
			endif
		endif
	endif
	
endfunction

function Boos_NecActions takes nothing returns nothing
	local unit Nec = udg_Boos[2] //亡灵法师
	local unit GPU
	local timer Raise = CreateTimer() //召唤技能
	local integer Rh = GetHandleId(Raise)
	local timer GPFt = CreateTimer() //结束对话
	local timer NecHa = CreateTimer() //竭心光环
	local timer AttackAI = CreateTimer() //亡灵法师攻击AI
	local trigger DeatHcoil = CreateTrigger() //死亡缠绕释放AI
	local integer AttackAIHandleId = GetHandleId(AttackAI)
	local rect r1 = Rect(-9600.00,-20288.00,-6752.00,-16736.00)
	local group PlayerHeroG = udg_HeroGroup
	//local group EggG = udg_EggGroup
	local trigger NecDeath = CreateTrigger()
	//设置
	call DisableTrigger(GetTriggeringTrigger()) 
	call SetUnitInvulnerable(Nec, true) //设置boos无敌 5秒后关闭
	call EnableSelect(false,true) //取消控制权和选择圈
	call EnableUserControl(false)
	call ForGroup(PlayerHeroG,function necs)
	//call RemoveGuardPosition(udg_Boos[2]) //删除警戒点
	
	//镜头
	call ResetToGameCamera(0)
	call PanCameraToTimed(-8032.00, -18464.00, 1.00) //镜头
	
	//计时器
	call TimerStart(GPFt,3.00,false,function GPFtd)  //解除暂停并且重新获得控制权
	call TimerStart(NecHa,.5,true,function NHA) //Nec光环
	call TimerStart(Raise,22.00,true,function NRA) //召唤骷髅
	call TimerStart(AttackAI, 0.33 , true , function NecAttackAI)
	//传参
	call SaveRectHandle(HY,AttackAIHandleId,'real',r1)
	
	//触发器
	call TriggerRegisterUnitEvent( NecDeath, udg_Boos[2], EVENT_UNIT_DEATH )//Nec 死亡
	call TriggerAddCondition(NecDeath, Condition(function NecDeathConditions))
	call TriggerRegisterUnitEvent( DeatHcoil, udg_Boos[2], EVENT_UNIT_DAMAGED )//死亡缠绕
	call TriggerAddCondition( DeatHcoil, Condition(function NecDeatHcoilConditions))
	
	
	set Nec = null
	set GPU = null
	set Raise = null
	set GPFt = null
	set NecHa = null
	set r1 = null
	set PlayerHeroG = null
	//set EggG = null
	set NecDeath = null
	set DeatHcoil = null
endfunction

//===========================================================================