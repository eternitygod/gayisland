

function necs takes nothing returns nothing
	call GPT(GetEnumUnit(),-9024.00,-18496.00,0.00)
	call PauseUnit(GetEnumUnit(), false)
	call IssuePointOrder(GetEnumUnit(), "move", -8200.00, -18496.00)
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
	call ForGroup(g,function necs)
	call DestroyTrigger(t)
	set t = null
	set u = null
	set g = null
endfunction

function NHD takes nothing returns nothing
	local unit u = GetEnumUnit()
	local real maxhp = GetUnitState(u,UNIT_STATE_MAX_LIFE)
	local real d = maxhp*0.0030
	call R8D(udg_Boos[2],u,3,d)
	set u = null
	//call GDS(GetUnitName(u))
endfunction

function NHA takes nothing returns nothing //竭心光环
	local integer h = GetHandleId(GetExpiredTimer())
	local unit  u = udg_Boos[2]
	local group g = CreateGroup()
	if (GetUnitState(u, UNIT_STATE_LIFE) > 0.00) == true then
		call GroupEnumUnitsInRange(g,GetUnitX(u),GetUnitY(u),1200.00,Condition (function BoosG1))
		call ForGroup(g,function NHD)
		call DestroyGroup(g)
	else
		//call GDS("HAHAHA")
		call PauseTimer(GetExpiredTimer())
		call DestroyTimer(GetExpiredTimer())
	endif
	set g =null
	set u =null
endfunction


function NRT takes nothing returns nothing //骷髅计时器攻击
	local integer h = GetHandleId(GetExpiredTimer())
	local group g = LoadGroupHandle(HY,h,1)
	local unit u
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

function NRA takes nothing returns nothing //召唤骷髅
	local timer t1 = GetExpiredTimer()
	local integer rh = GetHandleId(t1)
	local unit array slk
	local integer i = 0
	local integer ii
	local timer t2 = CreateTimer()
	local group g = CreateGroup()
	local integer h = GetHandleId(t2)
	if (GetUnitState(udg_Boos[2], UNIT_STATE_LIFE) > 0.00) == true then
		call SetUnitAnimationByIndex(udg_Boos[2], 3)
		set slk[0] = CreateUnit(Player(10),'u003',-7776.00,-17472.00,GetRandomDirectionDeg())
		set slk[1] = CreateUnit(Player(10),'slAc',-7584.00,-17632.00,GetRandomDirectionDeg())
		set slk[2] = CreateUnit(Player(10),'uslm',-7424.00,-17824.00,GetRandomDirectionDeg())
		call PlaySoundOnUnitBJ(gg_snd_NecromancerWhat1, 100, udg_Boos[2])
		call TransmissionFromUnitWithNameBJ(GetPlayersAll(), udg_Boos[2], GetUnitName(udg_Boos[2]), null, "死者服从于我！", bj_TIMETYPE_SET, 4.00, false)
		loop
		exitwhen i>2
			set ii = GetRandomInt(1, 10)
			call SetUnitAnimation(slk[i], "Birth")
			call GroupAddUnit(g,slk[i])
			call UnitApplyTimedLife(slk[i], 'Brai', 40.00+ii)
			set slk[i] = null
			set i = i+1
		endloop
		call SaveGroupHandle(HY,h,1,g)
		call TimerStart(t2,2.00,false,function NRT)
	else
		call FlushChildHashtable(HY,rh)
		//call GDS("召唤骷髅计时器清除")
		call PauseTimer(GetExpiredTimer())
		call DestroyTimer(GetExpiredTimer())
	endif
	set t1 = null
	set t2 = null
	set g = null
	//(-7776.00,-17472.00) //骷髅战士
	//(-7584.00,-17632.00) //骷髅射手
	//(-7424.00,-17824.00) //骷髅魔法师
endfunction


function Trig_Boos_NecActions takes nothing returns nothing
	local unit Nec = udg_Boos[2] //亡灵法师
	local unit GPU
	local timer Raise = CreateTimer() //召唤技能
	local integer Rh = GetHandleId(Raise)
	local timer GPFt = CreateTimer() //结束对话
	local timer NecHa = CreateTimer() //竭心光环
	local rect r1 = Rect(-9600.00,-20288.00,-6752.00,-16736.00)
	local group PlayerHeroG = udg_HeroGroup
	local group EggG = udg_EggGroup
	call DisableTrigger(GetTriggeringTrigger()) 
	call SetUnitInvulnerable(Nec, true) //设置boos无敌 5秒后关闭
	call EnableSelect(false,true) //取消控制权和选择圈
	call EnableUserControl(false)
	call RemoveGuardPosition(udg_Boos[2]) //警戒点
	call ResetToGameCamera(0)
	call PanCameraToTimed(-8032.00, -18464.00, 1.00) //镜头
	call ForGroup(PlayerHeroG,function necs)
	set PlayerHeroG = null
	call TimerStart(GPFt,3.00,false,function GPFtd)  //计时器 解除暂停并且重新获得控制权
	call TimerStart(NecHa,.5,true,function NHA) //Nec光环
	//call SaveRectHandle(HY,Rh,1,r1)
	call TimerStart(Raise,30.00,true,function NRA) //召唤骷髅
	//call SaveRectHandle(HY,Rh,1,slk1)
	//call SaveRectHandle(HY,Rh,2,slk2)
	//call SaveRectHandle(HY,Rh,3,Slk3)
endfunction

//===========================================================================
function InitTrig_Boos_Nec_Orig takes nothing returns nothing
	set gg_trg_Boos_Nec = CreateTrigger()
	#ifdef DEBUG
	call YDWESaveTriggerName(gg_trg_Boos_Nec, "Boos_Nec")
	#endif
	call TriggerAddAction(gg_trg_Boos_Nec, function Trig_Boos_NecActions)
endfunction

function InitTrig_Boos_Nec takes nothing returns nothing
endfunction