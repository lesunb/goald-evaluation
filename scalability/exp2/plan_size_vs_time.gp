
#set grid ztics lc rgb "#bbbbbb" lw 1 lt 0
set grid ytics lc rgb "#bbbbbb" lw 1 lt 0
set grid xtics lc rgb "#bbbbbb" lw 1 lt 0
set grid

#set key at graph .3, .9 spacing 3 font "Helvetica, 14"
set key off

set style fill pattern
set term postscript color eps
set output 'plan_size_vs_time.eps'
set xrange [0:3100]
set yrange []
set xlabel 'Plan size' font 'Arial,20'
set ylabel 'Time (ms)' font 'Arial,20'

set ticslevel 0



plot for [IDX=0:9] 'plan_size_vs_time.dat' i (IDX) using 1:3 w lines  title columnheader(1)

#plot 'dataset0_100goals1_10contexts.dat' i 0 u 1:3 w lines title columnheader(1),\
#      'dataset0_100goals1_10contexts.dat' i 1 u 1:3 w lines title columnheader(1)
