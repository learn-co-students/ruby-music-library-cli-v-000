class MusicLibraryController
  attr_accessor :path
  
  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    puts "Enter yo info!"
    input = gets.chomp
    while input != "exit"
      puts "Wrong info fool!"
      input = gets.chomp
    end
  end
end