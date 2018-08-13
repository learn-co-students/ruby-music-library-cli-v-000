class MusicLibraryController
  attr_reader :path 
  def initialize(path = "./db/mp3s")
    @path = path
    importer = MusicImporter.new(path).import
  end
  
  def call
    input = gets.strip
    until input == exit
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    input = gets.strip 
    end 
  end 
end 