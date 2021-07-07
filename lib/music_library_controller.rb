require 'pry'

class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    new_MI_object = MusicImporter.new(path)
    new_MI_object.import
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
    
    input = ""
    until input == 'exit'
    input = gets.strip
    
    case input
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
    look_at_all_songs_in_CLI = Song.all
    alphabetized_songs = look_at_all_songs_in_CLI.sort! { |a, b| a.name <=> b.name }
    remove_duplicates = alphabetized_songs.uniq

    counter = 0
    remove_duplicates.each do |each_song|
      puts "#{counter += 1}. #{each_song.artist.name} - #{each_song.name} - #{each_song.genre.name}"
    end

    # binding.pry
    # # array = look_at_all_songs_in_CLI.split(' - ')
    # # hash_song_data = Hash[array.map {|asg| asg.split(' - ') }]
    # # name = {:artist_name => Artist.name, :song_name => Song.name, :genre_name +> Genre.name}
    
  end

  def list_artists
    Artist.all.sort {|a, b| a.name <=> b.name}.each.with_index(1) {|artist, index| puts "#{index}. #{artist.name}"}
  end

  def list_genres
    unsorted_genres = Genre.all
    sorted_genres = unsorted_genres.sort_by{ |genre| genre.name}
    counter = 1 
    sorted_genres.uniq.each do |genre|
      puts "#{counter}. #{genre.name}" 
      counter += 1
    end 
  end 

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name_input = gets.strip
    artist = Artist.find_by_name(artist_name_input)

    if artist != nil 
      artist_songs = artist.songs.sort_by {|s| s.name}
      counter = 1
      artist_songs.each {|s| puts "#{counter}. #{s.name} - #{s.genre.name}"
        counter += 1 
      }
    end
  end 

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name_input = gets.strip
    genre = Genre.find_by_name(genre_name_input)

    if genre != nil 
      genre_songs = genre.songs.sort_by {|s| s.name}
      counter = 1
      genre_songs.each {|s| puts "#{counter}. #{s.artist.name} - #{s.name}"
        counter += 1 
      }
    end
  end 

  def play_song 
    puts "Which song number would you like to play?"
   
    input = gets.strip.to_i
      if (1..Song.all.length).include?(input)
        song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
      end

    puts "Playing #{song.name} by #{song.artist.name}" if song
  end

end
