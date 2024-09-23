# Step 1: Create a base map with coastlines
gmt pscoast -JM6 -R-78/-70/38/42 -Dl -G200 -B1/1 -K >! map.ps

# Step 2: Plot the earthquake event as a star
gmt psxy event.txt -JM6 -R-78/-70/38/42 -Sa0.3i -Gred -O -K >> map.ps

# Step 3: Plot the stations as triangles
gmt psxy station.txt -JM6 -R-78/-70/38/42 -St0.3i -Gblue -O -K >> map.ps

echo "-74.00 40.92 Earthquake" | gmt pstext -JM6 -R-78/-70/38/42 -F+f12p,Helvetica-Bold,red+jTL -O -K >> map.ps

# Step 5: Add labels for the stations
echo "-73.00 41.73 KSCT" | gmt pstext -JM6 -R-78/-70/38/42 -F+f12p,Helvetica-Bold,blue+jTL -O -K >> map.ps
echo "-75.2 39.81 GEDE" | gmt pstext -JM6 -R-78/-70/38/42 -F+f12p,Helvetica-Bold,blue+jTL -O >> map.ps

gv map.ps
