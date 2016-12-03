
set grid ztics lc rgb "#bbbbbb" lw 1 lt 0
set grid ytics lc rgb "#bbbbbb" lw 1 lt 0
set grid xtics lc rgb "#bbbbbb" lw 1 lt 0
set grid
set term postscript color eps
set output 'plan_size_and_context_3d_lines.eps'
set xrange [0:3100] reverse
set yrange []
set xlabel 'Plan size' font 'Arial,20'
set ylabel 'Variability' font 'Arial,20'
set zlabel 'Time (ms)' font 'Arial,20'
set ticslevel 0

#splot "dataset0_100goals1_10contexts.dat" u 1:2:3 with lines

splot for [IDX=0:9] 'dataset0_100goals1_10contexts.dat' i (IDX) using 1:2:3 with lines title columnheader(1)
