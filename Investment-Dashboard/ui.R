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
    dashboardHeader(title = "Investing for Your Future"),
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
      
    )
  )
))
