require 'pry'

class MusicLibraryController

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

    input = ""
    while input != "exit"
      input = gets.chomp
      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists
      elsif input == "list genres"
        list_genres
      elsif input == "list artist"
        list_songs_by_artist
      elsif input == "list genre"
        list_songs_by_genre
      elsif input == "play song"
        play_song
      end
    end
  end


  def list_songs
    Song.all.sort_by! {|song| song.name}
    Song.all.collect.with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      #binding.pry
    end
  end

  def list_artists
    Artist.all.sort_by! {|artist| artist.name}
    Artist.all.uniq.each_with_index {|artist, index| puts "#{index+1}. #{artist.name}"}
  end

  def list_genres
    Genre.all.sort_by! {|genre| genre.name}
    Genre.all.uniq.each_with_index {|genre, index| puts "#{index+1}. #{genre.name}"}
  end

  def list_songs_by_artist
    intro = puts "Please enter the name of an artist:"
    input = gets.chomp
    artist = Artist.find_by_name(input)
    if Artist.all.include?(artist) != true
      intro
    else
      artist.songs.sort_by! {|song| song.name}
      artist.songs.each_with_index do |song, index|
        puts "#{index+1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    intro = puts "Please enter the name of a genre:"
    input = gets.chomp
    genre = Genre.find_by_name(input)
    if Genre.all.include?(genre) != true
      intro
    else
      genre.songs.sort_by! {|song| song.name}
      genre.songs.each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    intro = puts "Which song number would you like to play?"
    input = gets.chomp
    if input.to_i > 0 && input.to_i <= Song.all.count
      song = Song.all.sort_by {|song| song.name}[input.to_i-1]
    end
    puts "Playing #{song.name} by #{song.artist.name}" if song
  end



end
