#
# This is the server logic
#
#

library(shiny)

# Define server logic required to draw a histogram
server <- function(input, output, session) {

#Testing to make sure I set up the age right
  output$age <- renderText({
    paste0("Your age is ", input$currentAge)
    })
               
               


}
