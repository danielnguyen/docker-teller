#!/bin/bash

TELLER_IMAGE=danielnguyen/teller:latest

echo Teller Docker Image: $TELLER_IMAGE

# Get latest docker image + def
# docker pull $TELLER_IMAGE

# Process options
POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    -b|--bank)
      BANK="$2"
      shift # past argument
      shift # past value
      ;;
    -s|--statements_dir)
      STATEMENTS_DIR="$2"
      shift # past argument
      shift # past value
      ;;
    -o|--output_dir)
      CSV_OUTPUT_DIR="$2"
      shift # past argument
      shift # past value
      ;;
    # --default)
    #   DEFAULT=YES
    #   shift # past argument
    #   ;;
    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done

# execute
docker run -it --rm \
    --mount type=bind,source="$PWD/$STATEMENTS_DIR",target=/statements \
    --mount type=bind,source="$PWD/$CSV_OUTPUT_DIR",target=/output \
    -e TARGET_FI="$BANK" \
    $TELLER_IMAGE /scripts/run.sh -d /statements -o /output