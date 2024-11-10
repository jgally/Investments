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
      #Adding custom CSS to make title back
      ground the same color as the rest of the header
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
              fluidRow(
                column(4,
                       box(
                title = "Let's Look at Your Numbers",
                #current age
                textInput("currentAge",
                          label = "Current Age",
                          value = "30",
                          width = "100%"),
                textOutput("age"),
                #expected retirement age
                numericInput("retireAge", 
                            label = "Retiring Age",
                            value = "65",
                            min = 1,
                            max = 120),
                #current savings of 401k
                numericInput("currentSavings"
                             label = "Current Amount Invested",
                             value = "30000"),
                #present salary
                numericInput("salary",
                             label = "Your Salary",
                             value = ""),
                #salary increase
                textInput("raises",
                          label = "Estimated Yearly Raises",
                          placeholder = "%"),
                #monthly contribution
                textInput("contributions",
                          label = "Your 401k Contributions",
                          placeholder = "10%"),
                #employer match
                textInput("eMatch",
                          label = "Employer Match",
                          placeholder = "5%"),
                #estimated rate of return
                numericInput("401kROI",
                             label = "Expected Ra5te of Return on Investments",
                             placeholder = "7%")
                
                
              ),
              column(8,
                    plotOutput("401k",
                              "Estimated 401k Investments")))  
              ))
    )
  )
))
