require 'pry'
class MusicLibraryController

  def initialize(path="./db/mp3s")#accepts one argument, the path to the MP3 files to be imported
    MusicImporter.new(path).import ##creates a new MusicImporter object, passing in the 'path' value & invokes the #import method on the created MusicImporter object
  end

  def call
    user_selection = nil
   while user_selection != "exit"
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    user_selection = gets.strip

    case user_selection
    when 'list songs' then list_songs
    when 'list artists' then list_artists
    when 'list genres' then list_genres
    when 'list artist' then list_songs_by_artist
    when 'list genre' then list_songs_by_genre
    when 'play song' then play_song
    end
   end
  end
#CLI methods
   def list_songs
      sorted_list = Song.all.uniq.sort_by {|song| song.name.downcase}
      sorted_list.each_with_index do|song, i|
      puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
 end

  def list_artists
    Artist.all.sort_by{|a| a.name}.each_with_index do |a, i|
      puts "#{i + 1}. #{a.name}"
  end
end

   def list_genres
     Genre.all.sort_by{|g| g.name}.each_with_index do |g, i|
       puts "#{i + 1}. #{g.name}"
   end
 end

   def list_songs_by_artist
     puts "Please enter the name of an artist:"
     input = gets.strip

     if artist = Artist.find_by_name(input)
       artist.songs.sort_by{|s| s.name}.each_with_index do | s, i|
         puts "#{i + 1}. #{s.name} - #{s.genre.name}"
   end
  end
 end

 def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip

    if genre = Genre.find_by_name(input)
    genre.songs.sort_by{|s| s.name}.each_with_index do |song, index|
    puts "#{index + 1}. #{song.artist.name} - #{song.name}"
  end
 end
end

def play_song
     puts "Which song number would you like to play?"
     number = gets.chomp
     index = number.to_i - 1
     sorted_list = Song.all.uniq.sort_by {|song| song.name.downcase}
     song = sorted_list[index]
     puts "Playing #{song.name} by #{song.artist.name}" if index.between?(0, sorted_list.length - 1)
   end
  end
