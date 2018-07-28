#!/bin/bash
WORK_SPACE="$(pwd)/WORK_SPACE"
CHECKPOINT_PATH="${WORK_SPACE}/Model/train"

# Vocabulary file generated by the preprocessing script.
VOCAB_FILE="${WORK_SPACE}/TFRecords/word_counts.txt"

# JPEG image file to caption.
IMAGE_FILE="$1"

# Ignore GPU devices (only necessary if your GPU is currently memory
# constrained, for example, by running the training script).
export CUDA_VISIBLE_DEVICES=""

# Run inference to generate captions.
cd im2txt
bazel-bin/im2txt/run_inference \
  --checkpoint_path=${CHECKPOINT_PATH} \
  --vocab_file=${VOCAB_FILE} \
  --input_files=${IMAGE_FILE}
