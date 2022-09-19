* Inversor - simulacao TRANSITORIA (Width)
* medir o efeito do W no atraso de propagacao
*
* Joao Leonardo Fragoso - Uergs
* versao LTSpice XVII
* inversor - diferentes dimensionamentos de transistor

*incluir o modelo para os transistores NMOS e PMOS
.include tsmc035.mod

*
* descricao do inversor na forma de um subcircuito
*
.subckt inversor in out vdd
M1 out in vdd  vdd   pmos l=0.35e-6 w=wtr  AD=adr   AS=adr  PD=pdr  PS=pdr
M2 out in 0    0     nmos l=0.35e-6 W=2.0U AD=4.0P  AS=4.0P PD=6.0U PS=6.0U
.ends inversor

*
* descricao do circuito
*
* instancia do inversor
X1  iv out vdd inversor
* capacitor como carga na saída
C1  out  0   100fF

*
* fonte de alimentacao 3.3
vdd vdd  0  dc 3.3
* gerador de pulsos na entrada (usado para )
vin1 iv  0  pulse (0 3.3 2n 0.1n 0.1n 5n 10n)

* variado WTR ADR e PDR juntos (usando sim_index)
* sim_index  WTR   ADR   PDR
*      1      2u     4p    6u
*      2      4u     8p    8u
*      3      5u    10p    9u
*      4    5.5u    11p  9.5u
*      5      6u    12p   10u
*      6      8u    16p   12u
.step param sim_index list 1 2 3 4 5 6
.param wtr table(sim_index, 1, 2u, 2, 4u, 3, 5u,  4, 5.5u, 5, 6u,  6, 8u)
.param adr table(sim_index, 1, 4p, 2, 8p, 3, 10p, 4, 11p , 5, 12p, 6, 16p)
.param pdr table(sim_index, 1, 6u, 2, 8u, 3, 9u,  4, 9.5u, 5, 10u, 6, 12u)

* analise transitoria
.tran 0.01N 11N

* mede o atraso de descida do inversor
.measure tran td   trig v(iv)  val=1.65  td=1n rise = 1
+                  targ v(out) val=1.65  td=1n fall = 1
* mede o atraso de descida do inversor
.measure tran ts   trig v(iv)  val=1.65  td=5n fall = 1
+                  targ v(out) val=1.65  td=5n rise = 1

*multiplica resultados 1e12 para mostrar em pico segundos
.measure tran Atraso_Descida  param  td*1e12
.measure tran Atraso_Subida   param  ts*1e12

.END
