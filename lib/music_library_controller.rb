require_relative '../config/environment.rb'

class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    music_importer = MusicImporter.new(path)
    music_importer.import

  end

  def call
    puts "Welcome to the music controller"
    loop do
      puts "Please enter one of the following: list songs, list artists, list genres, play song, list artist, list genre"
      input = gets.chomp

      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "play song"
        play_song
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      when "exit"
        break
      end

  end
end

  def list_songs
    Song.all.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    Artist.all.each {|artist| puts "#{artist.name}"}
  end

  def list_genres
    Genre.all.each {|genre| puts "#{genre.name}"}
  end

  def play_song
    Song.all.each {|song| puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artist
    puts "Enter an artist: "
    artist_input = gets.chomp
    artist = Artist.find_by_name(artist_input)
    artist.songs.each {|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
  end

  def list_genre
    puts "Enter a genre: "
    genre_input = gets.chomp
    genre = Genre.find_by_name(genre_input)
    genre.songs.each {|s| puts "#{s.artist.name} - #{s.name} - #{s.genre.name}"}
  end

end
