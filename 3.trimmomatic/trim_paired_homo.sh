#!/bin/bash
## 该脚本用来进行上级目录rawdata中人类双末端测序数据的过滤与剪切

for i in /opt/pipline/zhengdongxu/rawdata/homo/paired_seq/*_[1].fastq
do
	for j in /opt/pipline/zhengdongxu/rawdata/homo/paired_seq/*_[2].fastq
	do
		p=$(basename ${i} _1.fastq)
		q=$(basename ${j} _2.fastq)
		if [ $p = $q ];then
			java -jar /home/zhengdongxu/anaconda3/share/trimmomatic/trimmomatic.jar PE -phred33 ${i} ${j} ./${p}_1_paired.fastq ./${p}_1_unpaired.fastq ./${q}_2_paired.fastq ./${q}_2_unpaired.fastq ILLUMINACLIP:/home/zhengdongxu/anaconda3/share/trimmomatic/adapters/TruSeq3-PE.fa:2:30:10 SLIDINGWINDOW:4:15 LEADING:3 TRAILING:3 MINLEN:36
		fi
	done
done

