require 'pry'

class MusicLibraryController
  def initialize(path = "./db/mp3s" )
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
    puts "What would you like to do?"
    input = gets.chomp

    #CLI Prompt Methods
    case input
      when "list songs"
        list_songs
      when "list genres"
        list_genres
      when "list artist"
        list_artist
      when "play song"
        play_song
      end
      call if input != "exit"
  end

  def list_songs
    Song.all.each_with_index do |song, index|
      song.sort{|x,y| x.name <=> y.name}
      value = index + 1
      puts "#{value}. #{song}"
      value += 1
      binding.pry
    end
  end







end
