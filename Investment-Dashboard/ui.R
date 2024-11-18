#
# 
#

library(shiny)
library(shinydashboard)
library(tidyverse)
library(shinyWidgets)
# Defining UI page with shiny dashboard
shinyUI(fluidPage(
  #Official content of the UI page
  dashboardPage(
    dashboardHeader(title = "Investing for Your Future",
                    titleWidth = 250),
    #Sidebar options
    dashboardSidebar(
      sidebarMenu(id = "sidebarMenu",
        menuItem("401K",
                 tabName = "trad"),
        menuItem("Roth IRA",
                 tabName = "ira"),
        menuItem("Stock Investments",
                 tabName = "stocks")
                 )),  
    #Here is the body content
    dashboardBody(
      #Adding custom CSS to make title background the same color as the rest of the header
      tags$head(tags$style(HTML('
        .skin-blue .main-header .logo {
          background-color: #3c8dbc;
        }        
        .skin-blue .main-header .logo:hover {
          background-color: #3c8dbc;
        }
                                '))),
      #Starting the tabItems so I can house multiple tabItem
      tabItems(
        tabItem(tabName = "trad",
                h2("Traditional 401K Calculator"),
                  fluidRow(
                    box(title = "Let's Look at Your Numbers",
                      #current age
                      numericInput("currentAge",
                                label = "Current Age",
                                value = "30",
                                width = "100%"),
                      textOutput("age"),
                      textOutput("years"),
                      #expected retirement age
                      numericInput("retireAge", 
                                label = "Retiring Age",
                                value = "65",
                                min = 1,
                                max = 120),
                      #current savings of 401k
                      numericInput("currentSavings",
                                label = "Current Amount Invested",
                                value = "30000"),
                      #present salary
                      numericInput("salary",
                                label = "Your Salary",
                                value = ""),
                      #salary increase
                      numericInput("raises",
                                label = "Estimated Yearly Raises",
                                value = "3"),
                      #monthly contribution
                      numericInput("contributions",
                                label = "Your 401k Contributions",
                                value = "10"),
                      #employer match
                      numericInput("eMatch",
                                label = "Employer Match",
                                value = "5"),
                      #estimated rate of return
                      numericInput("kROI",
                                label = "Expected Rate of Return on Investments",
                                value = "7"),
                      #testing percent icon
                      numericInputIcon(
                        inputId = "ex1",
                        label = "With an icon",
                        value = 10,
                        icon = icon("percent", "fa-pull-right")
                      )
                
              )  
              )),
        #Roth Ira tab
        tabItem(tabName = "ira",
              h2("Roth IRA Calculator")),
        #Stock Calculator tab
        tabItem(tabName = "stocks",
              h2("Stock Investment Calculator"))
      )
    )
))
)
