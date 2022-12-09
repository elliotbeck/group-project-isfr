# Table of summary statistics HICP vs Commodities

grid.table(format(round(results_model, 3), nsmall = 3))

#Plot of growths
cols <- hcl.colors(100, "Temps")
kl = seq(from = 1, to = 100, by = 20)
matplot(period[2:length(period)],
        group.c, 
        type = c("l"),
        col = cols[kl],
        lwd = 2, 
        lty = 1, 
        xlab = "", 
        ylab = "Cumulative Growth")
legend("topleft", 
       legend = colnames(group.c),
       col = cols[kl],
       bty = "n", 
       pch=1:ncol(group.c) )   

matplot(date[13:length(date)],zn[,1:2], 
        type = c("l"),
        col = c(cols[1],cols[70]), 
        lwd = 2, 
        lty = 1, 
        xlab = "", 
        ylab = "12 month growth rate (%)")
legend("topleft", 
       legend = colnames(bind[,1:2]),
       cex = 1,bty = "n", 
       col = c(cols[1],cols[70]), 
       pch=1:ncol(bind[,1:2]) )  
matplot(date[13:length(date)],
        zn[,3:7], 
        type = c("l") ,
        col = c(cols[10],cols[30], cols[50],cols[70],cols[90]), 
        lwd = 2, 
        lty = 1, 
        xlab = "", 
        ylab = "12 month growth rate (%)")
legend("topleft", 
       legend = colnames(bind[,3:7]),
       cex = 1,
       bty = "n", 
       col = c(cols[10],cols[30], cols[50],cols[70],cols[90]), 
       pch=1:ncol(bind[,3:7]) )  


#Plots of the rolling correlations HICP vs Commodities
for(i in 1:nrow(roll_2)){
  print( plot(time,roll_2[i,], 
              type = "l", 
              lwd = 2 , 
              ylab = "Correlation", 
              xlab = "year",
              main = rownames(roll_2)[i])
  )
}

#Heatmaps
coul <- viridis(100)
levelplot(cor, col.regions = cm.colors(100)
          ,main = "Correlation Heatmap of monthly returns", xlab="", ylab="")
levelplot(cor2, col.regions = coul, 
          main = "Correlation Heatmap of monthly returns", xlab="", ylab="") 
levelplot(cor2_12m, col.regions = cm.colors(100),
          main = "Correlation Heatmap of 12-monthly returns", xlab="", ylab="")


 