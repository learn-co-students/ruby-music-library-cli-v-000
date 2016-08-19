require "pry"
class MusicLibraryController

  attr_reader :path

  def initialize(path='./db/mp3s')
    new = MusicImporter.new(path)
    new.import

  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to your music library!"
      puts "what would you like to do?"
      input = gets.chomp
      case input
      when "list songs"
        songs
      end

    end
  end



end
