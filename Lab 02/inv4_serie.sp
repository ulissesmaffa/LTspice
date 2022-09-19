* Inversor - simulacao TRANSITORIA (Cascata)
* observar o efeito da regeneracao do sinal no inversor
*
* Joao Leonardo Fragoso - Uergs
* versao LTSpice XVII
* inversor - diferentes dimensionamentos de transistor

*incluir o modelo para os transistores NMOS e PMOS
.include tsmc035.mod

*
* descricao do inversor na forma de um subcircuito
.subckt inversor in out vdd
*M1 out in vdd  vdd   pmos l=0.35e-6 w=5.5e-6  AD=11e-12   AS=11e-12  PD=9.5e-6 PS=9.5e-6
*M2 out in 0    0     nmos l=0.35e-6 W=2.0U    AD=4.0P     AS=4.0P    PD=6.0U   PS=6.0U
M1 out in vdd  vdd   pmos l=0.35e-6 w=1.8u  AD=11e-12   AS=11e-12  PD=9.5e-6 PS=9.5e-6
M2 out in 0    0     nmos l=0.35e-6 W=0.8u    AD=4.0P     AS=4.0P    PD=6.0U   PS=6.0U
.ends inversor

*instancias dos inversores em serie (saida -> entrada)
X1 i   a   vdd inversor
X2 a   b   vdd inversor
X3 b   c   vdd inversor
X4 c   d   vdd inversor
X5 d   e   vdd inversor
*carga no penultimo (ja deve estar regenerado)
c1 d   0 40fF
*alimentacao
vdd vdd  0  dc 3.3
*pulso de estimulo na entrada
vin1 i 0  pulse (1.4 1.8 4.9n 0.1n 0.1n 4.9n 10n)

*analise transitoria
.tran 0.5n 17n

.end
