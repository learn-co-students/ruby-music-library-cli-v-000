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
  Song.all.sort {|a,b| a.artist.name <=> b.artist.name }.each_with_index do |song,index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
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
  input=gets.chomp.to_i
  Song.all.sort {|a,b| a.artist.name <=> b.artist.name }.each_with_index do |song,index|
    if input == index + 1
      puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
end

def list_artist
 artist=gets.chomp
 artist = Artist.find_by_name(artist)
   artist.songs.each do |song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
end
end

def list_genre
  genre=gets.chomp
  genre=Genre.find_by_name(genre)
  genre.songs.each do |song|  puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end

end
