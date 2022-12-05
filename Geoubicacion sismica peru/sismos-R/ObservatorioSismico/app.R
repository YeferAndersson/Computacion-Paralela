#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
library(sp)
library(rmarkdown)
library(dplyr)
library(lubridate)
#library(ggmap)
library(ggplot2)
library(viridis)
library(rcartocolor)
library(plotly)
library(sf)
library(DT)
vars <- peru_d$NOMBDEP
# Define UI for application that draws a histogram
#ui <- fluidPage(
#  theme = shinytheme("cerulean"),
#  pageWithSidebar(
#    headerPanel('Iris k-means clustering'),
#    
#    sidebarPanel(
#      selectInput('departamento', 'Departamento', vars, selected = vars[21]),
#      strong("Años"),
#      checkboxGroupInput(inputId = "syear", label = NULL, 
#                         choices = 1960:2021, selected = 2020, inline = T),
#      actionButton("aplicar","Aplicar")
#      #hr(),
#      #fluidRow(column(3, verbatimTextOutput("value"))),
#      
#    ),
#    
#    mainPanel(
#      plotlyOutput("plot1")
#    )
#  )
#)

ui <- navbarPage("PeruSeism",
                 tabPanel("Nacional",
                          sidebarLayout(
                            sidebarPanel(
                              radioButtons("plotType", "Tipo de mapa",
                                           c("De calor 1"= 1,
                                             "De calor 2"= 2,
                                             "Por Magnitud" = 3,
                                             "Por profundidad" = 4)
                              ),
                              strong("Años"),
                                    checkboxGroupInput(inputId = "syear", label = NULL, 
                                                       choices = 1960:2021, selected = 1960:2021, inline = T),
                              actionButton("aplicar","Mostrar mapa"),
                              width = 2
                            ),
                            mainPanel(
                              plotlyOutput("plot1", height = "100%"),
                              width = 10
                            )
                          )
                 ),
                 tabPanel("Summary",
                          verbatimTextOutput("summary")
                 ),
                 navbarMenu("More",
                            tabPanel("Table",
                                     DT::dataTableOutput("table")
                            ),
                            tabPanel("About",
                                     fluidRow(
                                       column(6,
                                              includeMarkdown("")
                                       ),
                                       column(3,
                                              img(class="img-polaroid",
                                                  src=paste0("http://upload.wikimedia.org/",
                                                             "wikipedia/commons/9/92/",
                                                             "1919_Ford_Model_T_Highboy_Coupe.jpg")),
                                              tags$small(
                                                "Source: Photographed at the Bay State Antique ",
                                                "Automobile Club's July 10, 2005 show at the ",
                                                "Endicott Estate in Dedham, MA by ",
                                                a(href="http://commons.wikimedia.org/wiki/User:Sfoskett",
                                                  "User:Sfoskett")
                                              )
                                       )
                                     )
                            )
                 ),
                 theme = shinytheme("cerulean")
)



# Define server logic required to draw a histogram
server <- function(input, output) {
  
  #selectedDepartament <- eventReactive(input$aplicar,{
  #  input$departamento
  #})
  
  
  selectedTipe <- eventReactive(input$aplicar,{
    input$plotType
  })
  
  selectedYear <- eventReactive(input$aplicar,{
    input$syear
  })
  
  
  
  #selectedYear <- reactive({
  #  input$syear
  #})
  
  #output$plot0 <- renderPlot({
  #  mapa_magnitud
  #})
  
  output$plot1 <- renderPlotly({
    p_nacional(selectedTipe(),selectedYear())
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
