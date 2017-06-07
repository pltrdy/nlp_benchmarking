# About pltrdy's TF RNN LM
* src: https://github.com/Ubiqus/tf_rnnlm

## PTB 

* **Training with `--num_steps=35`**:   

| batch_size | num_steps | state | ppl   | time (sec) |
|------------|-----------|-------|-------|------------|
| 20         | 20        | y     | 114.8 | 3.58       |
| 1          | 20        | y     |**114.5**| 38.0       |
| 20         | 20        | n     | 138.0 |**3.36**      |
| 1          | 20        | n     | 136.6 | 38.1       |
|            |           |       |       |            |
| 20         | 0         | y     | 192.1 | 3.7        |
| 1          | 0         | y     | 191.4 | 42.9       |
| 20         | 0         | n     | 159.2 | 3.7        |
| 1          | 0         | n     | 158.2 | 36.8       |

* **Training with `--num_steps=0`**:   

| batch_size | num_steps | state | ppl   | time (sec) |
|------------|-----------|-------|-------|------------|
| 20         | 20        | y     | 167.0 | 3.52       |
| 1          | 20        | y     | 166.8 | 38.9       |
| 20         | 20        | n     | 173.6 | 3.37       |
| 1          | 20        | n     | 171.7 | 37.3       |
|            |           |       |       |            |
| 20         | 0         | y     | 121.19| 3.53       |
| 1          | 0         | y     | 121.21| 42.5       |
| 20         | 0         | n     | 121.18| 3.6        |
| 1          | 0         | n     | 121.2 | 40.7       |

* training speed only depend on `batch_size`
* ofc testing with the same `num_steps` better.
* ignoring states highly increase ppl in static, but have no effect in dynamic
*  `batch_size` does not have much effect on perplexity

## Tedlium 
### Configs
* `num_hidden`:
  * dynamic, static: 665
  * static (1024): 1024
* num_layers: 2,
  "max_max_epoch": 7,
  "max_epoch": 2,
  "learning_rate": 1.0,
  "epoch": 8,
  "num_samples": 1024,
  "hidden_size": 1024,
  "vocab_size": 152212,
  "lr_decay": 0.8,
  "max_grad_norm": 5,
  "init_scale": 0.05,
  "keep_prob": 1.0 

  
* **Training with `--num_steps=35`**:   

| batch_size | num_steps | state | ppl dynamic| ppl static   | ppl static (1024) |
|------------|-----------|-------|------------|--------------|-------------------|
| 20         | 20        | y     | 106.2      | 104.1        | 104.2             |
| 1          | 20        | y     | 118.2      |**90.0**      | **86.6**          |
| 20         | 20        | n     | 118.3      | 117.0        | 117.6             |
| 1          | 20        | n     | 117.6      | 116.0        | 116.5             |
|            |           |       |            |              | 127.3             |
| 20         | 0         | y     |**100.9**   | 122.7        | 127.3             |
| 1          | 0         | y     | 103.1      | 114.0        | 127.5             |
| 20         | 0         | n     |**100.5**   | 119.2        | 123.0             |
| 1          | 0         | n     | 101.7      | 116.6        | 119.6             |

