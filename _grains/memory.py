#coding=utf-8

def get_MemoryInfo():
	'''ÄÚ´æÐÅÏ¢'''
	with open('/proc/meminfo') as fd:
		data_list = fd.read().split('\n')
		MemTotal_line = data_list[0]
		Memory_K = MemTotal_line.split()[1]
		Memory_G = float(Memory_K) / 1000 / 1000
		Memory_G2 = '%.2f' % Memory_G
		memory = Memory_G2 + 'G'
		return {'Memory':memory}