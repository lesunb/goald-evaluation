library(ggplot2)
library(dplyr)

dataframe <- read.csv(file="dataset.dat" ,head=TRUE,sep="\t")

## group
serie <- tbl_df(dataframe) %>% group_by(scenario) %>% summarise(avg_time = mean(time/1000000),  std=sd(time/1000000))

serie
