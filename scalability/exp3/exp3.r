#install.packages("dplyr")
library(ggplot2)
library(dplyr)

dataframe <- read.csv(file="variability.dat" ,head=TRUE,sep="\t")
initial_deployment <- tbl_df(dataframe) %>% 
  #filter(dam_updated_0 < 10000000 ) %>% 
  group_by(variability, bundles_count) %>%
  summarise(avg_time = mean( ( dam_updated_3 )/1000000),  std=sd(( dam_updated_3 )/1000000))



#data <- read.csv(file="plan_size_vs_time.dat" ,head=TRUE,sep="\t")
setEPS()
postscript("exp3.eps")
ggplot(data = initial_deployment, aes(x=bundles_count, y=avg_time, group=factor(variability),color=factor(variability))) + geom_line() + scale_colour_hue(l=20) +  labs(x = "Size", y="Time(ms)", group="a") + guides(col = guide_legend(title="Variability", reverse = TRUE))
dev.off()

