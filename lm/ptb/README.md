# Penn Treen Bank (PTB) Benchmark

## Tools
* [pltrdy's RNN LM](https://github.com/pltrdy/tf_rnnlm), based on [TensorFlow's RNN LM Tutorial](https://www.tensorflow.org/versions/r0.11/tutorials/recurrent/) (paper: [(Zaremba et al., 2014)][1])
* [Facebook Research's Adaptive Softmax LM][2], paper: [(Grave et al., 2016)](http://arxiv.org/abs/1609.04309)
* (planned) *[Yandex's FasterRNNLM](https://github.com/yandex/faster-rnnlm)*

## Configurations
* **sm/lg** configuration refers to tf_rnnlm small/large config (see: https://github.com/pltrdy/tf_rnnlm/blob/master/config.py)
* **as-ptb** is as mentionned by Facebook research to train their model on PTB (see: [adaptive softmax page][2]

| Configuration | n_layers | n_hidden | bptt | dropout |
|---------------|----------|----------|------|---------|
| small         |    2     | 200      | 35   |  0.0    |
| large         |    2     | 1500     | 35   |  0.65   |
| as-ptb        |    1     | 512      | 20   |  0.5    |


## Results
[[go to execution script](run_ptb_benchmark.sh)]

|         Model         | train ppl | valid ppl | test ppl | epoch | time |
|-----------------------|-----------|-----------|----------|-------|------|
| adapsoft - as-ptb     |  62       |  97.8     |  92.9    | 10    | 3m38 |
| ada - sm              |  49       |  129.9    |  123.2   | 10    | 3m14 |   
| ada - lg              |  69.9     |  106.4    |  102.6   | 10    | 33m  |   
| pltrdy - sm           |  21.67    |  118.63   |  114.71  | 13    | 9m48 |   
| pltrdy - lg           |  20.08    |  83.013   |  78.40   | 55    | 253m |   
| pltrdy - as-ptb       |  41.26    |  96.7     |  93.40   | 13    | 17m20|   



[1]: http://arxiv.org/abs/1409.2329
[2]: https://github.com/facebookresearch/adaptive-softmax
