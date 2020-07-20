
########################
#Este script es para los gráficos de medidas repetidas
#Primero KDQOL
########################
p <- ggplot(albumina, aes(x=Moment, y=Albumina, color=Moment)) + 
  geom_violin()

p + stat_summary(fun.data="mean_sdl", mult=1, 
                 geom="crossbar", width=0.2 )

p + stat_summary(fun.data=mean_sdl, mult=1, 
                 geom="pointrange", color="red")
####

q <- ggplot(kdqol012long, aes(x=time, y=effectsofkidneydisease, color=time)) + 
  geom_violin()

q + stat_summary(fun.data="mean_sdl", mult=1, 
                 geom="crossbar", width=0.2 )

q + stat_summary(fun.data=mean_sdl, mult=1, 
                 geom="pointrange", color="red")
####

r <- ggplot(kdqol012long, aes(x=time, y=burdenofkidneydisease, color=time)) + 
  geom_violin()

r + stat_summary(fun.data="mean_sdl", mult=1, 
                 geom="crossbar", width=0.2 )

r + stat_summary(fun.data=mean_sdl, mult=1, 
                 geom="pointrange", color="red")

r + stat_summary(fun.data=mean_sdl, mult=1, 
                 geom="pointrange", color="red") +  geom_jitter(shape=16, position=position_jitter(0.3))
####

s <- ggplot(kdqol012long, aes(x=time, y=sf12physicalcomposite, color=time)) + 
  geom_violin()

s + stat_summary(fun.data="mean_sdl", mult=1, 
                 geom="crossbar", width=0.2 )

s + stat_summary(fun.data=mean_sdl, mult=1, 
                 geom="pointrange", color="red")

s + stat_summary(fun.data=mean_sdl, mult=1, 
                 geom="pointrange", color="red") +  geom_jitter(shape=16, position=position_jitter(0.3))

####


t <- ggplot(kdqol012long, aes(x=time, y=sf12mentalcomposite, color=time)) + 
  geom_violin()

t + stat_summary(fun.data="mean_sdl", mult=1, 
                 geom="crossbar", width=0.2 )

t + stat_summary(fun.data=mean_sdl, mult=1, 
                 geom="pointrange", color="red")

t + stat_summary(fun.data=mean_sdl, mult=1, 
                 geom="pointrange", color="red") +  geom_jitter(shape=16, position=position_jitter(0.3))
####

a <- ggplot(albumina, aes(x=Moment, y=Albumina, color=Moment)) + 
  geom_violin()

a + stat_summary(fun.data="mean_sdl", mult=1, 
                 geom="crossbar", width=0.2 )

a + stat_summary(fun.data=mean_sdl, mult=1, 
                 geom="pointrange", color="red")

a + stat_summary(fun.data=mean_sdl, mult=1, 
                 geom="pointrange", color="red") +  geom_jitter(shape=16, position=position_jitter(0.3))

####

b <- ggplot(sololabs1, aes(x=Moment, y=Hemoglobina, color=Moment)) + 
  geom_violin()

b + stat_summary(fun.data="mean_sdl", mult=1, 
                 geom="crossbar", width=0.2 )

b + stat_summary(fun.data=mean_sdl, mult=1, 
                 geom="pointrange", color="red")

b + stat_summary(fun.data=mean_sdl, mult=1, 
                 geom="pointrange", color="red") +  geom_jitter(shape=16, position=position_jitter(0.3))
####

c <- ggplot(sololabs1, aes(x=Moment, y=Hematocrito, color=Moment)) + 
  geom_violin()

c + stat_summary(fun.data="mean_sdl", mult=1, 
                 geom="crossbar", width=0.2 )

c + stat_summary(fun.data=mean_sdl, mult=1, 
                 geom="pointrange", color="red")

c + stat_summary(fun.data=mean_sdl, mult=1, 
                 geom="pointrange", color="red") +  geom_jitter(shape=16, position=position_jitter(0.3))
#####

d <- ggplot(sololabs1, aes(x=Moment, y=Fsforo, color=Moment)) + 
  geom_violin()

d + stat_summary(fun.data="mean_sdl", mult=1, 
                 geom="crossbar", width=0.2 )

d + stat_summary(fun.data=mean_sdl, mult=1, 
                 geom="pointrange", color="red")

d + stat_summary(fun.data=mean_sdl, mult=1, 
                 geom="pointrange", color="red") +  geom_jitter(shape=16, position=position_jitter(0.3))

####

e <- ggplot(sololabs1, aes(x=Moment, y=Calcio, color=Moment)) + 
  geom_violin()

e + stat_summary(fun.data="mean_sdl", mult=1, 
                 geom="crossbar", width=0.2 )

e + stat_summary(fun.data=mean_sdl, mult=1, 
                 geom="pointrange", color="red")

e + stat_summary(fun.data=mean_sdl, mult=1, 
                 geom="pointrange", color="red") +  geom_jitter(shape=16, position=position_jitter(0.3))
####
f <- ggplot(sololabs1, aes(x=Moment, y=Potasio, color=Moment)) + 
  geom_violin()

f + stat_summary(fun.data="mean_sdl", mult=1, 
                 geom="crossbar", width=0.2 )

f + stat_summary(fun.data=mean_sdl, mult=1, 
                 geom="pointrange", color="red")

f + stat_summary(fun.data=mean_sdl, mult=1, 
                 geom="pointrange", color="red") +  geom_jitter(shape=16, position=position_jitter(0.3))

####

g <- ggplot(sololabs1, aes(x=Moment, y=KtV, color=Moment)) + 
  geom_violin()

g + stat_summary(fun.data="mean_sdl", mult=1, 
                 geom="crossbar", width=0.2 )

g + stat_summary(fun.data=mean_sdl, mult=1, 
                 geom="pointrange", color="red")

g + stat_summary(fun.data=mean_sdl, mult=1, 
                 geom="pointrange", color="red") +  geom_jitter(shape=16, position=position_jitter(0.3))
####

h <- ggplot(sololabs1, aes(x=Moment, y=BUN_pre, color=Moment)) + 
  geom_violin()

h + stat_summary(fun.data="mean_sdl", mult=1, 
                 geom="crossbar", width=0.2 )

h + stat_summary(fun.data=mean_sdl, mult=1, 
                 geom="pointrange", color="red")

h + stat_summary(fun.data=mean_sdl, mult=1, 
                 geom="pointrange", color="red") +  geom_jitter(shape=16, position=position_jitter(0.3))
####

i <- ggplot(sololabs1, aes(x=Moment, y=BUN_post, color=Moment)) + 
  geom_violin()

i + stat_summary(fun.data="mean_sdl", mult=1, 
                 geom="crossbar", width=0.2 )

i + stat_summary(fun.data=mean_sdl, mult=1, 
                 geom="pointrange", color="red")

i + stat_summary(fun.data=mean_sdl, mult=1, 
                 geom="pointrange", color="red") +  geom_jitter(shape=16, position=position_jitter(0.3))

####

j <- ggplot(sololabs2, aes(x=Moment, y=Plaquetas, color=Moment)) + 
  geom_violin()

j + stat_summary(fun.data="mean_sdl", mult=1, 
                 geom="crossbar", width=0.2 )

j + stat_summary(fun.data=mean_sdl, mult=1, 
                 geom="pointrange", color="red")

j + stat_summary(fun.data=mean_sdl, mult=1, 
                 geom="pointrange", color="red") +  geom_jitter(shape=16, position=position_jitter(0.3))

####




#Ahora el gráfico de tendencias
#####

ggplot(kdqol_graph1) +
  geom_path(aes(x = Time, y = Response, group = Domain, color = Domain)) +
  geom_point(aes(x = Time, y = Response, color = Domain), size = 3) +
  scale_x_discrete(labels=c("1" = "T0", "2" = "T1", "3" = "T2"))



