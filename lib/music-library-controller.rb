class MusicLibraryController
  #class methods
  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  #instance methods
  def call
    input = ""
    while input != "exit"
      puts "What would you like to do? (type 'options' for a list of options)"
      input = gets.chomp
      case input
      when "options"
        puts "Your options are: list songs,"
      when "list songs"
          songs
      end
    end
  end

  #helper methods
  def songs
    Song.all.each_with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
end
