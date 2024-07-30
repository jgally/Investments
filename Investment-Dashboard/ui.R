#
# 
#

library(shiny)
library(shinydashboard)
library(tidyverse)

# Defining UI page with shiny dashboard
shinyUI(fluidPage(
  #Official content of the UI page
  dashboardPage(
    dashboardHeader(title = "Investing for Your Future",
                    titleWidth = 250),
    #Sidebar options
    dashboardSidebar(
      sidebarMenu(
        menuItem("401K",
                 tabName = "traditional",
                 startExpanded = TRUE,
                 menuSubItem("History",
                             tabName = "tradHist"),
                 menuSubItem("Calculator",
                             tabName = "tradCalc")
                 ),
        menuItem("Roth IRA",
                 tabName = "ira",
                 startExpanded = TRUE,
                 menuSubItem("History",
                             tabName = "iraHist"),
                 menuSubItem("Calculator",
                             tabName = "iraCalc")
                 ),
        menuItem("Stock Investments",
                 tabName = "stocks",
                 startExpanded = TRUE,
                 menuSubItem("Historical Data",
                             tabName = "stockHist"),
                 menuSubItem("Investment Calculator",
                             tabName = "stockCalc")
                 )
      )
    ),
    #Here is the body content
    dashboardBody(
      #Adding custom CSS to make title bakcground the same color as the rest of the header
      tags$head(tags$style(HTML('
        .skin-blue .main-header .logo {
          background-color: #3c8dbc;
        }        
        .skin-blue .main-header .logo:hover {
          background-color: #3c8dbc;
        }
                                '))),
      #Starting with the 401k content, debating on whether or not to have differing input options (typing in should probably be best)
      tabItem("tradCalc",
              box(
                title = "Let's Look at Your Numbers",
                textInput("currentAge",
                          label = "Current Age",
                          value = "",
                          width = "100%"),
                textOutput("age")
                #numericInput("retireAge", "Retiring Age")
              ))
    )
  )
))
