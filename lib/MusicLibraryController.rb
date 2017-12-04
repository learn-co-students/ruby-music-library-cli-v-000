class MusicLibraryController
attr_accessor :path,:filenames,:title

def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

def call
  puts "Welcome to your music library!"
  puts "To list all of your songs, enter 'list songs'."
  puts "To list all of the artists in your library, enter 'list artists'."
  puts "To list all of the genres in your library, enter 'list genres'."
  puts"To list all of the songs by a particular artist, enter 'list artist'."
  puts"To list all of the songs of a particular genre, enter 'list genre'."
  puts"To play a song, enter 'play song'."
  puts"To quit, type 'exit'."
  puts"What would you like to do?"
  if "exit"
    4.times{path = gets("a", "b", "c", "exit")}

  end
end


end
# CLI
# Greet the user.
# Ask the user for input.
# Capture and store that input.
# Do something with that input.
