require 'pry'

class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).tap {|importer| importer.import}
  end

  def call
    input = String.new
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
      input == 'list songs' ? list_songs : input
      input == 'list artists' ? list_artists : input
      input == 'list genres' ? list_genres : input
      input == 'list artist' ? list_songs_by_artist : input
      input == 'list genre' ? list_songs_by_genre : input
      input == 'play song' ? play_song : input
    end
    # self.class.send(gets.strip.to_sym)
  end

  def list_songs
    Song.all.sort_by(&:name).each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort_by(&:name).each.with_index(1) do |artist, i|
      puts "#{i}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort_by(&:name).each.with_index(1) do |genre, i|
      puts "#{i}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    # binding.pry
    if artist = Artist.find_by_name(input)
      artist.songs.sort_by(&:name).each.with_index(1) do |song, i|
        puts "#{i}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
      if genre = Genre.find_by_name(input)
        genre.songs.sort_by(&:name).each.with_index(1) do |song, i|
          puts "#{i}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if (1..Song.all.length).include?(input)
      target = Song.all.sort_by(&:name)[input - 1]
      puts "Playing #{target.name} by #{target.artist.name}" if target
    end
  end



end
