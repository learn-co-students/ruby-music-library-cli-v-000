class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    puts "What do you want to do?"
    input = gets.chomp
    while input != "exit"
      if input == "list songs"
        counter = 1
        Song.all.each do |song|
          puts "#{counter}. #{song.artist} - #{song.name} - #{song.genre}"
          counter += 1
        end
      else
        puts "Invalid command."
        input = gets.chomp
      end
    end
  end
end
