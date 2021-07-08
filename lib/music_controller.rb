class MusicLibraryController
  
  def initialize(path='./db/mp3s')
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
    user_command = gets.strip 
    case user_command
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
    when "exit"
      exit
    end
  end
  
  def list_songs
    Song.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    Artist.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
    end
  end
  
  def list_genres
     Genre.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input_artist = gets.strip
    if artist = Artist.find_by_name(input_artist)
      artist.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |art, index|
      puts "#{index}. #{art.name} - #{art.genre.name}"
    end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input_genre = gets.strip
    if genre = Genre.find_by_name(input_genre)
      genre.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |gen, index|
        puts "#{index}. #{gen.artist.name} - #{gen.name}"
      end
    end
    end
    
    def play_song
      puts "Which song number would you like to play?"
      input = gets.strip.to_i
    #  binding.pry
      if (1..Song.all.length).include?(input)
        song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
      end
        puts "Playing #{song.name} by #{song.artist.name}" if song
    end
    
    
end