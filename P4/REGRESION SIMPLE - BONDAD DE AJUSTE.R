


################################                       
#################################                      # Práctica 4 🏆
##################################                     # Regresión lineal multiple - bondad de ajuste en R
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




datos <- na.omit(datos)



# MODELOS


options(scipen=999)

modelo1 <- lm(precio ~ kilometraje,data = datos)



summary(modelo1)



modelo2 <- lm(precio ~ kilometraje+mejoras,data = datos)


summary(modelo2)





# MODELO SALARIOS



pacman::p_load(wooldridge)


wage1 <- force(wage1)



modelo3 <- lm(log(wage)~educ, data = wage1)

summary(modelo3)

str(wage1)





# VOLVAMOS AL KILOMETRAJE


datos$y_est <- predict(modelo2)

datos$error <- residuals(modelo2)





confint(modelo2)


x <- predict(modelo2, newdata= data.frame(
  kilometraje = mean(datos$kilometraje),
  mejoras = mean(datos$mejoras)
))









