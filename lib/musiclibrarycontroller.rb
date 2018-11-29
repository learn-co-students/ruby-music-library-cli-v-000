class MusicLibraryController
  
  attr_reader :name, :artist, :genre
  
  def initialize(path="./db/mp3s")
    @path = path
    music_importer_object = MusicImporter.new(path)
    music_importer_object.import
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
    gets.chomp
    gets.chomp
    gets.chomp
    gets.chomp
  end
  
  def list_songs
    x = 0
    Song.all.sort_by! {|song| song.name}
    array = Song.all.collect do |song|
      x+=1
      puts "#{x}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    x = 0
    Artist.all.sort_by! {|artist| artist.name}
    Artist.all.each do |artist|
      x+=1
      puts "#{x}. #{artist.name}"
    end
  end
  
  def list_genres
    x = 0
    Genre.all.sort_by! {|genre| genre.name}
    Genre.all.each do |genre|
      x+=1
      puts "#{x}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist
    x = 0
    puts "Please enter the name of an artist:"
    user_selected_artist = gets.chomp
    Song.all.sort_by! {|song| song.name}
    Song.all.each do |song|
      if user_selected_artist === song.artist.name
        x+=1
        puts "#{x}. #{song.name} - #{song.genre.name}"
      end
    end
  end
  
  def list_songs_by_genre
    x = 0
    puts "Please enter the name of a genre:"
    user_selected_genre = gets.chomp
    Song.all.sort_by! {|song| song.name}
    array = Song.all.collect do |song|
      if user_selected_genre === song.genre.name
        x+=1
        puts "#{x}. #{song.artist.name} - #{song.name}"
      end
    end
    array
  end
  
  def play_song
    puts "Which song number would you like to play?"
    list_songs
    user_selected_number = gets.chomp
  end
  
end