require 'pry'

class MusicLibraryController
  attr_accessor :path

def initialize(path='./db/mp3s')
  @path=path
  music_importer=MusicImporter.new(path)
  music_importer.import
end

def call
  input= " "
  while input != "exit"
    puts "What would you like to do?"
    input = gets.chomp
    case input
  when "list songs"
      songs
    when
      "list artists"
      artists
    when
      "list genres"
        genres
    when
      "list artist"
    list_artist
    when
      "list genre"
      list_genre
    when
      "play song"
    play_song
  end
end
end

def songs
  Song.all.sort {|a,b| b.name <=> a.name }.each_with_index do |song,index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end

def artists
  Artist.all.each do |artist| puts "#{artist.name}"
  end
end

def genres
  Genre.all.each do |genre| puts "#{genre.name}"
  end
end

def play_song
  puts "Please select a song number:"
  input=gets.chomp.to_i
  Song.all.each_with_index do |song,index|
    if input == index + 1
      puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
end

def list_artist
 puts "Please select an artist"
 artist=gets.chomp
 artist = Artist.find_by_name(artist)
   artist.songs.each do |song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
end
end

def list_genre
  puts "Please select a genre"
  genre=gets.chomp
  genre=Genre.find_by_name(genre)
  genre.songs.each do |song|  puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end

end
