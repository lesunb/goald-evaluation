library(ggplot2)
library(dplyr)

dataframe <- read.csv(file="dataset10.dat" ,head=TRUE,sep="\t")

## group
serie <- tbl_df(dataframe) %>%
  group_by(variability, size) %>%
  summarise(avg_time = mean(time))

## plot

setEPS()
postscript("plan_size_and_context_2d_lines_avg.eps")

ggplot(data = serie, aes(x=size, y=avg_time, group=factor(variability),color=factor(variability))) + geom_line() + scale_colour_hue(l=20) +  labs(x = "Plan Size", y="Average Time(ms)", group="a") + guides(col = guide_legend(title="Variability", reverse = TRUE))

dev.off()
