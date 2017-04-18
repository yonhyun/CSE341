import subprocess
import os
import sys
import csv



os.system('./a.out %s>result.csv')
arg='/home/unmdue/yonghyun/cse341/pro2/result.csv'

def config(args='/home/unmdue/yonghyun/cse341/pro2/result.csv'):
	input_data=[[]]
	with open(args,'r') as f:
		f=csv.reader(f,delimiter=',')
		for line in f:
			vec=[i for i in line]
			input_data.append(vec)
	for x in input_data:
		print(','.join(x))

	

config(arg)
