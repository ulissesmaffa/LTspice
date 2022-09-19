* Circuitos Latchs - uso de portas sequenciais
*
* Joao Leonardo Fragoso - Uergs
* versao LTSpice XVII

*incluir o modelo para os transistores NMOS e PMOS
.include tsmc035.mod

*subcircuito de um inversor
.subckt inv in out vdd
MP1  out in vdd vdd pmos l=0.35U W=3.0U AD=6.0P AS=6.0P PD=7.0U PS=7.0U
MN2  out in 0   0   nmos l=0.35U W=1.5U AD=3.0P AS=3.0P PD=7.0U PS=7.0U
.ends inv

*subcircuito de uma transmission gate (porta de transmissao)
.subckt tg a ctrl n_ctrl out vdd
MP2 a  n_ctrl out vdd pmos l=0.35U W=3.0U AD=6.0P AS=6.0P PD=7.0U PS=7.0U
MN2 a   ctrl  out 0   nmos l=0.35U W=1.5U AD=3.0P AS=3.0P PD=7.0U PS=7.0U
.ends tg

* subcircuito do latch 1
* versao 1 do latch usando transmission gates
.subckt latch1 d q ck vdd
X1 o1 o2    vdd inv
X2 o2 q     vdd inv
X3 ck nck   vdd inv
X4 d  nck  ck o1 vdd tg
X5 q   ck nck o1 vdd tg
.ends latch1

* subcircuito do latch 2
* versao 2 do latch usando transistor N e P
.subckt latch2 d q ck vdd
X1 o1 o2    vdd inv
X2 o2 q     vdd inv
MP2 d  ck o1 vdd pmos l=0.35U W=3.0U AD=6.0P AS=6.0P PD=7.0U PS=7.0U
MN2 q  ck o1 0   nmos l=0.35U W=1.5U AD=3.0P AS=3.0P PD=7.0U PS=7.0U
.ends latch2

*circuito de ensaio
*instancia do Latch 1
X1 D q1 clk vdd latch1
*instancia do Latch 2
X2 D q2 clk vdd latch2

* cargas para os latches
C1 q1 0 50fF
C2 q2 0 50fF

* fonte de alimentacao
vc vdd 0 dc 3.3
* sinal de estimulo da entrada D
v1 D 0 pwl(    0n    0   2n   0
+            2.1n  3.3   4n 3.3
+            4.1n    0   8n   0
+            8.1n  3.3  11n 3.3
+           11.1n    0  13n   0
+           13.1n  3.3  15n 3.3
+           15.1n    0  17n   0
+           17.1n  3.3  19n 3.3
+           19.1n    0  28n   0
+           28.1n  3.3  42n 3.3
+           42.1n    0  45n   0
+           45.1n  3.3  50n 3.3
+           50.1n    0  60n   0
+           60.1n  3.3  79n 3.3
+           79.1n    0 )
* sinal de relogio (onda quadrada)
vk  clk  0 pulse( 0 3.3 0 .1N .1N 10N 20N)

*simulacao transitoria
.tran .05N 100N

.end
