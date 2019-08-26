require 'pry'
# require_relative "../lib/concerns/findable.rb"
# require_relative "../lib/artist.rb"
class MusicLibraryController
  # extend Concerns::Findable
  # include Concerns
  attr_accessor :path, :name

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

    until gets == ("exit")
    end
    # binding.pry
  end

  def list_songs
    Song.all.sort { |song1, song2| song1.name <=> song2.name }
    .each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort { |artist1, artist2| artist1.name <=> artist2.name }
    .each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort { |genre1, genre2| genre1.name <=> genre2.name }
    .each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    tmp = gets.strip
    Song.all.select do |song|
      song.artist.name.eql?(tmp)
    end.sort { |song1, song2| song1.name <=> song2.name }
     .each_with_index do |song, index|
      puts "#{index + 1}. #{song.name} - #{song.genre.name}"
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    tmp = gets.strip
    Song.all.select do |song|
      song.genre.name.eql?(tmp)
    end.sort { |song1, song2| song1.name <=> song2.name }
     .each_with_index do |song, index|
       puts "#{index + 1}. #{song.artist.name} - #{song.name}"
     end
  end

  def play_song
    puts "Which song number would you like to play?"
    tmp = gets.strip
      # list_songs.eql?(tmp)
      Song.all.sort { |song1, song2| song1.name <=> song2.name }
      .select do |song|
         song.eql?(tmp)
        #  binding.pry
         puts "Playing #{song.name} by #{song.artist.name}"
       end

      #  def list_songs
      #    Song.all.sort { |song1, song2| song1.name <=> song2.name }
      #    .each_with_index do |song, index|
      #      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      #    end
      #  end
      #  Song.all.select do |song|
      #  song.name.eql?(tmp)
      #  end.sort do |song1, song2|
      #    song1.name <=> song2.name
      #    puts "Playing #{song.name} by #{artist.name}"
      #   # .each do |song|
      #  end
    # Song.all.select do |song|
    #   song.eql?(tmp)
    # end.sort do |song1, song2|
    #   song1.name <=> song2.name
    #   puts "Playing #{song.name} by #{song.artist.name}"
    # end
  end

end
