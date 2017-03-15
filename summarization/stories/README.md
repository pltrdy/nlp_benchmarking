# Stories Summarization


## Dataset
*dataset: all stories, from onmt discussions*

* Overview 

 |  set  |   #words  | #lines  | avg w/l | vocab_size |
 |-------|-----------|---------|---------|------------|
 | tr-src|227 791 425|287 113  |  793    |   339472   |
 | tr-tgt|15 177 328 |287 113  |  52     |   108991   |


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
|onmt-3x800      |  700/50          |                   |  16       | 6080MiB | ~5000    |        |           |      |
|                |                  |                   |           |         |          |        |           |      |
|                |                  |                   |           |         |          |        |           |      |
|                |                  |                   |           |         |          |        |           |      |
|                |                  |                   |           |         |          |        |           |      |
|                |                  |                   |           |         |          |        |           |      |
|                |                  |                   |           |         |          |        |           |      |
|                |                  |                   |           |         |          |        |           |      |
|                |                  |                   |           |         |          |        |           |      |
|                |                  |                   |           |         |          |        |           |      |
|                |                  |                   |           |         |          |        |           |      |
|                |                  |                   |           |         |          |        |           |      |


