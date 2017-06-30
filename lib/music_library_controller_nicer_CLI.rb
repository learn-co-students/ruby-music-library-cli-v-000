class MusicLibraryControllerFancy
  attr_accessor :path
  MENU = [" ---------------------------------------------------------------------",
          "|                  Welcome to your music library!                     |",
          "|---------------------------------------------------------------------",
          "|To list all of your songs, enter 'list songs'.                       |",
          "|To list all of the artists in your library, enter 'list artists'.    |",
          "|To list all of the genres in your library, enter 'list genres'.      |",
          "|To list all of the songs by a particular artist, enter 'list artist'.|",
          "|To list all of the songs of a particular genre, enter 'list genre'.  |",
          "|To play a song, enter 'play song'.                                   |",
          "|To quit, type 'exit'.                                                |",
          " ---------------------------------------------------------------------",
          "|               >>> What would you like to do? <<<                    |",
          " ---------------------------------------------------------------------",]

  def initialize(path='./db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def call
    command = " "
    MENU.each{|message| puts "#{message}"}
    while command != "exit"
      command = gets.chomp.downcase
      case command
      when "list songs"
        list_songs
      when "list artists"
        list_artists
        puts MENU[4]
      when "list genres"
        list_genres
        puts MENU[5]
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      when "h"
        puts MENU[0]
          MENU.each_with_index{|message, ind| puts "#{message}" if ind > 2 }
       else
        puts "Please enter a valid command :)"
      end
       if command != "h"
          puts MENU[0]
          puts MENU[9]
          puts "|Enter 'h' for the help menu, 'exit' to exit                          |"
          puts MENU[0]
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
    list_songs
    target = ask_for_input("Which song number would you like to play?").to_i
    if target > 0 && target < Song.all.length
      Song.list_by_name do |obj,ind|
        if ind == target - 1
          puts "\nPlaying #{obj.name} by #{obj.artist.name}\n"
        end
      end
    end
  end

  def ask_for_input(message)
    puts "#{message}"
    target = gets.chomp
  end

end
