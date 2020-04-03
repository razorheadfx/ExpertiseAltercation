#!/bin/sh

if [ "$1" = "--convert" ]; then
    filename=$2
    segment_len=$3
    echo "Converting and segmenting input/$filename into $segment_len second chunks"
    ffmpeg -i /input/$filename -f segment -segment_time $segment_len -ar 16000 -ac 1 /input/$filename_%04d.wav
else
    echo "Only processing existing .wav files in /input"
fi 

for filename in $(ls /input/*.wav); do
        echo "Processing $filename"
        deepspeech --model /output_graph.pbmm --lm /lm.binary --trie /trie --audio $filename > /output/$(basename $filename).txt
done

