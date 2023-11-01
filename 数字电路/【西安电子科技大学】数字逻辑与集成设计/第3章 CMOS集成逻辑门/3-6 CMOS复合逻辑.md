#### 通用设计规则
 *使用低电平控制的开关（**P管**）输出高电平
 使用高电平控制的开关（**N管**）输出低电平*
- **CMOS符合逻辑门：** 利用N管与P管的不同连接关系，设计任意符合逻辑运算。
	1. 将任意逻辑函数编程反函数的形式：$F=\overline{G}$；
	2. 对逻辑函数G：
		- <font color=blue>NMOS</font>网络：<font color=blue>与</font>运算对应<font color=blue>串联</font>，<font color=red>或</font>运算对应<font color=red>并联</font>；
		- <font color=red>PMOS</font>网络：<font color=red>与</font>运算对应<font color=red>并联</font>，<font color=blue>或</font>运算对应<font color=blue>串联</font>；
		- （与运算：N串P并；或运算：N并P串）
		- **（N管：与串或并；P管：与并或串）**
	3. NMOS网络连接”地“与输出，PMOS网络连接电源与输出；
	4. 即可得F的CMOS电路
- 例：画出逻辑函数$F=(\overline{a}+\overline{b}) \cdot (\overline{a}+\overline{c}) \cdot (\overline{b}+\overline{d})$的CMOS电路图。
	1. 化简![[Pasted image 20220720112742.png]]P管：pull up network，N管：pull down network
	2. 不化简（*多用一个非门（反相器）*）![[Pasted image 20220720113158.png]]
- **与或非/或与非**![[Pasted image 20220720113454.png]]
- **异或/同或**
	- **异或**：$F=A \oplus B=(A \cdot \overline{B}) + (\overline{A} \cdot B)=\overline{A \odot B}$![[Pasted image 20220720114222.png]]
	- **同或**：$F=A \odot B=A \cdot B+\overline{A} \cdot \overline{B}=\overline{A \oplus B}$![[Pasted image 20220720114227.png]]
#### 深入理解
![[Pasted image 20220720114516.png]]