require 'pry'
class MusicLibraryController
  attr_accessor :path
  attr_reader :artist, :song, :genre

  def initialize(path = "./db/mp3s")
    controller = MusicImporter.new(path)
    controller.import
  end

  def call
    input = ""
    while input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.strip
        if input == "list songs"
          self.list_songs
        elsif input == "list artists"
          self.list_artists
        elsif input == "list genres"
          self.list_genres
        elsif input == "list artist"
          self.list_songs_by_artist
        elsif input == "list genre"
          self.list_songs_by_genre
        elsif input == "play song"
          self.play_song
        end
    end
  end

  def list_songs
    # binding.pry
    # songlist = []
    # Song.all.each {|song_in_list| songlist << song_in_list}
    # songlist.sort_by! {|song_in_list| song_in_list.name}
    # songlist.map.with_index do |song_in_list, index|
    #     puts "#{index + 1}. #{song_in_list.artist.name} - #{song_in_list.name} - #{song_in_list.genre.name}"
    # end
    Song.all.sort_by {|song| song.name}.each_with_index {|a, b| puts "#{b + 1}. #{a.artist.name} - #{a.name} - #{a.genre.name}"}
  end

  def list_artists
    # artist_list = []
    # Artist.all.each {|artist_entry| artist_list << artist_entry}
    # artist_list.sort_by! {|artist| artist.name }
    # artist_list.each_with_index {|artist, index| puts "#{index + 1}. #{artist.name}" }
    Artist.all.sort_by {|artist| artist.name}.each_with_index {|a, b| puts "#{b + 1}. #{a.name}"}
  end

  def list_genres
    genre_list = []
    Genre.all.each {|genre_entry| genre_list << genre_entry}
    genre_list.sort_by! {|genre| genre.name }
    genre_list.each_with_index {|genre, index| puts "#{index + 1}. #{genre.name}" }
    # Genre.all.sort_by {|genre| genre.name}.each_with_index {|a, b| puts "#{b + 1}. #{a.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    list_of_songs = []
    Song.all.each do |song_listing|
      if song_listing.artist.name == input
        list_of_songs << song_listing
      end
    end
    list_of_songs.sort_by! {|song| song.name}
    list_of_songs.each_with_index {|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    list_of_genres = []
    Song.all.each do |song_listing|
      if song_listing.genre.name == input
        list_of_genres << song_listing
      end
    end
    list_of_genres.sort_by! {|song_listing| song_listing.name}
    list_of_genres.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i - 1
    if Song.all.include?(Song.all[input]) && input < Song.all.count && input > 1
      puts "Playing #{Song.all.sort_by {|song| song.name}[input].name} by #{Song.all.sort_by {|song| song.name}[input].artist.name}"
    # else
    #   return input
    end
  end
end
