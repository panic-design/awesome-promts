#!/bin/bash
OUTPUT_FILE="project.md"
> "$OUTPUT_FILE"
find . -type f \( -name "*.cpp" -o -name "*.h" -o -name "*.hpp" \) -print0 | while IFS= read -r -d $'\0' file; do
    echo "# $file" >> "$OUTPUT_FILE"
    cat "$file" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
done