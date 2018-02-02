class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    object = MusicImporter.new(path)
    object.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets.strip
    if input != "exit"
      call
    else
    end
  end

  def list_songs
    sorted_songs = []
    Song.all.sort_by! {|song| song.name}.each_with_index do |song, position|
        puts "#{position+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end


end
