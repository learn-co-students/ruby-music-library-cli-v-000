class MusicLibraryController
  attr_accessor :path
  
  def initialize(path = "./db/mp3s")
    new_importer_object = MusicImporter.new(path)
    new_importer_object.import
  end
 def call
    input = ""
    while input != "exit"
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
    song_sorted = Song.all.sort { |x,y| x.name <=> y.name } 
    song_sorted.each.with_index {|song,index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
  
  def list_artists
    artist_sorted = Artist.all.sort { |x,y| x.name <=> y.name } 
    artist_sorted.each.with_index(1){|artist,index| puts "#{index}. #{artist.name}"}
  end
  def list_genres
      genres_sorted = Genre.all.sort { |x,y| x.name <=> y.name } 
      genres_sorted.each.with_index(1){|genre,index| puts "#{index}. #{genre.name}"}
  end
  
  def list_songs_by_genre
     puts "Please enter the name of a genre:"
     input = gets.strip
     if genre = Genre.find_by_name(input)
      songs_sorted_by_name = genre.songs.sort { |x,y| x.name <=> y.name } 
      
      songs_sorted_by_name.each.with_index(1){|song,index| puts "#{index}. #{song.artist.name} - #{song.name}"}
     end
 
  end
  
  
  def list_songs_by_artist
     puts "Please enter the name of an artist:"
     input = gets.strip
     if artist = Artist.find_by_name(input)
      songs_sorted_by_name = artist.songs.sort { |x,y| x.name <=> y.name } 
      
      songs_sorted_by_name.each.with_index(1){|song,index| puts "#{index}. #{song.name} - #{song.genre.name}"}
     end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i

    if input >= 1 && input < Song.all.size
      song_sorted = Song.all.sort { |x,y| x.name <=> y.name } 
      song = song_sorted[input-1]
      puts "Playing #{song.name} by #{song.artist.name}"
      
    end
    
  end
  
end