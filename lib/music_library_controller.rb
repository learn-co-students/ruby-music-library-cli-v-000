require 'pry'
class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    #puts "Make a selection:"
    input = gets.chomp

    if input == "list songs"
      #binding.pry
      Song.all.each_with_index{|s,i| puts "#{i.to_i + 1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}

    elsif input == "list artists"
      Song.all.each_with_index{|s,i| puts "#{i.to_i + 1}. #{s.artist.name}"}

    elsif input == "list genres"
      Song.all.each_with_index{|s,i| puts "#{i.to_i + 1}. #{s.genre.name}"}

    elsif input == "play song"
      #puts "enter song number"
      input = gets.chomp.to_i
      s = Song.all[input - 1]
      puts "Playing #{s.artist.name} - #{s.name} - #{s.genre.name}"

    elsif input == "list artist"
      #puts "enter artist"
      input = gets.chomp
      a = Artist.find_by_name(input)
      a.songs.each do |song|
        puts "#{a.name} - #{song.name} - #{song.genre.name}"
      end

    elsif input == "list genre"
      #puts "enter genre"
      input = gets.chomp
      g = Genre.find_by_name(input)
      g.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end

  #  binding.pry
    call unless input == "exit"
  end

end
