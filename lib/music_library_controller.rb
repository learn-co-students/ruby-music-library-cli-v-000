require 'pry'
class MusicLibraryController

  attr_accessor :path

  def initialize(file_path = "./db/mp3s")
    importer = MusicImporter.new(file_path)
    importer.import
  end

  def call
    user_input = " "
    while user_input != "exit"
      puts "Please input information. When done type 'exit'."
      user_input = gets.chomp
      case user_input
      when "list songs"
        
      end
    end

  end
end
