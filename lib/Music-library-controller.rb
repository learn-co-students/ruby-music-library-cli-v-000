require "pry"
class MusicLibraryController

  attr_reader :path, :imported, :song_array #, :list_songs


  def initialize(path='./db/mp3s')
    @imported = MusicImporter.new(path)
    @imported.import
  end

  def call
      input = ""
      while input != "exit"
        puts "Welcome to your music library!"
        puts "what would you like to do?"
        input = gets.chomp
        case input
        when "list songs"
          list_songs
        end
      end
    end

    def list_songs
      song_array = @imported.import
      song_array.each.with_index(1) {|song, index| print  "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name} " }
    end



end
