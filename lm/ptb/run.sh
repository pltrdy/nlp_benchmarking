#!/bin/bash

# You must somehow define those variables as two ABSOLUTE paths.
# * RNNLM_pltrdy_path
# * RNNLM_adaptsoft_path



pltrdy_path="$RNNLM_pltrdy_path"
adaptsoft_path="$RNNLM_adaptsoft_path"

data_path="$PTB_DATA"

cur_dir="$(pwd)"
log_path="$cur_dir/ptb_benchmark"
mkdir -p "$log_path"

wrapper(){
  cmd="$1"
  out="$2"
  
  run=" { time unbuffer $cmd ; } 2>&1 | tee $log_path/$out "
  echo "$run"
}

run_pltrdy(){
  name="$1"
  args="$2" 
  cmd="python word_lm.py --action train --data_path $data_path --model_dir $name $args --loss sampledsoftmax --log_rate 10"

  filename="pltrdy.$name.out"
  echo $(wrapper "$cmd" "$filename")
}

run_adaptsamp(){
  name="$1"
  args="$2"
  cmd="th train_big_lstm.lua -data $data_path -usecudnn $args"

  filename="adaptsamp.$name.out"
  echo $(wrapper "$cmd" "$filename")
}




as_conf_asptb=" -nhid 512 -isz 512 -dropout 0.5 -cutoff 2000"
as_conf_sm=" -nlayer 2 -nhid 200 -cutoff 2000"
as_conf_lg=" -nlayer 2 -nhid 1500 -bptt 35 -dropout 0.65 -maxepoch 20 -cutoff 2000"
as_conf_truelg=" -nlayer 2 -nhid 1500 -bptt 35 -dropout 0.65 -maxepoch 20 -cutoff 2000 -isz 1500"
cd $adaptsoft_path
#eval $(run_adaptsamp "asptb" "$as_conf_asptb")
#eval $(run_adaptsamp "small" "$as_conf_sm")
#eval $(run_adaptsamp "large" "$as_conf_lg")
eval $(run_adaptsamp "true_large" "$as_conf_truelg")


cd $pltrdy_path
#eval $(run_pltrdy "small" "--config small")
#eval $(run_pltrdy "large" "--config large")
#eval $(run_pltrdy "asptb" "--config small --num_layers 1 --hidden_size 512 --keep_prob 0.5 --batch_size 64")

cd $cur_dir
