*Lab7 Fundamentos de CI
*Ulisses Maffazioli

*incluir o modelo para os transistores NMOS e PMOS
.include tsmc035.mod

*inversor
.subckt inv in out vdd
MP1 out in vdd vdd pmos l=0.35U W=3U AD=6.0P AS=6.0P PD=7.0U PS=7.0U
MN2 out in 0   0   nmos l=0.35U W=1.5U AD=3.0P AS=3.0P PD=7.0U PS=7.0U
.ends inv

*nand2
.subckt nand2 e1 e2 z vdd
M1   z e1 vdd vdd pmos l=0.35U W=3.0U AD=10.0P AS=10.0P PD=9.0U PS=9.0U
M2   z e2 vdd vdd pmos l=0.35U W=3.0U AD=10.0P AS=10.0P PD=9.0U PS=9.0U
M3   0  e1 2   0  nmos l=0.35U W=3.0U AD=7.3P AS=7.3P PD=7.7U PS=7.7U
M4   2  e2 z   0  nmos l=0.35U W=3.0U AD=7.3P AS=7.3P PD=7.7U PS=7.7U
.ends nand2

*relogio pulsado
.subckt rel_p ck ckg vdd
*INVERSORES
X0 ck 1  vdd inv
X1 1  2  vdd inv
X2 2  3  vdd inv
X4 4 ckg vdd inv
X5 4 ckg vdd inv
*NAND
X3 ck 3 4 vdd nand2
.ends rel_p
X6 clk ckg1 vdd rel_p

*TSPC
.subckt tspc d q ckg vdd
M3 vdd d   x   vdd pmos l=0.35U W=4U AD=6.0P AS=6.0P PD=7.0U PS=7.0U
M2 x  ckg  1   0   nmos l=0.35U W=1.5U AD=3.0P AS=3.0P PD=7.0U PS=7.0U
M1 1   d   0   0   nmos l=0.35U W=1.5U AD=3.0P AS=3.0P PD=7.0U PS=7.0U

M6 vdd  x   q   vdd pmos l=0.35U W=4U AD=6.0P AS=6.0P PD=7.0U PS=7.0U
M5 q   ckg  2   0   nmos l=0.35U W=1.5U AD=3.0P AS=3.0P PD=7.0U PS=7.0U
M4 2    x   0   0   nmos l=0.35U W=1.5U AD=3.0P AS=3.0P PD=7.0U PS=7.0U
.ends tspc
X7 d1 q1 ckg1 vdd tspc

*sinal nq=1
.ic v(nq)=3.3 v(q)=0

*carga para saida q
C1 q1 0 5fF

* fonte de alimentacao
vc vdd 0 dc 3.3

* sinal de estimulo da entrada D
v1 d1 0 pwl(    0n 0 0.2n 0
+   0.3n 3.3 0.7n 3.3
+   0.8n 0 1.1n 0
+   1.2n 3.3 1.3n 3.3
+   1.4n 0 1.9n 0
+   2.0n 3.3 2.5n 3.3
+   2.6n 0 2.8n 0
+   2.9n 3.3 3.3n 3.3
+   3.4n 0 3.5n 0
+   3.6n 3.3 3.9n 3.3
+   4.0n 0 5n 0
+           )

*clock 1GHz
vk clk 0 pulse(0 3.3 0.5n 0.05n 0.05n 0.5n 1n)

*simulacao transitoria
.tran .01N 5N

.end
