class MusicLibraryController
  
  attr_accessor :path 
  
  def initialize (path = './db/mp3s')
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
    
    i=gets.strip
    
    case i
      
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
    
    while i != "exit"
      i=gets.strip
    end
  end

  def list_songs
    Song.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |song, i|
        puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    Artist.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |artist, i|
        puts "#{i}. #{artist.name}"
    end
  end
  
  def list_genres
    Genre.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |genre, i|
        puts "#{i}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.strip
    songs_by_artist=[]
    
    songs = Song.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |song, i|
        
        if song.artist.name == artist
          puts "#{songs_by_artist.count + 1}. #{song.name} - #{song.genre.name}"
          songs_by_artist << song.name
        end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.strip
    songs_by_genre=[]
    
    songs = Song.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |song, i|
        
        if song.genre.name == genre
          puts "#{songs_by_genre.count + 1}. #{song.artist.name} - #{song.name}"
          songs_by_genre << song.name
        end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    number = gets.strip
    n = number.to_i
    song = Song.all.sort{ |a, b| a.name <=> b.name }[n - 1]
    if (song && n>=1 && n <= Song.all.length)
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
  
end