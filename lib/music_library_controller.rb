class MusicLibraryController
  attr_accessor :path
  MENU = ["Welcome to your music library!",
          "To list all of your songs, enter 'list songs'.",
          "To list all of the artists in your library, enter 'list artists'.",
          "To list all of the genres in your library, enter 'list genres'.",
          "To list all of the songs by a particular artist, enter 'list artist'.",
          "To list all of the songs of a particular genre, enter 'list genre'.",
          "To play a song, enter 'play song'.",
          "To quit, type 'exit'.",
          "What would you like to do?"]

  def initialize(path='./db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def call
    command = " "
    while command != "exit"
      MENU.each{|message| puts "#{message}"} #I like to see the menu after each input
      command = gets.chomp.downcase
      case command
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
        puts "To list songs by genre, enter 'list genre'"
      when "play song"
        play_song
      when "h"
          MENU.each_with_index{|message, ind| puts "#{message}" if ind != MENU.length-1}
      end
    end
  end

  def list_songs
    Song.list_by_name{|obj,ind| puts "#{ind+1}. #{obj.artist.name} - #{obj.name} - #{obj.genre.name}"}
  end

  def list_artists
    Artist.list_by_name{|obj,ind| puts "#{ind+1}. #{obj.name}"}
  end

  def list_genres
    Genre.list_by_name{|obj,ind| puts "#{ind+1}. #{obj.name}"}
  end

  def list_songs_by_artist
    target = ask_for_input("Please enter the name of an artist:")
    obj = Artist.find_by_name(target)
    Artist.list_songs_from(obj){|obj,ind| puts "#{ind+1}. #{obj.name} - #{obj.genre.name}"} if obj
  end

  def list_songs_by_genre
    target = ask_for_input("Please enter the name of a genre:")
    obj = Genre.find_by_name(target)
    Genre.list_songs_from(obj){|obj,ind| puts "#{ind+1}. #{obj.artist.name} - #{obj.name}"} if obj
  end

  def play_song
    target = ask_for_input("Which song number would you like to play?").to_i
    if target > 0 && target < Song.all.length
      Song.list_by_name do |obj,ind|
        if ind == target - 1
          puts "Playing #{obj.name} by #{obj.artist.name}"
        end
      end
    end
  end

  def ask_for_input(message)
    puts "#{message}"
    target = gets.chomp
  end

end
