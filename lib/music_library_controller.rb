require 'pry'

class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end


  def call
    user_input = ""

    while user_input != "exit"
      user_input = gets.strip

      case user_input
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
      end 
    end
  end


  def list_songs
    Song.all.each_with_index{|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    Song.all.each{|song| puts "#{song.artist.name}"}
  end

  def list_genres
    Song.all.each{|song| puts "#{song.genre.name}"}
  end

  def play_song
    puts "Please pick a track"
    track = gets.strip.to_i
    puts "Playing #{Song.all[track - 1].artist.name} - #{Song.all[track- 1].name} - #{Song.all[track - 1].genre.name}"
  end

  def list_artist
    puts "Please pick an Artist"
    artist = gets.strip
    Song.all.each{|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" if song.artist.name == artist}
  end

  def list_genre
    puts "Please pick a Genre"
    genre = gets.strip
    Song.all.each{|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" if song.genre.name == genre}
  end


end
