require 'pry'
class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s' )
    MusicImporter.new(path).import
  end

  def call
    user_input = ""
    until user_input == "exit"
      puts("Welcome to your music library!")
      puts("To list all of your songs, enter 'list songs'.")
      puts("To list all of the artists in your library, enter 'list artists'.")
      puts("To list all of the genres in your library, enter 'list genres'.")
      puts("To list all of the songs by a particular artist, enter 'list artist'.")
      puts("To list all of the songs of a particular genre, enter 'list genre'.")
      puts("To play a song, enter 'play song'.")
      puts("To quit, type 'exit'.")
      puts("What would you like to do?")

      user_input = gets.chomp


      case user_input
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
      when "play song"
        play_song
      end
    end
  end

  def list_songs
    Song.all.uniq.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
      puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort{ |a, b| a.name <=> b.name}.each.with_index(1) do |a, i|
      puts "#{i}. #{a.name}"
    end
  end

  def list_genres
    Genre.all.sort{ |a, b| a.name <=> b.name}.each.with_index(1) do |g, i|
      puts "#{i}. #{g.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.strip
    artist = Artist.find_by_name(user_input)
      if artist
        then
          artist.songs.sort{ |a, b| a.name <=> b.name}.each.with_index(1) do |s, i|
            puts "#{i}. #{s.name} - #{s.genre.name}"
        end
      end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.strip
    genre = Genre.find_by_name(user_input)
      if genre
        then
        genre.songs.sort{ |a, b| a.name <=> b.name}.each.with_index(1) do |s, i|
        puts "#{i}. #{s.artist.name} - #{s.name}"
      end
    end
  end

  def play_song
    #prompts user to choose a song
    #receives user input
    #select song from song list
    #puts playing 'song name' by 'song artist'
    #does not 'puts' if song is not found
    puts "Which song number would you like to play?"
    user_input = gets.strip.to_i
    sorted_list = Song.all.uniq.sort{ |a, b| a.name <=> b.name }
    if sorted_list[user_input-1] && user_input.between?(1, sorted_list.count)
      then
        song = sorted_list[user_input-1]
        puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

end
