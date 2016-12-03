library("ggplot2")

data <- read.csv(file="dataset.dat" ,head=TRUE,sep="\t")
setEPS()
postscript("plan_size_and_context_2d_lines.eps")

ggplot(data = data, aes(x=X, y=Z, group=factor(Y),color=factor(Y))) + geom_line() + scale_colour_hue(l=20) +  labs(x = "Size", y="Time(ms)", group="a") + guides(col = guide_legend(title="Variability", reverse = TRUE))

dev.off()
