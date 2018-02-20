class MusicLibraryController
attr_accessor :path, :imported_music
  def initialize(path = './db/mp3s')
    #@path = path
    music_importer = MusicImporter.new(path)
    @imported_music = music_importer.import
  end

  def call
    user_input = ''
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    until user_input == 'exit'
      user_input = gets
    end
  end

end
