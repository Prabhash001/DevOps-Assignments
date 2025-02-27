# Q1: Kaprekar's Routine

## kaprekar.sh
```bash
#!/bin/bash

# Function to sort digits in descending order
desc_sort() {
    echo "$1" | grep -o . | sort -r | tr -d '\n'
}

# Function to sort digits in ascending order
asc_sort() {
    echo "$1" | grep -o . | sort | tr -d '\n'
}

# Function to check if input is a valid 4-digit number
validate_input() {
    if [[ ! $1 =~ ^[0-9]{4}$ ]]; then
        echo "Error: Please enter a valid 4-digit number."
        exit 1
    fi
}

# Kaprekar Routine Function
kaprekar_routine() {
    local num=$1
    local count=0

    while [ "$num" != "6174" ]; do
        asc=$(asc_sort "$num")
        desc=$(desc_sort "$num")
        num=$((desc - asc))
        printf "Iteration %d: %s - %s = %d\n" $((++count)) "$desc" "$asc" "$num"

        # Pad with zeros if needed
        num=$(printf "%04d" "$num")

        if [ "$num" == "0000" ]; then
            echo "Reached zero, ending process."
            exit 1
        fi
    done

    echo "Kaprekar's constant 6174 reached in $count iterations."
}

# Main script
read -rp "Enter a 4-digit number: " input
validate_input "$input"
kaprekar_routine "$input"
```

---
