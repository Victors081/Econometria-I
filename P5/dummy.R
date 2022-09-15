



datos <- read.csv("data/datos1.csv")



datos1 <- na.omit(datos)

table(datos1$importado) #VEAMOS LAS CATEGORIAS DE LA VARIABLE IMPORTADO


datos1$domestic <- ifelse(datos1$importado == "Domestic",1,0)

datos1$foreign <- ifelse(datos1$importado == "Foreign",1,0)




names(datos1)

# USO 1: EL PRECIO DE LOS AUTOS NACIONALES E IMPORTADOS SON IGUALES

m1 <- lm(precio ~ kilometraje, data = datos1)

summary(m1)


# USO 2: EL PRECIO DE LOS CARROS IMPORTADOS ES MAYOR A DE LOS NACIONALES (CAMBIO PROPORCIONAL)

m2 <- lm(precio ~ kilometraje + foreign, data = datos1)

summary(m2)



# USO 3: EL PRECIO DE LOS CARROS IMPORTADOS ES MAYOR A DE LOS NACIONALES (CAMBIO ESTRUCTURAL)


datos1$new <- datos1$kilometraje * datos1$foreign

m3 <- lm(precio ~ kilometraje + new, data = datos1)

summary(m3)



# USO 4: 

m4 <- lm(precio ~ kilometraje * foreign, data = datos1)

summary(m4)



m4.1 <- lm(precio ~ kilometraje+foreign+new,data=datos1)

summary(m4.1)







# 




m5 <- lm(precio ~ kilometraje + mejoras+foreign+domestic, data=datos1)

summary(m5)



library(ggplot2)


ggplot(datos1, aes(x=kilometraje, y=precio, color=importado))+geom_point()+geom_smooth()










