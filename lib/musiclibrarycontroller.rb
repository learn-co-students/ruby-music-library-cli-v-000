require 'pry'

class MusicLibraryController
  # attr_accessor :songs, :artists, :genres

  def initialize(path = './db/mp3s')
    # @songs = []
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

    usercall = gets.chomp

    while usercall != 'exit' do
      case usercall
        when 'list songs'
          list_songs
        when 'list artists'
          list_artists
        when 'list genres'
          list_genres
        when 'list artist'
          list_songs_by_artist
        when 'list genre'
          list_songs_by_genre
        when 'play song'
          play_song
      end
      usercall = gets.chomp
    end
  end

  def list_songs
    Song.all.sort_by {|song| song.name}.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort_by {|artist| artist.name}.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort_by {|genre| genre.name}.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artistname = gets.chomp
    if Artist.find_by_name(artistname)
      Artist.find_by_name(artistname).songs.sort_by {|song| song.name}.each.with_index(1) do |song,index|
        puts "#{index}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genrename = gets.chomp
    if Genre.find_by_name(genrename)
      Genre.find_by_name(genrename).songs.sort_by {|song| song.name}.each.with_index(1) do |song,index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    # binding.pry
    number = gets.chomp
    # binding.pry
    Song.all.sort_by {|song| song.name}.each.with_index(1) do |song, index|
      if number.to_i == index
        puts "Playing #{song.name} by #{song.artist.name}"
      end
    end
  end

end
