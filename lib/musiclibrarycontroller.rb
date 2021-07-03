class MusicLibraryController
  attr_accessor :path

  def initialize(path='./db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def call
    input = gets.strip
    if input != exit
    puts "Welcome to your music library!"
  end
  end

end
