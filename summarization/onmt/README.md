# Summarization using Pyramidal Deep Bidirectionnal RNN
*Pyramidal Deep Bidirectionnal RNN (aka.  pdbrnn) from [OpenNMT#136](https://github.com/OpenNMT/OpenNMT/pull/136) for long sequence summarization.* 

Related Paper: [[pdf]](http://arxiv.org/pdf/1508.01211.pdf)

## Dataset
*dataset: all stories, from onmt discussions*

* Overview 

 |  set  |   #words  | #lines  | avg w/l | vocab_size |
 |-------|-----------|---------|---------|------------|
 | tr-src|235 512 661|287 113  |  820    |   339472   |
 | tr-tgt|15 961 30  |287 113  |  55     |   108991   |


* Sequence Length (max seq len: source = 2918; target = 2104) 

 | SeqLen (src/tgt) |    Sentences    | Ignored   |  % select  |
 |------------------|-----------------|-----------|------------|
 |   900/55         |        120554   |  166559   |    41.9    |
 |   1000/80        |    191508       |   95605   |    66.7    |
 

## Results
*click on configuration name to see full output and on perplexities to see prediction on test set*

**Hardware:** Nvidia GTX 1080 (driver 367.57)

|                | SeqLen (src/tgt) | VocSize (src/tgt) | Batchsize | gpu mem | Tokens/s | #epoch |ppl(tr/val)| time |
|----------------|------------------|-------------------|-----------|---------|----------|--------|-----------|------|
|[onmt-pdbrnn][0]|     900/55       |    100k/60k       |   32      | 7982MiB | ~12k     |   13   |52.1/63.5  | 23h45|
|onmt-pdbrnn     |     900/55       |    100k/60k       |   16      | 3822MiB | ---k     |  ---   | ---       | ---  |
|[onmt][2]       |     900/55       |    100k/60k       |   16      | 7234MiB | ~9k      |  13    |[7.23/18.8][4]  | 29h28|
|[pyonmt][3]     |     900/55       |    100k/60k       |   16      | 4660MiB |  16k     |  13    |14.4/20.2  | 16h18  |



[0]: p_b32_v100-60_s900-55
[2]: b16_v100-60_s900-55
[3]: pu_b16_v100-60_s900-55
[4]: pred_b16_v100-60_s900-55.txt
