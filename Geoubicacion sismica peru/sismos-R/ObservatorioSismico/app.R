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

vars <- peru_d$NOMBDEP
# Define UI for application that draws a histogram
ui <- fluidPage(
  theme = shinytheme("cerulean"),
  pageWithSidebar(
    headerPanel('Iris k-means clustering'),
    
    sidebarPanel(
      selectInput('departamento', 'Departamento', vars, selected = vars[21]),
      strong("Años"),
      checkboxGroupInput(inputId = "syear", label = NULL, 
                         choices = 1960:2021, selected = NULL, inline = T),
      actionButton("aplicar","Aplicar")
      #hr(),
      #fluidRow(column(3, verbatimTextOutput("value"))),
      
    ),
    
    mainPanel(
      fluidRow(
        column(width = 6,
               plotOutput("plot0")
        ),
        column(width = 6,
               plotOutput("plot1"))
      )
    )
  )
)


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

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  selectedDepartament <- eventReactive(input$aplicar,{
    input$departamento
  })
  
  selectedYear <- eventReactive(input$aplicar,{
    input$syear
  })
  
  output$plot0 <- renderPlot({
    mapa_magnitud
  })
  
  output$plot1 <- renderPlot({
    porDepartamento(selectedDepartament(),selectedYear())
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
