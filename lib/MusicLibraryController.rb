require "pry"

class MusicLibraryController
  def initialize(library_path = './db/mp3s')
    music_importer_object = MusicImporter.new(library_path)
      music_importer_object.import
  end
  
  def call 
    input = " "
    while input != "exit"
    input = gets.strip
    puts "Welcome to your music library!"
    begin
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    end 
  end
end

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
 #   binding.pry
    damn.each do |butt|
      puts "#{num}. #{butt.name}"
      num+=1
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    song_names = self.song_array
    user_input = gets.chomp.to_i
    if user_input > 0 && user_input <= self.library.size
      chosen_input = song_names[user_input - 1]
      chosen_input = name_extractor(chosen_input)[1]
      song = Song.find_by_name(chosen_input)
      puts "Playing #{song.name} by #{song.artist.name}" unless song == nil
   end
   
   def list_songs_by_artist
     puts "Which artist do you want?"
#     song_names = self.artist_array
     user_input = gets.chomp 
     artist = artist.find_by_name(user_input)
     artist.songs each do |song|
       puts "#{song.name}"
      end
   end
end
end

  