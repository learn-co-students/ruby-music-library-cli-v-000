require 'pry'
class MusicLibraryController


def initialize(path = "./db/mp3s")
  MusicImporter.new(path).import
end

def call
loop do
puts "Welcome to your music library!"
puts "To list all of your songs, enter 'list songs'."
puts "To list all of the artists in your library, enter 'list artists'."
puts "To list all of the genres in your library, enter 'list genres'."
puts "To list all of the songs by a particular artist, enter 'list artist'."
puts "To list all of the songs of a particular genre, enter 'list genre'."
puts "To play a song, enter 'play song'."
puts "To quit, type 'exit'."
puts "What would you like to do?"
choice = gets.strip
if choice == 'list songs'
  self.list_songs
elsif choice == 'list artists'
  self.list_artists
elsif choice == 'list genres'
  self.list_genres
elsif choice == 'list artist'
  self.list_songs_by_artist
elsif choice == 'list genre'
  self.list_songs_by_genre
elsif choice == 'play song'
  self.play_song
elsif choice == 'exit'
  break
end
end
end

def list_songs
Song.all.sort_by{|x| x.name}.each_with_index do |song,index|
    puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end

def list_artists
  Artist.all.sort_by{|x| x.name}.each_with_index do |artist,index|
      puts "#{index+1}. #{artist.name}"
    end
  end

def list_genres
  Genre.all.sort_by{|x| x.name}.each_with_index do |genre,index|
      puts "#{index+1}. #{genre.name}"
    end
  end

def list_songs_by_artist
puts "Please enter the name of an artist:"
choice = gets.strip
Artist.all.each do |x|
  if x.name == choice
    x.songs.sort_by{|x| x.name}.each_with_index do |song,index|
    puts "#{index+1}. #{song.name} - #{song.genre.name}"
  end
end
end
end

def list_songs_by_genre
puts "Please enter the name of a genre:"
choice = gets.strip
Genre.all.each do |x|
  if x.name == choice
    x.songs.sort_by{|x| x.name}.each_with_index do |song,index|
    puts "#{index+1}. #{song.artist.name} - #{song.name}"
  end
end
end
end


def play_song
  puts "Which song number would you like to play?"
  choice = gets.strip.to_i
  Song.all.sort_by{|x| x.name}.each do |y|
    if Song.all.sort_by{|x| x.name}[choice-1] == y && choice.between?(1,Song.all.count)
      puts "Playing #{y.name} by #{y.artist.name}"
    end
  end
end


















end
