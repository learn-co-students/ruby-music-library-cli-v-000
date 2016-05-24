require'pry'
class MusicLibraryController

  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    #input = gets loop until input == "exit"
    input = ""
    while input != "exit"
      puts "Hey, Welcome to Williams Music Controller"
      puts "What would you like to do?"
      input = gets.strip
      case input
    when "list songs"
      songs
    end
  end
  end

  def songs
    #binding.pry
    Song.all.each
  end



end