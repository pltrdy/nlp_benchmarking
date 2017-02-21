# Summarization using Pyramidal Deep Bidirectionnal RNN
*Using Pyramidal Deep Bidirectionnal RNN (aka.  pdbrnn) from [OpenNMT#136](https://github.com/OpenNMT/OpenNMT/pull/136) for long sequence summarization.*

## Dataset
*the dataset is not mine, I can't share it publicly.*

* volume 

|  set  |  #words  | #lines  | avg w/l | vocab_size |
|-------|----------|---------|---------|------------|
| tr-src|235 512 661|287 113 |  820    |   339472   |
| tr-tgt|15 961 30 |287 113  |  55     |   108991   |


* Sequence Length: 

 | SeqLen (src/tgt) |    Sentences    | Ignored   |  % select  |
 |------------------|-----------------|-----------|------------|
 |   900/55         |        120554   |  166559   |    41.9    |
 |   1000/80        |    191508       |   95605   |    66.7    |
 

## Execution

## Results
* **0) Vocab (100k/60k); batchsize: 64:**   
OOM
* **1) Seq (900/55); Vocab (100k/60k); batchsize: 32:**   
  * RAM: 7981MiB
  * around 10/12k token/s
* **2) Seq (1000/80); Vocab (150k/80k); batchsize: 32:**   
  * OOM



## Discussions
