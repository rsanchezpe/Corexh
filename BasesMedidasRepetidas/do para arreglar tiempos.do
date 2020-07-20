*Do para arreglar tiempos de seguimiento Corexh y hacer Cox
*Marzo 26/2019

gen T0 = F_Firma_CI
format T0 %td
gen T1 = F_Fin
format T1 %td
move T0 Estancia
move T1 Estancia
*Para una hospitalización
bysort consec: replace T1= F_ingreso_hospital[1] if F_egreso_hospital[1] != . & Momento==0
*Sigue reemplazar los que tuvieron 2 hospitalizaciones
*Omita lo anterior
*Sigue 1 hospitalización
bysort consec: replace T0= F_egreso_hospital[1] if F_ingreso_hospital[1] != . & Momento==1
bysort consec: replace T1= F_Fin if F_egreso_hospital[1] != . & Momento==1
bysort consec: replace T1= F_Fin[1] if F_egreso_hospital[1] != . & Momento==1
*Sigue reemplazar los que tuvieron 2 hospitalizaciones
bysort consec: replace T1= F_ingreso_hospital[2] if F_egreso_hospital[2] != . & Momento==1
bysort consec: replace T0= F_egreso_hospital if F_ingreso_hospital[2] != . & Momento==2 & totalhosp==2
bysort consec: replace T0= F_egreso_hospital[2] if F_ingreso_hospital[2] != . & Momento==2 & totalhosp==2
bysort consec: replace T1= F_Fin[1] if F_ingreso_hospital[2] != . & Momento==2 & totalhosp==2
save "C:\Users\rsanchez\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\parafechashospismall.dta", replace
save "C:\Users\rsanchez\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\parafechashospismall.dta", replace
bysort consec: replace T1= F_egreso_hospital[2] if F_egreso_hospital[3] != . & Momento==1
replace F_ingreso_hospital = date("15nov2017","DMY") in 1008
replace T0 = date("15nov2017","DMY") in 1008
replace T0 = date("14nov2017","DMY") in 1008
bysort consec: replace T1= F_ingreso_hospital[2] if F_egreso_hospital[3] != . & Momento==1
bysort consec: replace T0= F_egreso_hospital[2] if F_ingreso_hospital[3] != . & Momento==2 & totalhosp==3
bysort consec: replace T1= F_ingreso_hospital[2] if F_egreso_hospital[3] != . & Momento==1 & totalhosp==3
bysort consec: replace T1= F_ingreso_hospital[3] if F_egreso_hospital[3] != . & Momento==2 & totalhosp==3
bysort consec: replace T0= F_egreso_hospital[3] if F_ingreso_hospital[3] != . & Momento==3 & totalhosp==3
bysort consec: replace T1= F_Fin[1] if F_egreso_hospital[3] != . & Momento==3 & totalhosp==3
save "C:\Users\rsanchez\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\parafechashospismall.dta", replace
*para 4 hospitalizaciones
replace T1 = date("22oct2017","DMY") in 2232
bysort consec: replace T0= F_egreso_hospital[2] if F_ingreso_hospital[4] != . & Momento==2 & totalhosp==4
bysort consec: replace T1= F_ingreso_hospital[2] if F_ingreso_hospital[4] != . & Momento==2 & totalhosp==4
bysort consec: replace T1= F_ingreso_hospital[3] if F_ingreso_hospital[4] != . & Momento==2 & totalhosp==4
bysort consec: replace T0= F_egreso_hospital[3] if F_ingreso_hospital[4] != . & Momento==3 & totalhosp==4
bysort consec: replace T1= F_ingreso_hospital[4] if F_egreso_hospital[4] != . & Momento==3 & totalhosp==4
bysort consec: replace T0= F_egreso_hospital[4] if F_ingreso_hospital[4] != . & Momento==4 & totalhosp==4
bysort consec: replace T1= F_Fin[1] if F_egreso_hospital[4] != . & Momento==4 & totalhosp==4
bysort consec: replace T0= F_egreso_hospital[2] if F_ingreso_hospital[5] != . & Momento==2 & totalhosp==5
bysort consec: replace T1= F_ingreso_hospital[3] if F_ingreso_hospital[5] != . & Momento==2 & totalhosp==5
bysort consec: replace T0= F_egreso_hospital[3] if F_ingreso_hospital[5] != . & Momento==2 & totalhosp==5
bysort consec: replace T1= F_ingreso_hospital[3] if F_ingreso_hospital[5] != . & Momento==2 & totalhosp==5
bysort consec: replace T0= F_egreso_hospital[2] if F_ingreso_hospital[5] != . & Momento==2 & totalhosp==5
bysort consec: replace T0= F_egreso_hospital[3] if F_ingreso_hospital[5] != . & Momento==3 & totalhosp==5
bysort consec: replace T1= F_ingreso_hospital[4] if F_ingreso_hospital[5] != . & Momento==3 & totalhosp==5
bysort consec: replace T0= F_egreso_hospital[4] if F_ingreso_hospital[5] != . & Momento==4 & totalhosp==5
bysort consec: replace T1= F_Fin[1] if F_egreso_hospital[5] != . & Momento==4 & totalhosp==5
save "C:\Users\rsanchez\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\parafechashospismall.dta", replace
sort numsegui Momento totalhosp
tab totalhosp
sort totalhosp
sort numsegui Momento
sort consec Momento
bysort consec: replace T0= F_egreso_hospital[2] if F_ingreso_hospital[6] != . & Momento==2 & totalhosp==6
bysort consec: replace T1= F_ingreso_hospital[3] if F_ingreso_hospital[6] != . & Momento==2 & totalhosp==6
bysort consec: replace T0= F_egreso_hospital[3] if F_ingreso_hospital[6] != . & Momento==3 & totalhosp==6
bysort consec: replace T1= F_ingreso_hospital[4] if F_egreso_hospital[6] != . & Momento==3 & totalhosp==6
bysort consec: replace T0= F_egreso_hospital[4] if F_ingreso_hospital[6] != . & Momento==4 & totalhosp==6
replace F_ingreso_hospital = date("12jul2018","DMY") in 5553
bysort consec: replace T1= F_ingreso_hospital[5] if F_ingreso_hospital[6] != . & Momento==4 & totalhosp==6
bysort consec: replace T0= F_egreso_hospital[5] if F_ingreso_hospital[6] != . & Momento==4 & totalhosp==6
bysort consec: replace T0= F_egreso_hospital[4] if F_ingreso_hospital[6] != . & Momento==4 & totalhosp==6
bysort consec: replace T0= F_egreso_hospital[5] if F_ingreso_hospital[6] != . & Momento==5 & totalhosp==6
bysort consec: replace T1= F_ingreso_hospital[6] if F_egreso_hospital[6] != . & Momento==5 & totalhosp==6
bysort consec: replace T0= F_egreso_hospital[6] if F_ingreso_hospital[6] != . & Momento==6 & totalhosp==6
bysort consec: replace T1= F_Fin[1] if F_egreso_hospital[6] != . & Momento==6 & totalhosp==6
save "C:\Users\rsanchez\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\parafechashospismall.dta", replace
sort totalhosp
sort consec Momento
*Y al fin 7
bysort consec: replace T0= F_egreso_hospital[2] if F_ingreso_hospital[7] != . & Momento==2 & totalhosp==7
save "C:\Users\rsanchez\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\parafechashospismall.dta", replace
bysort consec: replace T1= F_ingreso_hospital[3] if F_ingreso_hospital[7] != . & Momento==2 & totalhosp==7
save "C:\Users\rsanchez\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\parafechashospismall.dta", replace
bysort consec: replace T0= F_egreso_hospital[3] if F_ingreso_hospital[7] != . & Momento==3 & totalhosp==7
save "C:\Users\rsanchez\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\parafechashospismall.dta", replace
bysort consec: replace T1= F_ingreso_hospital[4] if F_egreso_hospital[7] != . & Momento==3 & totalhosp==7
bysort consec: replace T0= F_egreso_hospital[4] if F_ingreso_hospital[7] != . & Momento==4 & totalhosp==7
bysort consec: replace T1= F_ingreso_hospital[5] if F_ingreso_hospital[7] != . & Momento==4 & totalhosp==7
bysort consec: replace T0= F_egreso_hospital[5] if F_ingreso_hospital[7] != . & Momento==5 & totalhosp==7
bysort consec: replace T1= F_ingreso_hospital[6] if F_ingreso_hospital[7] != . & Momento==5 & totalhosp==7
bysort consec: replace T0= F_egreso_hospital[6] if F_ingreso_hospital[7] != . & Momento==6 & totalhosp==7
bysort consec: replace T1= F_ingreso_hospital[7] if F_ingreso_hospital[7] != . & Momento==6 & totalhosp==7
bysort consec: replace T0= F_egreso_hospital[7] if F_ingreso_hospital[7] != . & Momento==6 & totalhosp==7
bysort consec: replace T0= F_egreso_hospital[6] if F_ingreso_hospital[7] != . & Momento==6 & totalhosp==7
bysort consec: replace T0= F_egreso_hospital[7] if F_ingreso_hospital[7] != . & Momento==7 & totalhosp==7
bysort consec: replace T1= F_Fin[1] if F_egreso_hospital[7] != . & Momento==7 & totalhosp==7
save "C:\Users\rsanchez\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\parafechashospismall.dta", replace
*Ahora poner 0 y 1 para censura y desenlace
gen rectype = .
move rectype Estancia
bysort consec: replace rectype= 0 if  Momento==0 & totalhosp==0
sort consec Momento
bysort consec: replace rectype= 1 if  Momento==0 & totalhosp==1
bysort consec: replace rectype= 0 if  Momento==1 & totalhosp==1
bysort consec: replace rectype= 1 if  Momento==0 & totalhosp==4
bysort consec: replace rectype= 1 if  Momento==1 & totalhosp==4
bysort consec: replace rectype= 1 if  Momento==2 & totalhosp==4
bysort consec: replace rectype= 1 if  Momento==3 & totalhosp==4
bysort consec: replace rectype= 0 if  Momento==4 & totalhosp==4
bysort consec: replace rectype= 1 if  Momento==0 & totalhosp==2
bysort consec: replace rectype= 1 if  Momento==1 & totalhosp==2
bysort consec: replace rectype= 0 if  Momento==2 & totalhosp==2
bysort consec: replace rectype= 1 if  Momento==0 & totalhosp==3
bysort consec: replace rectype= 1 if  Momento==1 & totalhosp==4
bysort consec: replace rectype= 1 if  Momento==1 & totalhosp==3
bysort consec: replace rectype= 1 if  Momento==2 & totalhosp==3
bysort consec: replace rectype= 0 if  Momento==3 & totalhosp==3
bysort consec: replace rectype= 1 if  Momento==0 & totalhosp==6
bysort consec: replace rectype= 1 if  Momento==1 & totalhosp==6
bysort consec: replace rectype= 1 if  Momento==2 & totalhosp==6
bysort consec: replace rectype= 1 if  Momento==3 & totalhosp==6
bysort consec: replace rectype= 1 if  Momento==4 & totalhosp==6
bysort consec: replace rectype= 1 if  Momento==5 & totalhosp==6
bysort consec: replace rectype= 0 if  Momento==6 & totalhosp==6
bysort consec: replace rectype= 1 if  Momento==0 & totalhosp==7
bysort consec: replace rectype= 1 if  Momento==10 & totalhosp==7
bysort consec: replace rectype= 1 if  Momento==1 & totalhosp==7
bysort consec: replace rectype= 1 if  Momento==2 & totalhosp==7
bysort consec: replace rectype= 1 if  Momento==3 & totalhosp==7
bysort consec: replace rectype= 1 if  Momento==4 & totalhosp==7
bysort consec: replace rectype= 1 if  Momento==5 & totalhosp==7
bysort consec: replace rectype= 1 if  Momento==6 & totalhosp==7
bysort consec: replace rectype= 0 if  Momento==7 & totalhosp==7
bysort consec: replace rectype= . if  Momento==10 & totalhosp==7
bysort consec: replace rectype= 1 if  Momento==0 & totalhosp==5
bysort consec: replace rectype= 1 if  Momento==1 & totalhosp==5
bysort consec: replace rectype= 1 if  Momento==2 & totalhosp==5
bysort consec: replace rectype= 1 if  Momento==3 & totalhosp==5
bysort consec: replace rectype= 1 if  Momento==4 & totalhosp==5
bysort consec: replace rectype= 0 if  Momento==5 & totalhosp==5
save "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\parafechashospismall.dta", replace
