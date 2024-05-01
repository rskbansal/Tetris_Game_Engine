# Game Engine for Tetris
This project is a part of the course CS F363 - Compiler Construction at BITS Pilani, Goa Campus. The project is a game engine for Tetris, a tile-matching puzzle game. The game engine is implemented in C & Python and uses the **Tkinter** library for rendering graphics and handling user input.


## Features
- Initial rotation limit is **20**
- Initial height and width of the game window is **20*10**
- Default background colour is **light gray** & tile colour is **blue**
- Foreground colour can be changed according to the following mapping:
    - 1 -> Red
    - 2 -> Green
    - 3 -> Blue
    - 4 -> Yellow
- **Menu**
    - **New Game:** Starts the game
    - **Pause/Resume:** Pauses/Resumes the game
    - **Speed-Up/Slow-Down:** Change the spped of the game
    - **Increase difficulty:** Increases the difficulty of the game
    - **Save State:** Saves the current state of the game
    - **Exit:** Exits the game
    - **About:** Displays information about the game
- **Increase difficulty:**
    - Reduces rotation limit to half its previous value
    - Doubles the speed 

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

- You can mention your test cases inside [testinput.tetris](./testinput.tetris) file. For running the test cases, use the following command:
    ```bash
    make tests
    ```

- Type `python3 game.py` to start playing the game
