require 'pry'

class MusicLibraryController

  def initialize(path = './db/mp3s')
    @path = path
    new_music = MusicImporter.new(path)
    new_music.import
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

input = gets.strip
until input == "exit" do
  puts "What would you like to do?"
  input = gets.strip
    end
  end

  def list_songs
all_songs = Song.all
sorted_songs = all_songs.sort_by{|song| song.name}
sorted_songs.each.with_index(1) do |song, index|
  puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
end
  end


def list_artists
  all_artists = Artist.all
  sorted_artists = all_artists.sort_by{|artist| artist.name}
  sorted_artists.each.with_index(1) do |artist, index|
    puts "#{index}. #{artist.name}"
  end
end

def list_genres
  all_genres = Genre.all
  sorted_genres = all_genres.sort_by{|genre| genre.name}
  sorted_genres.each.with_index(1) do |genre, index|
    puts "#{index}. #{genre.name}"
  end
end

def list_songs_by_artist
  puts "Please enter the name of an artist:"
  input = gets.strip
  artist = Artist.find_by_name(input)
  if artist
  artist_songs = artist.songs
  sorted_song = artist_songs.sort_by{|song| song.name}
  sorted_song.each.with_index(1) do |song, index|
    puts "#{index}. #{song.name} - #{song.genre.name}"
    end
  end
end

def list_songs_by_genre
  puts "Please enter the name of a genre:"
    input = gets.strip
    genre = Genre.find_by_name(input)
    if genre
      genre_songs = genre.songs
      sorted_songs = genre_songs.sort_by{|song| song.name}
      sorted_songs.each.with_index(1) do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
      end
    end
end

def play_song
  puts "Which song number would you like to play?"
  input = gets.strip
  song = Song.find_by_name(input)
  if song
    puts "Playing #{song.name} by #{song.artist.name}"
end
end



end
