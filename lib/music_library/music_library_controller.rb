require 'pry'
# accepts one argument, the path to the MP3 files to be imported
# creates a new MusicImporter object, passing in the 'path' value
# the 'path' argument defaults to './db/mp3s
# invokes the #import method on the created MusicImporter object

class MusicLibraryController

  attr_accessor

  def initialize(path = './db/mp3s')
    # @path = path
    @library = MusicImporter.new(path)
    @library.import
  end

  def call
    # asks the user for input
    # loops and asks for user input until they type in exit

    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    user_input = ""
    until user_input == "exit"
      user_input = gets.strip
        if user_input == "list songs"
          self.list_songs
        elsif user_input == "list artists"
          self.list_artists
        elsif user_input == "list genres"
          self.list_genres
        elsif user_input == "list artist"
          self.list_songs_by_artist
        elsif user_input == "list genre"
          self.list_songs_by_genre
        elsif user_input == "play song"
          self.play_song
        end #if
    end #until

  end #call

  def klass_sort(klass)
    # I use this method in list_songs, list_artists, and list_genres. I kept writing the below code in all of them and decided to break
    # it out.
    # I also use in play_song
    klass.all.sort { |a, b| a.name <=> b.name }
  end

  def list_songs
    # prints all songs in the music library in a numbered list (alphabetized by song name)
    # Sorts through the Song class @@all array, sorts that array by name, iterates through the sorted array,
    # and prints the index (starting at 1) and the songs name.
      klass_sort(Song).each.with_index(1) { |song, index| puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
  end

  def list_artists
    # prints all artists in the music library in a numbered list (alphabetized by artist name)
    # Sorts through the Artist class @@all array, sorts that array by name, iterates through the sorted array,
    # and prints the index (starting at 1) and the artist's name.
    klass_sort(Artist).each.with_index(1) { |artist, index| puts "#{index}. #{artist.name}"}
  end

  def list_genres
    # prints all genres in the music library in a numbered list (alphabetized by genre name)
    # Sorts through the Genre class @@all array, sorts that array by name, and iterates through the sorted array,
    # and prints the index (starting at 1) and the genre name.
    klass_sort(Genre).each.with_index(1) { |genre, index| puts "#{index}. #{genre.name}"}
  end

  def list_songs_by_artist
    # prompts the user to enter an artist
    # prints all songs by a particular artist in a numbered list (alphabetized by song name)
    # does nothing if no matching artist is found
    # iterates through the songs array of the artist, sorts it by song name, iterates throug the sorted list with each.with_index
    # starting at index 1 and prints out the index, song name, and genre.
    puts "Please enter the name of an artist:"
    user_input = gets.strip
    if artist = Artist.find_by_name(user_input)
      artist.songs.sort { |a, b| a.name <=> b.name }.each.with_index(1) { |song, index| puts "#{index}. #{song.name} - #{song.genre.name}" }
    end #if
  end #list_songs_by_artist

  def list_songs_by_genre
    # prompts the user to enter a genre
    # accepts user input
    # prints all songs by a particular genre in a numbered list (alphabetized by song name)
    # does nothing if no matching genre is found
    # iterates through the songs array of the genre, sorts it by song name, iterates throug the sorted list with each.with_index
    # starting at index 1 and prints out the index, artist, and song name.
    puts "Please enter the name of a genre:"
    user_input = gets.strip
    if genre = Genre.find_by_name(user_input)
      genre.songs.sort { |a, b| a.name <=> b.name }.each.with_index(1) { |song, index| puts "#{index}. #{song.artist.name} - #{song.name}" }
    end
  end

  def play_song
    # prompts the user to choose a song from the alphabetized list output by #list_songs
    # accepts user input
    # upon receiving valid input 'plays' the matching song from the alphabetized list output by #list_songs
    # does not 'puts' anything out if a matching song is not found
    # checks that the user entered a number between 1 and the total number of songs in the library
    # if the the user input is between one and the total amount of songs, we return the stored array of songs, take the index
    # with the user input - 1 (to get the song we want), and print out "Playing the song name by the artist"
    puts "Which song number would you like to play?"
    user_input = gets.strip
    if user_input.to_i.between?(1, Song.all.size)
      find_song = klass_sort(Song)[user_input.to_i - 1]
      puts "Playing #{find_song.name} by #{find_song.artist.name}"
    end #if
  end #play_song
end
