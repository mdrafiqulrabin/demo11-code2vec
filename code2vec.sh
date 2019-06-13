#!/bin/bash
#SBATCH -J code2vec
#SBATCH -o code2vec.txt
#SBATCH -t 24:01:01
#SBATCH --mem=10000
#SBATCH -N 1 -n 1
#SBATCH -p gpu
#SBATCH --gres=gpu:1
#SBATCH -A alipour

cd /project/alipour/rabin/TNP/fork-code2vec/

module load CMake/3.12.2
module load python/3.6
module load GCC/7.2.0-2.29
module load CUDA/10.0.130

python3 code2vec.py --load ./models/java14_model/saved_model_iter8.release --test data/java14m/java14m.test.c2v

