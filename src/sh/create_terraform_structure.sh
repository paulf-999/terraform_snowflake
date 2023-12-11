#!/bin/bash

# Function to check if a directory exists
dir_exists() {
  [ -d "$1" ]
}

# Function to check if a file exists
file_exists() {
  [ -f "$1" ]
}

# Array of files to create
files=("tbc/outputs.tf" "tbc/variables.tf" "tbc/main.tf" "tbc/terraform.tfvars")

# Create directories if they don't exist
for directory in "environments" "modules" "providers" "tbc"; do
  if ! dir_exists "$directory"; then
    mkdir "$directory"
    touch "$directory/.gitkeep"
  fi
done

# Create placeholder Terraform files if they don't exist
for file in "${files[@]}"; do
  if ! file_exists "$file"; then
    touch "$file"
  fi
done

echo "Terraform project structure created successfully!"
