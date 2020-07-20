*Este do es para reemplazar los puntos por ceros
*Se usa así porque hay valores faltantes y esos puntos hay que dejarlos
replace isd01_1= isd01 if isd01_1==.
replace isd02_1= isd02 if isd02_1==.
replace isd03_1= isd03 if isd03_1==.
replace isd04_1= isd04 if isd04_1==.
replace isd05_1= isd05 if isd05_1==.
replace isd06_1= isd06 if isd06_1==.
replace isd07_1= isd07 if isd07_1==.
replace isd08_1= isd08 if isd08_1==.
replace isd09_1= isd09 if isd09_1==.
replace isd10_1= isd10 if isd10_1==.
replace isd11_1= isd11 if isd11_1==.
replace isd12_1= isd12 if isd12_1==.
replace isd13_1= isd13 if isd13_1==.
replace isd14_1= isd14 if isd14_1==.
replace isd15_1= isd15 if isd15_1==.
replace isd16_1= isd16 if isd16_1==.
replace isd17_1= isd17 if isd17_1==.
replace isd18_1= isd18 if isd18_1==.
replace isd19_1= isd19 if isd19_1==.
replace isd20_1= isd20 if isd20_1==.
replace isd21_1= isd21 if isd21_1==.
replace isd22_1= isd22 if isd22_1==.
replace isd23_1= isd23 if isd23_1==.
replace isd24_1= isd24 if isd24_1==.
replace isd25_1= isd25 if isd25_1==.
replace isd26_1= isd26 if isd26_1==.
replace isd27_1= isd27 if isd27_1==.
replace isd28_1= isd28 if isd28_1==.
replace isd29_1= isd29 if isd29_1==.
replace isd30_1= isd30 if isd30_1==.


*Estos comandos son para generar puntajes de DSI
*Un puntaje es simplemente la sumatoria de'síntomas presentes
*EL otro es el puntaje del grado de molestia de cada síntoma que está presente

egen float numsintom = rowtotal(isd01 isd02 isd03 isd04 isd05 isd06 isd07 isd08 isd09 isd10 isd11 isd12 isd13 isd14 isd15 isd16 isd17 isd18 isd19 isd20 isd21 isd22 isd23 isd24 isd25 isd26 isd27 isd28 isd29 isd30)
label variable numsintom "Número de síntomas"
egen float scoresintom = rowtotal(isd01_ isd02_ isd03_ isd04_ isd05_ isd06_ isd07_ isd08_ isd09_ isd10_ isd11_ isd12_ isd13_ isd14_ isd15_ isd16_ isd17_ isd18_ isd19_ isd20_ isd21_ isd22_ isd23_ isd24_ isd25_ isd26_ isd27_ isd28_ isd29_ isd30_)
label variable scoresintom "Sumatoria puntaje síntomas"
rename numsintom numsintom0
rename scoresintom scoresintom0
save "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesDSI\dsi0.dta", replace


