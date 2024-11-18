#
# This is the server logic
#
#

library(shiny)

# Define server logic required to draw a histogram
server <- function(input, output, session) {

#Testing to make sure I set up the age right. Keeps "Your age is" out at all times
  output$age <- renderText({
    paste0("Your age is ", input$currentAge)
    })
#Creating a function to calculate. Needs the special thing added that determines when/ how often it refreshes. Would like it to only refresh when the calculate button is pressed.That is an observe event, see line 72 of final project
  calc401k <- function(currentAge, retireAge, currentSavings, salary, raises, contributions, eMatch, kROI){
    #calculating how many years the loop will need to iterate through
    years <- retireAge - currentAge
    return(years)
  }
#testing that the function is set up properly
  output$years <- renderText({
    years <- calc401k(input$currentAge, input$retireAge, input$currentSavings, input$salary, input$raises, contributions, input$eMatch, input$kROI)
    paste0("You are saving for ", years, " years")
  })

}
