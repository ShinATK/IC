#### 门级钟控触发器
![[Pasted image 20220721111103.png]]


#### CMOS钟控触发器
- CMOS钟控D触发器（**基本只用D触发器，因为触发器只用于状态切换，而不用与逻辑运算**）![[Pasted image 20220721111547.png]]
	- 单管传输门开关：
		- <font color=green>优点：晶体管数量少</font>
		- <font color=red>缺点：有阈值电压损失</font>
	- 双管传输管开关：
		- <font color=green>优点：无阈值电压损失</font>
		- <font color=red>缺点：晶体管数量多</font>
- 另一种形式和理解：![[Pasted image 20220721111919.png]]
	- CP=1时，D→Q，接收
	- CP=0时，Qn+1=Qn，保持
	- ![[Pasted image 20220721112024.png]]
- **正/负锁存器**
	- ![[Pasted image 20220721112302.png]]
	- <font color=red>缺点：（一半时间接收一半时间保持）接收时间太长，抗干扰能力弱</font>