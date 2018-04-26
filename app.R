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
install.packages("colourpiker")
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
         plotOutput("plot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$plot <- renderPlot({
      # generate bins based on input$bins from ui.R
   
      
      # draw the histogram with the specified number of bins
      ggplot(melted_corr , aes(x = Var1, y = Var2)) + geom_raster(aes(fill = value)) +
        scale_fill_gradient2(low="navy", mid="white", high=input$col, midpoint=0.5) + 
        theme( plot.title = element_blank(),axis.text.x = element_blank(), axis.text.y = element_blank(), axis.title.y = element_blank(), axis.title.x = element_blank())
   
   })
   
   }

# Run the application 
shinyApp(ui = ui, server = server)

