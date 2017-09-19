class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def call
    input = ""

    input != exit
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

      def list_songs
        alphabetized = Song.all.sort_by do |song|
      song.name
      end
      list = alphabetized.collect do | song |
        "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
      list.each_with_index { |string, index | puts "#{index+1}. #{string}" }
    end

      def list_artists
        list = Artist.all.collect do | artist |
          artist.name
      end
        list.sort.uniq.each_with_index { |string, index | puts "#{index+1}. #{string}" }
      end

      def list_genres
        list = Genre.all.collect do | genre |
          genre.name
      end
        list.sort.uniq.each_with_index { |string, index | puts "#{index+1}. #{string}" }
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      input = gets.strip
      list = Song.all.sort_by do | song |
        song.name
        binding.pry
      end
      artist = list.find_all { |song| song.genre.name == input }
      artist.uniq.each_with_index do | song, index |
       puts "#{index+1}. #{song.artist.name} - #{song.name}"
        end
      end






    end
