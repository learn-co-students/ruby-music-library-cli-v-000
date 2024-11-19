require 'pry'

class MusicLibraryController
attr_accessor :path, :musicimporter

  def initialize(path='./db/mp3s')
    MusicImporter.new(path).import
  end

  def call

   puts "Welcome to your music library!"
   puts "To list all of the songs by a particular artist, enter 'list artist'."
   puts "To list all of the artists in your library, enter 'list artists'."
   puts "To list all of the genres in your library, enter 'list genres'."
   puts "To list all of the songs of a particular genre, enter 'list genre'."
   puts "To list all of your songs, enter 'list songs'."
   puts "To play a song, enter 'play song'."
   puts "To quit, type 'exit'."
   puts "What would you like to do?"

  input = ''
  while input != "exit"
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
  Song.all.sort_by{|s| s.name}.each_with_index {|a, i| puts "#{i+1}. #{a.artist.name} - #{a.name} - #{a.genre.name}"}
end

def list_artists
  Artist.all.sort_by{|a| a.name}.each_with_index {|a, i| puts "#{i+1}. #{a.name}"}
end

def list_genres
  Genre.all.sort_by{|g| g.name}.each_with_index {|a, i| puts "#{i+1}. #{a.name}"}
end

def list_songs_by_artist
  puts "Please enter the name of an artist:"
  name = gets.strip
  artist = Artist.find_by_name(name)
  if !artist.nil?
    artist.songs.sort_by {|song| song.name}.each_with_index {|element, i| puts "#{i+1}. #{element.name} - #{element.genre.name}"}
  end

end

def list_songs_by_genre
  puts "Please enter the name of a genre:"
  name = gets.strip
  genre = Genre.find_by_name(name)
  if !genre.nil?
    genre.songs.sort_by {|song| song.name}.each_with_index {|element, i| puts "#{i+1}. #{element.artist.name} - #{element.name}"}
  end
end

def play_song
  puts "Which song number would you like to play?"
  song = gets.strip.to_i-1
  library_length = Song.all.count

  if (song >= 1 && song <= library_length)
      msong = Song.all.sort {|a, b| a.name <=> b.name}[song]
      puts "Playing #{msong.name} by #{msong.artist.name}" unless msong.nil?
  end

end


end
