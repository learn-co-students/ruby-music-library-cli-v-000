
class MusicLibraryController
  extend Concerns::Findable
  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(@path).import
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
    input = gets.strip until input == "exit"
  end
  
  def list_songs
    
    songs = Song.all.sort {|a,b|
    a.name <=> b.name
      
    }
  #binding.pry
    songs.each_with_index do |song, i| 
      puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" 
    end 
  end 
  def list_artists
    artists = Artist.all.sort {|a,b|
    a.name <=> b.name}
    
    artists.each_with_index do |artist,i|
      puts "#{i+1}. #{artist.name}"
    end 
  end 
  def list_genres
    genres = Genre.all.sort {|a,b|
    a.name <=> b.name}.uniq
    # binding.pry
    
    genres.each_with_index do |genre,i|
      #binding.pry
      puts "#{i+1}. #{genre.name}"
    end 
  end
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip
    #binding.pry
    _artist = Artist.all.detect do|artist|
        artist.name == artist_name
      end 
      if _artist
        _artist.songs.sort {|a,b| a.name <=> b.name}.each_with_index do |song,i|
            puts "#{i+1}. #{song.name} - #{song.genre.name}"
        end 
      else 
      end
  end
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip
    #binding.pry
    _genre = Genre.all.detect do|genre|
        genre.name == genre_name
      end 
      if _genre
        _genre.songs.sort {|a,b| a.name <=> b.name}.each_with_index do |song,i|
            puts "#{i+1}. #{song.artist.name} - #{song.name}"
        end 
      else 
      end
  end 
  def play_song
    puts "Which song number would you like to play?"
    song_request = gets.strip
     if song_request.to_i > = 1 && song_request.to_i <= Song.all.length  
      
      list_by_name = Song.all.collect {|song| song.name}.sort
      song = Song.all.detect {|song |song.name == list_by_name[song_request.to_i - 1]}
    else 
    end 
    if song 
        puts "Playing #{song.name} by #{song.artist.name}"
    else 
    end 
  end 
  
  
      
  end   
  
  
  
  
