class MusicLibraryController
  attr_accessor :song

  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
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

    call unless input == "exit"
  end

  def list_songs
    list = Song.all.collect do | song |
        song.name.sort
        "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    list.each_with_index { |string, index | puts "#{index+1}. #{string}" }
  end

  # def list_songs
  #   list = Song.all.collect do | song |
  #       song.name
  #     end
  #   list.sort.each_with_index { |song, index | puts "#{index+1}. #{song}" }
  # end

end
