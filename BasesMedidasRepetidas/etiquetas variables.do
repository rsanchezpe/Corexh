* Etiquetas de variables

label define Genero 1 Masculino 2 Femenino
label values Genero Genero

label define Causa_ERC  1 Hipertensi�n  2 Diabetes_mellitus 3 Glom�rulo_autoinmune 4 Obstructiva 5 Desconocida 6 Otras
label values Causa_ERC  Causa_ERC  

label define sino 0 N0 1 Si

label define PEW_categ 1 Con_desgaste 0 Sin_desgaste
label values PEW_categ PEW_categ

label define Malnutricion_categorizada 1 Normal 2 Bajo 3 Moderado 4 Grave
label values Malnutricion_categorizada Malnutricion_categorizada

*label define Causa_hospitalizacin 1 Cardiovascular 2 Cerebrovascular 3 Metab�licas 4 Ortopedia 5 Acceso_vascular_HD 6	Gastrointestinal 7 Infecciosas 8 Otras
*label values Causa_hospitalizacin Causa_hospitalizacin

label define Muerte 1 Muerto 0 Vivo
label values Muerte Muerte

label define Causa_muerte 1 C�ncer 2  Cardiocerebrovascular 3  Infecciosa 4 Metabolica 5 Respiratoria 6 Otras 7 Desconocida
label values Causa_muerte Causa_muerte

label define Motivo_fin 1 Muerte 2 Abandono_Suspensi�n_di�lisis 3 Cambio_asegurador_prestador 4 Recuperaci�n_funci�n_renal 5 Trasplante_Renal 6 Cambio_di�lisis_peritoneal_o_dializador 7 Retiro_Voluntario 8 Desviaci�n_protocolo 9 Fin_estudio
label values Motivo_fin Motivo_fin
label values Dx_Hiper sino
label values Dx_Diab sino
label values Dx_Enfcardio sino
label values Hospitalizacion sino
