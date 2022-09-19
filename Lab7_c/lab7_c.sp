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

*subcircuito de uma transmission gate (porta de transmissao)
.subckt tg a ctrl n_ctrl out vdd
MP2 a  n_ctrl out vdd pmos l=0.35U W=3.0U AD=6.0P AS=6.0P PD=7.0U PS=7.0U
MN2 a   ctrl  out 0   nmos l=0.35U W=1.5U AD=3.0P AS=3.0P PD=7.0U PS=7.0U
.ends tg
* ================================================
* subcircuito do ffd ms
.subckt ffd d q nq ck vdd
* inversor do clock
x0 ck nck vdd inv
*FFD1 - PARTE 1
X1 d  nck ck  1 vdd tg
X2 1  2  vdd inv
X3 2  3  vdd inv
X4 1  ck nck  3 vdd tg
*FFD1 - PARTE 2
X5 2  ck nck  4 vdd tg
X6 4  q  vdd inv
X7 q  nq vdd inv
X8 4  nck ck  nq vdd tg
.ends ffd

* ===============================================

*ffdp
.subckt ffdp d q ckg vdd
M3 vdd d   x   vdd pmos l=0.35U W=4U AD=6.0P AS=6.0P PD=7.0U PS=7.0U
M2 x  ckg  1   0   nmos l=0.35U W=1.5U AD=3.0P AS=3.0P PD=7.0U PS=7.0U
M1 1   d   0   0   nmos l=0.35U W=1.5U AD=3.0P AS=3.0P PD=7.0U PS=7.0U

M6 vdd  x   q   vdd pmos l=0.35U W=4U AD=6.0P AS=6.0P PD=7.0U PS=7.0U
M5 q   ckg  2   0   nmos l=0.35U W=1.5U AD=3.0P AS=3.0P PD=7.0U PS=7.0U
M4 2    x   0   0   nmos l=0.35U W=1.5U AD=3.0P AS=3.0P PD=7.0U PS=7.0U
.ends ffdp

*relogio pulsado
.subckt rel_p ck ckg vdd
*INVERSORES
X9 ck 1  vdd inv
X10 1  2  vdd inv
X11 2  3  vdd inv
X12 4 ckg vdd inv
X13 4 ckg vdd inv
*NAND
X14 ck 3 4 vdd nand2
.ends rel_p

*tspc
.subckt tspc d q nq ck vdd
M3 vdd d   1   vdd pmos l=0.35U W=4U AD=6.0P AS=6.0P PD=7.0U PS=7.0U
M2 1   ck  x   vdd pmos l=0.35U W=4U AD=6.0P AS=6.0P PD=7.0U PS=7.0U
M1 x   d   0   0   nmos l=0.35U W=2U AD=3.0P AS=3.0P PD=7.0U PS=7.0U

M6 vdd ck  y   vdd pmos l=0.35U W=4U AD=6.0P AS=6.0P PD=7.0U PS=7.0U
M5 y   x   2   0   nmos l=0.35U W=2U AD=3.0P AS=3.0P PD=7.0U PS=7.0U
M4 2   ck  0   0   nmos l=0.35U W=2U AD=3.0P AS=3.0P PD=7.0U PS=7.0U

M9 vdd y   nq  vdd pmos l=0.35U W=4U AD=6.0P AS=6.0P PD=7.0U PS=7.0U
M8 nq  ck  3   0   nmos l=0.35U W=2U AD=3.0P AS=3.0P PD=7.0U PS=7.0U
M7 3   y   0   0   nmos l=0.35U W=2U AD=3.0P AS=3.0P PD=7.0U PS=7.0U
X33 nq q vdd inv
.ends tspc

*comp
*ffd
X15 nq1 q1 nq1 ck vdd ffd
*tspc
X16 nq2 q2 nq2 ck vdd tspc
*pulso
X17 ck ckg1 vdd rel_p
*ffd_pulsado
X18 q3 nq3 vdd inv
X19 nq3 q3 ckg1 vdd ffdp

*carga para saida q
C1 q1 0 20fF
C2 q2 0 20fF
C3 q3 0 20fF

*sinal nq=1
.ic v(nq2)=3.3 v(15:x)=0 v(q2)=0 v(19:x)=3.3 v(q3)=0 v(nq3)=3.3

* fonte de alimentacao
vc vdd 0 dc 3.3

*clock 1GHz
vk ck 0 pulse(0 3.3 0.5n 0.05n 0.05n 0.5n 1n)

*simulacao transitoria
.tran .01N 5N

.end
