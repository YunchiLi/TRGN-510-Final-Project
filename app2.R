#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


library(shiny);
library(ggplot2);
library(plotly);
library(ComplexHeatmap)
library(circlize)
library(colorspace)
library(GetoptLong)
library(colourpicker)
setwd("~/TRGN 510/");
load("mydataset.RData");

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("RNAseq"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      colourInput("col", "Select colour", "red")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    # generate bins based on input$bins from ui.R
    
    # draw the histogram with the specified number of bins
    Heatmap(mat, name = "expression", km = 5,  
            top_annotation_height = unit(4, "mm"), show_row_names = FALSE, 
            show_column_names = TRUE, col = colorRamp2(c(0, 20), c("blue", input$col))) 
    
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

