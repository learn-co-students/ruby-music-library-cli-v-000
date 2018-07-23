require 'music_importer'
require 'song'


class MusicLibraryController
  attr_reader :path
  
  def initialize(path="./db/mp3s")
    @path = path
    MusicImporter.new(path).import
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
    user_input = ''
    while user_input != 'exit' do 
      puts "What would you like to do?"
      user_input = gets.chomp
    end
  end 
  
  def list_songs
    Song.all.sort_by {|song| song.name}.each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  
end

# s_one = Song.create("Love NYC")
# s_two = Song.create("Las Vegas Heat")
# s_three = Song.create("I love LA")

# mc = MusicLibraryController.new("../db/mp3s")
# mc.list_songs





