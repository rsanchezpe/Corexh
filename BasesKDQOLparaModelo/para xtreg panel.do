*Análisis de regresión múltiple con datos de panel
*file D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesKDQOLparaModelo\paramodeloKOL590.dta


xtreg sfphysical Edad
xtreg sfphysical Genero
xtreg sfphysical Dx_Diab
xtreg sfphysical Dx_Enfcardio
xtreg sfphysical i.Charlsoncat
xtreg sfphysical i.Acceso_Vascular
xtreg sfphysical Antigedad_Dialisisaos
xtreg sfphysical Karnosfky
xtreg sfphysical Hemoglobina
xtreg sfphysical Fsforo
xtreg sfphysical Albumina
xtreg sfphysical PTHi
xtreg sfphysical Vol_urinario

xtreg sfphysical Edad Genero Dx_Diab Dx_Enfcardio i.Charlsoncat i.Acceso_Vascular Karnosfky Antigedad_Dialisisaos Hemoglobina Fsforo Albumina PTHi Vol_urinario 



xtreg sf12mentalcomposite Edad
xtreg sf12mentalcomposite Genero
xtreg sf12mentalcomposite Dx_Diab
xtreg sf12mentalcomposite Dx_Enfcardio
xtreg sf12mentalcomposite i.Charlsoncat
xtreg sf12mentalcomposite i.Acceso_Vascular
xtreg sf12mentalcomposite Antigedad_Dialisisaos
xtreg sf12mentalcomposite Karnosfky
xtreg sf12mentalcomposite Hemoglobina
xtreg sf12mentalcomposite Fsforo
xtreg sf12mentalcomposite Albumina
xtreg sf12mentalcomposite PTHi
xtreg sf12mentalcomposite Vol_urinario

xtreg sf12mentalcomposite Edad Genero Dx_Diab Dx_Enfcardio i.Charlsoncat i.Acceso_Vascular Karnosfky Antigedad_Dialisisaos Hemoglobina Fsforo Albumina PTHi Vol_urinario 

save "D:\Dropbox\Baxter\Corexh\BasesCorexh\BasesKDQOLparaModelo\paramodeloKOL590.dta", replace
