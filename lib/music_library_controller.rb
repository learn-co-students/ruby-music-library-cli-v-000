class MusicLibraryController

  INPUT_OPTIONS = ['list songs', 'list artists', 'list genres',
                  'list artist', 'list genre', 'play song', 'exit']

  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import
  end
  # Upon initialization, accepts an optional path to the
  # library of MP3 files, defaulting to ./db/mp3s/.
  # It should then instantiate a MusicImporter object,
  # which it will use to import songs from the specified library.

  def call

    input = ""

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
    
    call unless INPUT_OPTIONS.include?(input)
  end

end
