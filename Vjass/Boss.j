
#include "Boss\Pudge.j"
#include "Boss\Imago.j"

scope Boss initializer Init

    function ExecuteBossAI takes unit whichUnit returns nothing
        local integer bossType = GetUnitTypeId(whichUnit)
        if bossType == 'U001' then
            call InitPudgeAI(whichUnit)
        elseif bossType == 'u000' then
            call InitImagoAI(whichUnit)
        endif
    endfunction
    
    function StartBossAI takes nothing returns boolean
        local trigger trig = GetTriggeringTrigger()
        local integer iHandleId = GetHandleId(trig)
        call ExecuteBossAI(LoadUnitHandle(HT, iHandleId, 0))
        call FlushChildHashtable(HT, iHandleId)
        call ClearTrigger(trig)
        return false
    endfunction

    public function Init takes nothing returns nothing
       
        local trigger trig = CreateTrigger()
        local integer iHandleId = GetHandleId(trig)
        local unit whichBoss
            
        //屠夫 9级
        set whichBoss = CreateUnit(Player(9), 'U001', - 13853.3, - 27003.7, 89.893)
        call SetHeroLevel(whichBoss, 9, false)
        call TriggerRegisterUnitInRange(trig, whichBoss, 600, null)
        call TriggerAddCondition(trig, Condition( function StartBossAI))
        call SaveUnitHandle(HT, iHandleId, 0, whichBoss)
        
        set whichBoss = CreateUnit(Player(9), 'u000', - 24785.3, - 25275.7, 89.893)
        // call SetHeroLevel(whichBoss, 9, false)
        call TriggerRegisterUnitInRange(trig, whichBoss, 600, null)
        call TriggerAddCondition(trig, Condition( function StartBossAI))
        call SaveUnitHandle(HT, iHandleId, 0, whichBoss)
        
        //死灵法师 10级
        set whichBoss = CreateUnit(Player(9), 'U002', - 8341.3, - 18597.8, 165.143)
        call SetHeroLevel(whichBoss, 10, false)
        
        set whichBoss = null
        set trig = null

    endfunction

endscope

