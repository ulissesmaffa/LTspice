* Inversor - simulacao DC
* Joao Leonardo Fragoso - Uergs
* versao LTSpice XVII

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
X1  iv  out  vdd inversor
* capacitor como carga na saída
C1  out  0   50fF

*
* fonte de alimentacao 3.3
vdd vdd  0  dc 3.3
* alimentar a entrada (sera variado na analise)
vin1 iv  0  dc 0

*
* controles para o simulador
*
* variado WTR ADR e PDR juntos (usando sim_index)
* sim_index  WTR   ADR   PDR
*      1      2u     4p    6u
*      2      4u     8p    8u
*      3      6u    12p   10u
*      4      8u    16p   12u
.step param sim_index list 1 2 3 4
.param wtr table(sim_index, 1, 2u, 2, 4u, 3, 6u, 4, 8u)
.param adr table(sim_index, 1, 4p, 2, 8p, 3, 12p, 4, 16p)
.param pdr table(sim_index, 1, 6u, 2, 8u, 3, 10u, 4, 12u)

*analise em regime permanente
.dc vin1 0 3.3 .05


.END
