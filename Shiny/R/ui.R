library(shiny)
library(shinythemes)

# load(file="/data/DF_Energia_GMinutos.RData")
# load(file="/data/DF_Energia_GHoras.RData")
# load(file="/data/DF_Energia_GDiaria.RData")
# load(file="/data/DF_Energia_GMensual.RData")


# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  # 
  titlePanel("IOT Analytics"),
  div(
    h1("Mi proyecto Smart Home"),
    p("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
      ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco 
      laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
      voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat
      non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
      
      Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque
      laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi 
      architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas 
      sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione 
      voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, 
      consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et 
      dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem
      ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? "),
  p("   
   Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae
   consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?
   But I must explain to you how all this mistaken idea of denouncing pleasure and praising 
   pain was born and I will give you a complete account of the system, and expound the actual
   teachings of the great explorer of the truth, the master-builder of human happiness. 
    ") ,
     p("
      No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because 
      those who do not know how to pursue pleasure rationally encounter consequences that are
      extremely painful. Nor again is there anyone who loves or pursues or desires to obtain
      pain of itself, because it is pain, but because occasionally circumstances occur in which 
      toil and pain can procure him some great pleasure. To take a trivial example, which of us 
      ever undertakes laborious physical exercise, except to obtain some advantage from it? But 
      who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying
      consequences, or one who avoids a pain that produces no resultant pleasure?")"),
  #### NavBarPane ####
  navbarPage("IOT Analitycs", 
             selected = "Home", 
             collapsible = TRUE, 
             inverse = TRUE, 
             theme = shinytheme("spacelab"),
             tabPanel(icon("home"),
                   
                      fluidRow(column(tags$img(src="my_image.jpg",width="200px",height="260px"),width=2),
                               column(
                                 br(),
                                 h1("Proyecto de viviendas smart home"),
                                 p(
                                   strong("But do not worry!"), "you will find alternatives to learn all these technical 
                                   aspects independently.",
                                   style="text-align:justify;color:black;background-color:lavender;padding:15px;border-radius:10px"),
                                 br(),
                                 width=8),
                               column(
                                 br(),
                                 tags$img(src="Gobernacion.png",width="200px",height="130px"),
                                 br(),
                                 br(),
                                 p("Para más información sobre smart home y sus beneficios, pulse aquí",
                                   br(),
                                   img(src="www/smart_home.jpg",height = 140, width = 400),style="text-align:center;color:black"),
                                 width=2)),
                      
                      hr(),
                      tags$style(".fa-database {color:#E87722}"),
                      h3(p(em("Dataset "),icon("database",lib = "font-awesome"),style="color:black;text-align:center")),
                      fluidRow(column(DT::dataTableOutput("RawData"),
                                      width = 12)),
                      
                      hr(),
                      p(em("Dataset con granularidad minutos"),br("Marta Venegas Pardo"),style="text-align:center; font-family: times")
             ),
             tabPanel("Datos",
                      fluidPage(
                        tabsetPanel(
                          tabPanel("Granularidad minutos"),
                          tabPanel("Granularidad horas"),
                          tabPanel("Space Preference - Most Days"),
                          tabPanel("Space Preference - Student Submissions")
                        )),
                      sidebarLayout(
                        sidebarPanel(
                          radioButtons("plotType", "Plot type",
                                       c("Scatter"="p", "Line"="l")
                          )
                        ),
                        mainPanel(
                          plotOutput("plot")
                        )
                      )
                      ),
             tabPanel("Visualización",
                      tabsetPanel(
                        tabPanel("Panel 1.1"),
                        tabPanel("Panel 1.2")
                      )
                      
                      ),
             tabPanel("Series",fluidPage(
               tabsetPanel(
                 tabPanel("Study Habit"),
                 tabPanel("Space Preference - Mid & Final Terms"),
                 tabPanel("Space Preference - Most Days"),
                 tabPanel("Space Preference - Student Submissions")
               ))
                      )
  ),
  #### ####
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Slider for the number of bins ----
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 10)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
      
    )
  )
)
