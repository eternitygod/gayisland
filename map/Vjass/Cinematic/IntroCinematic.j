
scope IntroCinematic initializer Init

    
    // 创建电影马甲单位
    function CreateMovieDummyUnit takes nothing returns nothing
        local player p = Player(6)

        set TavernUnit[1] = CreateUnit(Player(bj_PLAYER_NEUTRAL_VICTIM), 'n001', - 22752.0, - 25376.0, 320)
        call UnitShareVisionToAllPlayer(TavernUnit[1], true)

        set MovieDummyUnit[1] = CreateUnit(p, 'nm01', - 24901, - 25553, 71.69)
        call UnitAddAbility(MovieDummyUnit[1], 'Asla')
        call UnitAddSleepPerm(MovieDummyUnit[1], true)
        call SetUnitAnimation(MovieDummyUnit[1], "Sleep")
        call SetUnitColor(MovieDummyUnit[1], PLAYER_COLOR_GREEN)
        call RemoveGuardPosition(MovieDummyUnit[1])

        set MovieDummyUnit[2] = CreateUnit(p, 'nm02', - 22797, - 25827, 172)
        call SetUnitColor(MovieDummyUnit[2], PLAYER_COLOR_PURPLE)
        call RemoveGuardPosition(MovieDummyUnit[2])

        set MovieDummyUnit[3] = CreateUnit(p, 'nm03', - 22372, - 26034, 146.47)
        call SetUnitColor(MovieDummyUnit[3], PLAYER_COLOR_BLUE)
        call RemoveGuardPosition(MovieDummyUnit[3])
	
        // 偷税师棕色
        set MovieDummyUnit[4] = CreateUnit(p, 'nm04', - 22637, - 26245, 107.84)
        call SetUnitColor(MovieDummyUnit[4], PLAYER_COLOR_BROWN)
        call RemoveGuardPosition(MovieDummyUnit[4])
	
        // 小天红色
        set MovieDummyUnit[5] = CreateUnit(p, 'nm05', - 22800, - 26225, 87.6)
        call SetUnitColor(MovieDummyUnit[5], PLAYER_COLOR_RED)
        call RemoveGuardPosition(MovieDummyUnit[5])

        // 光 蓝色
        set MovieDummyUnit[7] = CreateUnit(p, 'nm07', - 22273, - 25675, 211.92)
        call SetUnitColor(MovieDummyUnit[7], PLAYER_COLOR_BLUE)
        call RemoveGuardPosition(MovieDummyUnit[7])

        // 仓鼠棕色	
        set MovieDummyUnit[6] = CreateUnit(p, 'nm06', - 22421, - 25235, 252.45)
        call SetUnitColor(MovieDummyUnit[6], PLAYER_COLOR_BROWN)
        call RemoveGuardPosition(MovieDummyUnit[6])

        set MovieDummyUnit[101] = CreateUnit(p, 'nhew', - 24660, - 24878, 249.95)
        call SetUnitColor(MovieDummyUnit[101], PLAYER_COLOR_PURPLE)
        call RemoveGuardPosition(MovieDummyUnit[101])

        set MovieDummyUnit[102] = CreateUnit(p, 'nhew', - 24206, - 25453, 176)
        call SetUnitColor(MovieDummyUnit[102], PLAYER_COLOR_PURPLE)

        // 火窖
        set MovieDummyUnit[103] = CreateUnit(p, 'n003', - 24326, - 25439, 270)
        call SetUnitColor(MovieDummyUnit[103], PLAYER_COLOR_PURPLE)
        call SetUnitAnimation(MovieDummyUnit[103], "Decay")

        // 挨打的工人
        set MovieDummyUnit[104] = CreateUnit(p, 'nhew', - 23504, - 23862 , 176)
        call SetUnitColor(MovieDummyUnit[104], PLAYER_COLOR_PURPLE)
        call RemoveGuardPosition(MovieDummyUnit[104])
		
        call CreateUnit(p, 'n002', - 23202, - 26463, 270)

        set p = Player(7)
        // 三个送死的小鱼人
        set MovieDummyUnit[105] = CreateUnit(p, 'nmcf', - 24227, - 23229 , 302.43)
        call RemoveGuardPosition(MovieDummyUnit[105])
        call SetWidgetLife(MovieDummyUnit[105], 50)
        set MovieDummyUnit[106] = CreateUnit(p, 'nmcf', - 24059, - 23311 , 276.04)
        call RemoveGuardPosition(MovieDummyUnit[106])
        call SetWidgetLife(MovieDummyUnit[106], 50)
        set MovieDummyUnit[107] = CreateUnit(p, 'nmcf', - 24244, - 23471 , 313.32)
        call RemoveGuardPosition(MovieDummyUnit[107])
        call SetWidgetLife(MovieDummyUnit[107], 50)

	
        //call SetUnitCreepGuard(MovieDummyUnit[102], false)
    endfunction

    // 电影相关用到的BJ函数均已处理
    // 电影简介
    function IntroCinematicActions takes nothing returns boolean
        //local group findFireCellar
        local string message
        local string cinematicFilterPath = "ReplaceableTextures\\CameraMasks\\Black_mask.blp"
        // 开启电影模式

        call CameraSetupApplyForceDuration(gg_cam_OrgeInitialPoint, true, 0.)

        call SuspendTimeOfDay(true)
        call CinematicModeBJ(true, bj_FORCE_ALL_PLAYERS)
        call CinematicFadeCommonBJ(255, 255, 255, 5, cinematicFilterPath, 0, 100)

        call ClearMapMusic()
        call TriggerSleepAction(0.01)
        call PlayThematicMusic("Sound\\Music\\mp3Music\\Orc2.mp3")
        call SetMapMusic("Music", false, 2)

        // 第一个工人砍树
        call IssueTargetOrder(MovieDummyUnit[101], "harvest", GetNearestDestructable(MovieDummyUnit[101], 300))

        // 第二个工人造火窖
        //call IssueBuildOrderById(MovieDummyUnit[102], 'n003', - 24326, - 25439)
        // 不造了,直接造假
        // 背着木头造假更带感
        call AddUnitAnimationProperties(MovieDummyUnit[102] , "Ready Lumber", true)
        call SetUnitAnimation(MovieDummyUnit[102], "Stand Work Lumber")

        call TriggerSleepAction(0.5)

        call VolumeGroupResetBJ()
        // 偷懒一下 通过单位组直接寻找到火窖
        //set findFireCellar = LoginGroup()
        //call GroupEnumUnitsOfType(findFireCellar, UnitId2String('n003'), null)
        //set MovieDummyUnit[103] = FirstOfGroup(findFireCellar)
        //call SetUnitAnimation(MovieDummyUnit[103], "Decay")
        //call LogoutGroup(findFireCellar)
        //set findFireCellar = null

        call DisplayTextToPlayer(LocalPlayer, 0, 0, "菊花打败9D，进入传送门后...")
        call TriggerSleepAction(4.5)
        // 关闭滤镜
        call DisplayCineFilter(false)

        call TriggerSleepAction(1.)

        // 先让菊花吼一下
        call AttachSoundToUnit(gg_snd_OgreYesAttack3, MovieDummyUnit[1])
        call StartSound(gg_snd_OgreYesAttack3)

        call TriggerSleepAction(0.3)
        // 再让菊花起来
        call UnitWakeUp(MovieDummyUnit[1])
        call UnitRemoveAbility(MovieDummyUnit[1], 'Asla')

        call TriggerSleepAction(0.2)
        call IssueImmediateOrder(MovieDummyUnit[101], "Stop")
        call SetUnitFacing(MovieDummyUnit[101], 257)

        call TriggerSleepAction(0.4)
        call SetUnitAnimation(MovieDummyUnit[1], "Stand")
        call QueueUnitAnimation(MovieDummyUnit[1], "Stand Ready")

        call TriggerSleepAction(0.2)
        // 工人1靠近菊花
        call IssuePointOrder(MovieDummyUnit[101], "Move", - 24832, - 25139)

        set message = "它醒了，快去和老板报告下。"
        call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_PURPLE, MovieDummyUnit[101], "工人", null, message, 4, false)
        call TriggerSleepAction(0.3)
        call SetUnitFacingTimed(MovieDummyUnit[1], 37, 1)

        call TriggerSleepAction(1)
        // 工人2去找卡尔
        call IssuePointOrder(MovieDummyUnit[102], "Move", - 23150, - 25595)
        call TriggerSleepAction(2.)
        call SetUnitFacingTimed(MovieDummyUnit[1], 93, 1.2)

        set message = "你们是谁，这是什么地方？"
        call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_GREEN, MovieDummyUnit[1], "菊花", null, message, 4, false)
        call TriggerSleepAction(4.)
        // 卡尔再去找菊花
        call IssuePointOrder(MovieDummyUnit[2], "Move", - 24238, - 25093)

        call TriggerSleepAction(0.3)

        call IssuePointOrder(MovieDummyUnit[102], "Move", - 24200, - 25423)

        set message = "我是开尔新材的，我们的老板要和你谈话。"
        call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_PURPLE, MovieDummyUnit[101], "工人", null, message, 5, false)
        call TriggerSleepAction(3.0)
        // 工人1继续砍树
        call IssueTargetOrder(MovieDummyUnit[101], "harvest", GetNearestDestructable(MovieDummyUnit[101], 300))
        call TriggerSleepAction(2.2)

        // 菊花走向卡尔
        call IssuePointOrder(MovieDummyUnit[1], "Move", - 24678, - 25345)
        call TriggerSleepAction(0.5)
        call SetUnitFacing(MovieDummyUnit[2], 231.)

        // 偷懒不用镜头,直接进行一个平移
        call PanCameraToTimed(- 24238, - 25093, 2.0)

        call TriggerSleepAction(0.5)

        call TriggerSleepAction(0.8)

        set message = "卡尔？这里是哪里？"
        call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_GREEN, MovieDummyUnit[1], "菊花", null, message, 3, false)
	
        call TriggerSleepAction(0.2)
        call SetUnitFacing(MovieDummyUnit[102], 173)
        call TriggerSleepAction(0.5)
        call SetUnitAnimation(MovieDummyUnit[102], "Stand Work")
        call TriggerSleepAction(2.5)

        set message = "菊花，好久不见，我们现在正处于一座岛上，这里是9D的基地。"
        call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_PURPLE, MovieDummyUnit[2], "卡尔", null, message, 5.5, false)

        call TriggerSleepAction(5.5)
        set message = "9D？他已经被我打败了..."
        call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_GREEN, MovieDummyUnit[1], "菊花", null, message, 4, false)

        // 工人2假装自己加了火
        call SetUnitAnimation(MovieDummyUnit[103], "Stand")
        call AddUnitAnimationProperties(MovieDummyUnit[102] , "Ready Lumber", false)
        call TriggerSleepAction(0.5)
        call SetUnitAnimation(MovieDummyUnit[102], "Stand")
        call TriggerSleepAction(1.)
        // 工人2也去砍树
        call IssueTargetOrder(MovieDummyUnit[102], "harvest", GetNearestDestructable(MovieDummyUnit[102], 500))

        call TriggerSleepAction(3.5)
        set message = "9D并没有死，现在他就在这座岛上，你击败的只是一个“猪人”。"
        call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_PURPLE, MovieDummyUnit[2], "卡尔", null, message, 5.0, false)
        call TriggerSleepAction(5.)

        //set message = "开尔新材当初参与这里的了部分设计，我知道这里有许多废弃的“通道”。我需要你来修理“通道”以确保我们在这座岛上的机动性。"
        //call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_PURPLE, MovieDummyUnit[2], "卡尔", null, message, 9., false)
        //call TriggerSleepAction(9.)
        set message = "你可以理解为测试或者是筛选，9D想要养猪你。"
        call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_PURPLE, MovieDummyUnit[2], "卡尔", null, message, 4.5, false)
        call TriggerSleepAction(4.5)

        set message = "太阴暗了，那我们要怎么对付他呢，我们两个和你的手下吗？"
        call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_GREEN, MovieDummyUnit[1], "菊花", null, message, 5, false)

        call TriggerSleepAction(5.0)
        // 偷懒不用镜头,再进行一个平移
        //call PanCameraToTimed(- 24238, - 25093, 1.0)

        set message = "跟我来。"
        call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_PURPLE, MovieDummyUnit[2], "卡尔", null, message, 2., false)
        call TriggerSleepAction(1.0)

        // 卡尔跑路
        call IssuePointOrder(MovieDummyUnit[2], "Move", - 23069, - 25771)

        // 锁定镜头到卡尔
        call SetCameraTargetController(MovieDummyUnit[2], 0, 0, true)

        call TriggerSleepAction(0.7)
        call IssuePointOrder(MovieDummyUnit[1], "Move", - 23212, - 25913)

        call TriggerSleepAction(3.2)
        //call ResetToGameCamera(0)
        // 小天靠近卡尔
        call IssuePointOrder(MovieDummyUnit[5], "Move", - 22906, - 25970)

        call TriggerSleepAction(0.2)
	
        // 偷懒不用镜头,双进行一个平移
        call PanCameraToTimedWithZ(- 22820, - 26100, 325, 0.8)
        // 零重找卡尔
        call IssuePointOrder(MovieDummyUnit[3], "Move", - 22699, - 25891)
        call TriggerSleepAction(0.1)

        set message = "给大家介绍一下，这位是我以前的工友，“通道修理者”菊花。"
        call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_PURPLE, MovieDummyUnit[2], "卡尔", null, message, 5, false)
        //call SetUnitFacing(MovieDummyUnit[2], 241.32)
        call SetUnitLookAt(MovieDummyUnit[2], "bone_head", MovieDummyUnit[3], 0, 0, 80.)

        // 光靠近卡尔
        call IssuePointOrder(MovieDummyUnit[6], "Move", - 22606, - 25601)
        call TriggerSleepAction(0.3)


        // 偷税师靠近卡尔
        call IssuePointOrder(MovieDummyUnit[4], "Move", - 22719, - 26101)
        call TriggerSleepAction(0.2)
        call SetUnitFacing(MovieDummyUnit[1], 16)
        // 仓鼠靠近卡尔
        call IssuePointOrder(MovieDummyUnit[7], "Move", - 22586, - 25711)

        call TriggerSleepAction(2.5)
        call SetUnitFacing(MovieDummyUnit[6], 206.72)

        call TriggerSleepAction(1.0)
        call SetUnitFacing(MovieDummyUnit[1], 334.86)
        call TriggerSleepAction(1.0)

        set message = "这些人是谁，你的手下员工？"
        call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_GREEN, MovieDummyUnit[1], "菊花", null, message, 3., false)

        call TriggerSleepAction(1.)
        call SetUnitLookAt(MovieDummyUnit[2], "bone_head", MovieDummyUnit[1], 0, 0, 80.)

        call TriggerSleepAction(2.)
        set message = "不是，他们是和你一样“击败”了9D的人。"
        call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_PURPLE, MovieDummyUnit[2], "卡尔", null, message, 4., false)
        call TriggerSleepAction(0.5)
        call SetUnitFacingTimed(MovieDummyUnit[2], 355.76, 1.2)

        call ResetUnitLookAt(MovieDummyUnit[2])
	
        call TriggerSleepAction(3.5)
        set message = "你好，通道修理者，我叫零重祈愿。我早就听说你的名号了。"
        call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_BLUE, MovieDummyUnit[3], "零重祈愿", null, message, 5.5, false)
        call TriggerSleepAction(0.4)
        call SetUnitFacing(MovieDummyUnit[1], 359.72)
        call TriggerSleepAction(4.5)

        // 滤镜再来！
        call CinematicFadeCommonBJ(255, 255, 255, 2, cinematicFilterPath, 100, 0)


        // 鱼人碰瓷 然后工人250移速开挂跑
        call TriggerSleepAction(0.5)
        call DisplayTextToPlayer(LocalPlayer, 0, 0, "众人自我介绍后...")
        call IssuePointOrder(MovieDummyUnit[105], "attack", - 22820, - 26000)
        call IssuePointOrder(MovieDummyUnit[106], "attack", - 22820, - 26000)
        call IssuePointOrder(MovieDummyUnit[107], "attack", - 22820, - 26000)
        call TriggerSleepAction(1.5)
        call ResetToGameCamera(0)
        call SetCameraTargetController(MovieDummyUnit[104], 0, 0, true)
        call IssuePointOrder(MovieDummyUnit[104], "Move", - 22820, - 26000)
        // 瞬间跑的飞起
        call CinematicFadeCommonBJ(255, 255, 255, 5, cinematicFilterPath, 0, 100)
        call SetUnitMoveSpeed(MovieDummyUnit[104], 250)
        call TriggerSleepAction(5.0)
        // 关闭滤镜
        call DisplayCineFilter(false)

        set message = "大爷们，帮帮我。"
        call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_PURPLE, MovieDummyUnit[104], "工人", null, message, 3.5, false)
        call TriggerSleepAction(3.5)
	
        set message = "这都是从哪里冒出来的？"
        call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_GREEN, MovieDummyUnit[1], "菊花", null, message, 4, false)

        call PanCameraToTimed(GetUnitX(TavernUnit[1]), GetUnitY(TavernUnit[1]), 1.3)
        call TriggerSleepAction(2.0)
        // 工人3继续砍树 正常移速
        call IssueTargetOrder(MovieDummyUnit[104], "harvest", GetNearestDestructable(MovieDummyUnit[104], 600))
        call SetUnitMoveSpeed(MovieDummyUnit[104], 190)
        call TriggerSleepAction(2.0)

        set message = "鱼人在附近有个营地，在你昏迷时我们就被袭击多次了，我们需要摧毁它，不然会一直受到骚扰。"
        call TransmissionFromUnitWithNameBJ(PLAYER_COLOR_BLUE, MovieDummyUnit[7], "牧师", null, message, 7, false)
        call TriggerSleepAction(7.)
	
        call ResetToGameCamera(0)


        // 电影结束
        call CinematicFadeCommonBJ(255, 255, 255, 2, cinematicFilterPath, 100, 0)
        call TriggerSleepAction(2.)

        call ShowUnit(MovieDummyUnit[1], false)
        call ShowUnit(MovieDummyUnit[2], false)
        call ShowUnit(MovieDummyUnit[3], false)
        call ShowUnit(MovieDummyUnit[4], false)
        call ShowUnit(MovieDummyUnit[5], false)
        call ShowUnit(MovieDummyUnit[7], false)
        call ShowUnit(MovieDummyUnit[6], false)


        call CinematicFadeCommonBJ(255, 255, 255, 3, cinematicFilterPath, 0, 100)
        call TriggerSleepAction(3.)
        call DisplayCineFilter(false)

        // 关闭电影模式
        call SuspendTimeOfDay(false)
        call CinematicModeBJ(false, bj_FORCE_ALL_PLAYERS)
        call SelectUnit(TavernUnit[1], true)

        //电影结束
        //call ShowUnit(TavernUnit[1], false)
        call TriggerSleepAction(bj_QUEUE_DELAY_QUEST)
        call QuestMessageBJ(bj_FORCE_ALL_PLAYERS, bj_QUESTMESSAGE_DISCOVERED, "|cffffcc00主要任务|r
        探索岛屿")

        call ClearTrigger(GetTriggeringTrigger())
        return false
    endfunction

    private function Init takes nothing returns nothing
        local trigger trig = CreateTrigger()
        call TriggerAddAction(trig, function IntroCinematicActions)
        //call TriggerExecute(trig)
        set trig = null
    endfunction


endscope
