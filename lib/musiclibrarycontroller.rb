class MusicLibraryController

  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end



  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    answer = gets.strip
    unless answer == exit
      puts "Please enter some input"
    end
  end

end
