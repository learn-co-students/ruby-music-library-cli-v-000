require "pry"
class MusicLibraryController

  attr_reader :path, :imported, :song_array


  def initialize(path='./db/mp3s')
    @imported = MusicImporter.new(path).import
  end



  def call
    input = ""
    while input != "exit"
      #puts "Welcome to your music library!"
      #puts "what would you like to do?"
      input = gets.chomp
      case input
      when "list songs"
          song_array = @imported
          song_array.each.with_index(1) {|song, index| print  "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name} " }
      end

    end
  end



end
