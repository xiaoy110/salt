#coding=utf-8
from subprocess import PIPE,Popen
import re
def get_DiskInfo():
	'''”≤≈Ã–≈œ¢'''
	p = Popen(['fdisk','-l'],stdout=PIPE,stderr=PIPE)
	stdout,stderr = p.communicate()
	diskdata = stdout
	disk_initial_size = 0
	re_disk_type = re.compile(r'Disk /dev/[sd*]{1}.*:\s+[\d.\s\w]*,\s+([\d]+).*')
	disk_size_bytes = re_disk_type.findall(diskdata)
	for size in disk_size_bytes:
		disk_initial_size += int(size)
		disk_size_total_bytes = '%.2f' % (float(disk_initial_size)/1000/1000/1000)
		disk_size_total_G = disk_size_total_bytes + 'G'
		disk = disk_size_total_G
	return {'disk':disk}