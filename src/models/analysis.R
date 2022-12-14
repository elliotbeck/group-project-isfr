# load libraries
library(feather)

# load data
pce_data <- read_feather("data/processed/pce_data.feather")
pce_data_growth <- read_feather("data/processed/pce_data_growth.feather")
pce_data_growth_yoy <-
    read_feather("data/processed/pce_data_growth_yoy.feather")
group_r <- read_feather("data/processed/commodities_growth.feather")
group_c <- read_feather("data/processed/commodities_growth_cum.feather")
group_c$date <- NULL
group_r$date <- NULL

# computations
avg_prc <- colMeans(group_r) * 100
cor <- cor(group_r)
cor2 <- cor(pce_data_growth)
cor2_12m <- cor(pce_data_growth_yoy)
results_cor_avg <-  rbind(cor, avg_prc)
correlations <- list(
    avg_prc,
    cor,
    cor2,
    cor2_12m,
    results_cor_avg)

# save the correlation output
save(correlations,
    file = "src/visualization/data/correlations.RData")

# fit the models
model_all <- summary(lm(hicp ~ cmd_all - 1, data = group_r))
model_agr <- summary(lm(hicp ~ cmd_agr - 1, data = group_r))
model_food <- summary(lm(hicp ~ cmd_food - 1, data = group_r))
model_gold <- summary(lm(hicp ~ cmd_gold - 1, data = group_r))
model_met <- summary(lm(hicp ~ cmd_met - 1, data = group_r))
model_oil <- summary(lm(hicp ~ cmd_oil - 1, data = group_r))

results_model <- rbind(model_all$coefficients,
      model_agr$coefficients,
      model_food$coefficients,
      model_gold$coefficients,
      model_met$coefficients,
      model_oil$coefficients)
# save the model output
save(results_model, file = "src/visualization/data/results_models_lm.RData")

# Rolling correlations HICP vs commodities
a <- nrow(group_c)-floor(nrow(group_c) / 12) * 12
b <- floor(nrow(group_c) / 12) - 1
roll_2 = c(1:(b + 1))
for(k in 1:7){
  roll <- numeric()
for(i in 0:b) {
  f <- a + 12 * i
  j = a + 12 * (i + 1)
  roll <- c(roll,
            cor(group_r[f:j, 1],
            group_r[f:j, k]))
}
  roll_2 <- rbind(roll_2, roll)
}
roll_2 <- roll_2[2:8, ]
rownames(roll_2) <- colnames(group_r)[1:7]
roll_2 <- roll_2[2:7, ]
time <- c(2004:2022)
colnames(roll_2) <- time

# save the rolling correlation output
save(roll_2, file = "src/visualization/data/roll_correlations.RData")
