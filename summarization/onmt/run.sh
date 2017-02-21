#!/bin/bash

##  
## 2017-02-201 - pltrdy 
## Summarization using Pyramidal Deep Bidirectionnal RNN
## aka. pdbrnn from https://github.com/OpenNMT/OpenNMT/pull/136
## Data comes for @srush
##      

DATA_ROOT="$SUMMARY_STORIES_DATA"
TR_SRC="${DATA_ROOT}all_stories_all_highlights-src-train.txt"
TR_TGT="${DATA_ROOT}all_stories_all_highlights-targ-train.txt"

VAL_SRC="${DATA_ROOT}all_stories_all_highlights-src-val.txt"
VAL_TGT="${DATA_ROOT}all_stories_all_highlights-targ-val.txt"

SRC_VOC_SIZE=100000
TGT_VOC_SIZE=60000

#avg: 820, 55
SRC_SEQ_LEN=900
TGT_SEQ_LEN=55


param=$1
default=0
step=${param:=$default}
echo $a

if [ $step -eq 0 ]; then
  th preprocess.lua -save_data summ_pdbrnn \
                  -train_src "$TR_SRC" \
                  -train_tgt "$TR_TGT" \
                  -valid_src "$VAL_SRC"\
                  -valid_tgt "$VAL_TGT"\
                  -src_vocab_size "$SRC_VOC_SIZE" \
                  -tgt_vocab_size "$TGT_VOC_SIZE" \
                  -src_seq_length "$SRC_SEQ_LEN" \
                  -tgt_seq_length "$TGT_SEQ_LEN"
fi

if [ $step -le 1 ]; then
  th train.lua -data summ_pdbrnn-train.t7 -save_model summ_pdbrnn_model -gpuid 1 -max_batch_size 32 -pdbrnn
fi

if [ $step -le 2 ]; then
  #translate.lua -model textsum_final.t7 -src ../data/Giga/inputs.txt
  echo "no translate"
fi

#th translate.lua -model textsum_final.t7 -src ../data/Giga/inputs.txt
