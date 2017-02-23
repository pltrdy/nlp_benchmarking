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
 

## Configuration
*click to see full output*

|                | SeqLen (src/tgt) | VocSize (src/tgt) | Batchsize | gpu mem | Tokens/s | #epoch |ppl(tr/val)| time |
|----------------|------------------|-------------------|-----------|---------|----------|--------|-----------|------|
|[onmt-pdbrnn][0]|     900/55       |    100k/60k       |   32      | 7982MiB | ~12k     |   13   |52.1/63.5  | 23h45|
|onmt-pdbrnn     |     900/55       |    100k/60k       |   16      | 3822MiBMiB | ---k     |  ---   | ---       | ---  |
|[onmt][2]       |     900/55       |    100k/60k       |   16      | 7234MiB | ~9k      |  13    |7.23/18.8  | 29h28|
|*pyonmt*        |     900/55       |    100k/60k       |   16      | 4660MiB |  1.2k    |  4   |*67.4/41.4*  | ---  |

*model*: still running

Full outputs:
* [onmt-pdbrnn b]
* [onmt

* We tried to used full dataset (no seqlen constraint) which leads to: seqlen  src: 2918; tgt: 2104
  * voc: 100k/60k, bs: 1 => OOM
 * 900/55; 100k/60k; 32 without -pdbrnn => OOM  

[0]: p_b32_v100-60_s900-55
[2]: b16_v100-60_s900-55
