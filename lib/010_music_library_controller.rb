require 'pry'
class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
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

    user_input = gets.strip
    if user_input == 'list songs'
      list_songs
    elsif user_input == 'list artists'
      list_artists
    elsif user_input == 'list genres'
      list_genres
    elsif user_input == 'list artist'
      list_songs_by_artist
    elsif user_input == 'list genre'
       list_songs_by_genre
     elsif user_input == 'play song'
       play_song
    end


    count = 0
    until count == 4

    user_input =  gets
      if user_input == "exit"
        count = 4
      else
        count +=1
      end
    end
  end

  def list_songs
   song_names= Song.all.sort_by{|song|song.name}
   song_names.each_with_index{|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
 end

 def list_artists
   artists_names = Artist.all.sort_by{|artist| artist.name}
   artists_names.each_with_index{|artist, index| puts "#{index+1}. #{artist.name}"}
 end

 def list_genres
   genre_names = Genre.all.sort_by{|type| type.name}
   genre_names.each_with_index{|genre, index|puts "#{index+1}. #{genre.name}"}
 end


 def list_songs_by_artist
   puts "Please enter the name of an artist:"
    artist_input= gets.strip
    if artist = Artist.find_by_name(artist_input)
      sorted_songs = artist.songs.sort_by{|song|song.name}
      sorted_songs.each_with_index{|song, index| puts "#{index+1}. #{song.name} - #{song.genre.name}"}
    end
 end

def list_songs_by_genre
  puts "Please enter the name of a genre:"
  genre_input = gets.strip
  if genre = Genre.find_by_name(genre_input)
    sorted_songs = genre.songs.sort_by{|song| song.name}
    sorted_songs.each_with_index{|song, index|puts "#{index+1}. #{song.artist.name} - #{song.name}"}
  end
end

def play_song
  puts "Which song number would you like to play?"
  song_selection = gets.strip.to_i

  if song_selection > 0 && song_selection<=Song.all.length
    song= Song.all.sort_by{|song|song.name}[song_selection-1]
  puts "Playing #{song.name} by #{song.artist.name}"
  end
end



end
# rspec spec/012_music_library_cli_spec.rb
