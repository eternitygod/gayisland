
scope Order initializer Init

    globals
        key OBJ_KEY_COMMON_ORDERID

        // 一些命令Id
        // 攻击
        constant integer ORDER_ATTACK = 851983
        // 右键
        constant integer ORDER_SMART = 851971
        // 移动
        constant integer ORDER_MOVE = 851986
        // 巡逻
        constant integer ORDER_PATROL = OrderId("patrol")
        // 停止
        constant integer ORDER_STOP = OrderId("stop")
        // 肉钩 / 照明弹
        constant integer ORDER_MEATHOOK = 852060
        // 魔法枷锁
        constant integer ORDER_MAGICLEASH = 852480
        // 闪电链
        constant integer ORDER_CHAINLIGHTNING = 852119
        // 嘲讽
        constant integer ORDER_TAUNT = 852520
        // 采集
        constant integer ORDER_HARVEST = 852018

        
    endglobals

    function IsCommonOrderId takes integer orderId returns boolean
        return LoadBoolean( ObjectData, OBJ_KEY_COMMON_ORDERID, orderId )
    endfunction

    private function SaveCommonOrderId takes integer orderId returns nothing
        call SaveBoolean( ObjectData, OBJ_KEY_COMMON_ORDERID, orderId, true )
    endfunction

    private function Init takes nothing returns nothing
        call SaveCommonOrderId( ORDER_ATTACK )
        call SaveCommonOrderId( ORDER_SMART )
        call SaveCommonOrderId( ORDER_MOVE )
        call SaveCommonOrderId( ORDER_PATROL )
        call SaveCommonOrderId( ORDER_STOP )
    endfunction

endscope
