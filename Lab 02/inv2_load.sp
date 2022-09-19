* Inversor - simulacao TRANSITORIA (Load)
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
* instancia do inversor
X1  iv  out vdd inversor
* capacitor como carga na saída
C3  out  0  {cl}

*
* fonte de alimentacao 3.3
vdd vdd  0  dc 3.3
* gerador de pulsos na entrada (usado para )
vin1 iv  0  pulse (0 3.3 2n 0.1n 0.1n 5n 10n)

*variando a carga de saida
.step param cl list 20f 80f 200f 400f 1000f

* controles para o simulador
.tran 0.01N 11N

* mede o tempo de descida do inversor
.measure tran td trig v(iv)  val=1.65  td=1n rise = 1
+                targ v(out) val=1.65  td=1n fall = 1

.measure tran ts trig v(iv)  val=1.65  td=5n fall = 1
+                targ v(out) val=1.65  td=5n rise = 1

*multiplica resultados 1e12 para mostrar em pico segundos
.measure tran Atraso_Descida  param  td*1e12
.measure tran Atraso_Subida   param  ts*1e12

.END

