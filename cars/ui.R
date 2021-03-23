library(shiny)

shinyUI(
    navbarPage("My shiny Application",
               tabPanel("Data set Analysis",
                        fluidPage(
                            titlePanel("Relationship between variables MPG"),
                            sidebarLayout(
                                sidebarPanel(
                                    selectInput("variable", "Variable:",
                                                c("No's of cylinders" = "cyl",
                                                  "Displacement (cu.in.)" = "disp",
                                                  "Gross horsepower" = "hp",
                                                  "Rear axle ratio" = "drat",
                                                  "Weight (lb/1000)" = "wt",
                                                  "1/4 mile time" = "qsec",
                                                  "V/S" = "vs",
                                                  "Transmission" = "am",
                                                  "Number of forward gears" = "gear",
                                                  "Number of carburetors" = "carb"
                                                )),
                                    
                                    checkboxInput("outliers", "Show BoxPlot's outliers", TRUE)
                                ),
                                
                                mainPanel(
                                    h3(textOutput("caption")),
                                    
                                    tabsetPanel(type = "tabs", 
                                                tabPanel("boxplot", plotOutput("mpgboxplot")),
                                                tabPanel("Regression model", 
                                                         plotOutput("mpgPlot"),
                                                         verbatimTextOutput("default")
                                                )
                                    )
                                )
                            )
                        )
               ),
               tabPanel("Data Set details",
                        
                        h3("Regression Models Course Project "),
                        helpText("This work is from cousera"),
                        h3("Dataframe details"),
                        p("it has 32 observations on 11 variables."),
                        
                        a("https://class.coursera.org/regmods-008")
               )
    )
)