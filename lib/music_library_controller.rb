class MusicLibraryController

  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = nil
    while input != "exit"
      puts "Welcome to Your Music Library!"
      puts "What would you like to do?"
      input = gets.chomp.strip
      if input == "list songs"
        Song.all.each.with_index(1) do |sng, index|
          puts "#{index}. #{sng}"
        end
      end
    end
  end
end
