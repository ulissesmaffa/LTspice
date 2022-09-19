* NAND - simulacao TRANSITORIA (Porta NAND)
* observar o efeito do numero de entradas e da posicao
* do transistor no atraso de transicao da saida
*
* Joao Leonardo Fragoso - Uergs
* versao LTSpice XVII

*incluir o modelo para os transistores NMOS e PMOS
.include tsmc035.mod



* NAND2 - duas entradas
* e1 : entrada mais proxima do GROUND
* e2 : entrada mais proxima da saida
* z  : saida
* vdd : alimentacao da porta
.SUBCKT nand2 e1 e2 z vdd
M1   z e1 vdd vdd pmos l=0.35U W=5.0U AD=10.0P AS=10.0P PD=9.0U PS=9.0U
M2   z e2 vdd vdd pmos l=0.35U W=5.0U AD=10.0P AS=10.0P PD=9.0U PS=9.0U
M3   0  e1 2   0  nmos l=0.35U W=3.7U AD=7.3P AS=7.3P PD=7.7U PS=7.7U
M4   2  e2 z   0  nmos l=0.35U W=3.7U AD=7.3P AS=7.3P PD=7.7U PS=7.7U
.ENDS nand2

* NAND3 - 3 entradas
* e1 : entrada mais proxima do GROUND
* e2 : entrada mais proxima da saida
* z  : saida
.SUBCKT nand3 e1 e2 e3 z vdd
M1   z e1 vdd vdd pmos l=0.35U W=5.0U AD=10.0P AS=10.0P PD=9.0U PS=9.0U
M2   z e2 vdd vdd pmos l=0.35U W=5.0U AD=10.0P AS=10.0P PD=9.0U PS=9.0U
M3   z e3 vdd vdd pmos l=0.35U W=5.0U AD=10.0P AS=10.0P PD=9.0U PS=9.0U
M10  0  e1 4   0  nmos l=0.35U W=3.7U AD=7.3P AS=7.3P PD=7.7U PS=7.7U
M11  4  e3 2   0  nmos l=0.35U W=3.7U AD=7.3P AS=7.3P PD=7.7U PS=7.7U
M12  2  e2 z   0  nmos l=0.35U W=3.7U AD=7.3P AS=7.3P PD=7.7U PS=7.7U
.ENDS nand3

* NAND4
* e1 : entrada mais proxima do GROUND
* e2 : entrada mais proxima da saida
* z  : saida
.SUBCKT nand4 e1 e2 e3 e4 z vdd
M1   z e1 vdd vdd pmos l=0.35U W=5.0U AD=10.0P AS=10.0P PD=9.0U PS=9.0U
M2   z e2 vdd vdd pmos l=0.35U W=5.0U AD=10.0P AS=10.0P PD=9.0U PS=9.0U
M3   z e3 vdd vdd pmos l=0.35U W=5.0U AD=10.0P AS=10.0P PD=9.0U PS=9.0U
M4   z e4 vdd vdd pmos l=0.35U W=5.0U AD=10.0P AS=10.0P PD=9.0U PS=9.0U
M9   0  e1 6   0  nmos l=0.35U W=3.7U AD=7.3P AS=7.3P PD=7.7U PS=7.7U
M10  6  e4 4   0  nmos l=0.35U W=3.7U AD=7.3P AS=7.3P PD=7.7U PS=7.7U
M11  4  e3 2   0  nmos l=0.35U W=3.7U AD=7.3P AS=7.3P PD=7.7U PS=7.7U
M12  2  e2 z   0  nmos l=0.35U W=3.7U AD=7.3P AS=7.3P PD=7.7U PS=7.7U
.ENDS nand4

* NAND5
* e1 : entrada mais proxima do GROUND
* e2 : entrada mais proxima da saida
* z  : saida
.SUBCKT nand5 e1 e2 e3 e4 e5 z vdd
M1   z e1 vdd vdd pmos l=0.35U W=5.0U AD=10.0P AS=10.0P PD=9.0U PS=9.0U
M2   z e2 vdd vdd pmos l=0.35U W=5.0U AD=10.0P AS=10.0P PD=9.0U PS=9.0U
M3   z e3 vdd vdd pmos l=0.35U W=5.0U AD=10.0P AS=10.0P PD=9.0U PS=9.0U
M4   z e4 vdd vdd pmos l=0.35U W=5.0U AD=10.0P AS=10.0P PD=9.0U PS=9.0U
M5   z e5 vdd vdd pmos l=0.35U W=5.0U AD=10.0P AS=10.0P PD=9.0U PS=9.0U
M8   0  e1 8   0  nmos l=0.35U W=3.7U AD=7.3P AS=7.3P PD=7.7U PS=7.7U
M9   8  e5 6   0  nmos l=0.35U W=3.7U AD=7.3P AS=7.3P PD=7.7U PS=7.7U
M10  6  e4 4   0  nmos l=0.35U W=3.7U AD=7.3P AS=7.3P PD=7.7U PS=7.7U
M11  4  e3 2   0  nmos l=0.35U W=3.7U AD=7.3P AS=7.3P PD=7.7U PS=7.7U
M12  2  e2 z   0  nmos l=0.35U W=3.7U AD=7.3P AS=7.3P PD=7.7U PS=7.7U
.ENDS nand5

* NAND6
* e1 : entrada mais proxima do GROUND
* e2 : entrada mais proxima da saida
* z  : saida
.SUBCKT nand6 e1 e2 e3 e4 e5 e6 z vdd
M1   z e1 vdd vdd pmos l=0.35U W=5.0U AD=10.0P AS=10.0P PD=9.0U PS=9.0U
M2   z e2 vdd vdd pmos l=0.35U W=5.0U AD=10.0P AS=10.0P PD=9.0U PS=9.0U
M3   z e3 vdd vdd pmos l=0.35U W=5.0U AD=10.0P AS=10.0P PD=9.0U PS=9.0U
M4   z e4 vdd vdd pmos l=0.35U W=5.0U AD=10.0P AS=10.0P PD=9.0U PS=9.0U
M5   z e5 vdd vdd pmos l=0.35U W=5.0U AD=10.0P AS=10.0P PD=9.0U PS=9.0U
M6   z e6 vdd vdd pmos l=0.35U W=5.0U AD=10.0P AS=10.0P PD=9.0U PS=9.0U
M7   0  e1 10  0  nmos l=0.35U W=3.7U AD=7.3P AS=7.3P PD=7.7U PS=7.7U
M8   10 e6 8   0  nmos l=0.35U W=3.7U AD=7.3P AS=7.3P PD=7.7U PS=7.7U
M9   8  e5 6   0  nmos l=0.35U W=3.7U AD=7.3P AS=7.3P PD=7.7U PS=7.7U
M10  6  e4 4   0  nmos l=0.35U W=3.7U AD=7.3P AS=7.3P PD=7.7U PS=7.7U
M11  4  e3 2   0  nmos l=0.35U W=3.7U AD=7.3P AS=7.3P PD=7.7U PS=7.7U
M12  2  e2 z   0  nmos l=0.35U W=3.7U AD=7.3P AS=7.3P PD=7.7U PS=7.7U
.ENDS nand6

* instancia das NANDs
* numero da instancia corresponde ao nro de entradas
X2 e1 e2             o2 vdd nand2
X3 e1 e2 e3          o3 vdd nand3
X4 e1 e2 e3 e4       o4 vdd nand4
X5 e1 e2 e3 e4 e5    o5 vdd nand5
X6 e1 e2 e3 e4 e5 e6 o6 vdd nand6

* cargas na saida
C2 o2 0 10fF
C3 o3 0 10fF
C4 o4 0 10fF
C5 o5 0 10fF
C6 o6 0 10fF


* alimentacao das portas
vdd  vdd 0  dc 3.3
* colocando as entradas que nao serao usadas
* em '1' = 3.3V
v3 e3  0  dc 3.3
v4 e4  0  dc 3.3
v5 e5  0  dc 3.3
v6 e6  0  dc 3.3

*
* estimulo das entradas e1 e e2
* |
* +--------------------------+          +---------------- 3.3
* |                          |          |                      v2 = V(e2)
* |                          |          |
* |                          +----------+                 0
* |                          .          .
* +----+          +-------------------------------------- 3.3
* |    |          |          .          .
* |    |          |          .          .                     v1 = V(e1)
* |    +----------+          .          .                 0
* +----+----------+----------+----------+---------------> t
* 0    2n         7n         12n        17n
*
v1 e1 0 pwl(0 3.3 2n  3.3 2.1n  0 7n 0 7.1n 3.3)
v2 e2 0 pwl(0 3.3 12n 3.3 12.1n 0 17n 0 17.1n 3.3)

* analise transitoria
.tran 0.05n 20n

*  __  __   ______   _____    _____   _____                _____
* |  \/  | |  ____| |  __ \  |_   _| |  __ \      /\      / ____|
* | \  / | | |__    | |  | |   | |   | |  | |    /  \    | (___
* | |\/| | |  __|   | |  | |   | |   | |  | |   / /\ \    \___ \
* | |  | | | |____  | |__| |  _| |_  | |__| |  / ____ \   ____) |
* |_|  |_| |______| |_____/  |_____| |_____/  /_/    \_\ |_____/

* NAND2
** gate mais perto da GROUND
.measure tran tr_2_1 trig v(e1)  val=1.65  td=1n fall = 1
+                    targ v(o2)  val=1.65  td=1n rise = 1
.measure tran tf_2_1 trig v(e1)  val=1.65  td=1n rise = 1
+                    targ v(o2)  val=1.65  td=1n fall = 1
** gate mais perto da saida
.measure tran tr_2_2 trig v(e2)  val=1.65  td=10n fall = 1
+                    targ v(o2)  val=1.65  td=10n rise = 1
.measure tran tf_2_2 trig v(e2)  val=1.65  td=10n rise = 1
+                    targ v(o2)  val=1.65  td=10n fall = 1

.measure tran NAND2_TEMPO_DESCIDA_ENTR_GND   param tf_2_1*1e12
.measure tran NAND2_TEMPO_DESCIDA_ENTR_SAIDA param tf_2_2*1e12
.measure tran NAND2_TEMPO_SUBIDA_ENTR_GND    param tr_2_1*1e12
.measure tran NAND2_TEMPO_SUBIDA_ENTR_SAIDA  param tr_2_2*1e12
*  ___   _  _    ___   _      _   _   ___   ___      ___    _   _   _____   ___     _     ___
* |_ _| | \| |  / __| | |    | | | | |_ _| | _ \    / _ \  | | | | |_   _| | _ \   /_\   / __|
*  | |  | .` | | (__  | |__  | |_| |  | |  |   /   | (_) | | |_| |   | |   |   /  / _ \  \__ \
* |___|_|_|\_|_ \___| |____|  \___/  |___| |_|_\_   \___/   \___/    |_|   |_|_\ /_/ \_\ |___/
* |  \/  | | __| |   \  |_ _| |   \    /_\   / __|
* | |\/| | | _|  | |) |  | |  | |) |  / _ \  \__ \
* |_|  |_| |___| |___/  |___| |___/  /_/ \_\ |___/
*
* NAND3
** gate mais perto da GROUND
.measure tran tr_3_1 trig v(e1)  val=1.65  td=1n fall = 1
+                    targ v(o3)  val=1.65  td=1n rise = 1
.measure tran tf_3_1 trig v(e1)  val=1.65  td=1n rise = 1
+                    targ v(o3)  val=1.65  td=1n fall = 1
** gate mais perto da saida
.measure tran tr_3_2 trig v(e2)  val=1.65  td=10n fall = 1
+                    targ v(o3)  val=1.65  td=10n rise = 1
.measure tran tf_3_2 trig v(e2)  val=1.65  td=10n rise = 1
+                    targ v(o3)  val=1.65  td=10n fall = 1

.measure tran NAND3_TEMPO_DESCIDA_ENTR_GND   param tf_3_1*1e12
.measure tran NAND3_TEMPO_DESCIDA_ENTR_SAIDA param tf_3_2*1e12
.measure tran NAND3_TEMPO_SUBIDA_ENTR_GND    param tr_3_1*1e12
.measure tran NAND3_TEMPO_SUBIDA_ENTR_SAIDA  param tr_3_2*1e12

* NAND4
** gate mais perto da GROUND
.measure tran tr_4_1 trig v(e1)  val=1.65  td=1n fall = 1
+                    targ v(o4)  val=1.65  td=1n rise = 1
.measure tran tf_4_1 trig v(e1)  val=1.65  td=1n rise = 1
+                    targ v(o4)  val=1.65  td=1n fall = 1
** gate mais perto da saida
.measure tran tr_4_2 trig v(e2)  val=1.65  td=10n fall = 1
+                    targ v(o4)  val=1.65  td=10n rise = 1
.measure tran tf_4_2 trig v(e2)  val=1.65  td=10n rise = 1
+                    targ v(o4)  val=1.65  td=10n fall = 1

.measure tran NAND4_TEMPO_DESCIDA_ENTR_GND   param tf_4_1*1e12
.measure tran NAND4_TEMPO_DESCIDA_ENTR_SAIDA param tf_4_2*1e12
.measure tran NAND4_TEMPO_SUBIDA_ENTR_GND    param tr_4_1*1e12
.measure tran NAND4_TEMPO_SUBIDA_ENTR_SAIDA  param tr_4_2*1e12

* NAND5
** gate mais perto da GROUND
.measure tran tr_5_1 trig v(e1)  val=1.65  td=1n fall = 1
+                    targ v(o5)  val=1.65  td=1n rise = 1
.measure tran tf_5_1 trig v(e1)  val=1.65  td=1n rise = 1
+                    targ v(o5)  val=1.65  td=1n fall = 1
** gate mais perto da saida
.measure tran tr_5_2 trig v(e2)  val=1.65  td=10n fall = 1
+                    targ v(o5)  val=1.65  td=10n rise = 1
.measure tran tf_5_2 trig v(e2)  val=1.65  td=10n rise = 1
+                    targ v(o5)  val=1.65  td=10n fall = 1

.measure tran NAND5_TEMPO_DESCIDA_ENTR_GND   param tf_5_1*1e12
.measure tran NAND5_TEMPO_DESCIDA_ENTR_SAIDA param tf_5_2*1e12
.measure tran NAND5_TEMPO_SUBIDA_ENTR_GND    param tr_5_1*1e12
.measure tran NAND5_TEMPO_SUBIDA_ENTR_SAIDA  param tr_5_2*1e12

* NAND6
** gate mais perto da GROUND
.measure tran tr_6_1 trig v(e1)  val=1.65  td=1n fall = 1
+                    targ v(o6)  val=1.65  td=1n rise = 1
.measure tran tf_6_1 trig v(e1)  val=1.65  td=1n rise = 1
+                    targ v(o6)  val=1.65  td=1n fall = 1
** gate mais perto da saida
.measure tran tr_6_2 trig v(e2)  val=1.65  td=10n fall = 1
+                    targ v(o6)  val=1.65  td=10n rise = 1
.measure tran tf_6_2 trig v(e2)  val=1.65  td=10n rise = 1
+                    targ v(o6)  val=1.65  td=10n fall = 1

.measure tran NAND6_TEMPO_DESCIDA_ENTR_GND   param tf_6_1*1e12
.measure tran NAND6_TEMPO_DESCIDA_ENTR_SAIDA param tf_6_2*1e12
.measure tran NAND6_TEMPO_SUBIDA_ENTR_GND    param tr_6_1*1e12
.measure tran NAND6_TEMPO_SUBIDA_ENTR_SAIDA  param tr_6_2*1e12

.END
