*DO para estimar mortalidad asumiendo medidas repetidas
*Corexh, marzo 2019
**/*/*/*/*
*Esta es para mortalidad
use "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesMedidasRepetidas\RepetidasCorexhArreglada.dta", clear
stset F_Fin , id( consec ) failure( Motivo_fin==1 ) time0( F_Firma_CI ) exit(time .) origin(time F_Firma_CI ) scale(365.25)

*Esta es para hospitalización
stset F_ingreso_hospital , id( consec ) failure( Hospitalizacion ) time0( F_Firma_CI ) exit(time .) origin(time F_Firma_CI ) scale(365.25)
