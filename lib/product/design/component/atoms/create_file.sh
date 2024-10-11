#!/bin/bash

# Klasör isimlerini snake_case formatında tanımla
components=(
  "Button"
  "FAB"
  "Icon button"
  "Checkbox"
  "Chips"
  "Dialog"
  "Divider"
  "Elevation"
  "Focus ring"
  "List"
  "Menu"
  "Progress indicators"
  "Radio"
  "Ripple"
  "Select"
  "Slider"
  "Switch"
  "Tabs"
  "Text field"
)

# Her bir bileşeni snake_case formatına dönüştür ve klasör oluştur
for component in "${components[@]}"
do
  # Snake_case formatına dönüştürme (boşlukları _ ile değiştirip, harfleri küçük yapma)
  folder_name=$(echo "$component" | tr '[:upper:]' '[:lower:]' | tr ' ' '_')

  # Klasör oluştur
  mkdir -p "$folder_name"

  echo "Created folder: $folder_name"
done

