#!/bin/bash

# Usage: ./wait_and_run.sh <pid|name> <next_program> [args...]

TARGET="$1"
shift
NEXT_PROGRAM=("$@")

SELF_PID=$$

# Function to check if a process with given PID is running
is_pid_running() {
  ps -p "$1" > /dev/null 2>&1
}

# Function to check if a process with given name is running
is_name_running() {
  pgrep -f "$1" | grep -v "$SELF_PID" | grep -v "grep" > /dev/null 2>&1
}

echo "Waiting for process '$TARGET' to finish..."

while true; do
  if [[ "$TARGET" =~ ^[0-9]+$ ]]; then
    is_pid_running "$TARGET" || break
  else
    is_name_running "$TARGET" || break
  fi
  sleep 100
done

echo "Process '$TARGET' has completed."
echo "Starting: $NEXT_PROGRAM"
#exec $NEXT_PROGRAM
