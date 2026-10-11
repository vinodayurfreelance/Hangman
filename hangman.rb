
require "yaml"

def load_words
  words = File.readlines("google-10000-english-no-swears.txt")

  words = words.map do |word|
    word.chomp
  end

  words.select do |word|
    word.length >= 5 && word.length <= 12
  end
end

def load_game
  game_data = YAML.load_file(
    "game.yml",
    permitted_classes: [Symbol]
  )

  puts "Saved game loaded!"

  game_data
end

def new_game(words)
  secret_word = words.sample
  display = Array.new(secret_word.length, "_")
  wrong_guesses = 0
  guessed_letters = []

  {
    secret_word: secret_word,
    display: display,
    wrong_guesses: wrong_guesses,
    guessed_letters: guessed_letters
  }
end

def save_game(secret_word, display, wrong_guesses, guessed_letters)
  game_data = {
    secret_word: secret_word,
    display: display,
    wrong_guesses: wrong_guesses,
    guessed_letters: guessed_letters
  }

  File.write("game.yml", game_data.to_yaml)

  puts "Game saved successfully!"
end

def play_game(secret_word, display, wrong_guesses, guessed_letters)
  loop do
    puts "Word: #{display.join(" ")}"
    puts "Type 'save' to save and quit."
    puts "Guess a letter:"

    input = gets

    if input.nil?
      puts "Input ended. Exiting the game."
      break
    end

    guess = input.chomp.downcase

    if guess == "save"
      save_game(secret_word, display, wrong_guesses, guessed_letters)
      break
    end

    unless guess.match?(/\A[a-z]\z/)
      puts "Please enter one letter from a to z."
      next
    end

    if guessed_letters.include?(guess)
      puts "You already guessed that letter!"
      next
    end

    guessed_letters.push(guess)

    if secret_word.include?(guess)
      puts "Correct!"

      secret_word.chars.each_with_index do |letter, index|
        if letter == guess
          display[index] = guess
        end
      end
    else
      puts "Wrong!"
      wrong_guesses += 1
    end

    puts "Wrong guesses: #{wrong_guesses}"

    if !display.include?("_")
      puts "You win!"
      puts "The word was #{secret_word}"

      File.delete("game.yml") if File.exist?("game.yml")

      puts "Completed game save removed."
      break
    elsif wrong_guesses >= 6
      puts "You lose!"
      puts "The word was #{secret_word}"

      File.delete("game.yml") if File.exist?("game.yml")

      puts "Completed game save removed."
      break
    end
  end
end

words = load_words

puts "1. New game"
puts "2. Load saved game"
puts "Choose an option:"
choice = gets.chomp

if choice == "2"
  if File.exist?("game.yml")
    game_data = load_game
  else
    puts "No saved game found. Please start a new game."
    exit
  end
elsif choice == "1"
  game_data = new_game(words)
  puts "New game started!"
else
  puts "Invalid choice. Please run the game again."
  exit
end

play_game(
  game_data[:secret_word],
  game_data[:display],
  game_data[:wrong_guesses],
  game_data[:guessed_letters]
)
