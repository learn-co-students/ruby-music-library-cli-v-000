#require_relative '../lib/music_importer'
require 'pry'

class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    puts "Please enter the path to the music's folder"
    input = gets.chomp
    #binding.pry
    if input != "exit"
      MusicLibraryController.new(input)
    else
      call
    end
  end
end
