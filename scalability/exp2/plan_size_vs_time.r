#install.packages("magrittr")
#library(magrittr)

install.packages("dplyr")
# library(ggplot2)
library(dplyr)

dataframe <- read.csv(file="tsa_dataset1543038419001" ,head=TRUE,sep="\t")

initial_deployment_dam_update <- tbl_df(dataframe) %>% 
  group_by(bundles_count, numberOfGoals, variability) %>%
  summarise(avg_time = mean( (dam_updated_0+ deployment_change_planned_0)/1000000),  std=sd( (dam_updated_0 + deployment_change_planned_2) /1000000))

pdf("initial_deployment_dam_update.pdf")
boxplot(avg_time~bundles_count,data=initial_deployment_dam_update, xlab="Size", ylab="Time(ms)")
dev.off()

dam_updated_1 <- tbl_df(dataframe) %>% 
  group_by(bundles_count, numberOfGoals, variability) %>%
  summarise(avg_time = mean( (dam_updated_1 + deployment_change_planned_1) /1000000),  std=sd( (dam_updated_1+ deployment_change_planned_1)/1000000))

pdf("dam_updated_1.pdf")
boxplot(avg_time~bundles_count,data=dam_updated_1, xlab="Size", ylab="Time(ms)")
dev.off()

dam_updated_2 <- tbl_df(dataframe) %>% 
  group_by(bundles_count, numberOfGoals, variability) %>%
  summarise(avg_time = mean( (dam_updated_2 + deployment_change_planned_2) /1000000),  std=sd( (dam_updated_2 + deployment_change_planned_2)/1000000))

#data <- read.csv(file="plan_size_vs_time.dat" ,head=TRUE,sep="\t")
#setPDF()
pdf("dam_updated_2.pdf")
boxplot(avg_time~bundles_count,data=dam_updated_2, xlab="Size", ylab="Time(ms)")
dev.off()

