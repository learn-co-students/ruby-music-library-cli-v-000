require 'pry'

class MusicLibraryController

  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your music library!"
    user_input = nil
    until user_input == "exit"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      user_input = gets.strip
      if user_input == "list songs"
        list_songs
      elsif user_input == "list artists"
        list_artists
      elsif user_input == "list genres"
        list_genres
      elsif user_input == "list artist"
        list_songs_by_artist
      elsif user_input == "list genre"
        list_songs_by_genre
      elsif user_input == "play song"
        play_song
      end
    end
  end

  def list_songs
    Song.all.sort_by {|songs|songs.name}.each_with_index{|song,index|
    puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    Artist.all.sort_by {|artists|artists.name}.each_with_index{|artist,index|
    puts "#{index+1}. #{artist.name}"}
  end

  def list_genres
    Genre.all.sort_by {|genres|genres.name}.each_with_index{|genre,index|
    puts "#{index+1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.strip
    artist = Artist.find_by_name(user_input)
    artist == nil ? nil :
    artist.songs.sort_by {|songs|songs.name}.each_with_index{|song,index|
    puts "#{index+1}. #{song.name} - #{song.genre.name}"}
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
user_input = gets.strip
genre = Genre.find_by_name(user_input)
genre == nil ? nil :
genre.songs.sort_by {|songs|songs.name}.each_with_index{|song,index|
puts "#{index+1}. #{song.artist.name} - #{song.name}"}
end

def play_song
  puts "Which song number would you like to play?"
  user_input = gets.to_i
  playlist = Song.all.sort_by {|songs|songs.name}
  if user_input > 0 && user_input < playlist.count
    puts "Playing #{playlist[user_input-1].name} by #{playlist[user_input-1].artist.name}"
  end
end

end
