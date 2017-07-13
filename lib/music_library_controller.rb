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
    input = ''
    while input != "exit"
      input = gets.chomp

      case input
      when 'list songs'
        self.list_songs
      when 'list artists'
        self.list_artists
      when 'list genres'
        self.list_genres
      when 'list artist'
        self.list_songs_by_artist
      when 'list genre'
        self.list_songs_by_genre
      when 'play song'
        self.play_song
      end
    end
  end

  def sorted_songs
    Song.all.sort_by { |song| song.name }
  end

  def list_songs
    sorted_songs.each_with_index { |el, index|
      puts "#{index+1}. #{el.artist.name} - #{el.name} - #{el.genre.name}"
    }
  end

  def list_artists
    Artist.all.sort_by { |artist| artist.name }.each_with_index { |el, index|
      puts "#{index+1}. #{el.name}"
    }
  end

  def list_genres
    genres = []
    Song.all.each { |song| genres << song.genre.name }
    sorted = genres.sort.uniq
    sorted.each_with_index { |genre, index| puts "#{index+1}. #{genre}" }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if Artist.find_by_name(input)
      list = []
      Artist.find_by_name(input).songs.each { |song| list << song }
      sorted = list.sort_by { |el| el.name }
      sorted.each_with_index { |song, index|
        puts "#{index+1}. #{song.name} - #{song.genre.name}"
      }
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    if Genre.find_by_name(input)
      list = []
      Genre.find_by_name(input).songs.each { |song| list << song }
      sorted = list.sort_by { |el| el.name }
      sorted.each_with_index { |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name}"
      }
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp
    if input.to_i >= 1 && input.to_i <= self.sorted_songs.length
      songs = self.sorted_songs
      song = songs[input.to_i - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

end
