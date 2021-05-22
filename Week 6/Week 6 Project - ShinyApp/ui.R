library('shiny')
library('shinydashboard')
library('ggplot2')
library('dplyr')

install.packages('rsconnect')

shinyUI(
  dashboardPage(
    dashboardHeader (title = "Boing Boing Candy"), 
    # Sidebar content
    dashboardSidebar(
      sidebarMenu(
      menuItem('Overview', tabName = 'First'),
      menuItem('Participators', tabName = 'Second'),
      menuItem('Going Out', tabName = 'Third'),
      menuItem('Healthy fruit', tabName = 'Fourth'),
      menuItem('Hershey Chocolate', tabName = 'Fifth')
      )),
    # Body content
    dashboardBody(
      tabItems(
        # First tab content 
        tabItem(tabName = 'First',
                h1('Boing Boing Candy App'),
                br(), br(),
                h3('You can find some Info about the data set by ', tags$a(href = "https://boingboing.net/2016/10/31/the-candy-hierarchy-for-2016.html", "   Clicking Here!")),
                h3('Our team members:'),
                h4('Mram Alshehri'),
                h4('Nouf Alruhaili'),
                h4('Nourah Alsaadan'),
                h4('Norah Alharthi')
                
        ),
        # Second tab content 
        tabItem(tabName = 'Second',
                titlePanel("Who is participating on the survy ?"),
                fluidPage(
                  box(
                    title = 'Scatter plot', status = 'primary', solidHeader = TRUE, width = 500,
                    collapsible = TRUE, plotOutput("surveyplot", height = 500, width = 500)
                    )
                ),
                fluidPage(
                  box(
                    title = 'Controlers', status = 'warning', solidHeader = TRUE, width = 500,
                    radioButtons("genderInput", "Gender",
                                 choices = c("Male", "Female","Other", "Unspecified"),
                                 selected = "Male"),
                    sliderInput("ageinput", "Please Select Age Range", 10, 100, c(25, 40),pre = "Y")
                  )
                ),
                h1('by. Maram Alshehri')
              ),
        # Third tab content 
        tabItem(tabName = 'Third',
                titlePanel("Who is going out for trick or treating ?"),
                fluidPage(
                  box(
                    title = 'Scatter plot', status = 'primary', width = 500,
                    collapsible = TRUE, plotOutput("coolplot", height = 500, width = 500),
                    br(), br(),
                    )
                  ),
                fluidPage(
                  box(
                    title = 'Controlers', status = 'warning', width = 500,
                    sidebarPanel(
                      width = 500,
                      radioButtons("goingoutInput", "Going_Out",
                                   choices = c("Yes", "No"),
                                   selected = "Yes"),
                      radioButtons("genderInput", "Gender",
                                   choices = c("Male", "Female","Other","Unspecified"),
                                   selected = "Male"),
                      selectInput("countryInput", "Country",
                                  choices = c("United States", "Canada", "United Kingdom"))
                    )
                  )
                ),
                h1('by. Nouf Alruhaili')
        ),
        # Fourth tab content 
        tabItem(tabName = 'Fourth',
                titlePanel("Healthy Fruit"),
                fluidPage(
                  tabBox(
                    title = 'Bar plot', width = 500,
                    # vertical
                    tabPanel(
                     title = 'Vertical view', width = 500,
                     plotOutput("bar")
                    ),
                    # horizontal
                    tabPanel(
                     title = 'Horizontal view', width = 500,
                     plotOutput("bar_hor") 
                  )
                )
                ),
                fluidPage(
                  box(
                    title = 'Controlers', width = 500,
                    sidebarPanel(
                      width = 500,
                      selectInput("PlotColor", "Please Select Plot Color",
                                  choices = c("Purple" = "#cebbd9", "Pink" = "#faaac4", "Blue" = "#659EC7")),
                      checkboxInput("sidebar","Side Bar View"),

                    )
                  )
                ),
                h1('by. Nourah Alsaadan')
      ),
      # Fifth tab content 
        tabItem ( tabName = 'Fifth',
                  titlePanel('Hershy chocolate comparision'),
                  fluidRow(
                      box(plotOutput("firstPlot"), width = 4),
                      box(plotOutput("secondPlot"), width = 4),
                      box(plotOutput("thirdPlot"), width = 4)
                    ),
                  fluidRow(
                      box(
                        title = 'Controlers', solidHeader = TRUE, width = 12,
                        radioButtons("gender_Input", "Gender",
                                     choices = c("Male", "Female","Other", "Unspecified"),
                                     selected = "Male"),
                        selectInput("Plot_Color", "Please Select Plot Color",
                                    choices = c("Dark Chocolate color" = "#6F4E37", "Milk Chocolate color" = "#835C3B",
                                                "My Favorite color" = "#E77471")),
                        )
                      ),
                  h1('by Norah Alharthi')
                  )
          )
       )
    )
  )
