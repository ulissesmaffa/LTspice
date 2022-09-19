* Inversor - simulacao TRANSITORIA (Oscilador em Anel)
* observar o efeito da regeneracao do sinal no inversor
*
* Joao Leonardo Fragoso - Uergs
* versao LTSpice XVII
* inversor - diferentes dimensionamentos de transistor

*incluir o modelo para os transistores NMOS e PMOS
.include tsmc035.mod

*
* descricao do inversor na forma de um subcircuito
.subckt inversor in out  vdd
M1 out in vdd  vdd   pmos l=0.35e-6 w=5.5e-6  AD=11e-12   AS=11e-12  PD=9.5e-6 PS=9.5e-6
M2 out in 0    0     nmos l=0.35e-6 W=2.0U    AD=4.0P     AS=4.0P    PD=6.0U   PS=6.0U
.ends inversor

*instancia dos inversores
X1  o  a  vdd inversor
X2  a  b  vdd inversor

**deve ser preenchido de acordo com o laboratorio
vdd vdd  0  dc 3.3

*analise transitoria
.tran 0.5N 12n
* precisa setar uma condicao inicial para o oscilador
* ja estar em operacao (senao demora a simulacao)
.ic v(o)=3.3

** medidas
.measure tran tr  trig v(a)  val=1.65  td=5n fall = 1
+                 targ v(b)  val=1.65  td=5n rise = 1
.measure tran tf  trig v(a)  val=1.65  td=5n rise = 1
+                 targ v(b)  val=1.65  td=5n fall = 1

.measure tran periodo_ns  param  (tf+tr)*1e9*15
.measure tran freq_Mhz  param (1/periodo_ns)*1e3

.end
