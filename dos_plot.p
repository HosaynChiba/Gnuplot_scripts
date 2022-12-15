# Gnuplot script file for plotting data in file "*.dat"
# This file is called   dos_plot.p

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
 set xtic nomirror
 set ytic nomirror
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
set term postscript eps  enhanced color font "Helvetica, 14" linewidth 1
set output "dos_projected.eps"
#set term pdfcairo enhanced size 10 cm,14 cm font "Times-New-Roman, 12"
#set output "dos_proj_Co.pdf"
#set term pngcairo size 550 ,950 enhanced font "Times-New-Roman, 14"
#set output "dos_projected.png"
#set term epslatex size 5.8,5.8 color colortext
#set output "figure_6-a1.tex"
#=====================================================
# Canvas size of each plot
#=====================================================
set size 1,1

yinit=0.05         # Where is going to start the image
suma=0.10          # Where is going to appear the next plot

#=======================================================
# 'STYLE LINES ADJUSTMENTS'
#=======================================================

set style line 5   lt 1  lw 0.8 pt 1 ps  0.9 lc  rgb "gray80"
set style line 10  lt 1  lw 0.8 pt 2 ps  1.1 lc  rgb "gray50"
set style line 11  lt 5  lw 0.8 pt 3 ps  1.1 lc  rgb "gray20"
set style line 12 lt 1 lw 0.8 pt 1 ps 0.9 lc rgb "black"
set style line 13 lt 1 lw 0.8 pt 1 ps 0.9 lc rgb "red"
set style line 14 lt 1 lw 0.8 pt 1 ps 0.9 lc rgb "green"
set style line 15 lt 1 lw 0.8 pt 1 ps 0.9 lc rgb "blue"
set arrow nohead from -3,0 to 3,0 lt 5  
set style line 16 lt 1 lw 1.5 pt 11 ps 1.1 lc rgb "black"
#=======================================================
#'       Settings of multiplot' 
#=======================================================
set tmargin 0
set bmargin 0
set multiplot layout 5,1 
set key outside
set key top right
set key spacing 2
set arrow from -1.1,2 to -1.1,5 ls 16
set arrow from -1.1,-2 to -1.1,-5 ls 16

#=========================================================
#      First plot
#=========================================================
# Setting individual keys
#========================
 set tmargin 1
 set xr [-3:3]
 set yrange [-6:6]
 set label "\\textbf{ a)}" at -4.1,5 tc rgb "black" font "Helvetica, 24" front
 set label at screen 1, graph 1
 set label "\\textbf{ PBE}" at -4,0 tc rgb "red" font "Helvetica, 13" front
 set label "Hf$_{4}$C$_{3}$" at -2,4.5 tc rgb "red" font "Helvetica, 13" front
 set arrow nohead from -3,0 to 3,0 
 set arrow nohead from 0,-6 to 0, 6 lt 0
 unset xtics
 set key font "Helvetica bold, 8"
 set ytics font "Helvetica bold, 8"
 set ylabel "\\textbf{ PDOS (states/eV)}" offset 1.8,0 font "Helvetica, 8"
 plot "Gtdos.dat"   using 1:2 title "\\textbf{Totale}" with lines  ls 11 , \
      "Gtdos.dat"   using 1:3 title "" with lines  ls 11,\
      "GPDOS_Hf_UP.dat" using 1:4 title "\\textbf{ Hf-{5d}}" with lines lc rgb "red" , \
      "GPDOS_Hf_DW.dat" using 1:4 title "" with lines lc rgb "red", \
      "GPDOS_C_UP.dat" using 1:3 title "\\textbf{ C-{2p}}" with lines lc rgb "blue", \
      "GPDOS_C_DW.dat" using 1:3 title "" with lines lc rgb "blue";
      

#================================================================
#     Second plot
#================================================================

# 'RESET KEYS'
#'***********************'
 set noautoscale y
 unset label
 unset tmargin
 unset arrow 
 set key spacing 2
 set label "\\textbf{ PBE+U}" at -4.25,0 tc rgb "red" font ",13" front
 unset xtics
 set ytics font "Helvetica bold, 8"
 set xr [-3:3]
 set yrange [-6:6]
 set ylabel "\\textbf{ PDOS ( states/eV)}"
 set key font "Helvetica bold, 8"	
 set key spacing 2
 set arrow nohead from -3,0 to 3,0 
 set arrow nohead from 0,-6 to 0, 6 lt 0
 plot "Utdos.dat"   using 1:2 title "\\textbf{Totale}" with lines  ls 11 , \
      "Utdos.dat"   using 1:3 title "" with lines  ls 11,\
      "UPDOS_Hf_UP.dat" using 1:4 title "\\textbf{ Hf-{5d}}" with lines lc rgb "red" , \
      "UPDOS_Hf_DW.dat" using 1:4 title "" with lines lc rgb "red", \
      "UPDOS_C_UP.dat" using 1:3 title "\\textbf{ C-{2p}}" with lines lc rgb "blue", \
      "UPDOS_C_DW.dat" using 1:3 title "" with lines lc rgb "blue";

#================================================================
#     Third plot
#================================================================

# 'RESET KEYS'
#'***********************'
 set noautoscale y
 unset key
 set key spacing 2
 unset label
 unset tmargin
 unset arrow
 set tmargin 0
 set label "\\textbf{ SCAN}" at -4.1,0 tc rgb "red" font ",13" front
 unset xlabel
 set xr [-3:3]
 set yrange [-6:6]
 set ylabel "\\textbf{ PDOS (states/eV)}"
 set arrow nohead from -3,0 to 3,0 
 set arrow nohead from 0,-6 to 0, 6 lt 0
 unset xtics
 set ytics font "Helvetica bold, 8"
 set key font "Helvetica bold, 8"	
 set key spacing 2 
 plot "Mtdos.dat"   using 1:2 title "\\textbf{Totale}" with lines  ls 11 , \
      "Mtdos.dat"   using 1:3 title "" with lines  ls 11,\
      "MPDOS_Hf_UP.dat" using 1:4 title "\\textbf{ Hf-{5d}}" with lines lc rgb "red" , \
      "MPDOS_Hf_DW.dat" using 1:4 title "" with lines lc rgb "red", \
      "MPDOS_C_UP.dat" using 1:3 title "\\textbf{ C-{2p}}" with lines lc rgb "blue", \
      "MPDOS_C_DW.dat" using 1:3 title "" with lines lc rgb "blue";
#================================================================
#     Fourth plot
#================================================================

# 'RESET KEYS'
#'***********************'
 set noautoscale y
 unset label
 unset tmargin
 unset arrow
 set key spacing 2
 set tmargin 0
 set label "\\textbf{ HSE06}" at -4.25,0 tc rgb "red" font ",13" front
 set xlabel "\\textbf{ Energie (eV)}"
 set ylabel "\\textbf{ PDOS (states/eV)}"
 set arrow nohead from -3,0 to 3,0 
 set arrow nohead from 0,-6 to 0, 6 lt 0
 set key font "Helvetica bold, 8"
 set xr [-3:3]
 set yr [-6:6]
 set key spacing 2
 set xtics auto
 set ytics font "Helvetica bold, 8"
 set xtics font "Helvetica bold, 8"
 set xtics nomirror
 plot "HTDOS.dat"   using 1:2 title "\\textbf{Totale}" with lines  ls 11 , \
      "HTDOS.dat"   using 1:3 title "" with lines  ls 11,\
      "HPDOS_Hf_UP.dat" using 1:($6+$7+$8+$9+$10) title "\\textbf{ Hf-{5d}}" with lines lc rgb "red" , \
      "HPDOS_Hf_DW.dat" using 1:($6+$7+$8+$9+$10) title "" with lines lc rgb "red", \
      "HPDOS_C_UP.dat" using 1:($3+$4+$5) title "\\textbf{ C-{2p}}" with lines lc rgb "blue", \
      "HPDOS_C_DW.dat" using 1:($3+$4+$5) title "" with lines lc rgb "blue";

 unset multiplot
 reset