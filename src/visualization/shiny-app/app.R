# load the required packages
library(shiny)
require(shinydashboard)
library(lattice)
library(DT)
library(dygraphs)
library(feather)
library(xts)

# load the data
correlations <- get(load("correlations.RData"))
results_models <- get(load("results_models_lm.RData"))
roll_2 <- get(load("roll_correlations.RData"))
group_c <- read_feather("commodities_growth_cum.feather")
pce_data_growth_yoy <-
    read_feather("pce_data_growth_yoy.feather")

# set up the ui
ui <- dashboardPage(
    dashboardHeader(),
    dashboardSidebar(
    sidebarMenu(
        menuItem("Correlations",
                tabName = "correlations",
                icon = icon("bar-chart")),
        menuItem("Models", 
                tabName = "models", 
                icon = icon("line-chart")))
    ),
    dashboardBody(
    tabItems(
        tabItem(tabName = "correlations",
                fluidRow(
                box(
                    title = "Correlations",
                    status = "primary",
                    solidHeader = TRUE,
                    width = 12,
                    DT::dataTableOutput(("correlations"))
                ),
                fluidRow(
                box(
                    title = "Correlation Heatmap of monthly returns",
                    status = "primary",
                    solidHeader = TRUE,
                    width = 6,
                    plotOutput("rolling_comm")
                ),
                box(
                    title = "Correlation Heatmap of monthly returns",
                    status = "primary",
                    solidHeader = TRUE,
                    width = 6,
                    plotOutput("rolling_comm_12")
                ),
                box(
                    title = "Correlation Heatmap of 12-monthly returns",
                    status = "primary",
                    solidHeader = TRUE,
                    width = 6,
                    plotOutput("rolling_sp500")
                        )
                    )
                )
            ),
        tabItem(tabName = "models",
                fluidRow(
                box(
                    title = "Cumulative Growth of Commodities and US Inflation",
                    status = "primary",
                    solidHeader = TRUE,
                    width = 12,
                    dygraphOutput("time_series")
                    ),
                box(
                    title = "Growth rates of commodities and SP500",
                    status = "primary",
                    solidHeader = TRUE,
                    width = 12,
                    dygraphOutput("time_series_sp500_crb")
                    ),
                box(
                    title = "Growth rates of inflation groups",
                    status = "primary",
                    solidHeader = TRUE,
                    width = 12,
                    dygraphOutput("time_series_inflation_groups")
                    )
                )
            )
        )
    )
)

# set up the server
server <- function(input, output) { 

    # set up the plots
    output$correlations <- DT::renderDataTable({
    # correlation table & average growth per month (%) (last-row)
        datatable(format(round(correlations[[5]], 3), nsmall = 3))
    })

    output$models <- renderPlot({
        heatmap(results_models, Rowv = NA, Colv = NA, scale = "none")
    })

    output$rolling_comm <- renderPlot({
        levelplot(correlations[[4]], col.regions = cm.colors(100),
          main = "Correlation Heatmap of 12-monthly returns", 
          xlab = "", ylab = "")
    })
    output$rolling_comm_12 <- renderPlot({
        levelplot(correlations[[2]], col.regions = cm.colors(100),
          main = "Correlation Heatmap of 12-monthly returns", 
          xlab = "", ylab = "")
    })
    output$rolling_sp500 <- renderPlot({
        levelplot(correlations[[3]], col.regions = cm.colors(100),
          main = "Correlation Heatmap of 12-monthly returns", 
          xlab = "", ylab = "")
    })
    output$time_series <- renderDygraph({
        series <- xts(group_c[, 1:7], order.by = group_c$date)
        dygraph(series)
    })
    output$time_series_sp500_crb <- renderDygraph({
        date <- seq.Date(from = as.Date('1990-01-31'), 
                to = as.Date('2022-10-30'), 
                by = 'months')

        series <- xts(pce_data_growth_yoy[, 1:2], 
                        order.by = as.Date(date[13:length(date)]))
        dygraph(series)
    })
    output$time_series_inflation_groups <- renderDygraph({
        date <- seq.Date(from = as.Date('1990-01-31'), 
                to = as.Date('2022-10-30'), 
                by = 'months')

        series <- xts(pce_data_growth_yoy[, 3:7], 
                        order.by = as.Date(date[13:length(date)]))
        dygraph(series)
    })
}

# run the app
shinyApp(ui, server)
