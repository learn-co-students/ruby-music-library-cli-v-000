#require "pry"

class MusicLibraryController
  attr_accessor :path, :music_importer, :files

  def initialize(path='./db/mp3s')
    @music_importer=MusicImporter.new(path)
    @music_importer.import
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

    enter=""
    while enter!='exit' do
      enter=gets
      puts "You entered: #{enter="exit"}"
      case enter
      when "list songs"
        list_songs
       end
    end
  end
  require 'pry'


  def list_songs
    binding.pry
    songs= @files.collect{|filename|
      filename.split(/\s-\s/)[1]}.sort
      #puts "Songs! #{songs}"

    songs.each_with_index do |index,song|
      binding.pry
      puts "#{index}. #{song}"
      songs
    end

  end

end
