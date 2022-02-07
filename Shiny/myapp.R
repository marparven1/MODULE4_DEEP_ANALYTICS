library(shiny)
library(dplyr)
library(tibble)
library(purrr)
library(ggplot2)
library(shinyjs)
library(rintrojs)
library(markdown)


myfile <-  file.path("data", "DF_Energia_GMensual.RData") 
load(myfile)
source("R/ui.R")
source("R/server.R")




shinyApp(ui = ui,server=server)
