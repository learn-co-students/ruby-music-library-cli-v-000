class MusicLibraryController

def initialize(path = "./db/mp3s")
  importer = MusicImporter.new(path)
  importer.import
end

def call
    input = ""
  while input != "exit"
    puts "Welcome to your music library!"
    puts "What would you like to do?"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
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
Song.all.sort{|a, b| a.name<=>b.name}.each_with_index{|song, number| puts "#{number += 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
end

def list_artists
 Artist.all.sort{|a, b| a.name <=> b.name}.each_with_index{|artist, number| puts "#{number += 1}. #{artist.name}"}
end

def list_genres
  Genre.all.sort{|a, b| a.name <=> b.name}.each_with_index{|genre, number| puts "#{number += 1}. #{genre.name}"}
end


def list_songs_by_artist
  input = ""
  puts "Please enter the name of an artist:"
  input = gets.strip
  number = 1
  song_list = Song.all.sort{|a, b| a.name<=>b.name}
  song_list.each do |song|
    if input == song.artist.name
    puts "#{number}. #{song.name} - #{song.genre.name}"
    number += 1
    end
  end
end

def list_songs_by_genre
  input = ""
  puts "Please enter the name of a genre:"
  input = gets.strip
  number = 1
  song_list = Song.all.sort{|a, b| a.name<=>b.name}
  song_list.each do |song|
    if input == song.genre.name
      puts "#{number}. #{song.artist.name} - #{song.name}"
      number += 1
    end
  end
end

def play_song
  input = ""
  puts "Which song number would you like to play?"
  input = gets.strip.to_i
    if (1..Song.all.length).include?(input)
      song = Song.all.sort{|a, b| a.name<=>b.name}[input - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end




  ###
end
