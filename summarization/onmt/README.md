# Summarization using Pyramidal Deep Bidirectionnal RNN
*Using Pyramidal Deep Bidirectionnal RNN (aka.  pdbrnn) from [OpenNMT#136](https://github.com/OpenNMT/OpenNMT/pull/136) for long sequence summarization.* 

Related Paper: [[pdf]](http://arxiv.org/pdf/1508.01211.pdf)

## Dataset
*dataset: all stories, from onmt discussions*

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
see [run.sh](run.sh)

## Results
* **0) Vocab (100k/60k); batchsize: 64:**   
OOM
* **1) Seq (900/55); Vocab (100k/60k); batchsize: 32:**   
  * RAM: 7981MiB/8108MiB (too much to run with 2 GPUs considering overhead)
  * around 10/12k token/s
     * **[15:49:50]** - Start training: 
     * **[17:33:27]** - Ep.1: tr: 706.55; val: 433.79
     
* **2) Seq (1000/80); Vocab (150k/80k); batchsize: 32:**   
  * OOM

## RAW
```
02/21/17 19:15:02 INFO] ... 100000 sentences prepared	
[02/21/17 19:15:53 INFO] ... 200000 sentences prepared	
[02/21/17 19:16:39 INFO] ... shuffling sentences	
[02/21/17 19:16:40 INFO] ... sorting sentences by size	
[02/21/17 19:16:41 INFO] Prepared 287113 sentences (0 ignored due to source length > 1000000 or target length > 8000[02/21/17 19:16:41 INFO] 	
[02/21/17 19:16:41 INFO] Preparing validation data...	
[02/21/17 19:16:48 INFO] ... shuffling sentences	
[02/21/17 19:16:48 INFO] ... sorting sentences by size	
[02/21/17 19:16:48 INFO] Prepared 13368 sentences (0 ignored due to source length > 1000000 or target length > 80000)	
[02/21/17 19:16:48 INFO] 	
[02/21/17 19:16:48 INFO] Saving source vocabulary to 'summ_pdbrnn_full.src.dict'...	
[02/21/17 19:16:48 INFO] Saving target vocabulary to 'summ_pdbrnn_full.tgt.dict'...	
[02/21/17 19:16:48 INFO] Saving data to 'summ_pdbrnn_full-train.t7'...	
[02/21/17 19:17:02 INFO] Using GPU(s): 2	
[02/21/17 19:17:02 INFO] Training Sequence to Sequence with Attention model	
[02/21/17 19:17:02 INFO] Loading data from 'summ_pdbrnn_full-train.t7'...	
[02/21/17 19:17:11 INFO]  * vocabulary size: source = 100003; target = 60003	
[02/21/17 19:17:11 INFO]  * additional features: source = 0; target = 0	
[02/21/17 19:17:11 INFO]  * maximum sequence length: source = 2918; target = 2104	
[02/21/17 19:17:11 INFO]  * number of training sentences: 287113	
[02/21/17 19:17:11 INFO]  * maximum batch size: 1	
[02/21/17 19:17:11 INFO] Building model...	
[02/21/17 19:17:16 INFO]  * using input feeding	
[02/21/17 19:17:18 INFO] Initializing parameters...	
[02/21/17 19:17:20 INFO]  * number of parameters: 123838503	
[02/21/17 19:17:20 INFO] Preparing memory optimization...	
[02/21/17 19:17:21 INFO]  * sharing 69% of output/gradInput tensors memory between clones	
[02/21/17 19:17:21 INFO] Start training...	
[02/21/17 19:17:21 INFO] 	
/home/moses/torch-20170129/install/bin/luajit: not enough memory
```

## Discussions
