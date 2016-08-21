require "pry"
class MusicLibraryController

  attr_reader :path, :imported, :song_array #, :list_songs
  def initialize(path='./db/mp3s')
    @imported = MusicImporter.new(path)
    @imported.import
    #binding.pry
  end

  def call
      input = ""
      while input != "exit"
        puts "Welcome to your music library!"
        puts "what would you like to do?"
        input = gets.chomp
        case input
        when "list songs"
          songs
        when "list artists"
          list_artists
        when "list genres"
          list_genres
        when "play song"
          play_song
        when "list artist"
          list_artist
        when "list genre"
          list_genre
        end
      end
    end

    def songs
      song_array = @imported.import
      song_array.each.with_index(1) {|song, index| print  "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name} " }
    end

    def list_artists
      song_array = @imported.import
      song_array.each.with_index(1) {|song, index| puts "#{index}. #{song.artist.name}"}
    end

    def list_genres
      song_array = @imported.import
      song_array.each.with_index {|song, index| puts "#{index}. #{song.genre.name}"}
    end

    def play_song
      song_array = @imported.import
      song_array.each.with_index {|song, index | puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name} "}
    end

    def list_artist
      song_array = @imported.import
      song_array.each {|song| puts  "#{song.artist.name} - #{song.name} - #{song.genre.name} "}
    end

    def list_genre
      song_array = @imported.import
      song_array.each {|song| print  "#{song.artist.name} - #{song.name} - #{song.genre.name} "}
    end





end
