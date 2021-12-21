
library TextTag requires base
    
    //暴击漂浮文字 只会出现一次
    function CriticalStrikeTextTag takes unit whichUnit, real damage returns nothing
        local texttag t = CreateTextTag()
        call SetTextTagText(t, I2S(R2I(damage)) + "!", 0.025)	//文字 字体大小
        call SetTextTagPos(t, GetUnitX(whichUnit), GetUnitY(whichUnit), .0)	//高度偏移
        call SetTextTagColor(t, 255, 0, 0, 255)
        call SetTextTagVelocity(t, 0, .04)
        call SetTextTagFadepoint(t, 2) //淡入时间
        call SetTextTagPermanent(t, false)	//永久性
        call SetTextTagLifespan(t, 5) //生命周期
        call SetTextTagVisibility(t, UnitVisibleToPlayer(whichUnit, LocalPlayer))
        set t = null
    endfunction
    
    //通用漂浮文字
    function CommonTextTag takes string msg, real lifespan, unit whichUnit, real height, integer r, integer g, integer b, integer a, integer heightOffset returns nothing
        local texttag t = CreateTextTag()
        call SetTextTagText(t, msg, height)	//文字 字体大小
        call SetTextTagPosUnit(t, whichUnit, heightOffset)	//高度偏移
        call SetTextTagColor(t, r, g, b, a)
        call SetTextTagVelocity(t, 0, .0355)
        call SetTextTagFadepoint(t, 2) //淡入时间
        call SetTextTagPermanent(t, false)	//永久性
        call SetTextTagLifespan(t, lifespan) //生命周期
        //call SetTextTagVisibility(tt,TYV(U,GetLocalPlayer())or RBX(GetLocalPlayer()))
        set t = null
    endfunction
    
    //黄金漂浮文字
    function GoldTextTag takes player sourcePlayer, unit whichUnit, integer goldAmount returns nothing
        local texttag tag
        local string effectPath = ""
        local boolean islocalPlayer = LocalPlayer== sourcePlayer
        set tag = CreateTextTag()
        if GetHandleId(tag)> 0 then
            call SetTextTagText(tag, "+" + I2S(goldAmount), .025)
            call SetTextTagPosUnit(tag, whichUnit, - 0.4)
            if islocalPlayer then
                call SetTextTagColor(tag, 255, 220, 0, 255)
            endif
            call SetTextTagVelocity(tag, 0, .03)
            call SetTextTagVisibility(tag, islocalPlayer)
            call SetTextTagFadepoint(tag, 2)
            call SetTextTagLifespan(tag, 3)
            call SetTextTagPermanent(tag, false)
        else
            call DestroyTextTag(tag)
        endif
        if islocalPlayer then
            set effectPath = "UI\\Feedback\\GoldCredit\\GoldCredit.mdl"
        endif
        call DestroyEffect(AddSpecialEffectTarget(effectPath, whichUnit, "overhead"))
        set tag = null
    endfunction

endlibrary




