


function CryptBeetle takes nothing returns boolean
	
	return GetUnitTypeId(GetFilterUnit()) == 'ucsB'
	
endfunction

function ElevatorRect takes nothing returns nothing
	local trigger t = GetTriggeringTrigger()
	local integer A = 0
	local integer h = GetHandleId(t)
	local integer Z = LoadInteger(HY,h,3)
	//if GetTriggerEventId()==EVENT_GAME_TIMER_EXPIRED then
	if Z!=1 then
		call BJDebugMsg("Z未赋值")		
		set Z = 1
		call SaveInteger(HY,h,3,Z)
		loop
			if udg_Hero[A] != null then
				call SaveUnitHandle(HY,h,A,udg_Hero[A])
				call SaveBoolean(HY,h,A,false)
				if test then 
					call BJDebugMsg(GetUnitName(udg_Hero[A])+"存放至ElevatorRect"+I2S(h)+"父索引"+"子索引"+I2S(A))
				endif
			endif
			set A = A + 1
		exitwhen A == 6
		endloop
	elseif GetTriggerEventId()==EVENT_GAME_ENTER_REGION then
		call BJDebugMsg("神秘通道")		
		
		
	endif
endfunction


function CaveAmbush takes nothing returns boolean
	local group g
	local rect r
	local boolexpr b
	//call BJDebugMsg("ZZZ")
	if IsUnitInGroup(GetTriggerUnit(), udg_HeroGroup) == true then
		set g = CreateGroup()
		set r = Rect(-17536,-18880,-16576,-15840)
		set b = Condition(function CryptBeetle)
		call GroupEnumUnitsInRect( g, r,b)
		call DestroyBoolExpr(b)
		loop
		exitwhen FirstOfGroup(g) == null
			call PauseUnit( FirstOfGroup(g), false)
			call IssuePointOrder( FirstOfGroup(g), "attack", GetUnitX(GetTriggerUnit()), GetUnitY(GetTriggerUnit()))
			call GroupRemoveUnit(g,FirstOfGroup(g))
		endloop
		call DestroyGroup(g)
		call DestroyTrigger(GetTriggeringTrigger())
	endif
	set g = null
	set r = null
	return false
endfunction
