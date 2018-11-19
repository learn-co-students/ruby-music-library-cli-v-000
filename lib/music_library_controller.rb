class MusicLibraryController
  attr_reader :path, :importer
  
  def initialize(path = './db/mp3s')
    @path = path
    @importer = MusicImporter.new(@path)
    @importer.import
  end
  
  def call
    input = nil
    until input == 'exit'
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
    end
  end
  
  def list_songs
    file_array = []
    @importer.files.each {|file| file_array << file.chomp('.mp3')}
    file_array.sort_by! {|file| file.split(' - ')[1]}
    counter = 1
    file_array.collect do |file|
      puts "#{counter}. #{file}"
      counter += 1
    end
  end
  
  def list_artists
    artist_array = Artist.all.collect {|artist| artist.name}.uniq.sort
    counter = 1
    artist_array.each do |artist|
      puts "#{counter}. #{artist}"
      counter += 1
    end
  end
  
  def list_genres
    genre_array = Genre.all.collect {|genre| genre.name}.uniq.sort
    counter = 1
    genre_array.each do |genre|
      puts "#{counter}. #{genre}"
      counter += 1
    end    
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.strip
    song_array = Song.all.select {|song| song.artist.name == artist}
    song_array.sort_by! {|song| song.name}
    counter = 1
    song_array.each do |song|
      puts "#{counter}. #{song.name} - #{song.genre.name}"
      counter += 1
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.strip
    song_array = Song.all.select {|song| song.genre.name == genre}
    song_array.sort_by! {|song| song.name}
    counter = 1
    song_array.each do |song|
      puts "#{counter}. #{song.artist.name} - #{song.name}"
      counter += 1
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    list_songs
    song = gets.strip
  end
  
  
end