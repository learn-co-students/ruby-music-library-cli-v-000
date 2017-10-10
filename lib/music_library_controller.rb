class MusicLibraryController
  attr_reader :song_list

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
    @song_list = Song.all.sort_by{|s| s.name}
  end

  def call
    user_input = ""

    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    while user_input != "exit"
      user_input = gets.chomp

      self.list_songs if user_input == "list songs"
      self.list_artists if user_input == "list artists"
      self.list_genres if user_input == "list genres"
      self.list_songs_by_artist if user_input == "list artist"
      self.list_songs_by_genre if user_input == "list genre"
      self.play_song if user_input == "play song"
    end
  end

  def list_songs
    self.song_list.each_with_index{|s, i| puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}

  end

  def list_artists
    Artist.all.sort_by{|a| a.name}.each_with_index{|a, i| puts "#{i+1}. #{a.name}"}
  end

  def list_genres
    Genre.all.sort_by{|g| g.name}.each_with_index{|g, i| puts "#{i+1}. #{g.name}"}
  end

  def list_songs_by_artist
    user_input = ""

    puts "Please enter the name of an artist:"
    user_input = gets.chomp

    if Artist.all.detect(user_input)
      self.song_list.reject{|s| s.artist.name != user_input}.each_with_index{|s, i| puts "#{i+1}. #{s.name} - #{s.genre.name}"}
    end
  end

  def list_songs_by_genre
    user_input = ""

    puts "Please enter the name of a genre:"
    user_input = gets.chomp

    if Genre.all.detect(user_input)
      self.song_list.reject{|s| s.genre.name != user_input}.each_with_index{|s, i| puts "#{i+1}. #{s.artist.name} - #{s.name}"}
    end
  end

  def play_song
    user_input = ""

    puts "Which song number would you like to play?"

    user_input = gets.chomp
    index = user_input.to_i - 1

    if index >= 0 && index < self.song_list.size
      puts "Playing #{self.song_list[index].name} by #{self.song_list[index].artist.name}"
    end
  end
end
