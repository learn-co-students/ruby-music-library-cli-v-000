class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = ""
    while input != "exit"
      puts "What do you want to do?"
      input = gets.strip
      case input
      when "list songs"
        counter = 1
          Song.all.each do |song|
            puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
            counter += 1
          end
      when "list artists"
        puts "artists"
      end
    end
  end

end
