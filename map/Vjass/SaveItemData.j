
scope SaveItemData initializer Init

    globals
        // BonusKey
        constant key BONUS_DAMAGE   //攻击力
        constant key BONUS_ARMOR //护甲
        constant key BONUS_ATTACK    //攻速
        constant key BONUS_LIFE //最大生命
        constant key BONUS_MANA //最大魔法
        constant key BONUS_STR // 
        constant key BONUS_AGI // 
        constant key BONUS_INT // 
        constant key BONUS_MOVESPEED  //移动速度

        constant key DAMAGE_BASE_BONUS //基础攻击力奖励 白字
        constant key ARMOR_BASE_BONUS //基础护甲奖励 白字

        constant key LIFE_RESTORE_BONUS
        constant key MANA_RESTORE_BONUS
    endglobals

    //初始化物品属性 - 英雄三围
    function InitItemHeroAttribute takes nothing returns nothing
        call SetItemHeroAttribute('cnob', 5, 5, 5)  //贵族圆环
        //call SetItemHeroAttribute('Idms', 0, 0, 0) //幻影斧
    endfunction
    //初始化物品属性 - 攻击防御生命魔法攻速
    function InitItemAttribute takes nothing returns nothing
        //call SetItemAttribute('cnob', 10, 200, 100 , 0 , 0.0)  //贵族圆环
        call ItemAddStateBonus('IR01', BONUS_MANA, 250)
        call ItemAddStateBonus('IR01', BONUS_MOVESPEED, 50)
        call ItemAddStateBonus('IR02', BONUS_MOVESPEED, 50)
    endfunction

    private function Init takes nothing returns nothing
        call InitItemAttribute()
        call InitItemHeroAttribute()
    endfunction

endscope