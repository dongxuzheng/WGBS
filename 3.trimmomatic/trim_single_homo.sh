#!/bin/bash
## 脚本用来处理上级目录中rawdata文件中人类单末端测序数据
## 使用软件为trimmomatic，对原始数据进行过滤与剪切adapter


for i in /opt/pipline/zhengdongxu/rawdata/homo/single_seq/*.fastq
do
	echo ${i}
	j=$(basename ${i} .fastq)
	java -jar /home/zhengdongxu/anaconda3/share/trimmomatic/trimmomatic.jar SE -phred33 ${i} ./${j}_clean.fastq ILLUMINACLIP:/home/zhengdongxu/anaconda3/share/trimmomatic/adapters/TruSeq3-SE.fa:2:30:10 SLIDINGWINDOW:4:15 LEADING:3 TRAILING:3 MINLEN:36

done


