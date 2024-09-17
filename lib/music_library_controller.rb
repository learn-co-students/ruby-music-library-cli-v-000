#  require "pry"

class MusicLibraryController
  def initialize(library_path = './db/mp3s')
    music_importer_object = MusicImporter.new(library_path)
      music_importer_object.import
  end
  
  def call 
    input = " "
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
      when "list artists"
        list_artists
      when "list artist"
        list_songs_by_artist
      when "list genres"
        list_genres
      when "list genre"
        list_songs_by_genre
      when "list songs"
        list_songs
      when "play song"
        play_song
      end
    end 
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
     user_input = gets.strip
      artist = Artist.find_by_name(user_input)
      if artist != nil
      num=1 
      artist.songs.sort_by{ |song| song.name.downcase }.each { |song| 
          puts "#{num}. #{song.name} - #{song.genre.name}" 
        num+=1 } 
    end
  end
  
   def list_songs_by_genre
    puts "Please enter the name of a genre:"
     user_input = gets.strip
      genre = Genre.find_by_name(user_input)
      if genre != nil
      num=1 
      genre.songs.sort_by{ |song| genre.name.downcase }.each { |song| 
          puts "#{num}. #{song.artist.name} - #{song.name}" 
        num+=1 } 
    end
  end
 
#  def find_by_name(artist)
#    find=Artist.all { |artist| Artist.name.downcase }
#    artist=gets.strip
#  end

  def list_songs
    garbage=Song.all.sort_by { |song| song.name.downcase }
    num=1 
    garbage.each do |trash| 
            puts "#{num}. #{trash.artist.name} - #{trash.name} - #{trash.genre.name}"
      num+=1
    end
  end  
  
  def list_artists
    moron=Artist.all.sort_by { |artist| artist.name.downcase }
    num=1 
    moron.each do |retard|
      puts "#{num}. #{retard.name}"
      num+=1
    end
  end
  
  def list_genres
    damn=Genre.all.sort_by { |genre| genre.name.downcase }
    num=1 
#    binding.pry
    damn.each do |butt|
      puts "#{num}. #{butt.name}"
      num+=1
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    song_names = Song.all
    user_input = gets.chomp.to_i
    if user_input > 0 && user_input <= Song.all.size
      chosen_input = song_names.sort_by  { |song| song.name.downcase }[user_input - 1]
      song = Song.find_by_name(chosen_input.name)
      puts "Playing #{song.name} by #{song.artist.name}" unless song == nil
    end
   end
end