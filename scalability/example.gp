reset
set term postscript color eps
set output 'plan_size_and_context_exemplo.eps'

filename="dataset0_100goals1_10contexts.dat"

set ticslevel 0
unset key; unset colorbox
set tics out nomirror

set isosample 100, 3
set xrange [*:*] reverse
set yrange [*:*]

set multiplot
set palette model RGB defined (0 0.3 0.3 0.85, 1 0.9 0.9 0.95)

r=rand(0); g=rand(0); b=rand(0)
set palette model RGB defined (0 r/100 g/100 b/100, 1 r/100 g/100 b/100)
splot filename every ::1::2 u 1:2:3 w pm3d
