class MusicLibraryController
  attr_accessor :path
  @@user_list_data = []
  
  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
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
    input = gets
    until input == "exit"
      cli_commands(input)
      puts "What would you like to do?"
      input = gets
    end
  end
  
  def cli_commands(input)
    if input == "list songs"
      self.list_songs
    elsif input == "list artists"
      self.list_artists
    elsif input == "list genres"
      self.list_genres
    elsif input == "list artist"
      self.list_songs_by_artist(input)
    elsif input == "list genre"
      self.list_songs_by_genre(input)
    elsif input == "play song"
      self.play_song
    end
  end
  
  def song_data
    @songs = []
    Song.all.collect do |i|
      song_name = i.name
      artist_name = i.artist.name
      genre_name = i.genre.name
      data = [[song_name], [artist_name], [genre_name]]
      @songs << data
    end
    @ordered_list = @songs.sort
  end
  
  def song_count
    @song_count = Song.all.count
  end

  
  def list_songs
    song_data
    list_count = 0
    @ordered_song_list = []
    @songs.sort.collect do |i|
      list_count += 1
      @ordered_song_list << i
      list_data = i[1] + i[0] + i[2]
      puts "#{list_count}. #{list_data.join(" - ")}"
    end
    @ordered_song_list
  end
  
  def valid?(input)
    song_count
    input.to_i >= 1 && input.to_i <= @song_count
  end
  
  def play_song
    song_data
    puts "Which song number would you like to play?"
    input = gets.chomp
    if valid?(input)
      index = input.to_i - 1
      song_choice = @ordered_list[index].join(" - ")
      song_name = song_choice.split(" - ")[0]
      artist_name = song_choice.split(" - ")[1]
      puts "Playing #{song_name} by #{artist_name}"
    end
  end
      
  def valid_artist?(input)
    Song.all.detect {|i| i.artist.name == input}
  end
  
  def list_songs_by_artist
    artist_song_list = []
    puts "Please enter the name of an artist:"
    gets
    input = gets.chomp
    if valid_artist?(input)
      artist_songs = Song.all.select {|i| i.artist.name == input}
      artist_songs.each {|i| artist_song_list << i.name + " - " + i.genre.name}
      count = 1
      artist_song_list.sort.each do |i|
        puts "#{count}. #{i}"
        count += 1
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    gets
    song_list = []
    genre_songs = Song.all.select {|i| i.genre.name == gets}
    genre_songs.each do |i|
      song_list << [i.name, i.artist.name]
    end
    count = 1
    song_list.sort.each do |i|
      puts "#{count}. #{i[1]} - #{i[0]}"
      count += 1
    end
  end
    
  
  def list_artists
    artist_list = []
    Artist.all.collect do |i|
      artist_list << i.name
    end
    count = 1
    artist_list.sort.each do |i|
      puts "#{count}. #{i}"
      count += 1
    end
  end
  
  def list_genres
    genre_list = []
    Genre.all.collect do |i|
      genre_list << i.name
    end
    count = 1
    genre_list.sort.each do |i|
      puts "#{count}. #{i}"
      count += 1
    end
  end
  
end