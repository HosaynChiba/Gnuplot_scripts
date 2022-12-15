# Gnuplot script file for plotting data in file "*.dat"
# This file is called   band_plot.p

#======================================================
#'    STANDARD KEYS TO LATIN-AMERICAN SPEAKERS'
#======================================================

 set termopt enhanced                   # Permite pone ^super/_{sub} indices
 unset log                              # remove any log-scaling
 unset label                            # remove any previous labels
 set termoption dashed                  # Allows dash styles
 set terminal pngcairo dashed           # Dash style for png terminal 
 set xtic auto                          # set xtics automatically
 set ytic auto                          # set ytics automatically
 set palette gray
 set encoding iso_8859_1                # Para poner acentos
# set grid

#======================================================
#          Output settings terminals
#=====================================================
#
#    Type of file you want to print the plot
#    eps is the most recomended
#    Default: Shows it on your screen
set term postscript eps  enhanced color font "Helvetica, 15" linewidth 2
set output "band_multiplot.eps"
#set term pngcairo size 950 ,550 enhanced font "Times-New-Roman, 14"
#set output "band_multiplot.png"
#set term pdfcairo enhanced font "Times-New-Roman, 13"
#set output "band_multiplot.pdf"
#set term epslatex size 7.2,5 color colortext 'ptm,bx'
#set output "band_multiplot.tex"
#=====================================================
# Canvas size of each plot
#=====================================================

xsize= 0.5        # Controls the image x size in the canvas
ysize= 1          # Controls the image y size in the canvas
#=======================================================
# 'STYLE LINES ADJUSTMENTS'
#=======================================================

set style line 5   lt 1  lw 1.2 pt 1 ps  0.9 lc  rgb "black"
set style line 10  lt 1  lw 1.0 pt 2 ps  1.1 lc  rgb "red90"
set style line 11  lt 5  lw 1.4 pt 3 ps  1.1 lc  rgb "gray20"
#=======================================================
#'       Settings of multiplot' 
#=======================================================

set multiplot layout 1,4 columnsfirst 
set ylabel "\\textbf{Energie [eV]}}" offset 1.5,0
set xr [-10:10]
set yr [-20:20]
#=========================================================
#      First plot
#=========================================================

# Reset keys
#'******************'
 unset lmargin
 unset rmargin

# Setting individual keys
#========================
 set size xsize, ysize
 set lmargin at screen 0.05  # Controls the x position
 set rmargin at screen 0.25  # Controls the y position
 set label "\\textbf{a)}" at -0.6,3.2 tc rgb "black" font "Helvetica, 18" front
 set object 1 rect from graph 0,2.5 to 1.5,2.5 fc rgb "white" 
 fs solid 1.0 front lw 0
 set label at 0.1,2.8 "Hf$_{4}$C$_{3}$"  tc rgb "black" font ",14" front
 set key out above left
 set arrow 1 nohead from 0.951,-3 to 0.951,3 ls 2
 set arrow 2 nohead from 1.501,-3 to 1.501,3 ls 2
 set arrow 3 nohead from 0,0.00 to 2.599, 0.00 ls 3
 set xr [0.0:2.599]
 set yr [-3:3]
 set ytics nomirror
 set xtics font "Symbol"
 set xtics ("$\\Gamma$" 0, "M" 0.951, "K" 1.501, "$\\Gamma$" 2.599)
 plot 'BAND.dat' using 1:2 title 'PBE up' with lines ls 5, \
      'BAND.dat' using 1:3 title '    down' with lines ls 10;
#================================================================
#     Second plot
#================================================================

# 'RESET KEYS'
#'***********************'
 
 unset label
 unset lmargin
 unset rmargin
 unset ylabel
 unset ytics
 unset object 1
 set size xsize, ysize
 set lmargin at screen 0.25
 set rmargin at screen 0.50
 set arrow 1 nohead from 0.951,-3 to 0.951,3 ls 2
 set arrow 2 nohead from 1.501,-3 to 1.501,3 ls 2
 set arrow 3 nohead from 0,0.00 to 2.599, 0.00 ls 3
 set xr [0.0:2.599]
 set yr [-3:3]
 set xtics font "Symbol"
 set xtics ("$\\Gamma$" 0, "M" 0.951, "K" 1.501, "$\\Gamma$" 2.599)
 plot  'BAND_U.dat'  using 1:2 title 'PBE+U =2 up  ' with lines ls 5, \
       'BAND_U.dat'  using 1:3 title '         down' with lines ls 10;
#================================================================
#     Third plot
#================================================================

# 'RESET KEYS'
#'***********************'
 
 unset label
 unset lmargin
 unset rmargin
 unset ylabel
 unset ytics
 set size xsize, ysize
 set lmargin at screen 0.50
 set rmargin at screen 0.75
 set arrow 1 nohead from 0.951,-3 to 0.951,3 ls 2
 set arrow 2 nohead from 1.501,-3 to 1.501,3 ls 2
 set arrow 3 nohead from 0,0.00 to 2.599, 0.00 ls 3
 set xr [0.0:2.599]
 set yr [-3:3]
 set xtics font "Symbol"
 set xtics ("$\\Gamma$" 0, "M" 0.951, "K" 1.501, "$\\Gamma$" 2.599)
 plot  'BAND_M.dat'  using 1:2 title 'SCAN up  ' with lines ls 5, \
       'BAND_M.dat' using 1:3 title '    down' with lines ls 10;
#================================================================
#     Fourth plot
#================================================================

# 'RESET KEYS'
#'***********************'
 
 unset label
 unset lmargin
 unset rmargin
 unset ylabel
 unset ytics
 set size xsize, ysize
 set lmargin at screen 0.75
 set rmargin at screen 0.995
 set arrow 1 nohead from 0.951,-3 to 0.951,3 ls 2
 set arrow 2 nohead from 1.501,-3 to 1.501,3 ls 2
 set arrow 3 nohead from 0,0.00 to 2.599, 0.00 ls 3
 set xr [0.0:2.599]
 set yr [-3:3]
 set xtics font "Symbol"
 set xtics ("$\\Gamma$" 0, "M" 0.951, "K" 1.501, "$\\Gamma$" 2.599)
 plot  'BAND_hse.dat'  using 1:2 title 'HSE06 up  ' with lines ls 5, \
        'BAND_hse.dat'  using 1:3 title '      down' with lines ls 10;
 unset multiplot
 reset