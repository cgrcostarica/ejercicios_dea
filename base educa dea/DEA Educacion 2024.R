# Analisis DEA Educa#

#Este script presenta un analisis DEA para las área de salud del pais, las variables contenidas se pueden consultar en la documentacion del papel del trabajo correspondiente que se encuentra en el Github#


#Asegurese de conocer en que dirección tienen la base de datos y la dirección desde la que opera R

#el siguiente código indica la dirección desde donde opera R
getwd()
## "C:/Users/humberto.perera/Documents"

#El siguiente debe modificarse según donde tiene ubicada la base de datos, la utilizada para este ejemplo se encuentra en el github

setwd("C:/Users/humberto.perera/Documents/base educa dea")
#"G:/Unidades compartidas/AO EBAIS/03_Exam/02_Proced/Creacion de bases de datos"

#se procede a instalar los paquetes necesarios y a comvocarlos para ser utilizados
install.packages("deaR")
install.packages("tidyverse")
install.packages("excelR")
install.packages("readr")
install.packages("RTextTools")

library("readr")
library("deaR")
library("excelR")
library("readxl")
library("RTextTools")

##################DEA EDUCACION##################
#se llama la base de datos para el año 2019 y se le da un nombre#
base_dea_educa <- read_excel("base final recortada.xlsx")
colnames(base_dea_educa)

#"country","GDP_porc","exp_edu_2017_2020","PPP_const_prom18_22","tasa_termino_prom","inv_deser","prompisa","tasa_bruta_prom","tasa_neta_prom"

###Modelo 1####
#para el uso de los  modelos se deben quitar aquellas areas que no tengan datos pues causan error, y se proceden a crear subconjuntos solo con las variables de interes para el modelo
modelo1 <- base_dea_educa [, c("Country","GDP_porc","tasa_termino_prom","prompisa","inv_deser")]
View(modelo1)
modelo1 <- modelo1 [-c(1,22,27,29,30,34,38,40,47,49,51),]
View(modelo1)
any(is.na(modelo1))


#la posicion de las variables segun sean un input o un output y si cuenta con insumOS no controlables y/o de contexto
model1 <- make_deadata(modelo1, inputs=2,   outputs=3:5) 
#seleccionamos el tipo de modelo
result1 <- model_basic(model1, orientation = "oo", rts = "vrs")
#tiramos los resultados a un archivo para ser analizados

summary(result1, TRUE, filename = "modelo1_ed.xlsx")


###Modelo 2####
#para el uso de los  modelos se deben quitar aquellas areas que no tengan datos pues causan error, y se proceden a crear subconjuntos solo con las variables de interes para el modelo
modelo2 <- base_dea_educa [, c("Country","exp_edu_2017_2020","tasa_termino_prom","prompisa","inv_deser")]
View(modelo2)
modelo2 <- modelo2 [-c(1,2,5,7,11,12,15,19,21,22,25,27,29,30,31,34,35,37,38,40,42,43,44,47,48,49,50,51,56,59,60),]
View(modelo2)
any(is.na(modelo2))


#la posicion de las variables segun sean un input o un output y si cuenta con insumOS no controlables y/o de contexto
model2 <- make_deadata(modelo2, inputs=2,   outputs=3:5) 
#seleccionamos el tipo de modelo
result2 <- model_basic(model2, orientation = "oo", rts = "vrs")
#tiramos los resultados a un archivo para ser analizados

summary(result2, TRUE, filename = "modelo2_ed.xlsx")

###Modelo 3####
#para el uso de los  modelos se deben quitar aquellas areas que no tengan datos pues causan error, y se proceden a crear subconjuntos solo con las variables de interes para el modelo
modelo3 <- base_dea_educa [, c("Country","PPP_const_prom18_22","tasa_termino_prom","prompisa","inv_deser")]
View(modelo3)
modelo3 <- modelo3 [-c(1,7,9,11,19,22,25,27,29,30,31,34,37,38,40,44,47,49,50,51,56),]
View(modelo3)
any(is.na(modelo3))


#la posicion de las variables segun sean un input o un output y si cuenta con insumOS no controlables y/o de contexto
model3 <- make_deadata(modelo3, inputs=2,   outputs=3:5) 
#seleccionamos el tipo de modelo
result3 <- model_basic(model3, orientation = "oo", rts = "vrs")
#tiramos los resultados a un archivo para ser analizados

summary(result3, TRUE, filename = "modelo3_ed.xlsx")

