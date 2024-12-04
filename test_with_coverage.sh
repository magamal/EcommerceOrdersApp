##!/bin/bash

# pre requesits
## brew install lcov =====> generate reports
## dart pub global activate remove_from_coverage

excluded=("coverage/" "di/" "app/")
appPath=$(pwd)
coveragePath=$(pwd)"/coverage"
output="$appPath/coverage/lcov.info"
rm -rf $(pwd)"/coverage" # delete the coverage folder and create new one
mkdir "coverage"

appendTestCoverage() {
  dir=$(pwd)
  input="$dir/coverage/lcov.info"
  echo "$output"
  while read line; do
    secondString="SF:$dir/"
    echo "${line/SF:/$secondString}" >>$output
  done <"$input"
}

runIntegrationTesting() {
  return
  if [[ "$d" == "app/" ]]; then
    flutter test integration_test --coverage
    appendTestCoverage
  fi
}

removeGeneratedFilesFromCoverage() {
  remove_from_coverage -f coverage/lcov.info -r '.g.dart$'
  remove_from_coverage -f coverage/lcov.info -r '.freezed.dart$'
  remove_from_coverage -f coverage/lcov.info -r '.gen.dart$'
  remove_from_coverage -f coverage/lcov.info -r '.config.dart$'
}

for d in */; do # Check if the directory name is in the exclusion list
  if [[ " ${excluded[@]} " =~ " $d " ]]; then
    continue # Skip excluded folder
  fi
  cd "$d"
  echo "========================$d========================"
  flutter test --coverage
  appendTestCoverage
  cd ..
done
cd "$appPath"
removeGeneratedFilesFromCoverage
genhtml coverage/lcov.info -o coverage/html
