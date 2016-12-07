class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    puts "Welcome to your Music Library!"
    puts "What would you like to do?"

    while input != "exit"
      input = gets.strip
    end #while
  end #call



end #class
