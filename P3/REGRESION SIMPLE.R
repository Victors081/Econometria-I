


################################                       
#################################                      # Práctica 3 🏆
##################################                     # REGRESION LINEAL SIMPLE Y MULTIPLE EN R
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




pacman::p_load(Hmisc, corrplot, psych, ggplot2, ggthemes)


datos <- read.csv("data/datos1.csv")


data <- na.omit(datos)


data$marca <- NULL

data$importado <- NULL

matrix <-  cor(data)


corrplot(matrix, method = "color")


corPlot(matrix, upper = F)


names(data)


modelo1 <- lm(precio ~ kilometraje,data = data)



summary(modelo1)



modelo2 <- lm(precio ~ kilometraje+mejoras,data = data)


summary(modelo2)


pacman::p_load(wooldridge)


wage1 <- force(wage1)





modelo3 <- lm(log(wage)~educ, data = wage1)

summary(modelo3)
































































