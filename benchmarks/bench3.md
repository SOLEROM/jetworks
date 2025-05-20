git clone https://github.com/NVIDIA-AI-IOT/jetson_benchmarks
cd jetson_benchmarks
sudo sh install_requirements.sh
python3 utils/download_models.py --all \
       --csv_file_path benchmark_csv/tx2-nano-benchmarks.csv \
       --save_dir ./models

 sudo python3 benchmark.py --all \
      --csv_file_path benchmark_csv/tx2-nano-benchmarks.csv \
      --model_dir ./models \
      --jetson_devkit nano \
      --power_mode 0 --precision fp16 \
      --jetson_clocks



