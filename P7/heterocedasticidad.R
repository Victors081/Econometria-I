
################################                       
#################################                      # Práctica 5 🏆
##################################                     # Problemas econometricos: heterocedasticidad
############           ############                    # Monitor: Victor Manuel Sarmiento Garcia
############            ############                   # Email: victorsarmiento8@gmail.com
############             ###########
############             ###########
############            ############
############           #############
####################################
###################################
##################################
############        ###########
############         ###########          ###### ######## ####   ### ######## #####   ##### ###### ########## #########  ######## ###### ######
############          ############        ###### ######## #####  ### ######## ###### ###### ###    ########## ##########   ####   ###### ######
############           ############       ###    ###  ### ### ## ### ###  ### ### ##### ### ######    ####    ###    ###   ####   ###    ###
############            ############      ###    ###  ### ###  ##### ###  ### ###  ###  ### ##        ####    #########    ####   ###       ###
############             ############     ###### ######## ###   #### ######## ###       ### ######    ####    ###   ###    ####   ###### ######
############              ############    ###### ######## ###    ### ######## ###       ### ######    ####    ###    ### ######## ###### ######




datos <- read.csv("data/datos1.csv")



datos1 <- na.omit(datos)

names(datos1)

m1 <- lm(precio ~ kilometraje + mejoras, data = datos1, na.action = na.exclude)

summary(m1)


datos1$error <- residuals(m1)

datos1$y_est <- predict(m1)


library(ggplot2)

# PRUEBAS INFORMALES

ggplot(datos1, aes(x=kilometraje,y=error))+
  geom_point(color="blue")+labs(title="Kilometraje vs error")

ggplot(datos1, aes(x=mejoras,y=error))+
  geom_point(color="blue")+labs(title="Mejoras vs error")

ggplot(datos1, aes(x=y_est,y=error))+
  geom_point(color="blue")+labs(title="Y est vs error")


ggplot(datos1, aes(x=y_est,y=error^2))+
  geom_point(color="blue")+labs(title="Y est vs error")

"
No parece existir un potencial problema de heterocedasticidad luego
de realizar las respectivas pruebas informales. 

En los graficos que realizamos buscamos alguna tendencia. Sin embargo,
parece que los datos se distribuyen de forma aleatoria.

"


# PRUEBAS FORMALES


# H0: σ^2_i =σ^2   |  Los residuos se distribuyen de forma homocedastica

# H1: σ^2_i =! σ^2 | Los residuos se distribuyen de forma heterocedastica

# PRUEBA DE BREUSCH-PAGAN

library(lmtest)


summary(m1)


bptest(m1)


library(car)


bptest(m1, varformula = ~ kilometraje * mejoras + I(kilometraje^2) + I(mejoras^2), data=datos1) # LINEA CORREGIDA


library(dplyr)

datos1 <- datos1 %>% mutate(
  mejoras2 = mejoras^2,
  km2 = kilometraje^2,
  mk = mejoras*kilometraje
)


white <- lm(error ~ kilometraje+mejoras+km2+mejoras2+mk, data=datos1)


summary(white)

# CORRECCION

library(sandwich)

summary(m1)


coeftest(m1, vcov. = vcovHC(m1, type = "HC1"))



#install.packages("MASS")

library(MASS)

m1.1 <- rlm(precio ~ kilometraje + mejoras, data = datos1, 
            na.action = na.exclude)

summary(m1.1)


install.packages("robustbase")


library(robustbase)

m1.2 <- lmrob(precio ~ kilometraje+mejoras, data = datos1)

summary(m1.2)



# PRESENTACION DE RESULTADOS



install.packages("apaTables")

library(apaTables)

apa.reg.table(m1, filename = "tablas/MODELO MULTIPLE.doc",
              table.number = 1)













