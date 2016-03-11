<<<<<<< HEAD
# Ruby Music Library

## Overview

You're going to be implementing a Music Library domain composed of 3 main models, `Song`, `Artist`, and `Genre` that will relate to each other and collaborate heavily. Additionally, you're going to be extracting some common functionality of those models into a module, `Concerns::Findable` and mixing that module into those classes. You'll then build a collaborating object, `MusicImporter`, that can parse a directory of MP3 files and use the filenames to create instances of `Song`, `Artist`, and `Genre`. Finally, you'll build a CLI in `bin/musiclibrary` that is powered by a `MusicLibraryController` to provide a simple CLI that let's a user browse the library of MP3s imported by song, artist, and genre.

This is a complex lab with many parts, go slow, try to understand what you're trying to build holistically before starting. Read this entire README before jumping in. As you go from spec to spec, we recommend doing them in numbered order. 

## Concerns

A quick note on the placement of Modules. It's Ruby convention to put all Modules in a `concerns` folder and to be namespaced like this `Concerns::ModuleName`.

## Instructions

## `Song`, `Artist`, and `Genre` Basics

The first thing to do is get the basics of the main models working. Each model has almost the exact same basic requirements, so once you make `001_song_basics_spec.rb` pass by building the `Song` class, the `Artist` and `Genre` basic specs will go fast.

The requirements of each model is that they can accept a name upon initialization and set that property correctly. The `name` property should be readable and writeable by the object.

```ruby
Song.new("Blank Space").name #=> "Blank Space"`
```

Additionally, each class should contain a class variable `@@all` that is set to an empty array and is prepared to store all saved instances. This class variable should be accessible via the class method `.all`.

```ruby
Song.all #=> []
```

Instances should respond to a `#save` method that adds the instance itself into the class variable `@@all`.

```ruby
Song.new("Blank Space").save
Song.all #=> [#<Song: @name="Blank Space">]
```

The class should be able to empty it's `@@all` array via a class method `.destroy_all`.

```ruby
Song.new("Blank Space").save
Song.all #=> [#<Song: @name="Blank Space">]
Song.destroy_all
Song.all #=> []
```

Finally, all classes should implement a custom constructor `.create` that instantiates an instance using `.new` but also evokes `#save` on that instance, forcing it to persist immediately.

```ruby
Song.new("Blank Space")
Song.all #=> []
Song.create("Blank Space")
Song.all #=> [#<Song: @name="Blank Space">]
```

## Relationships

### Songs and Artists

 * Songs belong to an Artist and an Artist has many songs. Adding a song to an Artist is done by calling an `#add_song` method on an instance of the `Artist` class
 * Songs can be initialized with an optional `Artist` argument

### Songs and Genres

  * Genres have many songs and are initialized with an empty list of songs
  * Songs have one genre
  * Songs can be initialized with an optional genre

### Artists and Genres

  * `Artist`s have many `Genre`s through `Song`. Implement a `#genres` method for this association.
  * `Genre`s have many `Artists`s through `Song`. Implement a `#artists` method for this association.

## Finding 

### Song
First implement the following two methods in your `Song` class

  * Songs should have a `find_by_name` method.
  * Songs should have a `find_or_create_by_name` method.

Now that you've done that, let's generalize those methods by putting them into a module and then including that module in the `Genre` and `Artist` class.

### Concerns::Findable

  * Implement a generic `#find_by_name` method that uses the `.all` method defined by the class to find by name.
  * Implement a generic `#find_or_create_by_name` method that uses the `.all` method defined by the class.
  * Add this module to your `Genre` and `Artist` class.


## Music Importer

Create a Music Importer class to work with your `Song`, `Genre` and `Artist` objects to import a directory of mp3s. This class will have the following methods:

  * Initialize accepts a file path of mp3 files
  * A `#files` method that will return all of the filenames
  * Add a new method to the `Song` class called `.new_from_filename` that creates a `Song` based on a filename
  * Add a new method to the `Song` class called `.create_from_filename` that creates a `Song` based on a filename and saves it to the `@@all` class variable
  * In your `MusicImporter` class, add an `.import` method that imports all the files from the library and creates the `Song` objects.

## CLI and Music Importer Controller
Congrats! You've done the heavy lifting. Now let's wrap it all up in a CLI so that users can actually interact with our code.

  * Initializes with an optional path to the music, but defaults to `./db/mp3s`. It creates a `MusicImporter` and imports the music.
  * Add a `#call` method that starts the CLI and asks the user for input. Check out the tests for specifics



<a href='https://learn.co/lessons/ruby-music-library-cli' data-visibility='hidden'>View this lesson on Learn.co</a>
=======
# Tic Tac Toe with AI

## Objectives

1. Build a CLI
2. Create a domain model with multiple relating and collaborating objects.

## Overview

The goal of this project is to build a version of Tic Tac Toe with 0, 1, and 2 player modes. What is the point of Tic Tac Toe with zero players? Let me explain more.

  - A 0 player game has two computer players playing against each other with no interaction from the user.
  - A 1 player game has a human playing against a computer.
  - A 2 player game has two human players.

You'll be implementing Tic Tac Toe using multiple objects that relate and collaborate, including separate classes for Human players and Computer players. The computer player class will have some sort of artificial intelligence or logic to make move decisions. Finally, you'll wrap all of this up in a Command Line Interface.

## Group Project Instructions

*Instructions for how to work on a Group Project with Learn*

### Some Hints on Working Together 

Working on a software project with another person is not something to be taken lightly. While you are a fantastic coder solo, software development is a collaborative activity. Just like anything else, there is skill in collaborating on code. In the end, collaborating with another person boils down to three different styles:

  - Pair - Pair the entire time working linearly together
  - Pass - 1 person does 1 requirement and then the next person does the next one
  - Parallel - work on different parts at the same time by agreeing on interfaces and stubs and meeting in the middle
    - Person A does board and player human
    - Person B does game expecting a working board and player with stubs?
    - Person A person does computer player
    - Work together on the AI (It's hard)

Remember! The goal at The Flatiron School is not to do, it is to *learn*. Make sure you have worked in all three styles of collaboration. We want you to learn how the different styles works, and make sure that together you and your partner understand every part of the code.

## Requirements

  - Passing Unit Tests
  - 0, 1 or 2 player Tic Tac Toe.
  - Command Line Interface
  - Computer AI

## Instructions

### Project Structure

```
├── Gemfile
├── Gemfile.lock
├── README.md
├── Rakefile
├── bin
│   └── tictactoe
├── config
│   └── environment.rb
├── lib
    ├── players
        ├── computer.rb
        └── human.rb
    ├── board.rb
    ├── game.rb
    └── player.rb
└── spec
    ├── 01_board_spec.rb
    ├── 02_player_spec.rb
    ├── 03_human_player_spec.rb
    ├── 04_game_spec.rb
    ├── 05_computer_player_spec.rb
    └── spec_helper.rb
```

#### `Gemfile` and `config/environment.rb`

This project is supported by Bundler and includes a `Gemfile`.

Run `bundle install` before getting started on the project.

As this project has quite a few files, an `environment.rb` is included that loads all the code in your project along with Bundler. You do not ever need to edit this file. When you see `require_relative '../config/environment'`, as in `bin/tictactoe`, that is how your environment and code are loaded.

#### `lib` - Tic Tac Toe Models

You will be implementing Tic Tac Toe through a domain model that uses multiple classes to encapsulate the different logical components and units in Tic Tac Toe.

##### `board.rb` - `Board`

The `Board` class represents the data and logic of a Tic Tac Toe game board. It has a property, `cells`, that stores the data of the state of the board in an array. The `#reset!` method can reset the state of the cells to what a board should look like at the start of a game, an array with 9 `" "` elements.

When a board is initialized, it should start with cells for a new game of Tic Tac Toe. You can and should use `#reset!`.

A board can print its current state with the `#display` method.

You'll also build a `#position` method that takes in the user's input in the form of 1-9 strings like "2" or "9" and looks up the value of the cells at the correct index from the array's perspective. All other methods will take input in the user's perspective of 1-9 strings and use `#position` to look up the value according to the cells' array index.

Similarly, you're going to build an `#update` method that represents updating the board when a player makes a move. This method will take two arguments, the first will be the position the user wants to occupy in the form of 1-9 strings that you will need to convert to the board cells' array index, along with the player object making the move. When you update the appropriate index in the cells, you will set it equal to the token of the player object by calling the `#token` method on the player.

Finally, a board can return values based on its state such as `#full?` when entirely occupied with "X" and "O"s and a `#turn_count` based on how many positions in the cells array are filled. `#taken?` will return true or false for an individual position. `#valid_move?` will ensure that moves are between 1-9 and not taken.

##### `player.rb` - `Player`

The `Player` class is not actually a valid player of Tic Tac Toe but rather a root class that will act as an inheritance point for actual player classes such as `Player::Human` and `Player::Computer`. The `Player` root class will define only the most basic properties of a player, that they have a `token` property that can be set upon initialization.

Every player subclass will implement a `#move` method that represents how that type of player makes a move in Tic Tac Toe.

##### 'players/human.rb' - `Player::Human`

Define a class `Player::Human` that inherits from `Player`. The human player must implement a `#move` method that takes in a `board` argument and allows a human player to enter a move via the CLI. The method should return the value the user enters. Even though the method accepts a `board` argument, it does not need to use it.

##### `game.rb` - `Game`

The `Game` class is the main model of the application and represents a singular instance of a Tic Tac Toe session.

  * A game has one `Board` through its `board` property.
  * A game has two `Player`s stored in a `player_1` and `player_2` property.

`Board` and `Player` do not directly relate to the `Game` but do collaborate with each other through arguments.

Beyond providing relationships with players and a board, the `Game` instance must also provide the basic game runtime and logic. These methods relate to the state of the game such as `#current_player`, `#won?`, and `#winner`. The other methods relate to managing a game, like `#start`, `#play`, and `#turn`. The test suite describes the method requirements.

##### 'players/computer.rb' - `Player::Computer`

Define a class `Player::Computer` that represents a computer player of Tic Tac Toe. Implement a `#move` method that accepts a board and returns the move the computer wants to make in the form of a 1-9 string. How the computer decides to make that move is up to you but it must be capable of returning a valid move at some point.

```ruby
def move(board)
  "1"
end
```

Returns a valid move for the first move but after that your program will go into an infinite loop because the computer will constantly try to occupy the `"1"` position in the board even though it is already occupied. So don't do that.

Think about the levels of intelligence you can build into this method. Start with the simplest level of intelligence, and get more and more complicated. Each step of the way you should have a working computer player though.

Remember, Tic Tac Toe when played perfectly is unwinnable. You should strive to build computer logic that when the computer plays, the game is unwinnable. There's even an algorithm called Min/Max that ensures this logic.

#### `bin/tictactoe`

The requirements of your CLI are as follows, free for you to implement however you see fit as we provide no tests against the CLI.

  * Greet the user with a message.
  * Prompt the user for what kind of game they want to play, 0,1, or 2 player.
  * Ask the user for who should go first and be "X".
  * Use the input to correctly initialize a `Game` with the appropriate player types and token values.
  * When the game is over, the CLI should prompt the user if they would like to play again and allow them to choose a new configuration for the game as described above. If the user doesn't want to play again, exit the program.

You can implement this logic within the `bin/tictactoe` directly or encapsulate it within `Game` via a method like `#start` and simply evoke that method in the CLI. There is no wrong way to implement code that works.

If you'd like, implement a "wargames" game type. When asked what kind of game they want to play or for the number of players, if the user types in "wargames", have the computer play itself 100 times and report how many times the game was won. This is not a requirement, it would just be fun. A perfect computer AI should never be able to win, like in the case of thermonuclear war.

The rest is up to you and your team. Have fun, implement the spirit of the project, meet the requirements as you interpret them, be creative, and don't worry, there are no wrong answers with code.

<a href='https://learn.co/lessons/ttt-with-ai-project' data-visibility='hidden'>View this lesson on Learn.co</a>

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/ttt-with-ai-project'>Tic-Tac-Toe with AI</a> on Learn.co and start learning to code for free.</p>
>>>>>>> 7d857eab89be25cace416fda944031753dce8f3d
