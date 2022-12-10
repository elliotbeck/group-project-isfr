# load libraries
library(gridExtra)
library(lattice)
library(viridisLite)

# load data
correlations <- get(load("src/visualization/correlations.RData"))
roll_correlations <- get(load("src/visualization/roll_correlations.RData"))
results_models_lm <- get(load("src/visualization/results_models_lm.RData"))
group_r <- read_feather("data/processed/commodities_growth.feather")
group_c <- read_feather("data/processed/commodities_growth_cum.feather")
pce_data_growth_yoy <-
    read_feather("data/processed/pce_data_growth_yoy.feather")
pce_data <- read_feather("data/processed/pce_data.feather")

# correlation table & average growth per month (%) (last-row)
grid.table(format(round(correlations[[5]], 3), nsmall = 3))

# table of summary statistics HICP vs Commodities
grid.table(format(round(results_models_lm, 3), nsmall = 3))

# plot of growths
cols <- hcl.colors(100, "Temps")
kl <- seq(from = 1, to = 100, by = 20)
matplot(group_c$date,
        group_c[1:(ncol(group_c) - 1)],
        type = c("l"),
        col = cols[kl],
        lwd = 2,
        lty = 1,
        xlab = "",
        ylab = "Cumulative Growth")
legend("topleft",
       legend = colnames(group_c[1:(ncol(group_c) - 1)]),
       col = cols[kl],
       bty = "n",
       pch=1:ncol(group_c[1:(ncol(group_c) - 1)]))

# plot of 12 month growths
date <- seq.Date(from = as.Date("1990-01-31"),
                to = as.Date("2022-10-30"),
                by = "months")
cols <- hcl.colors(100, "Temps")
matplot(date[13:length(date)],
        pce_data_growth_yoy[, 1:2],
        type = c("l"),
        col = c(cols[1], cols[70]),
        lwd = 2,
        lty = 1,
        xlab = "",
        ylab = "12 month growth rate (%)")
legend("topleft", 
       legend = colnames(pce_data[, 1:2]),
       cex = 1,bty = "n",
       col = c(cols[1], cols[70]),
       pch=1:ncol(pce_data[,1:2]))

# plot of 12 month growths pce
matplot(date[13:length(date)],
        pce_data_growth_yoy[,3:7],
        type = c("l") ,
        col = c(cols[10],
            cols[30],
            cols[50],
            cols[70],
            cols[90]),
        lwd = 2,
        lty = 1,
        xlab = "",
        ylab = "12 month growth rate (%)")
legend("topleft",
       legend = colnames(pce_data[, 3:7]),
       cex = 1,
       bty = "n",
       col = c(cols[10],
                cols[30],
                cols[50],
                cols[70],
                cols[90]),
       pch = 1:ncol(pce_data[,3:7]))


# plots of the rolling correlations HICP vs Commodities
time <- c(2004:2022)
for(i in 1:nrow(roll_correlations)){
  print(plot(time,
        roll_correlations[i,],
        type = "l",
        lwd = 2,
        ylab = "Correlation",
        xlab = "year",
        main = rownames(roll_2)[i])
  )
}

# heatmaps
coul <- viridis(100)
levelplot(correlations[[2]], col.regions = cm.colors(100),
        main = "Correlation Heatmap of monthly returns", xlab = "", ylab = "")
levelplot(correlations[[3]], col.regions = coul,
          main = "Correlation Heatmap of monthly returns",
          xlab = "", ylab = "")
levelplot(correlations[[4]], col.regions = cm.colors(100),
          main = "Correlation Heatmap of 12-monthly returns",
          xlab = "", ylab = "")