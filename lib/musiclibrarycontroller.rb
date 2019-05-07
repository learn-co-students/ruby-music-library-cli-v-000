class MusicLibraryController
  attr_accessor :path 
  
  def initialize(path = './db/mp3s')
    @path = path 
    music_importer = MusicImporter.new(path) 
    music_importer.import 
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
    input = gets.strip 
    while input != "exit"
    
    if input == "list songs"
        self.list_songs
      elsif input == "list artists"
        self.list_artists
      elsif input == "list genres"
        self.list_genres
      elsif input == "list artist"
        self.list_songs_by_artist
      elsif input == "list genre"
        self.list_songs_by_genre
      elsif input == "play song"
        self.play_song
      end
      puts "What would you like to do?"
      input = gets.strip
  end
    
  end 
  
  def list_songs
    song_sorter = Song.all.sort_by {|song|song.name}
     song_sorter.each_with_index do |song, index|
     puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
   end 
    
  end 
  
  def list_artists 
      artist_sorter = Artist.all.sort_by {|artist| artist.name}
      artist_sorter.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
  end 
  
end 
  
  def list_genres
    genre_sorter = Genre.all.sort_by{|genre| genre.name}
    genre_sorter.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end 
    
  end 
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip
    songs = Artist.find_or_create_by_name(artist_name).songs
    sorted_songs = songs.sort_by {|song| song.name}
    sorted_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.name} - #{song.genre.name}"
    end
    
  end 
  
  def list_songs_by_genre 
    puts "Please enter the name of a genre:"
    genre_name = gets.strip 
    songs = Genre.find_or_create_by_name(genre_name).songs
    sorted_songs = songs.sort_by {|song| song.name}
    sorted_songs.each_with_index do |song, index|
    puts "#{index + 1}. #{song.artist.name} - #{song.name}"
  end 
  
end 
  
    def play_song
    sorted_songs = Song.all.sort_by {|song| song.name}
    puts "Which song number would you like to play?"
    song_number = gets.strip.to_i
    if song_number.between?(1, sorted_songs.length)
      target_song = sorted_songs[song_number - 1]
      puts "Playing #{target_song.name} by #{target_song.artist.name}"
    end
  end
  
  end 