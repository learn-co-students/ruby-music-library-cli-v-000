class MusicLibraryController
  attr_reader :path, :importer, :alphabetized_song_list
  
  def initialize(path = './db/mp3s')
    @path = path
    @importer = MusicImporter.new(@path)
    @importer.import
    @alphabetized_song_list = Song.all.sort_by! {|song| song.name}
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
      case input
        when 'list songs' then list_songs
        when 'list artists' then list_artists
        when 'list genres' then list_genres
        when 'list artist' then list_songs_by_artist
        when 'list genre' then list_songs_by_genre
        when 'play song' then play_song
      end 
    end
  end
  
  def list_songs
    counter = 1
    alphabetized_song_list.each do |song|
      puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      counter += 1
    end
  end
  
  def list_artists
    artists = Artist.all.collect {|artist| artist.name}.uniq.sort
    counter = 1
    artists.each do |artist|
      puts "#{counter}. #{artist}"
      counter += 1
    end
  end
  
  def list_genres
    genres = Genre.all.collect {|genre| genre.name}.uniq.sort
    counter = 1
    genres.each do |genre|
      puts "#{counter}. #{genre}"
      counter += 1
    end    
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.strip
    songs_by_artist = Song.all.select {|song| song.artist.name == artist}
    songs_by_artist.sort_by! {|song| song.name}
    counter = 1
    songs_by_artist.each do |song|
      puts "#{counter}. #{song.name} - #{song.genre.name}"
      counter += 1
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.strip
    songs_by_genre = Song.all.select {|song| song.genre.name == genre}
    songs_by_genre.sort_by! {|song| song.name}
    counter = 1
    songs_by_genre.each do |song|
      puts "#{counter}. #{song.artist.name} - #{song.name}"
      counter += 1
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if input.between?(1, alphabetized_song_list.size)
      song = alphabetized_song_list[input - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
  
end