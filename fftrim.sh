#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 5 ]; then
  echo "Usage: $0 <input_file> <start_time> to <end_time> <output_file>"
  exit 1
fi

# Parse arguments
INPUT_FILE=$1
START_TIME=$2
TO_KEYWORD=$3
END_TIME=$4
OUTPUT_FILE=$5

# Ensure 'to' keyword is used
if [ "$TO_KEYWORD" != "to" ]; then
  echo "Error: Expected 'to' keyword between start_time and end_time."
  echo "Usage: $0 <input_file> <start_time> to <end_time> <output_file>"
  exit 1
fi

# Perform the trimming using ffmpeg
ffmpeg -i "$INPUT_FILE" -ss "$START_TIME" -to "$END_TIME" -c copy "$OUTPUT_FILE"

# Check if ffmpeg succeeded
if [ $? -eq 0 ]; then
  echo "Trimmed video saved to $OUTPUT_FILE"
else
  echo "An error occurred during the trimming process."
  exit 1
fi
