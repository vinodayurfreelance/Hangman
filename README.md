# Hangman (Ruby Edition)

A command-line Hangman game built in Ruby where you play against the computer. This project implements object serialization, allowing players to save their game progress and resume later. 

Built as part of **The Odin Project** curriculum.

## Features

*   **Dynamic Vocabulary:** Automatically downloads a 10,000-word dictionary (excluding profanity) if it isn't already present on your machine.
*   **Word Filtering:** Randomly selects a secret word between 5 and 12 characters long.
*   **Game State Tracking:** Displays remaining guesses, the current state of the guessed word, and a list of incorrect letters.
*   **Save/Load Functionality:** Allows you to pause the game at any time by typing `save`. The game state is serialized to a `.json` file and can be reloaded directly from the main menu.

## Prerequisites

*   **Ruby:** Make sure Ruby is installed on your system. You can check your version by running:
    ```bash
    ruby -v
    ```

## Installation

1.  Clone this repository or download the `hangman.rb` file to your local machine.
2.  Navigate to the directory containing the file in your terminal.

## How to Play

1.  Run the game from your terminal:
    ```bash
    ruby hangman.rb
    ```
2.  You will be prompted to either **Start New Game** or **Load Saved Game**.
3.  During gameplay, guess the secret word one letter at a time.
4.  You have 6 incorrect guesses before the game ends.
5.  **To Save:** At any prompt to guess a letter, type `save` instead. You will be asked to name your save file, and the game will safely store your progress in the `saved_games/` directory.

## Project Structure

Once run, the program manages a few local files:

*   `hangman.rb`: The main game logic and runner.
*   `google-10000-english-no-swears.txt`: The dictionary file (downloaded automatically on the first run).
*   `saved_games/`: A directory generated automatically to store your `.json` save files.

## Acknowledgments

*   Dictionary provided by [first20hours/google-10000-english](https://github.com/first20hours/google-10000-english).
*   Project prompt from [The Odin Project](https://www.theodinproject.com/).
