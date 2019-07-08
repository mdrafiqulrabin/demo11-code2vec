#!/bin/bash

dir=$1 #i.e. data_java/demo11

if [ "$#" -ne 1 ] || [ ! -d "$1" ]; then
	echo 'Usage: source script.sh "/path/to/data/"'
	echo 'Example: source preprocess_all.sh "data_java/demo11"'
	return 1
fi

for f in `ls $dir`
do
	datapath=${dir}/${f}
	rm -rf ${datapath}"/dataset"
	source preprocess_java.sh $datapath
	echo "Done: $datapath"; echo
done

