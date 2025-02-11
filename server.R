#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$Result <- renderValueBox({
        valueBox(
            value = input$Num1 + input$Num2,
            subtitle = "RESULT",
            color =  "yellow"
        )
    })
    rv <- reactiveValues(diceRoll = NULL, diceRolls = 0)
    
    
    observeEvent(input$Dice, {
        rv$diceRoll <- round(runif(1,1,6))
        if (rv$diceRolls[1]== 0) {rv$diceRolls <- rv$diceRoll}
        else {rv$diceRolls <- c(rv$diceRolls, rv$diceRoll)}
    })
    
    
    output$DiceRes <- renderValueBox({
        valueBox(
            value = rv$diceRoll,
            subtitle = "Dice Result",
            color =  "yellow"
        )
    })
    
    output$histogram <- renderPlot(hist(rv$diceRolls))
    
})
