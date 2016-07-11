require 'pry'


class MusicLibraryController

  attr_accessor :path

  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
    @path = path
  end

  def call
    puts "Hi! Welcome to your Music Library!"
    puts "What would you like to do? Please select from the following:"
    input = ""
    until input == "exit" do
      puts "'list songs', 'list artists', 'list genres' 'list artists songs',"
      puts "'list songs in a certain genre', 'play song'"
      input = gets.chomp
    
    case input
    when "list songs"
      songs
    when  "list artists"
      artists
    when "list genres"
      genres
    when "play song"
      play_song
    when "list artists songs"
      artists_songs
    when "list songs in a certain genre"
      genre_songs
      end
    end               
  end

  def songs
    list_songs = Song.all.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
    list_songs 
  end

  def artists
    list_artists = Artist.all.each {|artist| puts artist.name}
  end

  def genres
    list_genres = Genre.all.each {|genre| puts genre.name}
  end

  def play_song
    puts "Please select song number."
    song_number = gets.chomp.to_i
    song = Song.all[song_number - 1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end



end












