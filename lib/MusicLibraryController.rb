class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    music = MusicImporter.new(path)
    music.import
  end

  def call
    input = ""
    unless input == "exit"
      input = gets
      puts "Welcome to .. Please choose!"
      case input
      when "list songs"
        list_songs
      end
    end
  end

  def list_songs
    index_number = 1
    Song.all.each do |song|
      puts "#{index_number}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      index_number += 1
    end
  end

end
