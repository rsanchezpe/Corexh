load("C:/Users/rsanchez/Dropbox/Baxter/Corexh/BasesCorexh/BasesMedidasRepetidas/sololabs1.RData")

install.packages("Rcpp")
install.packages("ggthemes")
install.packages("dplyr")
install.packages("tidyverse")
install.packages("mgcv")
install.packages("purrr")
install.packages("nlme")
install.packages("tibble") 
install.packages("tidyr")
install.packages("stringr")
install.packages("readr")
install.packages("forcats")

library(Rcpp)
library(ggthemes)
library(dbplyr)
library(tidyverse)
library(purrr)
library(mgcv)
library(ggplot2)
library(plyr)
library(dplyr)
library(forcats)
library(readr)
library(ggthemes)
require(haven)
library(tibble)
library(tidyr)
require(stringr)

#Hay una base para cada grupo de laboratorios porque los baches en las mediciones dañan el gráfico
#Estos son Venus Plots

# Use a consistent y range
ymax <- max(sololabs1$Hemoglobina)
ymin <- min(sololabs1$Hemoglobina)

ggplot(sololabs1, aes(x=Momento, y=Hemoglobina, colour=Id, group=Id)) +
  geom_line() + geom_point(shape=21, fill="white") +
  ylim(ymin,ymax) + theme_minimal()

# Use a consistent y range
ymax <- max(sololabs1$Hematocrito)
ymin <- min(sololabs1$Hematocrito)

ggplot(sololabs1, aes(x=Momento, y=Hematocrito, colour=Id, group=Id)) +
  geom_line() + geom_point(shape=21, fill="white") +
  ylim(ymin,ymax)

# Use a consistent y range
ymax <- max(sololabs1$Fsforo)
ymin <- min(sololabs1$Fsforo)

ggplot(sololabs1, aes(x=Momento, y=Fsforo, colour=Id, group=Id)) +
  geom_line() + geom_point(shape=21, fill="white") +
  ylim(ymin,ymax)

# Use a consistent y range
ymax <- max(sololabs1$Calcio)
ymin <- min(sololabs1$Calcio)

ggplot(sololabs1, aes(x=Momento, y=Calcio, colour=Id, group=Id)) +
  geom_line() + geom_point(shape=21, fill="white") +
  ylim(ymin,ymax)

# Use a consistent y range
ymax <- max(sololabs1$Potasio)
ymin <- min(sololabs1$Potasio)

ggplot(sololabs1, aes(x=Momento, y=Potasio, colour=Id, group=Id)) +
  geom_line() + geom_point(shape=21, fill="white") +
  ylim(ymin,ymax)

# Use a consistent y range
ymax <- max(sololabs1$KtV)
ymin <- min(sololabs1$KtV)

ggplot(sololabs1, aes(x=Momento, y=KtV, colour=Id, group=Id)) +
  geom_line() + geom_point(shape=21, fill="white") +
  ylim(ymin,ymax)

# Use a consistent y range
ymax <- max(sololabs1$BUN_pre)
ymin <- min(sololabs1$BUN_pre)

ggplot(sololabs1, aes(x=Momento, y=BUN_pre, colour=Id, group=Id)) +
  geom_line() + geom_point(shape=21, fill="white") +
  ylim(ymin,ymax)

# Use a consistent y range
ymax <- max(sololabs1$BUN_post)
ymin <- min(sololabs1$BUN_post)

ggplot(sololabs1, aes(x=Momento, y=BUN_post, colour=Id, group=Id)) +
  geom_line() + geom_point(shape=21, fill="white") +
  ylim(ymin,ymax)

###############################################################
#
library(haven)

#Gráficos de efecto medio del tiempo (Main effect of time)
#Ojo: en estas se usa el tiempo como numérico, no como factor
#https://rpubs.com/jaw588/lab14

ggplot(albumina_, aes(Momento, Albumina))  + 
  stat_summary(fun.data = mean_cl_boot, geom="ribbon", alpha=.3) + 
  stat_summary(fun.y = mean, geom="line") + 
  labs(x="Time Interval", y = "Albumin", 
       title="Albumin over Time", subtitle = "Mean and Boostrapped 95% Confidence Intervals") +theme_solarized()

#Modelo lineal del ajuste del efecto medio del tiempo
ggplot(albumina_, aes(Momento, Albumina))  + 
geom_smooth(method=lm, alpha=.2) + 
  labs(x="Time Interval", y = "Albumin", 
       title="Albumin over Time",
       subtitle = "Linear Model Fit")+theme_solarized()

#Modelo cuadrático del ajuste del efecto medio del tiempo
ggplot(albumina, aes(Momento, Albumina))  + 
  geom_smooth(method=lm, alpha=.2, formula= y ~ x + I(x^2)) + 
  labs(x="Time Interval", y = "Albumin", 
       title="Albumin over Time",
       subtitle = "Quadratic Model Fit") +theme_solarized()


####

ggplot(sololabs1, aes(Momento, Hemoglobina))  + 
  stat_summary(fun.data = mean_cl_boot, geom="ribbon", alpha=.3) + 
  stat_summary(fun.y = mean, geom="line") + 
  labs(x="Time Interval", y = "Hemoglobin", 
       title="Hemoglobin over Time", subtitle = "Mean and Boostrapped 95% Confidence Intervals") +theme_solarized()

#Modelo lineal del ajuste del efecto medio del tiempo
ggplot(sololabs1, aes(Momento, Hemoglobina))  + 
  geom_smooth(method=lm, alpha=.2) + 
  labs(x="Time Interval", y = "Hemoglobin", 
       title="Hemoglobin over Time",
       subtitle = "Linear Model Fit")+theme_solarized()

#Modelo cuadrático del ajuste del efecto medio del tiempo
ggplot(sololabs1, aes(Momento, Hemoglobina))  + 
  geom_smooth(method=lm, alpha=.2, formula= y ~ x + I(x^2)) + 
  labs(x="Time Interval", y = "Hemoglobin", 
       title="Hemoglobin over Time",
       subtitle = "Quadratic Model Fit") +theme_solarized()

####

ggplot(sololabs1, aes(Momento, Hematocrito))  + 
  stat_summary(fun.data = mean_cl_boot, geom="ribbon", alpha=.3) + 
  stat_summary(fun.y = mean, geom="line") + 
  labs(x="Time Interval", y = "Hematocrito", 
       title="Hematocrito over Time", subtitle = "Mean and Boostrapped 95% Confidence Intervals") +theme_solarized()

#Modelo lineal del ajuste del efecto medio del tiempo
ggplot(sololabs1, aes(Momento, Hematocrito))  + 
  geom_smooth(method=lm, alpha=.2) + 
  labs(x="Time Interval", y = "Hematocrito", 
       title="Hematocrito over Time",
       subtitle = "Linear Model Fit")+theme_solarized()

#Modelo cuadrático del ajuste del efecto medio del tiempo
ggplot(sololabs1, aes(Momento, Hematocrito))  + 
  geom_smooth(method=lm, alpha=.2, formula= y ~ x + I(x^2)) + 
  labs(x="Time Interval", y = "Hematocrito", 
       title="Hematocrito over Time",
       subtitle = "Quadratic Model Fit") +theme_solarized()

####

ggplot(sololabs1, aes(Momento, Calcio))  + 
  stat_summary(fun.data = mean_cl_boot, geom="ribbon", alpha=.3) + 
  stat_summary(fun.y = mean, geom="line") + 
  labs(x="Time Interval", y = "Calcio", 
       title="Calcio over Time", subtitle = "Mean and Boostrapped 95% Confidence Intervals") +theme_solarized()

#Modelo lineal del ajuste del efecto medio del tiempo
ggplot(sololabs1, aes(Momento, Calcio))  + 
  geom_smooth(method=lm, alpha=.2) + 
  labs(x="Time Interval", y = "Calcio", 
       title="Calcio over Time",
       subtitle = "Linear Model Fit")+theme_solarized()

#Modelo cuadrático del ajuste del efecto medio del tiempo
ggplot(sololabs1, aes(Momento, Calcio))  + 
  geom_smooth(method=lm, alpha=.2, formula= y ~ x + I(x^2)) + 
  labs(x="Time Interval", y = "Calcio", 
       title="Calcio over Time",
       subtitle = "Quadratic Model Fit") +theme_solarized()

####


ggplot(sololabs1, aes(Momento, Potasio))  + 
  stat_summary(fun.data = mean_cl_boot, geom="ribbon", alpha=.3) + 
  stat_summary(fun.y = mean, geom="line") + 
  labs(x="Time Interval", y = "Potasio", 
       title="Potasio over Time", subtitle = "Mean and Boostrapped 95% Confidence Intervals") +theme_solarized()

#Modelo lineal del ajuste del efecto medio del tiempo
ggplot(sololabs1, aes(Momento, Potasio))  + 
  geom_smooth(method=lm, alpha=.2) + 
  labs(x="Time Interval", y = "Potasio", 
       title="Potasio over Time",
       subtitle = "Linear Model Fit")+theme_solarized()

#Modelo cuadrático del ajuste del efecto medio del tiempo
ggplot(sololabs1, aes(Momento, Potasio))  + 
  geom_smooth(method=lm, alpha=.2, formula= y ~ x + I(x^2)) + 
  labs(x="Time Interval", y = "Potasio", 
       title="Potasio over Time",
       subtitle = "Quadratic Model Fit") +theme_solarized()

####


ggplot(sololabs1, aes(Momento, KtV))  + 
  stat_summary(fun.data = mean_cl_boot, geom="ribbon", alpha=.3) + 
  stat_summary(fun.y = mean, geom="line") + 
  labs(x="Time Interval", y = "KtV", 
       title="KtV over Time", subtitle = "Mean and Boostrapped 95% Confidence Intervals") +theme_solarized()

#Modelo lineal del ajuste del efecto medio del tiempo
ggplot(sololabs1, aes(Momento, KtV))  + 
  geom_smooth(method=lm, alpha=.2) + 
  labs(x="Time Interval", y = "KtV", 
       title="KtV over Time",
       subtitle = "Linear Model Fit")+theme_solarized()

#Modelo cuadrático del ajuste del efecto medio del tiempo
ggplot(sololabs1, aes(Momento, KtV))  + 
  geom_smooth(method=lm, alpha=.2, formula= y ~ x + I(x^2)) + 
  labs(x="Time Interval", y = "KtV", 
       title="KtV over Time",
       subtitle = "Quadratic Model Fit") +theme_solarized()

####

ggplot(sololabs1, aes(Momento, BUN_pre))  + 
  stat_summary(fun.data = mean_cl_boot, geom="ribbon", alpha=.3) + 
  stat_summary(fun.y = mean, geom="line") + 
  labs(x="Time Interval", y = "BUN_pre", 
       title="BUN_pre over Time", subtitle = "Mean and Boostrapped 95% Confidence Intervals") +theme_solarized()

#Modelo lineal del ajuste del efecto medio del tiempo
ggplot(sololabs1, aes(Momento, BUN_pre))  + 
  geom_smooth(method=lm, alpha=.2) + 
  labs(x="Time Interval", y = "BUN_pre", 
       title="BUN_pre over Time",
       subtitle = "Linear Model Fit")+theme_solarized()

#Modelo cuadrático del ajuste del efecto medio del tiempo
ggplot(sololabs1, aes(Momento, BUN_pre))  + 
  geom_smooth(method=lm, alpha=.2, formula= y ~ x + I(x^2)) + 
  labs(x="Time Interval", y = "BUN_pre", 
       title="BUN_pre over Time",
       subtitle = "Quadratic Model Fit") +theme_solarized()

####

ggplot(sololabs1, aes(Momento, BUN_post))  + 
  stat_summary(fun.data = mean_cl_boot, geom="ribbon", alpha=.3) + 
  stat_summary(fun.y = mean, geom="line") + 
  labs(x="Time Interval", y = "BUN_post", 
       title="BUN_post over Time", subtitle = "Mean and Boostrapped 95% Confidence Intervals") +theme_solarized()

#Modelo lineal del ajuste del efecto medio del tiempo
ggplot(sololabs1, aes(Momento, BUN_post))  + 
  geom_smooth(method=lm, alpha=.2) + 
  labs(x="Time Interval", y = "BUN_post", 
       title="BUN_post over Time",
       subtitle = "Linear Model Fit")+theme_solarized()

#Modelo cuadrático del ajuste del efecto medio del tiempo
ggplot(sololabs1, aes(Momento, BUN_post))  + 
  geom_smooth(method=lm, alpha=.2, formula= y ~ x + I(x^2)) + 
  labs(x="Time Interval", y = "BUN_post", 
       title="BUN_post over Time",
       subtitle = "Quadratic Model Fit") +theme_solarized()


######################
#Otros gráficos
#Muestra trayectorias individuales y suaviza con LOESS
######################

ggplot(albumina_, aes(x=Momento, y=Albumina)) + 
  geom_line(alpha=.3,aes(group=consec), color="salmon1") + 
  geom_point(alpha=.02) +
  geom_smooth(method= "loess") +
  geom_line(data=albumina, show.legend = T, color='orange') +
  theme_bw() +
  xlab("Month") + ylab("Albumin")


#ggplot(albumina, aes(x=Momento, y=Albumina)) + 
  #geom_line(alpha=.3,aes(group=Id)) + 
  #geom_point(alpha=.3) +
  #geom_smooth(method= "loess") +
  #geom_line(data=albumina, show.legend = F, color='forestgreen') +
  #theme_solarized()

#For choosing colors: https://www.nceas.ucsb.edu/~frazier/RSpatialGuides/colorPaletteCheatsheet.pdf

ggplot(albumina_, aes(x=Momento, y=Albumina)) + 
  geom_line(alpha=.3,aes(group=consec), color="salmon1") + 
  geom_point(alpha=.02) +
  geom_smooth(method= "loess") +
  geom_line(data=albumina, show.legend = T, color='orange') +
  theme_bw() +
  xlab("Month") + ylab("Albumin")


ggplot(sololabs_1, aes(x=Momento, y=Hemoglobina)) + 
  geom_line(alpha=.3,aes(group=consec), color='wheat3') + 
  geom_point(alpha=.02) +
  geom_smooth(method= "loess") +
  geom_line(data=sololabs_1, show.legend = T, color='orange') +
  theme_bw() +
  xlab("Month") + ylab("Hemoglobin")


ggplot(sololabs_1, aes(x=Momento, y=Fsforo)) + 
  geom_line(alpha=.3,aes(group=consec), color='paleturquoise3') + 
  geom_point(alpha=.02) +
  geom_smooth(method= "loess") +
  geom_line(data=sololabs_1, show.legend = T, color='orange') +
  theme_bw() +
  xlab("Month") + ylab("Phosphorus")


ggplot(sololabs_1, aes(x=Momento, y=KtV)) + 
  geom_line(alpha=.3,aes(group=consec), color='palegreen2') + 
  geom_point(alpha=.02) +
  geom_smooth(method= "loess") +
  geom_line(data=sololabs_1, show.legend = T, color='orange') +
  theme_bw() +
  xlab("Month") + ylab("Kt/V")


ggplot(sololabs_1, aes(x=Momento, y=Calcio)) + 
  geom_line(alpha=.3,aes(group=consec), color='yellow2') + 
  geom_point(alpha=.02) +
  geom_smooth(method= "loess") +
  geom_line(data=sololabs_1, show.legend = T, color='orange') +
  theme_bw() +
  xlab("Month") + ylab("Calcium")


ggplot(sololabs_2, aes(x=Momento, y=Plaquetas)) + 
  geom_line(alpha=.3,aes(group=consec), color='ivory4') + 
  geom_point(alpha=.02) +
  geom_smooth(method= "loess") +
  geom_line(data=sololabs_2, show.legend = T, color='orange') +
  theme_bw() +
  xlab("Month") + ylab("Platelets")


ggplot(sololabs_2, aes(x=Momento, y=RazonPlaq_Linfocito)) + 
  geom_line(alpha=.3,aes(group=consec), color='darkolivegreen2') + 
  geom_point(alpha=.02) +
  geom_smooth(method= "loess") +
  geom_line(data=sololabs_2, show.legend = T, color='orange') +
  theme_bw() +
  xlab("Month") + ylab("Platelet/Lymphocyte ratio")

ggplot(pcr_, aes(x=Momento, y=pcr)) + 
  geom_line(alpha=.3,aes(group=consec), color='plum2') + 
  geom_point(alpha=.02) +
  geom_smooth(method= "loess") +
  geom_line(data=pcr_, show.legend = T, color='orange') +
  theme_bw() +
  xlab("Month") + ylab("CRP")


ggplot(solonutri_1, aes(x=Momento, y=IMC)) + 
  geom_line(alpha=.3,aes(group=consec), color='darkturquoise') + 
  geom_point(alpha=.02) +
  geom_smooth(method= "loess") +
  geom_line(data=solonutri_1, show.legend = T, color='orange') +
  theme_bw() +
  xlab("Month") + ylab("BMI")

ggplot(solonutri_2, aes(x=Momento, y=PEW)) + 
  geom_line(alpha=.3,aes(group=consec), color='peachpuff3') + 
  geom_point(alpha=.02) +
  geom_smooth(method= "loess") +
  geom_line(data=solonutri_2, show.legend = T, color='orange') +
  theme_bw() +
  xlab("Month") + ylab("PEW")

ggplot(solonutri_2, aes(x=Momento, y=NPCR)) + 
  geom_line(alpha=.3,aes(group=consec), color='pink') + 
  geom_point(alpha=.02) +
  geom_smooth(method= "loess") +
  geom_line(data=solonutri_2, show.legend = T, color='orange') +
  theme_bw() +
  xlab("Month") + ylab("NPCR")

#ggplot(sololabs1, aes(x=Momento, y=Hematocrito)) + 
  #geom_line(alpha=.3,aes(group=Id)) + 
  #geom_point(alpha=.3) +
  #geom_smooth(method= "loess") +
  #geom_line(data=sololabs1, show.legend = F, color='forestgreen') +
  #theme_solarized()

ggplot(sololabs1, aes(x=Momento, y=Fsforo)) + 
  geom_line(alpha=.3,aes(group=Id)) + 
  geom_point(alpha=.3) +
  geom_smooth(method= "loess") +
  geom_line(data=sololabs1, show.legend = F, color='forestgreen') +
  theme_solarized()

ggplot(sololabs1, aes(x=Momento, y=Calcio)) + 
  geom_line(alpha=.3,aes(group=Id)) + 
  geom_point(alpha=.3) +
  geom_smooth(method= "loess") +
  geom_line(data=sololabs1, show.legend = F, color='forestgreen') +
  theme_solarized()

ggplot(sololabs1, aes(x=Momento, y=Potasio)) + 
  geom_line(alpha=.3,aes(group=Id)) + 
  geom_point(alpha=.3) +
  geom_smooth(method= "loess") +
  geom_line(data=sololabs1, show.legend = F, color='forestgreen') +
  theme_solarized()


ggplot(sololabs1, aes(x=Momento, y=KtV)) + 
  geom_line(alpha=.3,aes(group=Id)) + 
  geom_point(alpha=.3) +
  geom_smooth(method= "loess") +
  geom_line(data=sololabs1, show.legend = F, color='forestgreen') +
  theme_solarized()

ggplot(sololabs1, aes(x=Momento, y=BUN_pre)) + 
  geom_line(alpha=.3,aes(group=Id)) + 
  geom_point(alpha=.3) +
  geom_smooth(method= "loess") +
  geom_line(data=sololabs1, show.legend = F, color='forestgreen') +
  theme_solarized()

ggplot(sololabs1, aes(x=Momento, y=BUN_post)) + 
  geom_line(alpha=.3,aes(group=Id)) + 
  geom_point(alpha=.3) +
  geom_smooth(method= "loess") +
  geom_line(data=sololabs1, show.legend = F, color='forestgreen') +
  theme_solarized()


ggplot(sololabs2, aes(x=Momento, y=Plaquetas)) + 
  geom_line(alpha=.3,aes(group=Id)) + 
  geom_point(alpha=.3) +
  geom_smooth(method= "loess") +
  geom_line(data=sololabs2, show.legend = F, color='forestgreen') +
  theme_solarized()



ggplot(solonutri1, aes(x=Momento, y=Peso)) + 
  geom_line(alpha=.3,aes(group=Id)) + 
  geom_point(alpha=.3) +
  geom_smooth(method= "loess") +
  geom_line(data=solonutri1, show.legend = F, color='forestgreen') +
  theme_solarized()



ggplot(solonutri1, aes(x=Momento, y=IMC)) + 
  geom_line(alpha=.3,aes(group=Id)) + 
  geom_point(alpha=.3) +
  geom_smooth(method= "loess") +
  geom_line(data=solonutri1, show.legend = F, color='forestgreen') +
  theme_solarized()


ggplot(solonutri2, aes(x=Momento, y=IMC)) + 
  geom_line(alpha=.3,aes(group=Id)) + 
  geom_point(alpha=.3) +
  geom_smooth(method= "loess") +
  geom_line(data=solonutri2, show.legend = F, color='forestgreen') +
  theme_solarized()


ggplot(solonutri2, aes(x=Momento, y=Malnutricion_Inflamacion)) + 
  geom_line(alpha=.3,aes(group=Id)) + 
  geom_point(alpha=.3) +
  geom_smooth(method= "loess") +
  geom_line(data=solonutri2, show.legend = F, color='forestgreen') +
  theme_solarized()

ggplot(solonutri2, aes(x=Momento, y=NPCR)) + 
  geom_line(alpha=.3,aes(group=Id)) + 
  geom_point(alpha=.3) +
  geom_smooth(method= "loess") +
  geom_line(data=solonutri2, show.legend = F, color='forestgreen') +
  theme_solarized()


ggplot(solonutri2, aes(x=Momento, y=PEW)) + 
  geom_line(alpha=.3,aes(group=Id)) + 
  geom_point(alpha=.3) +
  geom_smooth(method= "loess") +
  geom_line(data=solonutri2, show.legend = F, color='forestgreen') +
  theme_solarized()

#Los famosos VenusPlots!!

# Use a consistent y range
ymax <- max(albumina$Albumina)
ymin <- min(albumina$Albumina)
ggplot(albumina, aes(x=Moment, y=Albumina, colour=Id, group=Id)) +
  geom_line() + geom_point(shape=21, fill="white") +
  ylim(ymin,ymax)
ggplot(albumina, aes(x=Moment, y=Albumina, colour=Id, group=Id)) +
  geom_line() + geom_point(shape=21, fill="white") + xlab("Moment") +
  ylab("Albumin") +
  ylim(ymin,ymax)
ggplot(albumina, aes(x=Moment, y=Albumina, colour=Id, group=Id)) +
  geom_line() + geom_point(shape=21, fill="white") + xlab("Moment") +
  ylab("Albumin") + theme(legend.position="none") +
  ylim(ymin,ymax)


friedman.test(solonutri2$Malnutricion_Inflamacion, solonutri2$Moment, solonutri2$Id)
