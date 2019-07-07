class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end 
  
  def call 
    user_input = ""
    
    until user_input == "exit"
      
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

      case user_input
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
        
      end #end case
    end #end until 
  end #end def call 
  
  def list_songs
    Song.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |asong, index|
      puts "#{index}. #{asong.artist.name} - #{asong.name} - #{asong.genre.name}"  
    end
  end
  
  def list_artists
    Artist.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |aartist, index|
      puts "#{index}. #{aartist.name}"  
    end
  end
  
  def list_genres
    Genre.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |agenre, index|
      puts "#{index}. #{agenre.name}"  
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input_name = gets.strip

    if artist = Artist.find_by_name(input_name)
      artist.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |asongs, i|
        puts "#{i}. #{asongs.name} - #{asongs.genre.name}"
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input_name = gets.strip

    if genre = Genre.find_by_name(input_name)
      genre.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |asongs, i|
        puts "#{i}. #{asongs.artist.name} - #{asongs.name}"
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.strip.to_i  
    
    if (1..Song.all.length).include?(user_input)
      asong = Song.all.sort{ |a, b| a.name <=> b.name }[user_input-1]
      puts "Playing #{asong.name} by #{asong.artist.name}"
    end
  end
  
end #class MusicLibraryController  