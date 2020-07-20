*Para el anova de medidas repetidas primero poner la base en long
reshape long symptom_problemlist effectsofkidneydisease burdenofkidneydisease sf12physicalcomposite sf12mentalcomposite  , i(id) j(moment)
*Para anova el identificador no puede ser string:
codebook newid
label values newid .
*Todo listo para los anovas:
save "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesKDQOL\kdqol012long.dta"
set matsize 1000

anova symptom_problemlist newid moment, repeated( moment)
anova effectsofkidneydisease newid moment, repeated( moment)
anova burdenofkidneydisease newid moment, repeated( moment)
anova sf12physicalcomposite newid moment, repeated( moment)
anova sf12mentalcomposite newid moment, repeated( moment)

*Se puede chequear esfericidad con un test de Mauchly
*Se incluye el test para otras variables del grupo de PROMs
help mauchly

use "C:\Users\rsanchez\Dropbox\Baxter\Corexh\spilong.dta", clear
db xtset
xtset newid
xtgee rls_diagnstico , family(binomial) link(probit) corr(exchangeable)
db xtset
display exp(-0.916)
use "C:\Users\rsanchez\Dropbox\Baxter\Corexh\spiwide.dta", clear
mcc rls_diagnstico1 rls_diagnstico2
display 1/5
mcc rls_diagnstico2  rls_diagnstico1
symmetry rls_diagnstico1 rls_diagnstico2
help mcc
mcc rls_diagnstico2  rls_diagnstico1
mcc rls_diagnstico1 rls_diagnstico2
mcc rls_diagnstico2  rls_diagnstico1
tab1 rls_diagnstico1 rls_diagnstico2
use "C:\Users\rsanchez\Dropbox\Baxter\Corexh\dsi_wide.dta", clear
use "C:\Users\rsanchez\Dropbox\Baxter\Corexh\kdqol_wide.dta", clear
coun
use "C:\Users\rsanchez\Dropbox\Baxter\Corexh\spiwide.dta", clear

