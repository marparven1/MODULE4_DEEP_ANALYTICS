library(shiny)
library(shinythemes)
library(DT)
library(ggplot2)
library(nortest)
library(tseries)
library(RcmdrMisc)
library(lmtest)


# load(file="../data/DF_Energia_GMinutos.RData")
# load(file="../data/DF_Energia_GHoras.RData")
# load(file="../data/DF_Energia_GDiaria.RData")
# load(file="../data/DF_Energia_GMensual.RData")


# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  output$distPlot <- renderPlot({
    
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
    
  })
  
}