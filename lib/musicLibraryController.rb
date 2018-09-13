class MusicLibraryController
  
  attr_accessor :path
  
  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end
  
  
  def call
    input = ""
    while !(input == "exit")
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      
      if input == "list songs"
        list_songs
      end
      
      if input == "list artists"
        list_artists
      end
      
      if input == "list genres"
        list_genres
      end
      
      if input == "list artist"
        list_songs_by_artist
      end
      
      if input == "list genre"
        list_songs_by_genre
      end
      
      if input == "play song"
        play_song
      end
      
      input = gets.strip
    end
    
  end 
  
  def list_songs
    list = Song.all.sort_by { |s| s.name }
    list.each.with_index(1) do |s, i|
      puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end
  
  def list_artists
    list = Artist.all.sort_by { |a| a.name }
    list.each.with_index(1) do |a, i|
      puts "#{i}. #{a.name}"
    end
  end
  
  def list_genres
    list = Genre.all.sort_by { |g| g.name }
    list.each.with_index(1) do |g, i|
      puts "#{i}. #{g.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    if input == Artist.name
    
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if input == Genre.name
      
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    if input == Song.name
  
    end
  end

end