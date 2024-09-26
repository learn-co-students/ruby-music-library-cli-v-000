require 'pry'
class MusicLibraryController
  attr_accessor

  def initialize(path='./db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    wassup
    music_library
    see_ya
  end

  def wassup
    puts "Whats the plan for today master?"
  end

  def music_library
    input = ""
    while input != "exit"
      input = gets.chomp

      case input
      when "list songs"
        list_songs
        puts "What would you like to do next?"
      when "list artists"
        list_artist
        puts "What would you like to do next?"
      when "list genres"
        list_genre
        puts "What would you like to do next?"
      when "play song"
        play_song
        puts "What would you like to do next?"
      when "list artist"
        list_artists_songs
        puts "What would you like to do next?"
      when "list genre"
        list_genres_songs
        puts "What would you like to do next?"
      when "exit"
        break
        puts "Your library is awesome!"
      else
        puts "Error! Enter another input"
      end
    end
  end

  def see_ya
    puts "Your music collection is pretty cool! See you later"
  end

  def list_songs
    Song.all.each_with_index {|item, index| puts "#{index+1}. #{item.artist.name} - #{item.name} - #{item.genre.name}"}
  end

  def list_artist
    Artist.all.each {|artist| puts artist.name}
  end

  def list_genre
    Genre.all.each {|genre| puts genre.name}
  end
  
  def play_song
    Song.all.each_with_index {|item, index| puts "Playing #{item.artist.name} - #{item.name} - #{item.genre.name}"}
  end
  
 def list_artists_songs
    input = gets.strip
    songs = Artist.find_by_name(input).songs
    songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
  
  def list_genres_songs
    input = gets.strip
    songs = Genre.find_by_name(input).songs
    songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

end