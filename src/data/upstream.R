# import packages
library(feather)
library(rdbnomics)
library(quantmod)


# Download Ernest's data
ids <- c("IMF/PCPS/M.W00.PALLFNF.IX",
        "IMF/PCPS/M.W00.PAGRI.IX",
        "IMF/PCPS/M.W00.PALLMETA.IX",
        "IMF/PCPS/M.W00.PFOOD.IX",
        "IMF/PCPS/M.W00.PGOLD.IX",
        "IMF/PCPS/M.W00.POILBRE.IX",
        "Eurostat/prc_hicp_midx/M.I05.CP00.EA"
        )
df <- as.data.frame(rdb(ids = ids))
write_feather(df, "data/raw/commodities.feather")

# Download Chonghuo's data
data <- getSymbols("^GSPC",
                    src = "yahoo",
                    from = "1990-01-01",
                    to = "2022-10-31",
                    periodicity = "monthly",
                    auto.assign = FALSE)
data <- data.frame(date = index(data), data)

write_feather(data, "data/raw/sp500.feather")
