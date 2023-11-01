#### 钟控JK触发器
![[Pasted image 20220721104902.png]]
- $钟控JK触发器输入方程：$ $$S_D=\overline{J\overline{Q^n}\cdot CP},R_D=\overline{KQ^n\cdot CP}$$
	1. $当CP=0时，C、D门被封锁，S_D、R_D被锁死在1，触发器维持；$
	2. $当CP=1时，S_D=\overline{J\overline{Q^n}}，R_D=\overline{KQ^n}，钟控JK触发器的特征方程为：Q^{n+1}=\overline{S_D}+R_DQ^n=J\overline{Q^n}+\overline{K}Q^n$
- 状态表：![[Pasted image 20220721105527.png]]
- 激励表：![[Pasted image 20220721105651.png]]
- 状态图：![[Pasted image 20220721105817.png]]
- $JK$触发器具有*保持、置1、置0和翻转功能*
- $J\neq K$时，相当于RS触发器；
- $J=K$时，相当于*T触发器*

#### 钟控$T$触发器和$T'$触发器
![[Pasted image 20220721105937.png]]
- $钟控T触发器输入方程：S_D=\overline{T\overline{Q^n}\cdot CP},R_D=\overline{TQ^n\cdot CP}$
	1. $当CP=0时，C、D门被封锁，S_D、R_D锁死在1，触发器维持；$
	2. $当CP=1时，S_D=\overline{T\overline{Q^n}},R_D=\overline{TQ^n}，钟控T触发器的特征方程：Q^{n+1}=\overline{S_D}+R_DQ^n=T\overline{Q^n}+\overline{TQ^n}Q^n=T\overline{Q^n}+\overline{T}Q^n=T\oplus Q^n$
	- 也没有RS触发器的约束条件
- 状态表：![[Pasted image 20220721110742.png]]
- 激励表：![[Pasted image 20220721110758.png]]
- 状态图：![[Pasted image 20220721110806.png]]
- 钟控T触发器在T=0时保持；
- 钟控T触发器在T=1时翻转

#### 钟控$T'$触发器（计数触发器）
![[Pasted image 20220721110901.png]]
- 将T触发器的T端接高电平或悬空，即为$T'$触发器
	- CP每作用一次，$T'$触发器就翻转一次
	- ![[Pasted image 20220721111025.png]]

#### 不同逻辑功能的触发器小结
![[Pasted image 20220721111103.png]]
![[Pasted image 20220721111108.png]]