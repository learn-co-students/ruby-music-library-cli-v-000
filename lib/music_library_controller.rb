require 'pry'
class MusicLibraryController

  attr_accessor :path

  def initialize(file_path = "./db/mp3s")
    importer = MusicImporter.new(file_path)
    importer.import
  end

  def call
    MusicLibraryController.new
    loop do
      puts "Please input information. When done type 'exit'."
      break if gets.chomp == "exit"
    end

  end
end
