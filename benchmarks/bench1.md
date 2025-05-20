sudo apt install nvidia-cuda
sudo apt install nvidia-jetpack
sudo apt install libnvinfer-plugin8 libnvinfer8 libnvparsers8 libnvonnxparsers8


use:	/usr/src/tensorrt/bin/trtexec

with some demo onnx?
	dpkg -S /usr/src/tensorrt/data/resnet50/ResNet50.onnx
	libnvinfer-samples: /usr/src/tensorrt/data/resnet50/ResNet50.onnx

/usr/src/tensorrt/bin/trtexec  --onnx=/usr/src/tensorrt/data/resnet50/ResNet50.onnx --fp16  --noDataTransfers --iterations=200



#result with

[05/13/2025-10:36:46] [I] === Performance summary ===
[05/13/2025-10:36:46] [I] Throughput: 318.007 qps
[05/13/2025-10:36:46] [I] Latency: min = 3.12671 ms, max = 3.15479 ms, mean = 3.14068 ms, median = 3.14062 ms, percentile(90%) = 3.14587 ms, percentile(95%) = 3.14771 ms, percentile(99%) = 3.15039 ms
[05/13/2025-10:36:46] [I] Enqueue Time: min = 0.844238 ms, max = 2.05505 ms, mean = 0.887139 ms, median = 0.872437 ms, percentile(90%) = 0.932861 ms, percentile(95%) = 0.953735 ms, percentile(99%) = 1.0658 ms
[05/13/2025-10:36:46] [I] H2D Latency: min = 0 ms, max = 0 ms, mean = 0 ms, median = 0 ms, percentile(90%) = 0 ms, percentile(95%) = 0 ms, percentile(99%) = 0 ms
[05/13/2025-10:36:46] [I] GPU Compute Time: min = 3.12671 ms, max = 3.15479 ms, mean = 3.14068 ms, median = 3.14062 ms, percentile(90%) = 3.14587 ms, percentile(95%) = 3.14771 ms, percentile(99%) = 3.15039 ms
[05/13/2025-10:36:46] [I] D2H Latency: min = 0 ms, max = 0 ms, mean = 0 ms, median = 0 ms, percentile(90%) = 0 ms, percentile(95%) = 0 ms, percentile(99%) = 0 ms
[05/13/2025-10:36:46] [I] Total Host Walltime: 3.00622 s
[05/13/2025-10:36:46] [I] Total GPU Compute Time: 3.00249 s
[05/13/2025-10:36:46] [I] Explanations of the performance metrics are printed in the verbose logs.
[05/13/2025-10:36:46] [I] 
&&&& PASSED TensorRT.trtexec [TensorRT v100300] # /usr/src/tensorrt/bin/trtexec --onnx=/usr/src/tensorrt/data/resnet50/ResNet50.onnx --fp16 --noDataTransfers --iterations=2


