​    

#  神秘之岛(基佬之岛)

## 简介

神秘之岛是一张基于《魔兽争霸III》的RPG地图。

主要使用工具  YDWE1.32 和 W3X2lni 制作。

魔兽版本支持1.27，需要在Japi环境下运行。

本说明假定你已经掌握了jass的相关语法，有关语法的问题不再另行解释。

[toc]

## 代码

此地图绝大部分由Jass编写，会有少量Lua，但仅涉及到hook库和message库。

注意：Jass部分是原生Jass而不是VJass。

但在本说明中引用代码，声明全局变量时，会以globals endglobals的形式来写出

### 单位组(Group)

在本地图中，单位组会在初始化时就创建完毕，正常游戏基本只会使用到初始化时创建的这些单位组。

在Main中 call CreateMainGroup() 即创建所需单位组。

LoginGroup()  对应 CreateGroup()

LogoutGroup(g) 对应 DestroyGroup(g)

但实际上这么做并不会导致效率的提升，反而会下降。

好处就是并不用担心单位组的Handle不会被释放，因为他们是静态的。

并且可以得知当前地图单位组的使用情况。

## 常用函数

使得触发器加入销毁队列，并不是即使的，所以Handle不会立即回收。

> function ClearTrigger takes trigger t returns nothing

##### 计时器事件触发器

创建一个计时器事件触发器，返回值是触发器的整数地址，需要手动销毁。注意func为触发器的条件Condition而不是动作Action。

> function CreateTimerEventTrigger takes real timeout, boolean periodic, code func returns integer

##### 创建物品

> function EXCreateItem takes integer itemid, real x, real y returns item

##### 给所有玩家单位注册事件

> function TriggerRegisterAnyUnitEventBJ takes trigger t, playerunitevent whichPlayerUnitEvent returns nothing

##### 坐标修正，防止SetUnitXY出了地图

> function CoordinateX takes real x returns real
>
> function CoordinateY takes real y returns real

##### 得到坐标之间的角度

> function AngleBetweenXY takes real x1, real y1, real x2, real y2 returns real

##### 单位之间的角度

> function AngleBetweenUnit takes unit u1, unit u2 returns real

##### 坐标之间的距离

> function GetDistanceBetween takes real x1, real y1, real x2, real y2 returns real

##### 单位之间的距离

> function GetDistanceBetweenUnits takes unit u1, unit u2 returns real

##### 添加技能并且设置永久性

> function UnitAddPermanentAbility takes unit u, integer id returns boolean

##### 添加技能并且设置永久性和技能等级

> function UnitAddPermanentAbilitySetlevel takes unit u, integer id, integer lv returns nothing

##### Prd随机数 取5的整数

> function PrdRandom takes unit u, integer abId, real value returns boolean

##### 恢复

生命恢复和魔法恢复，通过这两个函数来进行。

> function UnitRestoreLife takes unit u, real r returns nothing
>
> function UnitRestoreMana takes unit u, real r returns nothing



### 单位组选取类函数

##### 得到单位组中距离坐标最远的单位

> function GetFarthestUnitByGroup takes group whichGroup, real x, real y returns unit

##### 得到单位组中距离坐标最近的单位

> function GetNearestUnitByGroup takes group whichGroup, real x, real y returns unit

##### 得到单位组中生命值百分比最小的单位

> function GetMinPercentLifeUnitByGroup takes group whichGroup returns unit

##### 得到单位组中生命值最小的单位

> function GetMinLifeUnitByGroup takes group whichGroup returns unit



### 单位属性奖励

还有很多不一一列出，可在j文件中自行查看。

> function UnitSetAttackSpeedBonus takes unit whichUnit, real newValue returns nothing
>
> function UnitSetArmorBonus takes unit whichUnit, real newValue returns nothing
>
> function UnitSetMoveSpeedBonus takes unit whichUnit, real newValue returns nothing
>
> function UnitSetDamageBonus takes unit whichUnit, real newValue returns nothing
>
> function UnitSetStrBonus takes unit whichUnit, integer newValue returns nothing
>
> function UnitSetMaxLife takes unit whichUnit, real newVal returns nothing
>
> function UnitSetMaxMana takes unit whichUnit, real newVal returns nothing



### 可破坏物相关

##### 杀死坐标范围内的可破坏物

> function KillDestructablesInCircle takes real x, real y, real d returns nothing

##### 获取坐标范围内的可破坏物数量(存活)

> function GetDestructablesAmountInCircle takes real x, real y, real d returns integer

##### 获取单位范围内的最近可破坏物

> function GetNearestDestructable takes unit whichUnit, real radius returns destructable



### UI相关

##### 启用新的UI

会额外显示移动速度和攻击速度。(可异步切换)

> function EnableNewUnitStateUI takes boolean enable returns nothing



## 物品系统

#### 物品属性

在本地图中，物品一些常用属性通常由脚本控制，而不是物编。

因为有些物品可能会有超过四个的属性，在以前，我们一般用魔法书来解决这个问题。

现在有了Japi，可以更改技能数据来改善这个问题，避免繁琐的物编。

结合上文，可以实现更加便捷的设置单位额外属性，而不再需要二进制属性系统。

可以使用以下两个函数来给物品设置属性：

> function SetItemAttribute takes integer whichType, integer damage, integer life, integer mana, real armor, real attack returns nothing
>
> function SetItemHeroAttribute takes integer whichType, integer str, integer agi, integer int returns nothing

需要注意的是，设置三围的函数和其他数据的函数是分开来的。

当然，主动技能和一些特殊技能还是需要物编进行添加。

#### 物品的拾取与丢弃

用能量提升类物品来作为可以拾取的物品，丢弃后同样也是。具体可参考DotA，但并不会区分物品所有者。

#### 物品分类

- 正常形态
- 可拾取形态
- 禁用形态

正常形态为单位背包里面的物品，而可拾取形态皆是能量提升物品，禁用形态则没有任何属性加成。

## 单位行为限制

在以前，我们想要让一个技能额外附带晕眩效果，需要创建一个马甲再释放技能。

> native EXPauseUnit takes unit u, boolean flag returns nothing

这个Japi可以做到同等于晕眩和枷锁的行为限制，现在不再需要使用马甲来释放技能了。

在魔兽中，晕眩是有计数的，当计数>0时，单位就会被晕眩。

此函数的flag如果为true，会使计数+1，为false则计数-1。

我用此函数实现了两个单位行为限制，分别是晕眩和枷锁，但是buff只能模拟了。

#### 晕眩

> function UnitSetStun takes unit u, real dur returns boolean

叠加形式为取最大值。

例：

call UnitSetStun (u, 3,)

call UnitSetStun (u, 2)

那么单位u的晕眩时间为2秒。

值得注意的是，该函数没有来源，也就是说无法获知是谁使其晕眩。

我封装了一个上层函数，通常晕眩是由此函数来造成。

> //封装了一层本质上是使用UnitSetStun 参数b为是否无视魔法免疫
>
> function MJ_UnitSetStun takes unit u, real dur, real herodur, boolean b returns boolean

#### 枷锁

> function UnitSetLeash takes unit spellUnit, unit targetUnit, string codeName, integer spellAbility,integer abilityId, integer buffId, real dur, real herodur, real damage, boolean ignoreMagicImmunes returns boolean

注意，这个枷锁是模拟的，并不完美。

一般来讲闪电效果会跟随单位的某个模型附加点，但无法做到，所以闪电效果仅仅是贴着地面，略微诡异。



## 通用技能模板

这些模板通常是仿照原版技能来模拟。

#### 战争践踏

让单位释放一个践踏 目标允许强制为 地面,非机械,非建筑,存活

和原版的区别是不会改变地形(因为会很卡)

> function UnitSpellStmop takes unit whichUnit, real damage, integer damageType, real dur, real herodur, real area, boolean ignoreMagicImmunes, string effectPath returns nothing

#### 光击阵

Dota里的恶魔赦令和光击阵，可以理解为不会召唤地狱火的地狱火技能。

> function UnitSpellLightStrikeArray takes unit whichUnit, real damage, integer damageType, real targetX, real targetY, real radius, real dur, real herodur, boolean ignoreMagicImmunes returns nothing

#### 冲击波

魔兽编辑器里自带的冲击波都不完美，震荡波会改变地形，腐臭蜂群强制黑雾特效。

如果参数area和range的值一样，为矩形冲击波，每次选取的范围一样.range＞area则像食腐蜂群。

单位释放冲击波 - 使用特效来作为投射物

func可以填null,则没有特殊效果,filter如果null则是无差别伤害.

filter就和触发器一样用GetFilterUnit()来进行筛选。

这是由特效模拟的冲击波，不过也有弊端，最大距离不宜过长，否则特效将不显示（大概2000之内）。

> function UnitSpellWaveByEffect takes unit whichUnit, effect missileEffect, real damage, real maxDistance, real area, real range, real startX, real startY, real targetX, real targetY, real missileSpeed, integer damageType, string func, integer level, code filter returns nothing

