globals
	quest array MainQuest
	questitem array MainQuestItem
endglobals
function MainQuestSet takes nothing returns nothing
	//主线1神秘之岛
	//if i == 0 then
	set MainQuest[0] = CreateQuestBJ( bj_QUESTTYPE_REQ_DISCOVERED, "神秘岛屿", "9d将你们传送至这个岛屿，探索并试图寻找到9d。", "ReplaceableTextures\\CommandButtons\\BTNCoralBed.blp" )
	//call CreateQuestItemBJ(MainQuest[0], "寻找9D")
	///elseif i == 1 then
	//主线2 憎恶
	//call FlashQuestDialogButton()
	set MainQuest[1] = CreateQuestBJ( bj_QUESTTYPE_REQ_UNDISCOVERED, "邪恶亡灵", "找到亡灵诞生的源头。", "ReplaceableTextures\\CommandButtons\\BTNAcolyte.blp" )
	set MainQuest[2] = CreateQuestBJ( bj_QUESTTYPE_OPT_UNDISCOVERED, "通道修理者", "菊花感应到了熟悉的气息，但谁也不知道它要干什么，很神秘。", "ReplaceableTextures\\CommandButtons\\BTNOgreMagi.blp" )
	call QuestSetEnabled(MainQuest[2], false)
	//set MainQuestItem[0] = QuestCreateItem(MainQuest[1])
	//call QuestItemSetDescription(MainQuestItem[0], "杀死食尸鬼")
	//call QuestItemSetCompleted(MainQuestItem[0], false)
	//elseif i == 2 then
	
	//endif
	
endfunction

function MainQuestItemSetTimer01 takes nothing returns nothing
call QuestMessageBJ(GetPlayersAll(), bj_QUESTMESSAGE_HINT, "|c006699CC提示|r - 许多和英雄相关的提示字幕和电影只有单位所有者能看到")
call DestroyTimer(GetExpiredTimer())
endfunction

function MainQuestItemSetTimer00 takes nothing returns nothing
	call QuestMessageBJ(GetPlayersAll(), bj_QUESTMESSAGE_ALWAYSHINT, "|cff32CD32提示|r - 选择英雄时别忘记带上菊花，它有许多独特的支线任务。")
	call TimerStart(CreateTimer(),20.00,false,function MainQuestItemSetTimer01)
	call DestroyTimer(GetExpiredTimer())
endfunction

function MainQuestItemSet takes integer i, integer s returns nothing
	local integer h
	if i == 0 then
		if s == 0 then
			call QuestMessageBJ(GetPlayersAll(), bj_QUESTMESSAGE_DISCOVERED, "|cffffcc00发现主要任务|r
			神秘岛屿
			  - 你们被传送至这个岛屿，探索并试图寻找到离开的办法。")
			call TimerStart(CreateTimer(),4.00,false,function MainQuestItemSetTimer00)
		endif
	elseif i == 1 then
		if s == 0 then
			call QuestSetDiscovered( MainQuest[1], true)
			set MainQuestItem[0] = QuestCreateItem(MainQuest[1])
			call QuestItemSetDescription(MainQuestItem[0], "找到亡灵诞生的源头")
			call QuestItemSetCompleted(MainQuestItem[0], false)
			call QuestMessageBJ(GetPlayersAll(), bj_QUESTMESSAGE_DISCOVERED, "|cffffcc00发现主要任务|r
			邪恶亡灵
			  - 找到亡灵诞生的源头")
		elseif s == 1 then
			set MainQuestItem[1] = QuestCreateItem(MainQuest[1])
			call QuestItemSetDescription(MainQuestItem[1], "击败巨型缝合怪")
			call QuestItemSetCompleted(MainQuestItem[1], false)
			call QuestMessageBJ(GetPlayersAll(), bj_QUESTMESSAGE_DISCOVERED, "|cffffcc00主要任务更新|r
			邪恶亡灵
			  - 找到亡灵诞生的源头
			  - 击败巨型缝合怪")
			//call FlashQuestDialogButton()
		endif
	elseif i == 2  then
		if s == 0 then
			call QuestSetDiscovered( MainQuest[2], true)
			set h = GetHandleId(MainQuest[2])
			
			set MainQuestItem[2] = QuestCreateItem(MainQuest[2])
			call QuestItemSetDescription(MainQuestItem[2], "找到扳手")
			call QuestItemSetCompleted(MainQuestItem[2], false)
			call SaveBoolean(HY,h,'Wren',false)
			
			set MainQuestItem[3] = QuestCreateItem(MainQuest[2])
			call QuestItemSetDescription(MainQuestItem[3], "找到披风")
			call QuestItemSetCompleted(MainQuestItem[3], false)
			call SaveBoolean(HY,h,'Icap',false)
			set MainQuestItem[4] = QuestCreateItem(MainQuest[2])
			call QuestItemSetDescription(MainQuestItem[4], "找到工具箱")
			call QuestItemSetCompleted(MainQuestItem[4], false)
			call SaveBoolean(HY,h,'Isui',false)
			call QuestMessageBJ(GetPlayersAll(), bj_QUESTMESSAGE_DISCOVERED, "|cffffcc00发现可选任务|r
			通道修理者
			  - 找到扳手
			  - 找到披风
			  - 找到工具箱")
		endif
	endif
endfunction