#!/bin/bash

# Step 1: Compile the Java files
javac -source 1.8 -target 1.8 Pair.java RegularExpressions.java Scan.java Scanner.java Token.java TokenNames.java

# Check if the compilation was successful
if [ $? -ne 0 ]; then
  echo "Compilation failed."
  exit 1
fi

# Step 2: Run the Scanner class with each file in the test folder

# Path to the test folder
TEST_FOLDER="./test"

# Loop through each file in the test folder
for inputFile in "$TEST_FOLDER"/*; do
  if [ -f "$inputFile" ]; then
    echo "Running Scanner with input file: $inputFile"
    java Scanner "$inputFile"
  fi
done

echo "All tests completed."
