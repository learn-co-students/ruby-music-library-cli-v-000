# require 'pry'
class MusicImporter
  attr_accessor :path, :files, :song
  def initialize(path)
    @path = path
  end

  def files
    Dir.entries("#{path}").select{|filename| filename.include?("mp3")}
  end

  def import
    files.each do |filename|
      Song.create_from_filename(filename)
    end
  end
end

class MusicLibraryController
  attr_accessor :music_import
  def initialize(path = './db/mp3s')
    @music_import = MusicImporter.new(path).import
  end

  def call
    "Do you want to 'list songs', 'exit', 'list artists', play song"
    user_input = gets.strip


    if user_input == 'list songs'
      list_songs

      "Do you want to 'exit'"
      user_input = gets.strip
    elsif user_input == "play song"
      # puts "which song?"
      song_input = gets.strip
      i = song_input.to_i - 1

      puts "Playing #{Song.all[i].artist.name} - #{Song.all[i].name} - #{Song.all[i].genre.name}"

      "Do you want to 'exit'"
      user_input = gets.strip
    elsif user_input == "list artist"
      # puts "which song?"
      artist_input = gets.strip
      artist = Artist.find_by_name(artist_input)

      artist.songs.collect{|song| puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"}

      "Do you want to 'exit'"
      user_input = gets.strip

    elsif user_input == "list genre"
      genre_input = gets.strip
      genre = Genre.find_by_name(genre_input)

      genre.songs.collect{|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}

      "Do you want to 'exit'"
      user_input = gets.strip

    elsif user_input == "list artists"
      list_artists

      "Do you want to 'exit'"
      user_input = gets.strip

    elsif user_input == "list genres"
      list_genres

      "Do you want to 'exit'"
      user_input = gets.strip
    end

  end

  def list_songs
    Song.all.each do |song|
      puts "#{Song.all.index(song) + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.each{|artist| puts "#{artist.name}"}
  end

  def list_genres
    Genre.all.each{|genre| puts "#{genre.name}"}
  end


end
