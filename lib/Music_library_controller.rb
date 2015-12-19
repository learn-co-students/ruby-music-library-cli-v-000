# require_relative "../config/environment.rb"

class MusicLibraryController
  attr_accessor :path


  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
    
    
    # call
  end

  def call
    puts "Heya. To use the default library, press any key. To import your own, enter it now. To exit, type 'exit.'"
    input = gets.strip.downcase
      if input == "exit"
        puts "WHAT DO YOU WANT FROM ME"
      elsif input == ".*"
        MusicImporter.new(input).import
        MusicLibraryCLI.new
      else
        MusicLibraryCLI.new
      end
    
  end



end