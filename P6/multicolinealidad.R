
################################                       
#################################                      # Práctica 5 🏆
##################################                     # Problemas econometricos: multicolinealidad
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


table(datos1$importado) #VEAMOS LAS CATEGORIAS DE LA VARIABLE IMPORTADO


datos1$domestic <- ifelse(datos1$importado == "Domestic",1,0)

datos1$foreign <- ifelse(datos1$importado == "Foreign",1,0)


# ELIMINAMOS LAS VARIABLES QUE NO SON CUANTITATIVAS


pacman::p_load(dplyr,corrplot, psych)

names(datos1)

datos1 <- datos1 %>% select(-marca, -importado)


matrix <- round(cor(datos1, method = "pearson"),2)



corrplot(matrix, method = "color")


corPlot(matrix, upper = F)

dev.off()

names(datos1)

m1 <- lm(precio ~ kilometraje+mejoras+domestic+foreign, data=datos1)

summary(m1)



# VEAMOS SI EXISTE MULTI


pacman::p_load(car)

m2 <- lm(precio ~ kilometraje+mejoras+domestic, data=datos1)

vif(m2)























