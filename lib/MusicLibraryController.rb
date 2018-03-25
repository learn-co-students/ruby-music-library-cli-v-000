require "pry"

class MusicLibraryController
  attr_accessor :path, :music

    def initialize(path = "./db/mp3s")
      @path = path
      @music = MusicImporter.new(path)
      @music.import
    end

    def call
      input = String.new

      until input == "exit"

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
  end # => End call

    def list_songs
      result = Array.new
      sorted = []
      i = 0

      song_array = self.music.import

      result = song_array.uniq.sort_by!{|obj| obj.name}
        result.each do |song|
          i += 1
           puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

    def list_artists
      sorted_by_artist = Artist.all.sort do |a, b|
        a.name <=> b.name
      end

      sorted_by_artist.each_with_index do |artist, i|
        puts "#{ i + 1 }. #{ artist.name }"
      end
      #binding.pry
    end

    def list_genres
      genre = []
      i = 0

      song_array = self.music.import
        song_array.each do |obj|
          genre << obj.genre.name
        end

      genre = genre.uniq.sort
        until i == genre.length
          puts "#{i+1}. #{genre[i]}"
          i += 1
        end
    end

    def list_songs_by_artist


      puts "Please enter the name of an artist:"
      input = gets.strip

      artist = Artist.find_by_name(input)

        if artist
          sorted_by_artist = artist.songs.sort do |a, b|
            a.name <=> b.name
        end
        #binding.pry
        sorted_by_artist.each_with_index do |song, i|
            puts "#{i + 1}. #{song.name} - #{song.genre.name}"
          end
        end


    end # => End list_songs_by_artist

    def list_songs_by_genre
      i = 0

      puts "Please enter the name of a genre:"
      input = gets.strip

      song_array = self.music.import
        song_array.each do |song|
          if song.genre.name == input
            i += 1
            puts "#{i}. #{song.artist.name} - #{song.name}"
          end
        end
    end # => End list_songs_by_genre

    def play_song
      i = 0

      puts "Which song number would you like to play?"
      input = gets.strip.to_i

      song_array = self.music.import
      song_array.sort_by!{|obj| obj.name}
        if input > 0 && input <= song_array.length
          puts "Playing #{song_array[input - 1].name} by #{song_array[input-1].artist.name}"
        end


    end # => End play_song
end # => End MusicLibraryController class
