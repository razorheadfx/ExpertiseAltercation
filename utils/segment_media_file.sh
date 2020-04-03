#!/bin/sh
# cut the input file into chunks chunks (default 30s) of mono at 16000Hz
segment_len="${2:-30}"

ffmpeg -i $1 -f segment -segment_time $segment_len -ar 16000 -ac 1 input/chunk_%04d.wav