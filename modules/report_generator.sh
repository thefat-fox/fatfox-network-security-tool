#!/bin/bash

echo ""
echo "===== FATFOX REPORT GENERATOR ====="
echo ""

read -p "Enter Target Folder Name: " target

report="../reports/$target/report.html"

echo "<html><body>" > $report
echo "<h1>FatFox Pentest Report</h1>" >> $report

for file in ../reports/$target/*.txt
do
echo "<h2>$file</h2><pre>" >> $report
cat $file >> $report
echo "</pre>" >> $report
done

echo "</body></html>" >> $report

echo "Report generated:"
echo $report

read -p "Press Enter..."
