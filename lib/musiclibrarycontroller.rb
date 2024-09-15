class MusicLibraryController
  attr_accessor :path
  
  def initialize(path = "./db/mp3s")
    @path = path if path
    MusicImporter.new(path).import
  end
  
  def call
    answer = ""
    
    until answer == "exit"
    puts "Welcome to your music library!"
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    answer = gets.strip
    
    case answer 
    when "list songs"
      list_songs
    when "list artists"
      list_artists
    when "list genres"
      list_genres
    when "list artist"
      list_songs_by_artist
    when "list genre"
      list_songs_by_genre
    when "play song"
      play_song
    end
  
    end
  end
  
  def list_songs
    sorted_songs = Song.all.sort_by{|song| song.name}
    sorted_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    sorted_artists = Artist.all.sort_by{|artist| artist.name}
    sorted_artists.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end
  
  def list_genres
    sorted_genres = Genre.all.sort_by{|genre| genre.name}
    sorted_genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    answer = gets.strip
    artist_songs = Song.all.select {|song| song.artist.name == answer}
    sorted_songs = artist_songs.sort_by{|song| song.name}
    sorted_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    answer = gets.strip
    genre_songs = Song.all.select {|song| song.genre.name == answer}
    sorted_songs = genre_songs.sort_by{|song| song.name}
    sorted_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name}"
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    answer = gets.strip.to_i
    sorted_songs = Song.all.sort_by{|song| song.name}
    
    if answer >= 1 && answer <= sorted_songs.count
      num_song = sorted_songs[answer - 1]
      puts "Playing #{num_song.name} by #{num_song.artist.name}"
    end
  end
end