require 'pry'

class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = ""
    until input == "exit"
      input = gets
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
        puts "Goodbye" 
      end
    end
  end

  def list_songs
    Song.all.each_with_index {|song,index|puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    Artist.all.each {|artist| puts artist.name}
  end

  def list_genres
    Genre.all.each {|genre| puts genre.name}
  end

  def play_song
    song = Song.all[gets.to_i - 1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_artist
    specific_artist = gets
    puts Artist.find_by_name(specific_artist).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_genre
    specific_genre = gets
    puts Genre.find_by_name(specific_genre).songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

end