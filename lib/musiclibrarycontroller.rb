class MusicLibraryController
  
  attr_reader :name, :artist, :genre
  
  @@list_songs = [0]
  
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
    user_input = gets.strip
    if user_input != "exit"
      call
    end
    command(user_input)
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
  
  def list_songs
    x = 0
    Song.all.sort_by! {|song| song.name}
    Song.all.each do |song|
      @@list_songs.push(song)
      x+=1
      puts "#{x}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    user_selected_number = gets.chomp
    if user_selected_number.to_i <=5 && user_selected_number.to_i >= 1
      puts "Playing #{@@list_songs[user_selected_number.to_i].name} by #{@@list_songs[user_selected_number.to_i].artist.name}"
    end
  end
  
  def command(command)
    if command === "list songs"
      list_songs
    elsif command === "list artists"
      list_artists
    elsif command === "list genres"
      list_genres
    elsif command === "list artist"
      list_songs_by_artist
    elsif command === "list genre"
      list_songs_by_genre
    elsif command === "play song"
      play_song
    end
  end
  
end