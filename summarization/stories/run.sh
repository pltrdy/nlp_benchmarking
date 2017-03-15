#!/bin/bash
#
# Copyright 2017 Ubiqus   (Author: pltrdy)
#		 
# License MIT
#


# TODO test is GPU is present or not
decode_cpu=false

data_path="./data"
tr_src="$data_path/all_stories_all_highlights-src-train.txt"
tr_tgt="$data_path/all_stories_all_highlights-targ-train.txt"
val_src="$data_path/all_stories_all_highlights-src-val.txt"
val_tgt="$data_path/all_stories_all_highlights-targ-val.txt"
tst_src="$data_path/all_stories_all_highlights-src-test.txt"
tst_tgt="$data_path/all_stories_all_highlights-targ-test.txt"

# Copy data and remve eos tag </s>
gpuid=2

rm_eos() {
  fname="$1"
  sed -i 's/<\/s>/ /g' $fname
}
if [ ! -e data ]; then
  echo "$0: Copying data, removing </s> tags..."
  mkdir -p data
  cp $SUMMARY_STORIES_DATA/* ./data
  cd ./data/

  for f in *.txt 
  do
    echo "$0: -- $f"
    rm_eos $f
  done
  cd ..
fi

# Make symlinks to access OpenNMT scripts - change this line if needed
OPENNMT_PATH=../../../torchwork/OpenNMT/
[ ! -h tools ] && ln -s $OPENNMT_PATH/tools tools
[ ! -h preprocess.lua ] && ln -s $OPENNMT_PATH/preprocess.lua preprocess.lua
[ ! -h train.lua ] && ln -s $OPENNMT_PATH/train.lua train.lua
[ ! -h translate.lua ] && ln -s $OPENNMT_PATH/translate.lua translate.lua
[ ! -h onmt ] && ln -s $OPENNMT_PATH/onmt onmt

# this is usefull to skip some stages during step by step execution
param=$1
default=0
stage=${param:=$default}

# if you want to run without training and use an existing model in the "exp" folder set notrain to true
notrain=false

# making these variables to make replication easier for other languages
sl=fr
tl=en

# Data download and preparation

if [ $stage -le 0 ]; then
  if [ ! -f learn_bpe.py ]; then
    wget https://raw.githubusercontent.com/rsennrich/subword-nmt/master/learn_bpe.py
  fi
fi

exp="exp"
mkdir -p "$exp"

# Preprocess the data - decide here the vocabulary size 50000 default value
if [ $stage -le 2 ]; then
  echo "$0: preprocessing corpus"
    th preprocess.lua -src_seq_length 700 -tgt_seq_length 50\
      -train_src "${tr_src}" -train_tgt "${tr_tgt}" \
      -valid_src "${val_src}" -valid_tgt "${val_tgt}" \
      -save_data exp/data
fi

if [ $stage -le 3 ]; then
  echo "$0: training"
  th train.lua -data exp/data-train.t7 -save_model summ_model -gpuid $gpuid -max_batch_size 16 -layers 3 -rnn_size 800
fi

if [ $stage -le 4 ]; then
  echo "$0: translation"
  #th translate.lua -model summ_model_epoch13_54.59.t7 -src ./data/all_stories_all_highlights-src-test.txt.tok -gpuid 2 -batch_size 8
fi
