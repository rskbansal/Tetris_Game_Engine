# Game Engine for Tetris
This project is a part of the course CS F363 - Compiler Construction at BITS Pilani, Goa Campus. The project is a game engine for Tetris, a tile-matching puzzle game. The game engine is implemented in C & Python and uses the **Tkinter** library for rendering graphics and handling user input.

## Installation & Running
- Install all the Python dependencies using `pip`
    ```bash
    pip install -r requirements.txt
    ```

- For removing previously generated file
    ```bash
    make clean
    ```

- `make build` builds the essential files needed for execution

- You can mention your test cases inside [testinput.tetris](./testinput.tetris) file. For running the test cases, use the following command
    ```bash
    make tests
    ```

- `python3 game.py` to start playing the game

## Specifications of the engine
- Initial rotation limit is 18. After that the game is over.
- Initial height and 
- The player can define the height and width of the game console from the file testinput.tetris.
- 

## Added features
- ### Increase difficulty :
    - Rotation Limit - decreases rotation limit to 0.6 of earlier
    - Increase Speed - by decreasing the 

When the player increases the difficulty from the drop-down menu of the game. It does the above mentioned two changes.

- ### Colour changes
- 