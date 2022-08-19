


################################                       
#################################                      # Práctica 2 🏆
##################################                     # Estadisticas descriptivas y graficos en R
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


data <- read.csv("data/datos1.csv")


pacman::p_load(Hmisc, corrplot, psych, ggplot2, ggthemes,esquisse)


label(data$precio) <- "Precio medido en dolares de 1980"

label(data$kilometraje)<-'Miles de kilómetros recorridos'

label(data$mejoras)<-'Mejoras realizadas en concesionario'

label(data$importado)<-'Tipo de vehículo, importado o nacional'




label(data)





summary(data)

describe(data)



data$marca <- NULL

data$importado <- NULL


data <- na.omit(data)


matrix <-  cor(data)

round(matrix, 2)


corrplot(matrix, method = "color")


corPlot(matrix, upper = F)



data <- read.csv("data/datos1.csv")


data <- na.omit(data)



plot(x = data$precio, y=data$kilometraje)


hist(data$precio)


table(data$mejoras)


barplot(table(data$mejoras))



barplot(table(data$mejoras),horiz = T)






ggplot(data, aes(x = mejoras))+geom_bar()+labs(title="Grafico 1. Frecuencia de la variable mejoras",
                                               x = "Mejoras del automovil en concesionario",
                                               y = "Frecuencia",
                                               caption = "Fuente: Elaboración propia")+theme_economist()





ggplot(data, aes(x = precio, y = kilometraje))+geom_point()+
  labs(title="Grafico 2. Relación entre precio y kilometraje en el mercado de carros usados en EEUU en el 70'",
       x = "Precio del automovil usado (dolares)",
       y = "Kilometraje (miles)",
       caption = "Fuente: Elaboración propia")+theme_minimal()


names(data)



install.packages("esquisse")




esquisse::esquisser(data)

data$mejoras <- as.character(data$mejoras)



str(data)

  

ggplot(data, aes(x=mejoras, y = precio))+geom_boxplot()+theme(text=element_text(size = 12, 
                                                                                family = "times"))+
  labs(title="Grafico 3. Relación entre precio y mejoras en el mercado de carros usados en EEUU en el 70'",
       x = "Mejoras realizadas en el concesionario",
       y = "Precio del automovil usado (dolares)",
       caption = "Fuente: Elaboración propia")+theme_classic()







g1 <- ggplot(data, aes(x=kilometraje, y=precio))+
  geom_point()+geom_smooth(method = "lm",colour="black")+
  labs(title="Grafico 4. Relación entre precio y kilometraje 
       en el mercado de carros usados en EEUU en el 70'",
       x = "Kilometraje (miles)",
       y = "Precio del automovil usado (dolares)",
       caption = "Fuente: Elaboración propia")+theme_economist()




ggsave(g1, width = 15, height = 10, device = "png", dpi=700, filename = "graficos/DISPERSION.png")




pacman::p_load(writexl)




write_xlsx(data, path = "data/datos.xlsx")
















