


################################                       
#################################                      # Práctica 1 🏆
##################################                     # Introducción a R y Rstudio
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




# ¡Bienvenidos!





# Primero veamos como cargar una base de datos:


data <- read.csv("data/datos1.csv")  # FORMA 1



data <- read.csv("https://www.dropbox.com/s/cacy2yhvn2niqkb/datos1.csv?dl=1") # FORMA 2




data <- read.csv(file.choose()) # FORMA 3





# REVISAMOS UN POCO LOS DATOS


head(data, n = 20)

tail(data, n=20)


str(data)





# VEAMOS LOS TIPOS DE CLASES EN R

2+3

x <- 2.5+3


y <- "4"

class(y)

class(x)




z <-  2 > 3




# COMO INSTALAR Y CARGAR PAQUETES AL MISMO TIEMPO


pacman::p_load(ggplot2, dplyr, Hmisc)


# TABLA DE FRECUENCIA ABSOLUTA DE UNA VARIABLE CATEGORICA

table(data$importado)


# NOMBRE DE LAS VARIABLES DE UNA BASE DE DATOS

names(data)



# CREAMOS UNA CODIFICACION DE 1 Y 0, Y AGREGAMOS UNA NUEVA VARIABLE A NUESTRA BASE DE DATOS

data$dummy <- ifelse(data$importado == "Foreign",1,0)


# ELIMINAMOS UNA VARIABLE EN NUESTRA BASE DE DATOS

data$dummy <- NULL


# EXTRAEMOS ESTADISTICAS DESCRIPTIVAS DE LAS VARIABLES NUMERICAS

summary(data)

# Extraemos estadisticas descriptivas de todas la variables.

describe(data)



# Almacenamos todos los objetos de nuestro environment en un archivo .RData

save.image("data/practica 1.RData")


# Cargamos el archivo para comprobar que los objetos reaparezcan en nuestro environment


load("data/practica 1.RData")













