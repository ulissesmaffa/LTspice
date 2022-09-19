* Inversor - simulacao TRANSITORIA (Rampa)
* medir o efeito da carga de saida no atraso de propagacao
*
* Joao Leonardo Fragoso - Uergs
* versao LTSpice XVII
* inversor - diferentes dimensionamentos de transistor

*incluir o modelo para os transistores NMOS e PMOS
.include tsmc035.mod

*
* descricao do inversor na forma de um subcircuito
.subckt inversor in out vdd
M1 out in vdd  vdd   pmos l=0.35e-6 w=5.5e-6  AD=11e-12   AS=11e-12  PD=9.5e-6 PS=9.5e-6
M2 out in 0    0     nmos l=0.35e-6 W=2.0U    AD=4.0P     AS=4.0P    PD=6.0U   PS=6.0U
.ends inversor

*
* descricao do circuito
*
* instacia de 5 inversores
* cada um sera estimulado por uma rampa diferente
X1 i1 o1 vdd inversor
X2 i2 o2 vdd inversor
X3 i3 o3 vdd inversor
X4 i4 o4 vdd inversor
X5 i5 o5 vdd inversor
* cargas em cada inversor
C1 o1 0 40fF
C2 o2 0 40fF
C3 o3 0 40fF
C4 o4 0 40fF
C5 o5 0 40fF
*alimentacao (todos os inversores)
vdd vdd  0  dc 3.3

* estimulos dos inversores
vin1 i1  0  pulse (0 3.3  1.95n 0.1n 0.1n 4.9n 12n)
vin2 i2  0  pulse (0 3.3  1.75n 0.5n 0.5n 4.5n 12n)
vin3 i3  0  pulse (0 3.3  1.50n 1.0n 1.0n 4.0n 12n)
vin4 i4  0  pulse (0 3.3  1.00n 2.0n 2.0n 3.0n 12n)
vin5 i5  0  pulse (0 3.3  0.50n 3.0n 3.0n 2.0n 12n)

*analise transitoria
.tran 0.5n 10n


* mede os atrasos de descida e de subidas dos inversores
.measure tran td1 trig v(i1)  val=1.65       rise = 1
+                 targ v(o1)  val=1.65       fall = 1
.measure tran ts1 trig v(i1)  val=1.65 td=5n fall = 1
+                 targ v(o1)  val=1.65 td=5n rise = 1

.measure tran td2 trig v(i2)  val=1.65       rise = 1
+                 targ v(o2)  val=1.65       fall = 1
.measure tran ts2 trig v(i2)  val=1.65 td=5n fall = 1
+                 targ v(o2)  val=1.65 td=5n rise = 1

.measure tran td3 trig v(i3)  val=1.65       rise = 1
+                 targ v(o3)  val=1.65       fall = 1
.measure tran ts3 trig v(i3)  val=1.65 td=5n fall = 1
+                 targ v(o3)  val=1.65 td=5n rise = 1

.measure tran td4 trig v(i4)  val=1.65       rise = 1
+                 targ v(o4)  val=1.65       fall = 1
.measure tran ts4 trig v(i4)  val=1.65 td=5n fall = 1
+                 targ v(o4)  val=1.65 td=5n rise = 1

.measure tran td5 trig v(i5)  val=1.65       rise = 1
+                 targ v(o5)  val=1.65       fall = 1
.measure tran ts5 trig v(i5)  val=1.65 td=5n fall = 1
+                 targ v(o5)  val=1.65 td=5n rise = 1

*multiplica tudo por 1e12 (mostra em pico-segundos)
.measure tran delay_descida_01n param td1*1e12
.measure tran delay_descida_05n param td2*1e12
.measure tran delay_descida_1n  param td3*1e12
.measure tran delay_descida_2n  param td4*1e12
.measure tran delay_descida_3n  param td5*1e12
.measure tran delay_subida_01n  param ts1*1e12
.measure tran delay_subida_05n  param ts2*1e12
.measure tran delay_subida_1n   param ts3*1e12
.measure tran delay_subida_2n   param ts4*1e12
.measure tran delay_subida_3n   param ts5*1e12

.END
