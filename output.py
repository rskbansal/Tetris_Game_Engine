import sys
sys.path.append('../')
from game_engine.engine import *

#PRIMITIVE:
height = 5
width = 10
Somename = 10
Someothername = 1
difficulty = 1
fg_color = 1
bg_color = 5
speed_increase_factor = 1
speed_decrease_factor = 1
difficulty = 1
direction = 1
shadow = 0
next = 0

#FUNCTIONS:
def Func2():
    Someothername = Someothername + Somename

def run():
    Somename = tetris_engine.move_piece(direction = 1)

def Func3():
    while 3 + 5 :
        while 3 + 5 :
            Someothername = 5


#ENGINE:
if __name__ == '__main__':
	tetris_engine = TetrisEngine(height = Somename, width = width)


