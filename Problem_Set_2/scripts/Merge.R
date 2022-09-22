
###############################################################
################ Big Data and Machine Learning ################
###############################################################


## A continuación se describe el paso a paso para realizar el Web Scraping.

## 1. Instalar/Cargar Paquetes

install.packages("tidyverse")
install.packages("here")

require("here")
require("tidyverse")


## Fijamos el Directorio

setwd("C:/Users/HP/Documents/Repositorio_Big_Data_2022_Uniandes/Problem_Set_2")


## 2. Cargamos la Base de Datos

train_hogares<- readRDS(here("C:/Users/HP/Documents/Repositorio_Big_Data_2022_Uniandes/Problem_Set_2/store/raw/train_hogares.Rds"))
train_personas<- readRDS(here("C:/Users/HP/Documents/Repositorio_Big_Data_2022_Uniandes/Problem_Set_2/store/raw/train_personas.Rds"))

## 2.1  Validamos las etiquetas

colnames(train_personas)[1:2]

## 3. Creamos una variable Ingresos en función de la identificación de la persona

sum_ingresos<- train_personas %>% group_by(id) %>% summarize(Ingtot_hogar=sum(Ingtot,na.rm = TRUE))

View(sum_ingresos)

summary(sum_ingresos)

## 4. Ahora vamos a realizar el Merge entre sum_ingresos con la base train_hogares, esto permite ///
## incorporar los individuos a la base hogar con el ingreso total que le corresponde en su nucleo /// 
## familiar.

train_hogares<-left_join(train_hogares,sum_ingresos)


head(train_hogares[c("id","Ingtotug","Ingtot_hogar")])

View(train_hogares)