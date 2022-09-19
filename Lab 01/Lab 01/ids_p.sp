* PMOS - funcao de transferencia
* Joao Leonardo Fragoso - Uergs
* versao LTSpice XVII

*incluir o modelo para os transistores NMOS e PMOS
.include tsmc035.mod


**
** 1 transistor apenas.
* Usando nome para os nós ao inves de números
M1 dreno gate vcc vcc pmos L=0.35u W=2.0u AD=4.0p PD=6.0u AS=4.0p PS=6.0u

* alimentacao
vcc  vcc 0  dc 3.3

vds dreno 0 3.3
vgs gate  0  0

*analise DC
.dc  vds 0 3.3 .1
.step vgs list 0 0.7 1.4 2.1 3.3

.END
