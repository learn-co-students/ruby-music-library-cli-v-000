class MusicLibraryController
  attr_reader :path

  def initialize(path="./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    puts "What would you like to see?"
    gets.chomp
  end

end