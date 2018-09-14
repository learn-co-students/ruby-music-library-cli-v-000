require "pry"
class MusicLibraryController
 
  def initialize(path = "./db/mp3s")
    new_importer_object = MusicImporter.new(path)
    new_importer_object.import
  end

  
  def list_songs
    songs_sorted_by_name = Song.all.sort_by do |song|
      song.name
    end
    
    songs_sorted_by_name.each.with_index(1) do |song,index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  
  def list_artists
    sorted_by_artist = Artist.all.uniq.sort_by do |artist| 
      artist.name
    end
  
    sorted_by_artist.each.with_index(1) do |artist,index|
      puts "#{index}. #{artist.name}"
    end
  end
  
   def list_genres
    sorted_by_genre = Genre.all.uniq.sort_by do |genre| 
      genre.name
    end
  
    sorted_by_genre.each.with_index(1) do |genre,index|
      puts "#{index}. #{genre.name}"
    end
  end
  
    def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if artist = Artist.find_by_name(input) 
      songs_sorted_by_name = artist.songs.sort_by do |song|
        song.name
      end
      songs_sorted_by_name.each.with_index(1) do |song,index|
        puts "#{index}. #{song.name} - #{song.genre.name}"
      end
    end
  end
  
   def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    if genre = Genre.find_by_name(input) 
      songs_sorted_by_name = genre.songs.sort_by do |song|
        song.name
      end

      songs_sorted_by_name.each.with_index(1) do |song,index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  
  
 def play_song
    puts "Which song number would you like to play?"
    list_of_songs =  Song.all.sort{ |a, b| a.name <=> b.name }

    input = gets.strip.to_i
  
    if (1..Song.all.length).include?(input)
      song = list_of_songs[input+2]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
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
      input = gets.chomp
     
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
end