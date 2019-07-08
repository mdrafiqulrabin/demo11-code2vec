#!/bin/bash
#SBATCH -J code2vec_java_all
#SBATCH -o code2vec_java_all.txt
#SBATCH -t 01:01:01
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

if [ "$#" -ne 1 ] || [ ! -d "$1" ]; then
	echo 'Usage: sbatch script.sh "/path/to/data"'
	echo 'Example: sbatch code2vec_all.sh "data_java/demo11"'
	return 1
fi

m_dir=$1
m_model="./models/java14_model/saved_model_iter8.release"

for f in `ls ${m_dir}`
do
	echo; echo "Start: ${m_dir}/${f}";
	rm -rf log.txt
	test_dir="${m_dir}/${f}/dataset/dataset.test.c2v"
	python3 code2vec.py --load ${m_model} --test ${test_dir}
	mv log.txt "${m_dir}/${f}/dataset/"
	echo "End: ${m_dir}/${f}"; echo
done
