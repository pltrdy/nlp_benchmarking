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
 |   70/50          |        x        |   x       |     x      |
 |   900/55         |        120554   |  166559   |    41.9    |
 |   1000/80        |    191508       |   95605   |    66.7    |
 
## Prerequisites
* define variable `SUMMARY_STORIES_DATA` to be the path of the data.
* install rouge:
  * `sudo pip3 install rouge`
  * https://github.com/pltrdy/rouge
  
  
## Results  

**Hardware:** Nvidia GTX 1080 (driver 367.57)

|                | SeqLen (src/tgt) | VocSize (src/tgt) | Batchsize | gpu mem | Tokens/s | #epoch |ppl| time | rouge |
|----------------|------------------|-------------------|-----------|---------|----------|--------|-----------|------|-------|
|onmt-3x800      |  700/50          |                   |  16       | 6080MiB | ~5000    |   13   |           |      |29,6-10,6-17,3|
|                |                  |                   |           |         |          |        |           |      |       |
|                |                  |                   |           |         |          |        |           |      |       |
|                |                  |                   |           |         |          |        |           |      |       |
|                |                  |                   |           |         |          |        |           |      |       |

* Reported `ppl` is (`training_ppl`, `valid_ppl`)
* Reported Rouge score is averaged F1-Score (Rouge-1, Rouge-2, Rouge-L).
```json
{
  "rouge-2": {
    "r": 0.08069615326456137,
    "p": 0.17524637812111596,
    "f": 0.10627980055038705
  },
  "rouge-1": {
    "r": 0.22744773509249291,
    "p": 0.4688193179620851,
    "f": 0.2968544370146252
  },
  "rouge-l": {
    "r": 0.16368141410726164,
    "p": 0.2767669028596474,
    "f": 0.1736930446405533
  }
}

```


