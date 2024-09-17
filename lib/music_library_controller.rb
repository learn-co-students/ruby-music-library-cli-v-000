require 'pry'

class MusicLibraryController

  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    new_music_library = MusicImporter.new(@path)
    new_music_library.import
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
    input = nil
    until input == "exit"
      input = gets
      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "play song"
        play_song
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      end
    end
  end

  def list_songs
    alphabetical_song_list = Song.all.sort_by {|song| song.name}
    alphabetical_song_list.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end



  def list_artists
    alphabetical_artist_list = Artist.all.sort_by {|artist| artist.name}
    alphabetical_artist_list.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    alphabetical_genre_list = Genre.all.sort_by {|genre| genre.name}
    alphabetical_genre_list.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    requested_artist = gets
    song_list = Song.all.select {|song| song.artist.name == requested_artist}
    song_list.sort_by! {|song| song.name}
    song_list.each_with_index do |song, index|
      puts "#{index + 1}. #{song.name} - #{song.genre.name}"
    end
  end

   def list_songs_by_genre
     puts "Please enter the name of a genre:"
     requested_genre = gets
     song_list = Song.all.select {|song| song.genre.name == requested_genre}
     song_list.sort_by! {|song| song.name}
     song_list.each_with_index do |song, index|
       puts "#{index + 1}. #{song.artist.name} - #{song.name}"
     end
   end

   def play_song
    puts "Which song number would you like to play?"
    song_number = gets.strip.to_i
    if (1..Song.all.length).include?(song_number)
      song = Song.all.sort {|a,b| a.name <=> b.name}[song_number - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

end
