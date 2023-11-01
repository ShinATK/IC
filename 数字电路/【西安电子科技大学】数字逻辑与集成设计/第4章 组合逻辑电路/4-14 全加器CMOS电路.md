#### 加法器——全加器CMOS电路
![[Pasted image 20220720210028.png]]
$C_o=AB+BC_i+AC_i=AB+(A+B)C_i \to X=\overline{C_o}$
（为了快点得到进位，所以有单独的一个$C_o$作为进位计算，从而提前进行高位的运算）
最后通过反相器得到S的值：$S=ABC_i+\overline{C_o}(A+B+C_i)$

#### 加法器——全加器AOI电路(AND、OR、INV)
![[Pasted image 20220720210747.png]]

#### 加法器——镜像全加器电路
![[Pasted image 20220720210832.png]]
