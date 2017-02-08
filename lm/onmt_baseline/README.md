# OpenNMT Baseline
* Dataset: We use [OpenNMT](http://opennmt.net) 1M English Baseline.

## Tools
* [pltrdy's RNN LM](https://github.com/pltrdy/tf_rnnlm), based on [TensorFlow's RNN LM Tutorial](https://www.tensorflow.org/versions/r0.11/tutorials/recurrent/) (paper: [(Zaremba et al., 2014)][1])
* [Facebook Research's Adaptive Softmax LM][2], paper: [(Grave et al., 2016)](http://arxiv.org/abs/1609.04309)

## Configurations
* **sm/lg** configuration refers to tf_rnnlm small/large config (see: https://github.com/pltrdy/tf_rnnlm/blob/master/config.py)
* **as-ptb** is as mentionned by Facebook research to train their model on PTB (see: [adaptive softmax page][2]

| Configuration | n_layers | n_hidden | bptt | dropout |
|---------------|----------|----------|------|---------|
| small         |    2     | 200      | 35   |  0.0    |
| large         |    2     | 1500     | 35   |  0.65   |
| as-ptb        |    1     | 512      | 20   |  0.5    |


## Results

|         Model         | train ppl | valid ppl | test ppl | epoch | time |
|-----------------------|-----------|-----------|----------|-------|------|
| adapsoft - as-ptb     |  51.4     |  56.3     |  54.2    | 10    | 354m |
| ada - sm              |  47.9     |  63.5     |  61.1    | 3     | 163m |   
| ada - lg              |  41.6     |  45.4     |  44.1    | 10    | 1300m|   
| pltrdy - as-ptb       |  19.53    |  53.15    |  51.88   | 13    | 134m |   
| pltrdy - sm           |  14.37    |  57.61    |  56.29   | 13    | 215m |   
| pltrdy - lg           |  16.38    |  44.86    |  44.14   | 35    | ~2500m * |   

( * ): Estimate

[1]: http://arxiv.org/abs/1409.2329
[2]: https://github.com/facebookresearch/adaptive-softmax
