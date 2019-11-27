#!/bin/bash
jdata="$1" # java-mid
wget https://s3.amazonaws.com/code2vec/data/"$jdata"_data.tar.gz
tar -xvzf "$jdata"_data.tar.gz

