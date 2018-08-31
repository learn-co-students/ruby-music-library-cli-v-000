require 'pry'
class MusicLibraryController
  attr_accessor :path
  attr_reader :artist, :song, :genre

  def initialize(path = "./db/mp3s")
    controller = MusicImporter.new(path)
    controller.import
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
    # until gets.strip == "exit"
    #   gets.strip
    #   call
    gets.strip
    if gets.strip != "exit" then call
    end
  end

  def list_songs
    songlist = []
    Song.all.each {|song_in_list| songlist << song_in_list}
    songlist.sort_by! {|song_in_list| song_in_list.name}
    songlist.each_with_index do |song_in_list, index|
        puts "#{index + 1}. #{song_in_list.artist.name} - #{song_in_list.name} - #{song_in_list.genre.name}"
    end
  end

  def list_artists
    artist_list = []
    Artist.all.each {|artist_entry| artist_list << artist_entry}
    artist_list.sort_by! {|artist| artist.name }
    artist_list.each_with_index {|artist, index| puts "#{index + 1}. #{artist.name}" }
  end

  def list_genres
    genre_list = []
    Genre.all.each {|genre_entry| genre_list << genre_entry}
    genre_list.sort_by! {|genre| genre.name }
    genre_list.each_with_index {|genre, index| puts "#{index + 1}. #{genre.name}" }
  end
end
