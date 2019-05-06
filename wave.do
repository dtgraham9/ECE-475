view wave 
wave clipboard store
wave create -driver freeze -pattern constant -value 1010 -range 3 0 -starttime 0ps -endtime 1000ps sim:/mult/X 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 0101 -range 3 0 -starttime 0ps -endtime 1000ps sim:/mult/Y 
WaveExpandAll -1
WaveCollapseAll -1
wave clipboard restore
