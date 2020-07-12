

function Elevatorposition takes nothing returns nothing
	local player p = GetTriggerPlayer()
	local integer i = 0 
	if GetLocalPlayer() == p then
		loop
		exitwhen i == 2
            call PingMinimap(GetUnitX(Elevator[i]), GetUnitY(Elevator[i]), 3)
            set i = i + 1
		endloop
	endif
endfunction


