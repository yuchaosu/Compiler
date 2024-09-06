#!/bin/bash

# Step 1: Compile the Java files
javac -source 1.8 -target 1.8 -d ./bin ./src/Pair.java ./src/RegularExpressions.java ./src/Scan.java ./src/Scanner.java ./src/Token.java ./src/TokenNames.java

# Check if the compilation was successful
if [ $? -ne 0 ]; then
  echo "Compilation failed."
  exit 1
fi

# Step 2: Run the Scanner class with each file in the test folder

# Path to the test folder
TEST_FOLDER="./test"

# Check if the test folder contains any files
if [ -z "$(ls -A "$TEST_FOLDER")" ]; then
  echo "No test files found in $TEST_FOLDER."
  exit 0
fi

# Loop through each file in the test folder
for inputFile in "$TEST_FOLDER"/*; do
  if [ -f "$inputFile" ]; then
    echo "Running Scanner with input file: $inputFile"
    java -cp ./bin Scanner "$inputFile"
  fi
done

echo "All tests completed."