require 'pry'
class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    new = MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    counter = 0
    user_input = gets.strip
    if user_input != "exit" || counter > 4
      counter += 1
      self.call
    elsif user_input == "exit" || counter == 4
      "exit"
    end
  end

  def list_songs #prints list of filenames alphabetized by song name
    #need an array of with all the songs parsed from a path
    library = Dir.glob("./#{@path}/*").collect {|file| File.basename("#{file}").sub(".mp3", "")}
    nested_library = library.collect {|song_string| song_string.split(" - ")}
    alphabetized_array = nested_library.sort_by {|song_array| song_array[1]}
    beta_array = alphabetized_array.collect {|array| array.join(" - ")}
    beta_array.each_with_index {|value, index| puts "#{index+1}. #{value}"}

  end

  def list_artists
    artist_list = Artist.all.collect {|artists_instance| artists_instance.name}
    artist_list.sort.each_with_index {|value, index| puts "#{index+1}. #{value}"}
  end

  def list_genres
    genre_list = Genre.all.collect {|genre_instance| genre_instance.name}
    genre_list.sort.each_with_index {|value, index| puts "#{index+1}. #{value}"}
  end

  def list_songs_by_artist
    user_input = gets.strip
    puts "Please enter the name of an artist:"
    if Artist.all.detect {|artist_instance| artist_instance.name == user_input} #matches an artist in the library
      grab_artist = Artist.all.detect {|artist_instance| artist_instance.name == user_input}
      song_list = grab_artist.songs.collect {|song| song.name + " - " + song.genre.name}
      song_list.sort.each_with_index {|value, index| puts "#{index+1}. #{value}"}
    end
  end

  def list_songs_by_genre
    user_input = gets.strip
    puts "Please enter the name of a genre:"
    if Genre.all.detect {|genre_instance| genre_instance.name == user_input} #matches an artist in the library
      grab_genre = Genre.all.detect {|genre_instance| genre_instance.name == user_input}
      song_list = grab_genre.songs.collect {|song| song.artist.name + " - " + song.name}
      nested_songs = song_list.collect {|nest| nest.split(" - ")}
      sorted_nest = nested_songs.sort_by {|element| element[1]}
      sorted_array = sorted_nest.collect {|element| element.join(" - ")}
      sorted_array.each_with_index {|value, index| puts "#{index+1}. #{value}"}
    end
  end

  def play_song
    user_input = gets.strip
    integer_input = user_input.to_i
    puts "Which song number would you like to play?"

    if Song.all.length >= integer_input
      alpha_songs = Song.all.sort_by {|song| song.name}
      name = alpha_songs[integer_input - 1].name
      artist = alpha_songs[integer_input - 1].artist.name
      binding.pry
      #breakdown = self.list_songs.
      #breakdown shows as an array in pry, but the value of self.list_songs is actually nil because of puts
      #array = breakdown.split(",")
      #array[integer_input - 1].split(" - ")
      puts "Playing #{name} by #{artist}"
    end
      #self.list_songs[user_input-1].split(" - ")
  end

end
