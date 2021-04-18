#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)

# Define UI for application that draws a histogram
shinyUI(fluidPage(


    # Sidebar with a slider input for number of bins
    dashboardPage(
        dashboardHeader(title = "Developing Data Products"),
        dashboardSidebar(
            sliderInput("Num1",
                        "First number to add",
                        min = 1,
                        max = 50,
                        value = 5),
            sliderInput("Num2",
                        "Second number to add",
                        min = 1,
                        max = 50,
                        value = 5)
        ),

        # Show a plot of the generated distribution
        dashboardBody(
            br(),
            h1("The Week 4 project"),
            br(),
            h3("You can select two buttons at the panel and will get as a result the sum of these two numbers"),
            valueBoxOutput("Result")
        )
    )
))
