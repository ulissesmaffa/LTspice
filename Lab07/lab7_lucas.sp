*incluir o modelo para os transistores NMOS e PMOS
.include tsmc035.mod
*subcircuito de um inversor
.subckt inv in out vdd
MP1 out in vdd vdd pmos l=0.35U W=4U AD=6.0P AS=6.0P PD=7.0U PS=7.0U
MN2 out in 0 0 nmos l=0.35U W=2U AD=3.0P AS=3.0P PD=7.0U PS=7.0U
.ends inv
* subcircuito do flip-flop
.subckt flipflop d q clk vdd
M1 0 d x 0 nmos l=0.35U W=2U AD=7.3P AS=7.3P PD=7.7U PS=7.7U
M2 x clk 1 vdd pmos l=0.35U W=4U AD=10.0P AS=10.0P PD=9.0U PS=9.0U
M3 1 d vdd vdd pmos l=0.35U W=4U AD=10.0P AS=10.0P PD=9.0U PS=9.0U
M4 0 clk 2 0 nmos l=0.35U W=2U AD=7.3P AS=7.3P PD=7.7U PS=7.7U
M5 2 x y 0 nmos l=0.35U W=2U AD=7.3P AS=7.3P PD=7.7U PS=7.7U
M6 y clk vdd vdd pmos l=0.35U W=4U AD=10.0P AS=10.0P PD=9.0U PS=9.0U
M7 0 y 3 0 nmos l=0.35U W=2U AD=7.3P AS=7.3P PD=7.7U PS=7.7U
M8 3 clk nq 0 nmos l=0.35U W=2U AD=7.3P AS=7.3P PD=7.7U PS=7.7U
M9 nq y vdd vdd pmos l=0.35U W=4U AD=10.0P AS=10.0P PD=9.0U PS=9.0U
X1 nq q vdd inv
.ends flipflop
* instancia do flipflop
X1 D Q clk vdd flipflop
*carga da saída

C1 Q 0 20fF
* fonte de alimentacao
vc vdd 0 dc 3.3
* sinal de estimulo da entrada D
v1 D 0 pwl( 0n 0 0.2n 0
+ 0.3n 3.3 0.7n 3.3
+ 0.8n 0 1.1n 0
+ 1.2n 3.3 1.3n 3.3
+ 1.4n 0 1.9n 0
+ 2.0n 3.3 2.5n 3.3
+ 2.6n 0 2.8n 0
+ 2.9n 3.3 3.3n 3.3
+ 3.4n 0 3.5n 0
+ 3.6n 3.3 3.9n 3.3
+ 4.0n 0 5n 0)
* sinal de relogio (onda quadrada)
vk clk 0 pulse(0 3.3 0.5n 0.05n 0.05n 0.5n 1n)
.ic v(nq)=3.3 v(q)=0 
*simulacao transitoria
.tran .05N 10N
.end