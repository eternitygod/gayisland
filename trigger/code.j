//TESH.scrollpos=4
//TESH.alwaysfold=0


//***************************************************************************
//*
//*  Map Configuration
//*
//***************************************************************************

//***************************************************************************
//*
//*  Players
//*
//***************************************************************************


//! inject config

    local integer i = 0
	call SetMapName("基佬之岛v1.15")
	call SetMapDescription("不简易小地图，菊花系列第二部。")
	call SetPlayers(10)
	call SetTeams(2)
	call SetGamePlacement(MAP_PLACEMENT_FIXED)
	loop
		call DefineStartLocation(i, 0.0, 0.0)
		exitwhen i == 9
		set i = i + 1
	endloop
	// Player setup
	call InitCustomPlayerSlots()
	call InitCustomTeams()
	//不需要联盟优先权
	//call InitAllyPriorities()

//! endinject
