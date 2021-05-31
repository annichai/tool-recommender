#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(shiny)
library(DT)
library(ECharts2Shiny)
library(fmsb)


matrix <- read.csv("r_matrix_0428.csv")
typical <- read.csv("typical.csv")

que = matrix$Description

cat <- data.frame(Category = c(0,0,0,0,0,0))
row.names(cat) <- c('Self Service',
                    'Interactivity',
                    'Embeddability',
                    'Collaboration',	
                    'Data Preparation',
                    'Data Governance')

# row.names(cat) <- c('Dashboard',	
#                     'Interactivity'	,
#                     'Data Source Connectivity',	
#                     'Self Service',	
#                     'Performance',	
#                     'Embeddability',
#                     'Data Collection and Sharing',	
#                     'Data Preparation',
#                     'Data Governance')



# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Data Visualization Tool Guide"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput("userType", label = h3("Select your role"), 
                        choices = list("Data Scientist" = 1, 
                                       "Data Analyst" = 2, 
                                       "Decision Maker" = 3,
                                       "Casual User" = 4,
                                       "Power User" = 5),
            
                        selected = 1),
            hr(),
            h4("On a scale of 0 to 5, rank the importance of the following categories to your data visualization \n"),
            
            fluidRow(
                column(4,
                       numericInput("interactivity", label = "Interactivity", value = 0, min = 0, max = 5, step = 1),
                ),

                column(4,
                       numericInput("self_service", label = "Self Service", value = 0, min = 0, max = 5, step = 1),
                ),
                column(4,
                       numericInput("collaboration", label = "Collaboration", value = 0, min = 0, max = 5, step = 1),
                ),
                column(4,
                       numericInput("embeddability", label = "Embeddability", value = 0, min = 0, max = 5, step = 1),
                ),
                column(4,
                       numericInput("data_preparation", label = "Data Preparation", value = 0, min = 0, max = 5, step = 1),
                ),
                column(4,
                       numericInput("data_governance", label = "Data Governance", value = 0, min = 0, max = 5, step = 1),
                )
            ),
            
            
            hr(),
            
            tabsetPanel(type = "tabs",
                        #to edit
                        tabPanel("Self Service", 
                                 h3("Self Service Features"),
                                 h4("On a scale of 0 to 5, rank the importance of the following self service features to your data visualization \n"),
                                 h5("*No need to fill out this section if you entered 0 for self service in the section above"),
                                 
                                 numericInput("q1", label = "Q1: Ability to create and perform individualized reports and analytics with minimal IT Support", value = 0, min = 0, max = 5, step = 1),
                                 numericInput("q2", label = "Q2: Ability to isolate specific data points of interest and save dynamically within the data model for further analysis", value = 0, min = 0, max = 5, step = 1),
                                 numericInput("q3", label = "Q3: Ability to browse or search the repository of available production data sources available for analysis and launch a new analysis from a selected data source", value = 0, min = 0, max = 5, step = 1),
                                 numericInput("q4", label = "Q4: Ability to send automatic notifications based on user configured parameters", value = 0, min = 0, max = 5, step = 1),
                                 numericInput("q5", label = "Q5: Ability to predict the outcome of a decision given a certain range of variables like what-if analysis - (Sensitivity Analysis based on Assumption)", value = 0, min = 0, max = 5, step = 1),
                                 numericInput("q6", label = "Q6: Ability to modify and augment the existing data model within the flow of analysis and content creation once connected to a trusted data source", value = 0, min = 0, max = 5, step = 1),
                                 numericInput("q7", label = "Q7: Ability to interactively correct data issues that surface during the analysis process", value = 0, min = 0, max = 5, step = 1),
                                 numericInput("q8", label = "Q8: Document-style output", value = 0, min = 0, max = 5, step = 1)
                        ),
                        
                        tabPanel("Interactivity", 
                                 h3("Interactivity of the Dashboard"),
                                 h4("On a scale of 0 to 5, rank the importance of the following interactivity features to your data visualization \n"),
                                 h5("*No need to fill out this section if you entered 0 for interactivity in the section above"),
                                 
                                 numericInput("q9", label = paste("Q9:",que[9]), value = 0, min = 0, max = 5, step = 1),
                                 numericInput("q10", label =  paste("Q10:",que[10]), value = 0, min = 0, max = 5, step = 1)),
                        
                        tabPanel("Embeddability", 
                                 h3("Embeddability Features"),
                                 h4("On a scale of 0 to 5, rank the importance of the following embeddability features to your data visualization \n"),
                                 h5("*No need to fill out this section if you entered 0 for embeddability in the section above"),
                                 
                                 numericInput("q11", label = paste("Q11:",que[11]), value = 0, min = 0, max = 5, step = 1)),
                        
                        tabPanel("Collaboration", 
                                 h3("Collaboration Features"),
                                 h4("On a scale of 0 to 5, rank the importance of the following collaboration features to your data visualization \n"),
                                 h5("*No need to fill out this section if you entered 0 for collaboration in the section above"),
                                 
                                 numericInput("q12", label = paste("Q12:",que[12]), value = 0, min = 0, max = 5, step = 1)),
                        
                        
                        tabPanel("Data Preparation", 
                                 h3("Data Preparation Features"),
                                 h4("On a scale of 0 to 5, rank the importance of the following data preparation features to your data visualization \n"),
                                 h5("*No need to fill out this section if you entered 0 for data preparation in the section above"),
                                 
                                 numericInput("q13", label = paste("Q13:",que[13]), value = 0, min = 0, max = 5, step = 1),
                                 numericInput("q14", label = paste("Q14:",que[14]), value = 0, min = 0, max = 5, step = 1)),
                        
                        tabPanel("Data Governance", 
                                 h3("Data Governance Features"),
                                 h4("On a scale of 0 to 5, rank the importance of the following data governance features to your data visualization \n"),
                                 h5("*No need to fill out this section if you entered 0 for governance in the section above"),
                                 
                                 numericInput("q15", label = paste("Q15:",que[15]), value = 0, min = 0, max = 5, step = 1),
                                 numericInput("q16", label = paste("Q16:",que[16]), value = 0, min = 0, max = 5, step = 1),
                                 numericInput("q17", label = paste("Q17:",que[17]), value = 0, min = 0, max = 5, step = 1))

            ),
            
            hr(),
            actionButton("submit", "Show Results")
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
            
            plotOutput('radar', width = "100%", height = 600),
            #plotOutput('typical_radar', width = "100%", height = 600),
            # We MUST load the ECharts javascript library in advance
            #loadEChartsLibrary(),
            
            #next two lines together load the radar chart
            #tags$div(id="test", style="width:100%;height:400px;"),
            #deliverChart(div_id = "test"),
            
            #tabpanel has 3 tabs
            tabsetPanel(type = "tabs",
                        #to edit
                        tabPanel("Recommendation", 
                                 fluidRow(
                                     column(8, h4(htmlOutput("text")))),
                                     column(12, dataTableOutput("recs"))
                                 ),
                        tabPanel("Summary", dataTableOutput("summary")),
                        tabPanel("Methods", 
                                 fluidRow(
                                     column(8, h4(htmlOutput("methodText")))),
                                 column(12, dataTableOutput("table"))
                                 )
            )
        )
    )
)




# Define server logic required to draw a histogram
server <- function(input, output) {
    original_msg = "The results will appear here once you answer the questions on the left and click submit."
    sorted_df = data.frame("Tool" = c("Tableau", "Qlik", "SAP", "Thoughtspot"), "score" = c(0,0,0,0))
    output$text <- renderText({original_msg})
    output$recs <- renderDataTable({sorted_df})
    
    
    new_matrix = matrix
    new_cat = cat
    output$summary <- renderDataTable({new_cat})
    output$table <- renderDataTable({new_matrix})
    
    cat_transpose = as.data.frame(t(as.matrix(new_cat)))
    row.names(cat_transpose) <- c("you")
    cat_transpose <- rbind(rep(5,6) , rep(0,6) , cat_transpose)
    
    
    colors_border=c( rgb(0.2,0.5,0.5,0.9), rgb(0.8,0.2,0.5,0.9))
    colors_in=c( rgb(0.2,0.5,0.5,0.4), rgb(0.8,0.2,0.5,0.4))
    
    output$radar =  renderPlot({radarchart(cat_transpose,
                                           axistype=1 , 
                                           #custom polygon
                                           pcol=colors_border , pfcol=colors_in , plwd=4 , plty=1,
                                           #custom the grid
                                           cglcol="grey", cglty=1, axislabcol="grey", cglwd=0.8,
                                           #custom labels
                                           vlcex=0.8 
                                           )
                                legend(x=0.7, y=1, legend = rownames(cat_transpose[-c(1,2),]), bty = "n", pch=20 , col=colors_in , text.col = "grey", cex=1.2, pt.cex=3)
        
    })
    
    
    
    testRecsProxy  <- dataTableProxy('recs')
    testSummaryProxy <- dataTableProxy('summary')
    testTableProxy <- dataTableProxy('table')
    
    observeEvent(input$submit, {
        print('Updating table...')
        
        score <- c(input$q1, input$q2, input$q3, input$q4, input$q5, input$q6, input$q7, input$q8,
                   input$q9, input$q10, input$q11, input$q12, input$q13, input$q14, input$q15, input$q16,
                   input$q17)
        new_matrix = matrix
        new_matrix$Score = score
        
        # radar_scores = c(input$dashboard, 
        #                  input$interactivity,
        #                  input$data_source_connectivity,
        #                  input$self_service, 
        #                  input$performance, 
        #                  input$embeddability,
        #                  input$data_collection,
        #                  input$data_preparation, 
        #                  input$data_governance)
        
        print("hi")
        radar_scores = c(input$self_service,
                         input$interactivity,
                         input$embeddability,
                         input$collaboration,
                         input$data_preparation, 
                         input$data_governance)
        
        print(radar_scores)
        
        new_cat = cat
        print("error")
        new_cat$Category = radar_scores

        
        
        #updates both tables when submit is clicked
        cat_transpose = as.data.frame(t(as.matrix(new_cat)))
        cat_transpose[nrow(cat_transpose) + 1,] = typical[input$userType,]
        row.names(cat_transpose) <- c("you", "typical user of your type")
        
        cat_transpose <- rbind(rep(5,6) , rep(0,6) , cat_transpose)
        output$radar =  renderPlot({radarchart(cat_transpose,
                                               axistype=1 , 
                                               #custom polygon
                                               pcol=colors_border , pfcol=colors_in , plwd=4 , plty=1,
                                               #custom the grid
                                               cglcol="grey", cglty=1, axislabcol="grey", cglwd=0.8,
                                               #custom labels
                                               vlcex=0.8 
        )
            legend(x=0.7, y=1, legend = rownames(cat_transpose[-c(1,2),]), bty = "n", pch=20 , col=colors_in , text.col = "grey", cex=1.2, pt.cex=3)
            
        })
        output$table = renderDataTable({new_matrix})
        output$summary = renderDataTable({new_cat})
        
        
        replaceData(testTableProxy, new_matrix)
        
        replaceData(testSummaryProxy, new_cat)
        
        
        
        
        
        
        #makes recommendation here:
        adjusted_scores = score
        adjusted_scores[1:8] = score[1:8] * input$self_service
        adjusted_scores[9:10] = score[9:10] * input$interactivity
        adjusted_scores[11] = score[11] * input$embeddability
        adjusted_scores[12] = score[12] * input$collaboration
        adjusted_scores[13:14] = score[13:14] * input$data_preparation
        adjusted_scores[15:17] = score[15:17] * input$data_governance
        
        print(score)
        print(adjusted_scores)
        new_matrix$importance = adjusted_scores
        print(new_matrix)
        
        tableau = sum(new_matrix[new_matrix$Tableau == 1, ]$importance)
        qlik = sum(new_matrix[new_matrix$Qlik == 1, ]$importance)
        sap = sum(new_matrix[new_matrix$SAP == 1, ]$importance)
        thoughtspot = sum(new_matrix[new_matrix$Thoughtspot == 1, ]$importance)
        
        final_df = data.frame("Tool" = c("Tableau", "Qlik", "SAP", "Thoughtspot"), "score" = c(tableau, qlik, sap, thoughtspot))
        sorted_df = final_df[with(final_df, order(-score)), ]

        print(sorted_df)
        
        
        
        sorted_tools = sorted_df$Tool
        tool = "dummy tool"
        strings = c("<p>The tool that we recommend the most is: ", sorted_df$Tool[1], ", because it received an overall score of ",sorted_df$score[1], " based on your user needs. </p>",
                    "<p>The second recommended tool is:", sorted_df$Tool[2],  ", because it received an overall score of ",sorted_df$score[2], ". </p>",
                    "<p> </p>",
                    '<p> To learn about how we came to this recommendation, please refer to the "methods" tab. </p>')
        new_msg = paste(strings, sep = '')
        output$text <- renderText({new_msg})
    })
    
    
    method_str = c("<p>We weighed the importance of requirement based on your ratings on the feature category it belongs to.",
                "For each one of your requirements that a tool can meet, we added its adjusted weight to the total score of that tool.</p>",
                "<p>We ranked the data visualization tools based on their total scores according to your requirements. </p>",
                '<p></p>')
    method_text = paste(method_str, sep = '')
    
    output$methodText <- renderText({method_text})
}


# Run the application 
shinyApp(ui = ui, server = server)
