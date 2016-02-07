require 'pry'

class MusicLibraryController

  attr_accessor :path

  def initialize path="./db/mp3s"
    @path = path
    music_importer = MusicImporter.new(@path).import
  end

  def call
    puts "What do you want to do?"
    puts "list songs"
    puts "list artists"
    puts "list genres"
    puts "play song"
    puts "list artist"
    puts "list genre"
    puts "exit"
    action = gets
    if action == "list songs"
      Song.all.each_with_index {|song, i| puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
      action = gets
    elsif action =="list artists" 
      Artist.all.each {|artist| puts artist.name}
      action = gets
    elsif action =="list genres" 
      Genre.all.each {|genre| puts genre.name}
      action=gets
    elsif action =="play song" 
      puts "what song do you want to play?"
      Song.all.each_with_index {|song, i| puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
      song = gets.chomp!.to_i
      puts "Playing #{Song.all[(song)].artist.name} - #{Song.all[song].name} - #{Song.all[song].genre.name}"
      action = gets
    elsif action == "list artist"
      artist = gets
      Song.all.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" if song.artist.name == artist }
      action = gets
    elsif action == "list genre"
      genre = gets
      Song.all.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" if song.genre.name == genre }
      action = gets
    elsif action == "exit"
      nil 
    end
  end
end
