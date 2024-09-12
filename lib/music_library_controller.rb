require 'pry'
class MusicLibraryController

  attr_reader :path

  def initialize(path = "./db/mp3s")
    @path = path
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    response = nil
    while response != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      response = gets.chomp

        case response
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
        # else
        #   puts "'#{response}' is not a valid entry."
      end
    end
  end

  def list_songs
    # sorted_songs = []
    # Song.all.each {|song| sorted_songs << song.name}
    Song.all.sort_by{|song| song.name}.each_with_index do |song, i|
      puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    i = 1
    Artist.all.sort_by{|artist| artist.name}.each do |artist|
      puts "#{i}. #{artist.name}"
      i += 1
    end
  end

  def list_genres
    Genre.all.sort_by{|genre| genre.name}.each_with_index do |genre, i|
      puts "#{i + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.chomp
    if Artist.find_by_name(artist)
      Artist.find_by_name(artist).songs.sort_by{|song| song.name}.each_with_index do |song, i|
        puts "#{i + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.chomp
    if Genre.find_by_name(genre)
      Genre.find_by_name(genre).songs.sort_by{|song| song.name}.each_with_index do |song, i|
        puts "#{i + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.chomp.to_i
    if song_number > 0 && song_number <= Song.all.length
      song = Song.all.sort_by{|song| song.name}[song_number - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

end
