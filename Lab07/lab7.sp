*Lab7 Fundamentos de CI
*Ulisses Maffazioli

*incluir o modelo para os transistores NMOS e PMOS
.include tsmc035.mod

*inversor
MP1 vdd nq q  vdd pmos l=0.35U W=3U AD=6.0P AS=6.0P PD=7.0U PS=7.0U
MN2 q   nq 0  0   nmos l=0.35U W=1.5U AD=3.0P AS=3.0P PD=7.0U PS=7.0U

*transistores
M3 vdd d   1   vdd pmos l=0.35U W=4U AD=6.0P AS=6.0P PD=7.0U PS=7.0U
M2 1   ck  x   vdd pmos l=0.35U W=4U AD=6.0P AS=6.0P PD=7.0U PS=7.0U
M1 x   d   0   0   nmos l=0.35U W=2U AD=3.0P AS=3.0P PD=7.0U PS=7.0U

M6 vdd ck  y   vdd pmos l=0.35U W=4U AD=6.0P AS=6.0P PD=7.0U PS=7.0U
M5 y   x   2   0   nmos l=0.35U W=2U AD=3.0P AS=3.0P PD=7.0U PS=7.0U
M4 2   ck  0   0   nmos l=0.35U W=2U AD=3.0P AS=3.0P PD=7.0U PS=7.0U

M9 vdd y   nq  vdd pmos l=0.35U W=4U AD=6.0P AS=6.0P PD=7.0U PS=7.0U
M8 nq  ck  3   0   nmos l=0.35U W=2U AD=3.0P AS=3.0P PD=7.0U PS=7.0U
M7 3   y   0   0   nmos l=0.35U W=2U AD=3.0P AS=3.0P PD=7.0U PS=7.0U

*sinal nq=1
.ic v(nq)=3.3 v(q)=0

*carga para saida q
C1 q 0 20fF

* fonte de alimentacao
vc vdd 0 dc 3.3

* sinal de estimulo da entrada D
v1 d 0 pwl(    0n 0 0.2n 0
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
vk ck 0 pulse(0 3.3 0.5n 0.05n 0.05n 0.5n 1n)

*simulacao transitoria
.tran .01N 5N

.end