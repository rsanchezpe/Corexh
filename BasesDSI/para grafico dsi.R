# Paragráfico de medidas repetidas

library(ggplot2)


library(lattice)

xyplot(mean ~ moment, group = symptom, data = dsi, type="b")

gg.base <- ggplot(dsi, aes(x = moment, y = mean))
gg.idline <- gg.base + geom_line(aes(color = symptom, group = symptom))
gg.idline
gg.idline + geom_point()
