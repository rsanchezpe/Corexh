//Ricardo S�nchez. Version 13//
//OCTUBRE 19-2019//
//Este do es para cuadrar la base de datos para regresi�n Poisson//

*Esta base viene en formato largo
use "D:\Dropbox\Baxter\Corexh\BasesCorexh\Econ�mico\hospitalizacion.dta" , clear
*Voy a generar una variable que me da el n�mero de hospitalizaciones observadas/paciente
*Para esto uso un comando que es "duplicates tag"
*Este comando me genera una variable que me dice cu�ntas repeticiones hubo
*Si no hay ninguna repetici�n el paciente no present� eventos durante el seguimiento
*Una repetici�n indica un evento, dos dos eventos y as� sucesivamente
*Para cada per�odo (variable "momento")voy a pedir que me genere una variable
*Voy a llamar a las variables numeventospre y numeventospost
*Estas variables contienen el n�mero de veces que se repita c/identificador
duplicates tag id if momento==1 , gen(numeventospre)
duplicates tag id if momento==1 , gen(numeventospost
move numeventospre T0
move numeventospost T0
label var numeventospre "N�mero de eventos observados pre"
label var numeventospost "N�mero de eventos observados post"

*La tabla del n�mero de eventos me da este resultado:

tab1 numeventospre numeventospost
*
* numeventos |
*        pre |      Freq.     Percent        Cum.
*------------+-----------------------------------
*          0 |         49       34.75       34.75
*          1 |         30       21.28       56.03
*          2 |         27       19.15       75.18
*          3 |         20       14.18       89.36
*          4 |         15       10.64      100.00
*------------+-----------------------------------
*      Total |        141      100.00
*Hay 30 casos que se repiten una vez (o sea 15 pacientes)
*Hay 27 casos que se repiten dos veces (o sea 9 pacientes)

*-> tabulation of numeventospost  
*
*numeventosp |
*        ost |      Freq.     Percent        Cum.
*------------+-----------------------------------
*          0 |         53       38.69       38.69
*          1 |         24       17.52       56.20
*          2 |         24       17.52       73.72
*          3 |         24       17.52       91.24
*          4 |          5        3.65       94.89
*          6 |          7        5.11      100.00
*------------+-----------------------------------
*      Total |        137      100.00

*Hay 24 casos que se repiten una vez (o sea 12 pacientes)
*Hay 24 casos que se repiten dos veces (o sea 8 pacientes)

*Vamos a dejar solo la base pre-intervenci�n:
drop if momento==2
*Despu�s a partir de aqu� se hace igual con post-intervenci�n.

*Ahora ordeno por identificador y por n�mero de eventos
sort id numeventos

*Para el an�lisis con Poisson me intertesan 2 cosas:
*1)Cu�ntos eventos tuvo cada paciente
*2)Cuanto tiempo aport� cada paciente

*Se espera que los que salen por fin del estudio completen los 365 d�as de seguimiento
*Aunque no necesariamente si lo que se mira es tiempo despu�s de iniciar riesgo...
*no importa cu�ntas hospitalizaciones hayan tenido

*Ahora tenemos que crear una variable que tenga el tiempo total en riesgo que aporta c/paciente
*El riesgo total que aporta cada paciente ser� el que tiene en la variable tiemporiesghospitalizacion si no tuvo eventos,
* o la suma de cada per�odo de tiemporiesghospitalizacion si tuvo al menos un evento:
bysort codeID: gen totalriesgo =sum( tiemporiesghospitalizacion)
label variable totalriesgo "D�as en riesgo de hospitalizaci�n"

*Le dije a Stata: Para cada identificador (bysort codeID) gen�reme una nueva variable que sea la suma de d�as en riesgo

*Ahora necesito que me deje los tiempos de los que no tienen eventos
*y que me deje los tiempos totales de los que tienen al menos un evento:
bysort codeID: drop if _n != _N & numeventos != 0
*Ahora en la variable totalriesgo solo me van a quedar:
*1)los tiempos totales de seguimiento para los que no tuvieron evento
*2)la suma de los diferentes tiempos de riesgo que aportaron los que tuvieron uno o dos eventos
*La tabla del n�mero de eventos ya queda cuadrada:
tab numeventos

*N�mero de	
*eventos	
*observados	
*pre	Freq.	Percent	Cum.
*			
*0	49	60.49	60.49
*1	15	18.52	79.01
*2	9	11.11	90.12
*3	5	6.17	96.30
*4	3	3.70	100.00
*			
*Total	81	100.00


*Est� lista la base para Poisson!
save "D:\Dropbox\Baxter\Modelo de hospitalizaci�n\Bases datos\derivacion poisson.dta"

*Tenemos el n�mero de eventos que aporta cada paciente (entre 0 y 11)
*y el tiempo en riesgo (que en los que se rehospitalizan es una suma de distintos tiempos en riesgo)
*Como tenemos el tiempo en d�as podemos volverlo a�os:
gen totalriesgopreyear =totalriesgopre/365.25
*Ahora s�, el IC para una variable (numeventos) que se distribuye Poisson:
ci numeventospre, poisson exposure( totalriesgopre)
ci numeventospre, poisson exposure( totalriesgopreyear)

*La salida es esta:
*
*                                                         -- Poisson  Exact --
*    Variable |   Exposure        Mean    Std. Err.       [95% Conf. Interval]
*-------------+---------------------------------------------------------------
*numeventos~e |   79.67967    .7530151    .0972138        .5746299    .9692798


*Ahora se repite con el per�odo post:
use "D:\Dropbox\Baxter\Corexh\BasesCorexh\Econ�mico\hospitalizacion.dta", clear
drop if momento==1
sort id numeventospost
save "D:\Dropbox\Baxter\Corexh\BasesCorexh\Econ�mico\hospitalizacionpost.dta"
ci numeventospost, poisson exposure( totalriesgopost)
gen totalriesgopostyear =totalriesgopost/365.25
ci numeventospost, poisson exposure( totalriesgopostyear)
save "D:\Dropbox\Baxter\Corexh\BasesCorexh\Econ�mico\hospitalizacionpost.dta", replace

*La salida es esta:
*                                                         -- Poisson  Exact --
*    Variable |   Exposure        Mean    Std. Err.       [95% Conf. Interval]
*-------------+---------------------------------------------------------------
*numeventos~t |   113.7659    1.810736    .1261599        1.571895    2.075612


/*Esta es la sintaxis para correr la regresi�n binomial negativa con todas las categ�ricas*/
nbreg numeventos sexo procedencia dxhta dxdm ant_cardiovascular ant_enf_periferica vacuinfluenza vacuneumococo insulina insulinanaloga hipoglicemianteoral raza1 raza3 niveleduca21 niveleduca22 niveleduca23  nivelsocioeco21 nivelsocioeco22 nivelsocioeco23 causaerc1 causaerc3 causaerc4 causaerc5 causaerc6 causaerc7 accesovascuinicio1 accesovascuinicio3 valvulopat2 valvulopat3, exposure( totalriesgo)
listcoef, percent help

save "D:\Dropbox\Baxter\Modelo de hospitalizaci�n\Bases datos\derivacion poisson.dta", replace
//Fin .do para aliatar base para poisson//
