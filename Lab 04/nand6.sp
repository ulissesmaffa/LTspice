* NOR - simulacao TRANSITORIA (Porta NOR)
* observar o efeito do numero de entradas e da posicao
* do transistor no atraso de transicao da saida
*
* Ulisses Maffazioli
* versao LTSpice XVII

*incluir o modelo para os transistores NMOS e PMOS
.include tsmc035.mod



* nor2 - duas entradas
* e1 : entrada mais proxima do vdd
* e2 : entrada mais proxima da saida
* z  : saida
* vdd : alimentacao da porta
.SUBCKT nor2 e1 e2 z vdd
M1   2  e1 vdd vdd pmos l=0.35U W=11U AD=22P AS=22P PD=13U PS=13U
M2   z  e2 2   vdd pmos l=0.35U W=11U AD=22P AS=22P PD=13U PS=13U

M3   0  e1 z   0 nmos l=0.35U W=2U AD=4P AS=4P PD=6U PS=6U
M4   0  e2 z   0 nmos l=0.35U W=2U AD=4P AS=4P PD=6U PS=6U
.ENDS nor2

* nor3 - 3 entradas
* e1 : entrada mais proxima do vdd
* e2 : entrada mais proxima da saida
* z  : saida
.SUBCKT nor3 e1 e2 e3 z vdd
M1   3 e1 vdd vdd pmos l=0.35U W=11U AD=22P AS=22P PD=13U PS=13U
M2   z e2 2 vdd pmos l=0.35U W=11U AD=22P AS=22P PD=13U PS=13U
M3   2 e3 3 vdd pmos l=0.35U W=11U AD=22P AS=22P PD=13U PS=13U

M10  0  e1 z   0  nmos l=0.35U W=2U AD=4P AS=4P PD=6U PS=6U
M11  0  e3 z   0  nmos l=0.35U W=2U AD=4P AS=4P PD=6U PS=6U
M12  0  e2 z   0  nmos l=0.35U W=2U AD=4P AS=4P PD=6U PS=6U
.ENDS nor3

* nor4
* e1 : entrada mais proxima do vdd
* e2 : entrada mais proxima da saida
* z  : saida
.SUBCKT nor4 e1 e2 e3 e4 z vdd
M1   4 e1 vdd vdd pmos l=0.35U W=11U AD=22P AS=22P PD=13U PS=13U
M2   z e2 2 vdd pmos l=0.35U W=11U AD=22P AS=22P PD=13U PS=13U
M3   3 e3 4 vdd pmos l=0.35U W=11U AD=22P AS=22P PD=13U PS=13U
M4   2 e4 3 vdd pmos l=0.35U W=11U AD=22P AS=22P PD=13U PS=13U

M9   0  e1 z   0  nmos l=0.35U W=2U AD=4P AS=4P PD=6U PS=6U
M10  0  e4 z   0  nmos l=0.35U W=2U AD=4P AS=4P PD=6U PS=6U
M11  0  e3 z   0  nmos l=0.35U W=2U AD=4P AS=4P PD=6U PS=6U
M12  0  e2 z   0  nmos l=0.35U W=2U AD=4P AS=4P PD=6U PS=6U
.ENDS nor4

* nor5
* e1 : entrada mais proxima do vdd
* e2 : entrada mais proxima da saida
* z  : saida
.SUBCKT nor5 e1 e2 e3 e4 e5 z vdd
M1   5 e1 vdd vdd pmos l=0.35U W=11U AD=22P AS=22P PD=13U PS=13U
M2   z e2 2 vdd pmos l=0.35U W=11U AD=22P AS=22P PD=13U PS=13U
M3   4 e3 5 vdd pmos l=0.35U W=11U AD=22P AS=22P PD=13U PS=13U
M4   3 e4 4 vdd pmos l=0.35U W=11U AD=22P AS=22P PD=13U PS=13U
M5   2 e5 3 vdd pmos l=0.35U W=11U AD=22P AS=22P PD=13U PS=13U

M8   0  e1 z   0  nmos l=0.35U W=2U AD=4P AS=4P PD=6U PS=6U
M9   0  e5 z   0  nmos l=0.35U W=2U AD=4P AS=4P PD=6U PS=6U
M10  0  e4 z   0  nmos l=0.35U W=2U AD=4P AS=4P PD=6U PS=6U
M11  0  e3 z   0  nmos l=0.35U W=2U AD=4P AS=4P PD=6U PS=6U
M12  0  e2 z   0  nmos l=0.35U W=2U AD=4P AS=4P PD=6U PS=6U
.ENDS nor5

* nor6
* e1 : entrada mais proxima do vdd
* e2 : entrada mais proxima da saida
* z  : saida
.SUBCKT nor6 e1 e2 e3 e4 e5 e6 z vdd
M1   6 e1 vdd vdd pmos l=0.35U W=11U AD=22P AS=22P PD=13U PS=13U
M2   z e2 2 vdd pmos l=0.35U W=11U AD=22P AS=22P PD=13U PS=13U
M3   2 e3 3 vdd pmos l=0.35U W=11U AD=22P AS=22P PD=13U PS=13U
M4   3 e4 4 vdd pmos l=0.35U W=11U AD=22P AS=22P PD=13U PS=13U
M5   4 e5 5 vdd pmos l=0.35U W=11U AD=22P AS=22P PD=13U PS=13U
M6   5 e6 6 vdd pmos l=0.35U W=11U AD=22P AS=22P PD=13U PS=13U

M7   0  e1 z   0  nmos l=0.35U W=2U AD=4P AS=4P PD=6U PS=6U
M8   0  e6 z   0  nmos l=0.35U W=2U AD=4P AS=4P PD=6U PS=6U
M9   0  e5 z   0  nmos l=0.35U W=2U AD=4P AS=4P PD=6U PS=6U
M10  0  e4 z   0  nmos l=0.35U W=2U AD=4P AS=4P PD=6U PS=6U
M11  0  e3 z   0  nmos l=0.35U W=2U AD=4P AS=4P PD=6U PS=6U
M12  0  e2 z   0  nmos l=0.35U W=2U AD=4P AS=4P PD=6U PS=6U
.ENDS nor6

* instancia das NORs
* numero da instancia corresponde ao nro de entradas
X2 e1 e2             o2 vdd nor2
X3 e1 e2 e3          o3 vdd nor3
X4 e1 e2 e3 e4       o4 vdd nor4
X5 e1 e2 e3 e4 e5    o5 vdd nor5
X6 e1 e2 e3 e4 e5 e6 o6 vdd nor6

* cargas na saida
C2 o2 0 10fF
C3 o3 0 10fF
C4 o4 0 10fF
C5 o5 0 10fF
C6 o6 0 10fF


* alimentacao das portas
vdd  vdd 0  dc 3.3
* colocando as entradas que nao serao usadas
* em '0' = 0V
v3 e3  0  dc 0
v4 e4  0  dc 0
v5 e5  0  dc 0
v6 e6  0  dc 0

*
* estimulo das entradas e1 e e2
* |
* |                          +----------+                  3.3
* |                          |          |                      v2 = V(e2)
* |                          |          |
* +--------------------------+          +----------------  0
* |                          .          .
* |    +----------+          .          .                  3.3
* |    |          |          .          .
* |    |          |          .          .                     v1 = V(e1)
* +----+          +--------------------------------------  0
* +----+----------+----------+----------+---------------> t
* 0    2n         7n         12n        17n
*
v1 e1 0 pwl(0 0 2n  0 2.1n  3.3 7n 3.3 7.1n 0)
v2 e2 0 pwl(0 0 12n 0 12.1n 3.3 17n 3.3 17.1n 0)

* analise transitoria
.tran 0.05n 20n

*  __  __   ______   _____    _____   _____                _____
* |  \/  | |  ____| |  __ \  |_   _| |  __ \      /\      / ____|
* | \  / | | |__    | |  | |   | |   | |  | |    /  \    | (___
* | |\/| | |  __|   | |  | |   | |   | |  | |   / /\ \    \___ \
* | |  | | | |____  | |__| |  _| |_  | |__| |  / ____ \   ____) |
* |_|  |_| |______| |_____/  |_____| |_____/  /_/    \_\ |_____/

* nor2
** gate mais perto da vdd
.measure tran tr_2_1 trig v(e1)  val=1.65  td=1n fall = 1
+                    targ v(o2)  val=1.65  td=1n rise = 1
.measure tran tf_2_1 trig v(e1)  val=1.65  td=1n rise = 1
+                    targ v(o2)  val=1.65  td=1n fall = 1
** gate mais perto da saida
.measure tran tr_2_2 trig v(e2)  val=1.65  td=10n fall = 1
+                    targ v(o2)  val=1.65  td=10n rise = 1
.measure tran tf_2_2 trig v(e2)  val=1.65  td=10n rise = 1
+                    targ v(o2)  val=1.65  td=10n fall = 1

.measure tran nor2_TEMPO_DESCIDA_ENTR_GND   param tf_2_1*1e12
.measure tran nor2_TEMPO_DESCIDA_ENTR_SAIDA param tf_2_2*1e12
.measure tran nor2_TEMPO_SUBIDA_ENTR_VDD    param tr_2_1*1e12
.measure tran nor2_TEMPO_SUBIDA_ENTR_SAIDA  param tr_2_2*1e12
*  ___   _  _    ___   _      _   _   ___   ___      ___    _   _   _____   ___     _     ___
* |_ _| | \| |  / __| | |    | | | | |_ _| | _ \    / _ \  | | | | |_   _| | _ \   /_\   / __|
*  | |  | .` | | (__  | |__  | |_| |  | |  |   /   | (_) | | |_| |   | |   |   /  / _ \  \__ \
* |___|_|_|\_|_ \___| |____|  \___/  |___| |_|_\_   \___/   \___/    |_|   |_|_\ /_/ \_\ |___/
* |  \/  | | __| |   \  |_ _| |   \    /_\   / __|
* | |\/| | | _|  | |) |  | |  | |) |  / _ \  \__ \
* |_|  |_| |___| |___/  |___| |___/  /_/ \_\ |___/
*
* nor3
** gate mais perto da vdd
.measure tran tr_3_1 trig v(e1)  val=1.65  td=1n fall = 1
+                    targ v(o3)  val=1.65  td=1n rise = 1
.measure tran tf_3_1 trig v(e1)  val=1.65  td=1n rise = 1
+                    targ v(o3)  val=1.65  td=1n fall = 1
** gate mais perto da saida
.measure tran tr_3_2 trig v(e2)  val=1.65  td=10n fall = 1
+                    targ v(o3)  val=1.65  td=10n rise = 1
.measure tran tf_3_2 trig v(e2)  val=1.65  td=10n rise = 1
+                    targ v(o3)  val=1.65  td=10n fall = 1

.measure tran nor3_TEMPO_DESCIDA_ENTR_GND   param tf_3_1*1e12
.measure tran nor3_TEMPO_DESCIDA_ENTR_SAIDA param tf_3_2*1e12
.measure tran nor3_TEMPO_SUBIDA_ENTR_VDD    param tr_3_1*1e12
.measure tran nor3_TEMPO_SUBIDA_ENTR_SAIDA  param tr_3_2*1e12

* nor4
** gate mais perto da vdd
.measure tran tr_4_1 trig v(e1)  val=1.65  td=1n fall = 1
+                    targ v(o4)  val=1.65  td=1n rise = 1
.measure tran tf_4_1 trig v(e1)  val=1.65  td=1n rise = 1
+                    targ v(o4)  val=1.65  td=1n fall = 1
** gate mais perto da saida
.measure tran tr_4_2 trig v(e2)  val=1.65  td=10n fall = 1
+                    targ v(o4)  val=1.65  td=10n rise = 1
.measure tran tf_4_2 trig v(e2)  val=1.65  td=10n rise = 1
+                    targ v(o4)  val=1.65  td=10n fall = 1

.measure tran nor4_TEMPO_DESCIDA_ENTR_GND   param tf_4_1*1e12
.measure tran nor4_TEMPO_DESCIDA_ENTR_SAIDA param tf_4_2*1e12
.measure tran nor4_TEMPO_SUBIDA_ENTR_VDD    param tr_4_1*1e12
.measure tran nor4_TEMPO_SUBIDA_ENTR_SAIDA  param tr_4_2*1e12

* nor5
** gate mais perto da vdd
.measure tran tr_5_1 trig v(e1)  val=1.65  td=1n fall = 1
+                    targ v(o5)  val=1.65  td=1n rise = 1
.measure tran tf_5_1 trig v(e1)  val=1.65  td=1n rise = 1
+                    targ v(o5)  val=1.65  td=1n fall = 1
** gate mais perto da saida
.measure tran tr_5_2 trig v(e2)  val=1.65  td=10n fall = 1
+                    targ v(o5)  val=1.65  td=10n rise = 1
.measure tran tf_5_2 trig v(e2)  val=1.65  td=10n rise = 1
+                    targ v(o5)  val=1.65  td=10n fall = 1

.measure tran nor5_TEMPO_DESCIDA_ENTR_GND   param tf_5_1*1e12
.measure tran nor5_TEMPO_DESCIDA_ENTR_SAIDA param tf_5_2*1e12
.measure tran nor5_TEMPO_SUBIDA_ENTR_VDD    param tr_5_1*1e12
.measure tran nor5_TEMPO_SUBIDA_ENTR_SAIDA  param tr_5_2*1e12

* nor6
** gate mais perto da vdd
.measure tran tr_6_1 trig v(e1)  val=1.65  td=1n fall = 1
+                    targ v(o6)  val=1.65  td=1n rise = 1
.measure tran tf_6_1 trig v(e1)  val=1.65  td=1n rise = 1
+                    targ v(o6)  val=1.65  td=1n fall = 1
** gate mais perto da saida
.measure tran tr_6_2 trig v(e2)  val=1.65  td=10n fall = 1
+                    targ v(o6)  val=1.65  td=10n rise = 1
.measure tran tf_6_2 trig v(e2)  val=1.65  td=10n rise = 1
+                    targ v(o6)  val=1.65  td=10n fall = 1

.measure tran nor6_TEMPO_DESCIDA_ENTR_GND   param tf_6_1*1e12
.measure tran nor6_TEMPO_DESCIDA_ENTR_SAIDA param tf_6_2*1e12
.measure tran nor6_TEMPO_SUBIDA_ENTR_VDD    param tr_6_1*1e12
.measure tran nor6_TEMPO_SUBIDA_ENTR_SAIDA  param tr_6_2*1e12

.END
