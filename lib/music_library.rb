class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    music = MusicImporter.new(path)
    music.import

  end

  def call()
    puts "What would you like to do?"
    option=gets.chomp

    case option.downcase
    when "list songs"
      list_songs
    when "exit"
      #
    end
  end

  def list_songs()
    Song.all.each_with_index {|song, i| puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

end