require 'pry'
class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    puts "Make a selection:"
    input = gets.chomp

    if input == "list songs"
      Song.all.each_with_index{|s,i| puts "#{i.to_i + 1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
    elsif input == "list artists"
      Song.all.each_with_index{|s,i| puts "#{i.to_i + 1}. #{s.artist.name}"}
    elsif input == "list genres"
      Song.all.each_with_index{|s,i| puts "#{i.to_i + 1}. #{s.genre.name}"}
    elsif input == "play song"

    elsif input == "list artist"

    elsif input == "list genre"

    end

  #  binding.pry
    call unless input == "exit"
  end

end
