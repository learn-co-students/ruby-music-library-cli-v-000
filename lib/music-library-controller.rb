class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    user_input = ""

    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"


    while user_input != 'exit'
      user_input = gets.strip
      self.list_songs if user_input == 'list songs'
      self.list_artists if user_input == 'list artists'
      self.list_genres if user_input == 'list genre'
      self.play_song if user_input == 'play song'


    end
  end
end
