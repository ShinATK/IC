### 复习线性系统和时不变系统的定义

**线性系统**：
- 齐次性：$$\forall x[n] \rightarrow y[n], then \ ax[n] \rightarrow y[n], a \in \mathcal{R}$$
- 叠加性：$$\forall x_1[n] \rightarrow y_1[n], \forall x_2[n] \rightarrow y[n], then \ x_1[n]+x_2[n] \rightarrow y_1[n]+y_2[n]$$

**时不变系统**：$$\forall x[n] \rightarrow y[n], then \  x[n-n_0] \rightarrow y[n-n_0], n_0 \in \mathcal{Z}$$

- 例：$x[n] \rightarrow \mathbf{LTI} \rightarrow y[n]$
	- 根据线性系统的**齐次性**即可直接得到**输出结果同样变为2倍的结论**![[Pasted image 20231012211431.png]]

- ![[Pasted image 20231012212605.png]]
- ![[Pasted image 20231012212610.png]]

$h[n]$**是LTI系统的唯一标识**（注意是LTI系统）
- 如果两个**LTI系统**的$h[n]$，即单位脉冲相应完全一样，则这两个**LTI系统**是完全一样的
- 但如果随便两个系统的$h[n]$一样，这两个系统不一定一样

$$x[n] \overset{LTI}{\rightarrow} y[n] = x[n] \ast h[n]$$

### 出题方式

- 第一种：![[Pasted image 20231013212921.png]]
- 第二种：![[Pasted image 20231013212931.png]]


#### 列表法

1. 确定$y[n]=x[n] \ast h[n]$的取值范围，$y[n]最左边（最右边）= x[n]最左边（最右边）+ h[n]最左边（最右边）$

| h\[n\]     | 1   | 1   | 2   | -1  |     |     |     |
| ---------- | --- | --- | --- | --- | --- | --- | --- |
| 3          | 3   | 3   | 6   | -3  |     |     |     |
| 2          |     | 2   | 2   | 4   | -2  |     |     |
| 1          |     |     | 1   | 1   | 2   | -1  |     |
| -1         |     |     |     | -1  | -1  | -2  | 1   |
| 求和y\[n\] | 3   | 5   | 9   | 1   | -1  | -3  | 1   |
| n          | -2  | -1  | 0   | 1   | 2   | 3   | 4    |

- 若$x[n]$长度为$N_1$，$h[n]$长度为$N_2$，则$y[n] = x[n] \ast h[n]$长度为$N_1+N_2-1$



#### 卷积计算公式

$$x[n] \ast h[n] = \sum\limits^{+\infty}_{k=-\infty} {x[k]h[n-k]}$$

- **证明1**：
	先证明：$$x[n] = \sum\limits^{+\infty}_{k=-\infty}{x[k]\delta[n-k]}$$
	$$\begin{align}
	
	& \delta[n] \overset{LTI}{\rightarrow} h[n] \\
	& \delta[n-k] \overset{LTI}{\rightarrow} h[n-k] \\
	& x[k]\delta[n-k] \overset{LTI}{\rightarrow} x[k]h[n-k], \quad齐次性 \\
	& x[n]=\sum\limits^{+\infty}_{k=-\infty}{x[k]\delta[n-k]} \overset{LTI}{\rightarrow} \sum\limits^{+\infty}_{k=-\infty}{x[k]h[n-k]}, \quad 叠加性
	
	\end{align}$$
- **证明2**：利用卷积公式法
	$$\begin{align}
	x[n] \ast h[n] &= \sum\limits^{+\infty}_{k=-\infty} {x[k]h[n-k]}\\
	&=\sum x[k]h[-(k-n)]
	\end{align}$$
	- 翻转（h中化为k-n后提出的负号）、平移（k-n）、相乘（x与h）、求和（最外的求和符号）
	- 上边这四步，可以与上边的列表法结合来看，列表法其实就是这四个步骤可视化展现

> **这一个方法多看几遍**

- 是$h[n]$翻转，不是$x[n]$翻转
- 翻转谁，平移谁