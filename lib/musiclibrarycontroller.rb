require 'pry'
require_relative './song'
require_relative './artist'
require_relative './genre'
require_relative './musicimporter'
#extend import
class MusicLibraryController
  #include Song.all
  attr_accessor :path, :counter
  def initialize (path="./db/mp3s")
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import
  end
  def call
    #puts "hi, whatever..."
    #puts "want list of songs? Enter 'list songs' to receive all songs. Enter 'exit' to exit program"
    name = gets.strip
    #binding.pry
    if name == "list songs"
      Song.all.each_with_index do|song, i|
      indexplusone = i + 1
      puts "#{indexplusone}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      #binding.pry
      end
      #binding.pry
      #Song.all.sort
    call
    elsif name == "list artists"
      Song.all.each_with_index do|song, i|
      indexplusone = i + 1
      puts "#{indexplusone}. #{song.artist.name}"
      #binding.pry
      end
    call
  elsif name == "list genres"
    Song.all.each_with_index do|song, i|
    indexplusone = i + 1
    puts "#{indexplusone}. #{song.genre.name}"
    #binding.pry
    end
  call
  elsif name == "play song"
    #puts "which song number?"
    song_number = gets.chomp.to_i - 1
    #binding.pry
    song = Song.all[song_number]
    #no need to iterate. rem to use [] to access value
    #of the array
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  call
  elsif name == "list artist"
    artist_name = gets.chomp
    #songs_collection=(Song.all)
    artist = Artist.all.find {|artist| artist.name == artist_name}
    artist.songs.each do |song|
      puts "#{artist.name} - #{song.name} - #{song.genre.name}"
    end
    call
  elsif name == "list genre"
    genre_name = gets.chomp
    #songs_collection=(Song.all)
    genre = Genre.all.find {|genre| genre.name == genre_name}
    artist = Artist.all.find {|artist| artist == genre.artists}
    genre.songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    call
    elsif name == "exit"
      puts "goodbye"
    else
      puts "invalid choice"
      call
    end
  end
end
