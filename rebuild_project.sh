#!/bin/bash
for d in */; do
  cd "$d"
  if [[ ! -f "pubspec.yaml" ]]; then # check if directory is flutter project
    cd ..
    continue
  fi
  echo "========================$d========================"
    flutter clean
    flutter pub get
    flutter pub run build_runner build --delete-conflicting-outputs
  cd ..
done