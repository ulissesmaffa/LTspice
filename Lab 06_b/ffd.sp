* Circuitos Latchs - uso de portas sequenciais
*
* Joao Leonardo Fragoso - Uergs
* versao LTSpice XVII

*incluir o modelo para os transistores NMOS e PMOS
.include tsmc035.mod

*subcircuito de um inversor
.subckt inv in out vdd
MP1  out in vdd vdd pmos l=0.35U W=5.0U AD=6.0P AS=6.0P PD=7.0U PS=7.0U
MN2  out in 0   0   nmos l=0.35U W=3.0U AD=3.0P AS=3.0P PD=7.0U PS=7.0U
.ends inv

*subcircuito de uma transmission gate (porta de transmissao)
.subckt tg a ctrl n_ctrl out vdd
MP2 a  n_ctrl out vdd pmos l=0.35U W=3.0U AD=6.0P AS=6.0P PD=7.0U PS=7.0U
MN2 a  ctrl   out 0   nmos l=0.35U W=1.5U AD=3.0P AS=3.0P PD=7.0U PS=7.0U
.ends tg

.subckt ffd d q t ck vdd
* inversor do clock (nck funcionar)
x0 ck nck vdd inv
*latch 1
X1 d ck nck 1 vdd tg
X2 1 2  vdd inv
X3 2 t  vdd inv
X4 1 nck ck t vdd tg
*latch 2
X5 t nck ck 4 vdd tg
X6 4 5  vdd inv
X7 5 q  vdd inv
X8 4 ck nck q vdd tg
.ic v(t)=0
.ic v(4)=0
.ends ffd

*circuito de ensaio
*instancia do ffd
X9 d1 q1 t1 ck vdd ffd

* carga para ffd
C1 q1 0 50fF
C2 t1 0 50fF

* fonte de alimentacao
vc vdd 0 dc 3.3
* sinal de estimulo da entrada D
v1 d1 0 pwl(
+ 	         0n    0   2n   0
+            2.1n  3.3   3.2n 3.3
+            3.3n    0   6.4n   0
+            6.5n  3.3  11n 3.3
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

.ic v(q1)=0


* sinal de relogio (onda quadrada)
vk  ck  0 pulse( 0 3.3 0 .05N .05N 0.5N 1N)
*vk ck 0 pulse(0 3.3 0 .1N .1N 10N 20N)

*simulacao transitoria
.tran 01N 10N

.end
