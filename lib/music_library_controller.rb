class MusicLibraryController
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your music library! Please enter your command: \n'list songs' \n'list artists' \n'list genres' \n'exit' "
    input = gets.strip
  end
end