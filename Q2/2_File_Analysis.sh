# Q2: File Type Analysis and Graph Plotting

## file_analysis.sh
```bash
#!/bin/bash

# Get file details and write to output file
output_file="file_info.txt"
echo -e "Filename\tType\tSize(KB)" > "$output_file"

for file in *; do
    if [ -f "$file" ]; then
        type="File"
    elif [ -d "$file" ]; then
        type="Directory"
    else
        type="Other"
    fi
    size=$(du -k "$file" | cut -f1)
    echo -e "$file\t$type\t$size" >> "$output_file"
done

# Generate plot script for gnuplot
cat <<EOF > plot.gp
set terminal png
set output 'file_types.png'
set title 'File Types and Sizes'
set xlabel 'File Type'
set ylabel 'Size (KB)'
set style data histogram
set style fill solid
set boxwidth 0.5
plot '$output_file' using 3:xtic(2) title 'File Size'
EOF

gnuplot plot.gp

# Display completion message
echo "Analysis complete. Check file_info.txt and file_types.png."
```

---
