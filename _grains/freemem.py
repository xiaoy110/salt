#coding=utf-8

def freemem():
	'''get meminfo'''
	with open('/proc/meminfo') as fd:
		data_list = fd.read().split('\n')
		MemFree_line = data_list[1]
		Buffers_line = data_list[3]
		Cache_line = data_list[4]
		Freemem_k = int(MemFree_line.split()[1]) + int(Buffers_line.split()[1]) + int(Cache_line.split()[1])
		Freemem_G = float(Freemem_k) / 1000 / 1000
		Freemem_G2 = '%.2f' % Freemem_G
		freemem = Freemem_G2 + 'G'
		return {'freemem':freemem}
