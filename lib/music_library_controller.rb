require 'pry'

class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
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

    user_input = gets.chomp


    until user_input == 'exit'
      if user_input == 'list songs'
        list_songs
      elsif user_input == 'list artists'
        list_artists
      elsif user_input == 'list genres'
        list_genres
      elsif user_input == 'list artist'
        list_songs_by_artist
      elsif user_input == 'list genre'
        list_songs_by_genre
      elsif user_input == 'play song'
        play_song
      end
      user_input = gets.chomp 
    end
  end

  def list_songs
    song_list = Song.all.sort_by {|song| song.name}
    song_list.each.with_index(1) do |s, i|
      puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists
    artist_list = Artist.all.sort_by {|artist| artist.name}
    artist_list.each.with_index(1) do |a, i|
      puts "#{i}. #{a.name}"
    end
  end

  def list_genres
    genre_list = Genre.all.sort_by {|genre| genre.name}
    genre_list.each.with_index(1) do |g, i|
      puts "#{i}. #{g.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets
    if Artist.find_by_name(input)
      Artist.find_by_name(input).songs.sort_by {|song| song.name}.each.with_index(1) do |s, i|
        puts "#{i}. #{s.name} - #{s.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_input = gets
    if Genre.find_by_name(genre_input)
      Genre.find_by_name(genre_input).songs.sort_by{|song| song.name}.each.with_index(1) do |s, i|
        puts "#{i}. #{s.artist.name} - #{s.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"

    song_input = gets.to_i
    song_list = Song.all.sort_by {|song| song.name}
    if song_input > 0 && song_input <= song_list.size
      puts "Playing #{song_list[song_input - 1].name} by #{song_list[song_input - 1].artist.name}"
    end

  end


end
