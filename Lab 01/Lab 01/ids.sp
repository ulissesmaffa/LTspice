* NMOS - funcao de transferencia
* Joao Leonardo Fragoso - Uergs
* versao LTSpice XVII

*incluir o modelo para os transistores NMOS e PMOS
.include tsmc035.mod

*declarando um transistor
* Mx DRENO PORTA FONTE SUBSTRATO TRANSITOR COMPRIMENTO LARGURA AREA_DRENO PERIMETRO_DRENO AREA_FONTE PERIMETRO_DRENO
M2    1     2     0      0        NMOS      L=0.35u     W=2u    AD=4.0p   PD=6.0u          AS=4.0p    PS=6.0u

* fonte entre DRENO e GND
vds  1 0 0

* fonte entre PORTA e GND
vgs  2 0 0

* analise DC (regime permanente variando VDS)
.dc vds 0 3.3 0.1
.step vgs list 0 0.7 1.4 2.1 3.3

.END
