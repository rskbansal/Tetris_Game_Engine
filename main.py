import numpy as np
import board
graph16 = { 1:[2,6,5], 2:[3,7,6,5,1], 3:[4,8,7,6,2], 4:[8,7,3],
					5:[9,10,6,2,1], 6:[9,10,11,7,3,2,1,5], 7:[10,11,12,8,4,3,2,6],
					8:[12,11,4,3,7], 9:[13,14,10,6,5], 10:[13,14,15,11,7,6,5,9],
					11:[14,15,16,12,8,7,6,10], 12:[15,16,8,7,11],
					13:[14,10,9], 14:[15,11,10,9,13], 15:[16,12,11,10,14], 16:[12,11,15] }
matrix = {}
k = 0
for i in range(4):
	for j in range(4):
		k = k+1
		matrix.update({k:(i,j)})
extetromino_list = {}
first = 1
new_extetromino = [first]
for second in graph16[first]:
	try:
		if new_extetromino.index(second):
			continue
	except ValueError :
		new_extetromino.append(second)
		for third in graph16[second]:
			try:
				if new_extetromino.index(third):
					continue
			except ValueError :
				new_extetromino.append(third)
				for fourth in graph16[third]:
					try:
						if new_extetromino.index(fourth):
							continue
					except ValueError :
						new_extetromino.append(fourth)
						# print(new_extetromino)
						k = len(extetromino_list)+1
						extetromino_list.update({k:new_extetromino})
						new_extetromino = [first,second,third]
			new_extetromino = [first,second]
		new_extetromino = [first]
board = board.Board(4,4)
for i,extetromino in extetromino_list.items():
	coords = []
	for l in extetromino:
		coords.append(matrix[l])
	print(coords)
	temp = np.array([[False,False,False,False],[False,False,False,False],[False,False,False,False],[False,False,False,False]])
	for x,y in coords:
		temp[x][y] = True
	board.insertShape(temp,0,0)
	print(board)
	board.removeShape(temp,0,0)