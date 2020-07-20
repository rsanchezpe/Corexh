label define tiporeporte 1 Inicial  2 Seguimiento
label values tiporeporte tiporeporte

label define condujoretiro 0 No 1 Si
label values condujoretiro condujoretiro

label define nivelseveridad 1 Leve 2 Moderada 3 Severa
label values nivelseveridad nivelseveridad

label define resultadoreporte 1 "Muerte" 2 "No Recuperado ni resuelto" 3 "En Recuperación/Resolución" 4 "Recuperado/Resuelto" 5 "Recuperado/Resuelto con Secuelas" 6 "Desconocido"
label values resultadoreporte resultadoreporte

label define serio 0 No 1 Si
label values serio serio

label define porqueserio 1 "Muerte" 2 "Amenazó la vida" 3 "Hospitalización o prolonga Hospitalización" 4 "Incapacidad/daño permanente de estructura corporal o función" 5 "Intervención médica/quirúrgica para evitar enfermedad/lesión potencialmente mortales o deterioro permanente" 6 "Sufrimiento/muerte fetal o anomalía congénita/malformación"
label values porqueserio porqueserio

label define intervenciones 1 "Ninguna" 2 "Tratamiento Farmacológico" 3 "No se Administra tratamiento Farmacológico" 4 "Interrupción tratamiento HDx" 5 "Retiro tratamiento de HDx" 6 "Otros"
label values intervenciones intervenciones

label define condujoacambio 0 No 1 Si
label values condujoacambio condujoacambio

label define relaciondispo 1 "Probablemente" 2 "Posiblemente" 3 "No se puede Determinar" 4 "Improbable" 5 "No Asociado"
label values relaciondispo relaciondispo

label values relacionconprocedi relaciondispo

label values hospiencurso serio

label values autopsia serio
