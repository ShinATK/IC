- 在时序电路中，经常要求触发器的反转时刻受时钟脉冲控制，而翻转到什么状态输入及现态决定，因此引入了钟控触发器。
- 逻辑功能划分：
	- 钟控RS触发器
	- 钟控D触发器
	- 钟控T触发器
	- 钟控JK触发器

#### 钟控RS触发器
- **此时的有效电平为高电平**
- 逻辑图：![[Pasted image 20220721103246.png]]
- 门级电路图：![[Pasted image 20220721103250.png]]
- 基本RS触发器输入方程：$R_D=\overline{R\cdot CP},S_D=\overline{S\cdot CP}$
	1. $当CP=0时，C、D门被锁死，S_D、R_D锁死在1，触发器维持；$
	2. $当CP=1时，S_D=\overline{S}、R_D=\overline{R}，触发器维持正常工作，状态可翻转；$
	- $钟控RS触发器特征方程：\begin{cases}Q^{n+1}=S+\overline{R}Q^n\\ S\cdot R=0(约束条件)\end{cases}——时钟为1时$
- 状态表：![[Pasted image 20220721103707.png]]
- 激励表：![[Pasted image 20220721103932.png]]
- 总结：
	- 钟控RS触发器**在CP=1时的逻辑功能与基本RS触发器类似**；
	- **只是在复位端R、置位端S为高电平有效**，R=S=0时触发器维持，R=S=1为不可出现的状态。
- 状态图和波形图：
	- ![[Pasted image 20220721104020.png]]
	- 波形图按照CP来划分时段：![[Pasted image 20220721104142.png]]

#### 钟控D触发器
- ![[Pasted image 20220721104248.png]]
- ![[Pasted image 20220721104254.png]]
- $钟控D触发器的输入方程：S_D=\overline{D\cdot CP}，R_D=\overline{S_D\cdot CP}=\overline{\overline{D}\cdot CP}$
	1. $当CP=0时，C、D门被锁死，S_D、R_D锁死在1，触发器维持$
	2. $当CP=1时，S_D=\overline{D}、R_D=D，钟控D触发器的特征方程：Q^{n+1}=\overline{S_D}+R_DQ^n=D+DQ^n=D$
	- 当CP=1时，SD和RD永远不可能同时为11状态，所以没有约束条件
- 状态表：![[Pasted image 20220721104717.png]]
- 激励表：![[Pasted image 20220721104728.png]]
- 状态图：![[Pasted image 20220721104743.png]]
- 钟控D触发器在时钟作用下，次态始终和输入一致