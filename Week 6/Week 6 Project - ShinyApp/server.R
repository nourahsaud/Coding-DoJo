library('shiny')
library('shinydashboard')
library('ggplot2')
library('dplyr')
library('data.table')

theme_set(theme_bw())

tidy_candy <- read.csv("tidy_candy.csv", header = TRUE)

count_fruit <- table(tidy_candy$Healthy_Fruit, tidy_candy$Gender)

hershey_type <- data.frame(tidy_candy$Gender, tidy_candy$Hershey_Dark_Chocolate,
                           tidy_candy$Hershey_Milk_Chocolate,
                           tidy_candy$Hershey_Kisses)

shinyServer(function(input,output){
  # participators 
  output$surveyplot <- renderPlot({
    filtered <-
      tidy_candy %>%
      filter(Gender == input$genderInput,
             Age >= input$ageinput[1],
             Age <= input$ageinput[2],
      )
    ggplot(filtered,mapping = aes(Gender ,Age, colour = Country)) + 
      geom_point()
  })
  
  # Going out 
  output$coolplot <- renderPlot({
    filtered <-
      tidy_candy %>%
      filter(Going_out == input$goingoutInput,
             Gender == input$genderInput,
             Country == input$countryInput,
      )
    ggplot(data = tidy_candy) + 
      geom_point(filtered,mapping = aes(x =Age , y = Going_out , col = 'red'))
  })
  
  #Healthy fruit 
  
  output$tabset1Selected <- renderText({
    input$tabset1
  })
  
  output$bar <- renderPlot({
    barplot(count_fruit, beside=input$sidebar, col = input$PlotColor)
  })
  
  output$bar_hor <- renderPlot({
    barplot(count_fruit, beside=input$sidebar, horiz=TRUE, col = input$PlotColor) 
  })
  
  # Hershey 
  output$firstPlot <- renderPlot({
    filtered <- hershey_type %>%
      filter( tidy_candy$Gender == input$gender_Input )
    ggplot(data = hershey_type) + 
      geom_bar(filtered, mapping = aes(x =tidy_candy.Hershey_Dark_Chocolate) ,width = 0.3 ,fill = input$Plot_Color)+
      xlab("Dark Chocolate") + ggtitle("Hershey Dark Chocolate") })
  
  output$secondPlot <- renderPlot({
    filtered <- hershey_type %>%
      filter( tidy_candy$Gender == input$gender_Input )
    ggplot(data = hershey_type) + 
      geom_bar(filtered, mapping = aes(x =tidy_candy.Hershey_Milk_Chocolate) ,width = 0.3 ,fill = input$Plot_Color)+
      xlab("Milk Chocolate") + ggtitle("Hershey Milk Chocolate") })
  
  output$thirdPlot <- renderPlot({
    filtered <- hershey_type %>%
      filter( tidy_candy$Gender == input$gender_Input )
    ggplot(data = hershey_type) + 
      geom_bar(filtered, mapping = aes(x =tidy_candy.Hershey_Kisses) ,width = 0.3 ,fill = input$Plot_Color)+
      xlab("Kisses") + ggtitle("Hershey Kisses") })
}) 