require 'pry'
class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(@path).import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts  "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = nil
    while input != 'exit' do
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
    alpha_songs = Song.all.sort_by{ |song| song.name }
    i = 1
    alpha_songs.collect do |song|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      i += 1
    end
  end

  def list_artists
    alpha_artists = Artist.all.sort_by{ |artist| artist.name }
    i = 1
    alpha_artists.collect do |artist|
      puts "#{i}. #{artist.name}"
      i += 1
    end
  end

  def list_genres
    alpha_genres = Genre.all.sort_by{ |genre| genre.name }
    i = 1
    alpha_genres.collect do |genre|
      puts "#{i}. #{genre.name}"
      i += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    alpha_songs = Song.all.sort_by{|song| song.name}
    songs = alpha_songs.select{|song| song.artist.name == input}
    i = 1
    songs.each do |song|
      puts "#{i}. #{song.name} - #{song.genre.name}"
      i += 1
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    alpha_songs = Song.all.sort_by{|song| song.name}
    songs = alpha_songs.select{|song| song.genre.name == input}
    i = 1
    songs.each do |song|
      puts "#{i}. #{song.artist.name} - #{song.name}"
      i += 1
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp

    index = input.to_i - 1
    if input.to_i >= 1 && input.to_i <= Song.all.size
      alpha_songs = Song.all.sort_by{ |song| song.name }
      selected_song = alpha_songs[index]
      if selected_song != nil
        puts "Playing #{selected_song.name} by #{selected_song.artist.name}"
      end
    end

  end



end
