# import packages
library(feather)

# source the upstream script
source("/src/data/upstream.R")

# read in Ernest's data
df <- as.data.frame(read_feather("/data/raw/commodities.feather"))

# Regularization of dbnomics data
df$period <- as.Date(df$period)
period <- df[df$COMMODITY=="PALLFNF","period"][1]
hicp <- df[df$period >= period & is.na(df$COMMODITY), "value"]
df <- df[!is.na(df$COMMODITY),]
cmd_agr <- df[df$period >= period & df$COMMODITY == "PAGRI", "value"]
cmd_met <- df[df$period >= period & df$COMMODITY == "PALLMETA", "value"]
cmd_food <- df[df$period >= period & df$COMMODITY == "PFOOD", "value"]
cmd_gold <- df[df$period >= period & df$COMMODITY == "PGOLD", "value"]
cmd_oil <- df[df$period >= period & df$COMMODITY == "POILBRE", "value"]
cmd_all <- df[df$period >= period & df$COMMODITY == "PALLFNF", "value"]


# bind the data into data frame
group <- data.frame(date = df[df$period >= period & 
                      df$COMMODITY == "PALLFNF", "period"],
                    hicp, cmd_all, cmd_agr, cmd_food, cmd_gold, cmd_met,
                    cmd_oil)

# get growth rates and save
group_r <- group[2:nrow(group), 2:ncol(group)] /
  group[1:(nrow(group) - 1), 2:ncol(group)] - 1
group_r$date <- group$date[2:nrow(group)]
write_feather(group_r, "data/processed/commodities_growth.feather")

# get cumulative growth rates and save
group_c <- cumprod((group_r[, 1:(ncol(group)-1)] + 1))
group_c$date <- group$date[2:nrow(group)]
write_feather(group_c, "data/processed/commodities_growth_cum.feather")

# read in Chonghuo's data
crb <- read.csv("/data/raw/crb.csv")
crb <- crb[order(nrow(data):1), ]
sp500 <- as.data.frame(read_feather("data/raw/sp500.feather"))
pce <- read.csv("/data/raw/pce.csv")
pce <- pce[order(nrow(pce):1), ]

# define the date sequence
date <- seq.Date(from = as.Date("1990-01-31"),
                to = as.Date("2022-10-30"),
                by = "months")

# preprocess Chonghuo's data
sp500 <- sp500$`GSPC.Adjusted`
sp500 <- as.numeric(sp500[2:nrow(data)])
crb <- crb[1:(nrow(crb) - 1), 2]
allitems <- as.numeric(pce[, 6])
durables <- as.numeric(pce[, 2])
nondur <- as.numeric(pce[, 3])
serv <- as.numeric(pce[, 4])
core <- as.numeric(pce[, 5])

# bind the data into data frame and save
pce_data <- data.frame(sp500, crb, allitems, durables, nondur, serv, core)
write_feather(pce_data, "data/processed/pce_data.feather")

# get growth rates and save
pce_data_growth <- pce_data[2:nrow(pce_data), ] /
    pce_data[1:(nrow(pce_data) - 1), ] - 1
write_feather(pce_data_growth, "data/processed/pce_data_growth.feather")

# get year on year growth rates and save
pce_data_growth_yoy <- c(1:7)
bn <- nrow(pce_data) - 12
for (i in 1:bn){
  xn <- 100 * (pce_data[i + 12, ] / pce_data[i, ] - 1)
  pce_data_growth_yoy <- rbind(pce_data_growth_yoy, xn)
}
pce_data_growth_yoy <- pce_data_growth_yoy[2:nrow(pce_data_growth_yoy), ]
write_feather(pce_data_growth_yoy,
    "data/processed/pce_data_growth_yoy.feather")

