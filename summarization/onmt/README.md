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


* Sequence Length (max seq len: source = 2918; target = 2104) 

 | SeqLen (src/tgt) |    Sentences    | Ignored   |  % select  |
 |------------------|-----------------|-----------|------------|
 |   900/55         |        120554   |  166559   |    41.9    |
 |   1000/80        |    191508       |   95605   |    66.7    |
 

## Configuration

| SeqLen (src/tgt) | VocSize (src/tgt) | Batchsize |`-pdbrn`| gpu mem | Tokens/s | #epoch | ppl | time |
|------------------|-------------------|-----------|--------|---------|----------|--------|-----|------|
|     900/55       |    100k/60k       |   32      |    y   | 7982MiB | ~12k     |        |     |      |
|     900/55       |    100k/60k       |   16      |    y   | ----MiB | ---k     |  ---   | --- | ---  |
|     900/55       |    100k/60k       |   16      |    n   | 7234MiB | ~9k      |        |     |      |
|                  |                   |           |        |         |          |        |     |      |


* We tried to used full dataset (no seqlen constraint) which leads to: seqlen  src: 2918; tgt: 2104
  * voc: 100k/60k, bs: 1 => OOM
 * 900/55; 100k/60k; 32 without -pdbrnn => OOM  


