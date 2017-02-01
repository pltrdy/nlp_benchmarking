# Tedlium Benchmark

## Tools
* [pltrdy's RNN LM](https://github.com/pltrdy/tf_rnnlm), based on [TensorFlow's RNN LM Tutorial](https://www.ten    sorflow.org/versions/r0.11/tutorials/recurrent/) (paper: [(Zaremba et al., 2014)][1])
* [Facebook Research's Adaptive Softmax LM][2], paper: [(Grave et al., 2016)](http://arxiv.org/abs/1609.04309)
* (planned) *[Yandex's FasterRNNLM](https://github.com/yandex/faster-rnnlm)*

## Configuration

|  config     | batch_size |  bptt  | `nlayers`x`hidden_size`  |
|------------ |------------|--------|--------------------------|
|  SM         |    64      |   35   |   2x200                  |
|  MD         |    64      |   35   |   2x650                  |
|  MD/LG      |    64      |   35   |   2x1024                 |


## Results

* 2 fev, 2017 - Vincent

|   model    |  kWPS |
|------------|-------|
| TF SM      | 100   |  
| TF MD      | 30    |  
| TF MD/LG   | 22    |  
| AS SM      | 48    |  
| AS MD      | 32    |  
| AS MD/LG   | 11    |  
