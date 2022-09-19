* Circuitos Latchs - uso de portas sequenciais
*
* Joao Leonardo Fragoso - Uergs
* versao LTSpice XVII

*incluir o modelo para os transistores NMOS e PMOS
.include tsmc035.mod

*subcircuito de um inversor
.subckt inv in out vdd
MP1  out in vdd vdd pmos l=0.35U W=3U AD=6.0P AS=6.0P PD=7.0U PS=7.0U
MN2  out in 0   0   nmos l=0.35U W=1.5U AD=3.0P AS=3.0P PD=7.0U PS=7.0U
.ends inv

*subcircuito de uma transmission gate (porta de transmissao)
.subckt tg a ctrl n_ctrl out vdd
MP2 a  n_ctrl out vdd pmos l=0.35U W=3.0U AD=6.0P AS=6.0P PD=7.0U PS=7.0U
MN2 a   ctrl  out 0   nmos l=0.35U W=1.5U AD=3.0P AS=3.0P PD=7.0U PS=7.0U
.ends tg

* subcircuito do ffd ms
.subckt ffd d q nq ck vdd
*FFD1 - PARTE 1
X0 ck nck   vdd inv
X1 o1 o2    vdd inv
X2 o2 o3    vdd inv
X3 d  nck ck  o1 vdd tg
X4 o3 ck  nck o1 vdd tg
*FFD1 - PARTE 2
X5 o4 q    vdd inv
X6 q  d   vdd inv
X7 o2 ck  nck  o4 vdd tg
X8 d nck ck   o4 vdd tg
.ends ffd

*circuito de ensaio
*instancia do Latch 1
X1 D q1 nq1 clk vdd ffd
X2 D q2 nq2 q1 vdd ffd
X3 D q3 nq3 q2 vdd ffd
X4 D q4 nq4 q3 vdd ffd
* cargas para os latches
C1 q1 0 50fF
C2 nq1 0 50fF

C3 q2 0 50fF
C4 nq2 0 50fF

C5 q3 0 50fF
C6 nq3 0 50fF

C7 q4 0 50fF
C8 nq4 0 50fF

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
*vk  clk  0 pulse( 0 3.3 0 .1N .1N 10N 20N)
*clock 1GHz
vk clk 0 pulse( 0 3.3 0 .05n .05n 0.5n 1n)

*simulacao transitoria
.tran .01N 10N

.end
