*Do para modelos ANOVA y mixtos

use "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\RepetidasCorexhArregladaImputada.dta", clear
tab Genero
sum Edad, det
tab Causa_ERC
tab Causa_ERC if consec ==0
tab Causa_ERC if consec ==0
tab Causa_ERC if Momento ==0
tab1 Dx_Hiper Dx_Diab Dx_Enfcardio
sum Charlson,det
sum Karnosfky ,det
sum Antigedad_Dialisisaos ,det
display 7.917864 -  1.659138
tabstat Hemoglobina, statistics( mean sd median iqr skewness )
tabstat Hematocrito , statistics( mean sd median iqr skewness )
tabstat Plaquetas , statistics( mean sd median iqr skewness )
tabstat Linfocitos , statistics( mean sd median iqr skewness )
tabstat Fsforo , statistics( mean sd median iqr skewness )
tabstat Calcio , statistics( mean sd median iqr skewness )
tabstat Potasio , statistics( mean sd median iqr skewness )
tabstat Albumina , statistics( mean sd median iqr skewness )
tabstat Albumina , statistics( mean sd median iqr skewness )
tabstat HbA1c , statistics( mean sd median iqr skewness )
tabstat PTHi , statistics( mean sd median iqr skewness )
tabstat pcr , statistics( mean sd median iqr skewness )
tabstat KtV , statistics( mean sd median iqr skewness )
tabstat BUN_pre , statistics( mean sd median iqr skewness )
tabstat BUN_post , statistics( mean sd median iqr skewness )
tabstat Urea_pre , statistics( mean sd median iqr skewness )
tabstat urea_post , statistics( mean sd median iqr skewness )
tabstat Hierro , statistics( mean sd median iqr skewness )
tabstat TIBC , statistics( mean sd median iqr skewness )
tabstat TSAT , statistics( mean sd median iqr skewness )
tabstat Ferritina , statistics( mean sd median iqr skewness )
tabstat Colesterol , statistics( mean sd median iqr skewness )
tabstat HDL , statistics( mean sd median iqr skewness )
tabstat LDL , statistics( mean sd median iqr skewness )
tabstat Trigliceridos , statistics( mean sd median iqr skewness )
tabstat Vol_urinario , statistics( mean sd median iqr skewness )
tabstat Dep_Creati , statistics( mean sd median iqr skewness )
tabstat Dep_urea , statistics( mean sd median iqr skewness )
use "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\solonutri1.dta", clear
codebook Id
use "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\RepetidasCorexhArregladaImputada.dta", clear
keep consec Momento Peso Talla IMC
codebook consec
save "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\solonutri_1.dta"
use "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\RepetidasCorexhArregladaImputada.dta", clear
keep consec Momento PEW PEW_categ NPCR Malnutricion_Inflamacion Malnutricion_categorizada
keep if Momento ==0 | Momento == 4| Momento ==7|Momento ==10|Momento ==13
save "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\solonutri_2.dta"
tabstat PEW , statistics( mean sd median iqr skewness )
tabstat NPCR , statistics( mean sd median iqr skewness )
tab PEW_categ
tabstat PEW  if Momento ==0, statistics( mean sd median iqr skewness )
tabstat NPCR if Momento ==0, statistics( mean sd median iqr skewness )
tab PEW_categ if Momento ==0
codebook cons
tabstat PEW  if Momento ==0, statistics( mean sd median iqr skewness count )
tabstat NPCR if Momento ==0, statistics( mean sd median iqr skewness count )
tabstat Malnutricion_Inflamacion if Momento ==0, statistics( mean sd median iqr skewness count )
tab Malnutricion_categorizada   if Momento ==0
use "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\solonutri_1.dta", clear
tabstat Peso if Momento ==0, statistics( mean sd median iqr skewness count )
tabstat Talla if Momento ==0, statistics( mean sd median iqr skewness count )
tabstat IMC if Momento ==0, statistics( mean sd median iqr skewness count )
use "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\albumina_.dta", clear
set matsize 2000
anova Albumina consec Momento, repeated(Mom)
margins Momento
marginsplot
set dp comm
margins Momento
use "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\sololabs_1.dta", clear
anova Hemoglobina consec Momento, repeated(Mom)
margins Momento
marginsplot
anova Fsforo consec Momento, repeated(Mom)
margins Momento
marginsplot
anova KtV consec Momento, repeated(Mom)
margins Momento
marginsplot
anova Calcio consec Momento, repeated(Mom)
margins Momento
marginsplot
use "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\sololabs_2.dta", clear
anova Plaquetas consec Momento, repeated(Mom)
margins Momento
marginsplot
anova RazonPlaq_Linfocito consec Momento, repeated(Mom)
margins Momento
marginsplot
use "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\RepetidasCorexhArregladaImputada.dta", clear
use "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\sololabs2.dta", clear
use "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\solonutri_2.dta", clear
use "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\RepetidasCorexhArregladaImputada.dta", clear
keep consec Momento pcr
drop if M ==1| M==2| M==3| M==5| M==6| M==8|M==9|M==11|M==12
sort consec Momento
use "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\RepetidasCorexhArregladaImputada.dta", clear
keep consec Momento pcr
keep if Momento ==0|M==4|M==7|M==10
use "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\RepetidasCorexhArregladaImputada.dta", clear
keep consec Momento pcr
keep if Momento ==0|M==4|M==7|M==10|M==13
codebook con
save "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\pcr_.dta"
anova pcr consec Momento, repeated(Mom)
sort pcr
replace pcr = . in 4018
save "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\pcr_.dta", replace
anova pcr consec Momento, repeated(Mom)
margins Momento
marginsplot
use "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\solonutri_1.dta", clear
anova IMC consec Momento, repeated(Mom)
margins Momento
marginsplot
drop if M==0
anova IMC consec Momento, repeated(Mom)
use "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\solonutri_1.dta", clear
drop if M==13
anova IMC consec Momento, repeated(Mom)
margins Momento
marginsplot
use "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\solonutri_2.dta", clear
anova PEW consec Momento, repeated(Mom)
margins Momento
marginsplot
anova NPCR consec Momento, repeated(Mom)
margins Momento
marginsplot
use "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\RepetidasCorexhArregladaImputada.dta", clear
tab Motivo
stset F_Fin , id( consec ) failure( Motivo_fin==1 ) time0( F_Firma_CI ) exit(time .) origin(time F_Firma_CI ) scale(365.25)
sts graph
tab Causa_muerte
stptime, per(100)
stsum
stdes
tab1 Causa_hospitalizacin Hospitalizacion_agrupada
tab Hospitalizacion_agrupada, sort
stset F_ingreso_hospital , id( consec ) failure( Hospitalizacion ) time0( F_Firma_CI ) exit(time .) origin(time F_Firma_CI ) scale(365.25)
sts graph
stptime
tab Hospitalizacion
use "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesKDQOL\kdqol012long.dta", clear
use "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesKDQOL\kdqol0.dta", clear
use "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\RepetidasCorexhArregladaImputada.dta", clear
db xtset
db xtset
xtset consec Momento
 xtreg Albumina Antigedad_Dialisisaos , re
xtreg Albumina Antigedad_Dialisisaos i.Causa_ERC , re
xtreg Albumina Antigedad_Dialisisaos i.Causa_ERC Edad , re 
xtreg Albumina Antigedad_Dialisisaos i.Causa_ERC Edad, re
 xtreg Albumina Dx_Diab , re
xtreg Albumina  i.Causa_ERC , re
tab Causa_ERC
xtreg Albumina  ib6.Causa_ERC , re
xtreg Albumina  ib1.Causa_ERC , re
xtreg Albumina  ib3.Causa_ERC , re
xtreg Albumina  ib4.Causa_ERC , re
xtreg Albumina  ib5.Causa_ERC , re
bysort consec: replace Dx_Enfcardio= Dx_Enfcardio[_n - 1] if missing( Dx_Enfcardio)
bysort consec: replace Dx_Diab = Dx_Diab[_n - 1] if missing( Dx_Diab )
bysort consec: replace Dx_Hiper = Dx_Hiper[_n - 1] if missing( Dx_Hiper )
save "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\RepetidasCorexhArregladaImputada.dta", replace
xtreg Albumina Antigedad_Dialisisaos i.Causa_ERC Edad Dx_Diab, re
xtreg Albumina Antigedad_Dialisisaos ib5.Causa_ERC Edad Dx_Diab, re
xtreg Albumina Antigedad_Dialisisaos ib5.Causa_ERC Edad, re
xtreg Albumina Antigedad_Dialisisaos ib6.Causa_ERC Edad, re
xtreg Albumina Antigedad_Dialisisaos ib3.Causa_ERC Edad, re
xtreg Albumina Antigedad_Dialisisaos ib4.Causa_ERC Edad, re
xtreg Albumina Antigedad_Dialisisaos ib5.Causa_ERC Edad, re
xtreg Albumina Antigedad_Dialisisaos ib6.Causa_ERC Edad, re
xtreg Albumina  Edad Antigedad_Dialisisaos Dx_Hiper Dx_Diab Dx_Enfcardio , re
xtreg Albumina  Edad Antigedad_Dialisisaos , re
xtreg Albumina  Edad , re
xtreg Albumina  Antigedad_Dialisisaos , re
xtreg Albumina  ib5.Causa_ERC , re
xtreg Albumina  ib6.Causa_ERC , re
xtreg Albumina  ib4.Causa_ERC , re
xtreg Albumina  i.Causa_ERC , re
xtreg Albumina  ib5.Causa_ERC , re
xtreg Albumina Edad , re
xtreg Albumina Antigedad_Dialisisaos , re
xtreg Albumina ib5.Causa_ERC , re
tab Causa_ERC
xtreg Albumina Dx_Hiper , re
xtreg Albumina Dx_Diab , re
xtreg Albumina Dx_Enfcardio , re
xtreg Albumina Edad Antigedad_Dialisisaos Dx_Diab Dx_Hiper Dx_Enfcardio , re
xtreg Hemoglobina Edad , re
xtreg Hemoglobina Antigedad_Dialisisaos , re
xtreg Hemoglobina ib5.Causa_ERC , re
xtreg Hemoglobina Dx_Hiper , re
xtreg Hemoglobina Dx_Diab , re
xtreg Hemoglobina Dx_Enfcardio , re
xtreg Hemoglobina Edad Antigedad_Dialisisaos Dx_Diab Dx_Hiper Dx_Enfcardio , re
xtreg KtV Edad , re
xtreg KtV Antigedad_Dialisisaos , re
xtreg KtV ib5.Causa_ERC , re
xtreg KtV Dx_Hiper , re
xtreg KtV Dx_Diab , re
xtreg KtV Dx_Enfcardio , re
xtreg KtV Edad Antigedad_Dialisisaos Dx_Diab Dx_Hiper Dx_Enfcardio , re
xtreg Fsforo Edad , re
xtreg Fsforo Antigedad_Dialisisaos , re
xtreg Fsforo ib5.Causa_ERC , re
xtreg Fsforo Dx_Hiper , re
xtreg Fsforo Dx_Diab , re
xtreg Fsforo Dx_Enfcardio , re
xtreg Fsforo Edad Antigedad_Dialisisaos Dx_Diab Dx_Hiper Dx_Enfcardio , re
xtreg Fsforo Edad Antigedad_Dialisisaos Dx_Hiper Dx_Diab  Dx_Enfcardio , re
xtreg Calcio Edad , re
xtreg Calcio Antigedad_Dialisisaos , re
xtreg Calcio ib5.Causa_ERC , re
xtreg Calcio Dx_Hiper , re
xtreg Calcio Dx_Diab , re
xtreg Calcio Dx_Enfcardio , re
xtreg Calcio Edad Antigedad_Dialisisaos Dx_Diab Dx_Hiper Dx_Enfcardio , re
xtreg pcr Edad , re
xtreg pcr Antigedad_Dialisisaos , re
xtreg pcr ib5.Causa_ERC , re
xtreg pcr Dx_Hiper , re
xtreg pcr Dx_Diab , re
xtreg pcr Dx_Enfcardio , re
xtreg pcr Edad Antigedad_Dialisisaos Dx_Diab Dx_Hiper Dx_Enfcardio , re
*Este es el gráfico de porcentaje de pacientes con el síntoma en cada momento
twoway (connected isd01 momento) (scatter isd02 momento) (connected isd03 momento) (connected isd04 momento) (connected isd05 momento) (connected isd06 momento) (connected isd07 momento) (connected isd08 momento) (connected isd09 momento) (connected isd10 momento) (connected isd11 momento) (connected isd12 momento) (connected isd13 momento) (connected isd14 momento) (connected isd15 momento) (connected isd16 momento) (connected isd17 momento) (connected isd18 momento) (connected isd19 momento) (connected isd20 momento) (connected isd21 momento) (connected isd22 momento) (connected isd23 momento) (connected isd24 momento) (connected isd25 momento) (connected isd26 momento) (connected isd27 momento) (connected isd28 momento) (connected isd29 momento) (connected isd30 momento),scheme(mrc)
