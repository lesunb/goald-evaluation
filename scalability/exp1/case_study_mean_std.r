#install.packages("dplyr")
# library(ggplot2)
library(dplyr)

dataframe <- read.csv(file="result.dat" ,head=TRUE,sep="\t")

## group
initial_deployment <- tbl_df(dataframe) %>% 
  group_by(scenario, operation, exec_index) %>%
  filter(row_number()==1) %>% # only the first, the initial plan
  group_by(scenario, operation ) %>%
  summarise(avg_time = mean(time/1000000),  std=sd(time/1000000))

initial_deployment
write.table(initial_deployment, "initial_deployment.txt", sep="\t")

update_deployment <- tbl_df(dataframe) %>% 
  group_by(scenario, operation, exec_index) %>%
  filter(row_number() > 1) %>% # only the first, the initial plan
  group_by(scenario, operation ) %>%
  summarise(avg_time = mean(time/1000000),  std=sd(time/1000000))

update_deployment

write.table(update_deployment, "update_deployment.txt", sep="\t")

