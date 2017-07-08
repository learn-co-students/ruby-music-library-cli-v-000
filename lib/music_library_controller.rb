require 'pry'
class MusicLibraryController
  attr_reader :path, :importer
  # attr_accessor :song_list

  def initialize(path = './db/mp3s')
    @path = path
    @importer = MusicImporter.new(self.path).import
  end

  def call
    input = ""
    puts "Welcome to your music library!"
    puts "What would you like to do?"
    while input != "exit"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      input = gets.strip
      case input
      when "list songs"
          self.list_songs
        when "list artists"
          self.list_artists
        when "list genres"
          self.list_genres
        when "list artist"
          self.list_songs_by_artist
        when "list genre"
          self.list_songs_by_genre
        when "play song"
          self.play_song
      end
    end
  end

    def list_songs
      sorted = Song.all.sort {|a,b| a.name <=> b.name}
      sorted.each_with_index do |s,i|
        puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
      end
    end

    def list_artists
      sorted = Artist.all.sort {|a,b| a.name <=> b.name}
      sorted.each_with_index do |a,i|
        puts "#{i+1}. #{a.name}"
      end
    end

    def list_genres
      sorted = Genre.all.sort {|a,b| a.name <=> b.name}
      sorted.each_with_index do |g,i|
        puts "#{i+1}. #{g.name}"
      end
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      artist = gets.strip
      if Artist.find_by_name(artist)
        # the issue was that i needed a control for if the artist didn't exist
        sorted = Artist.find_by_name(artist).songs.sort {|a,b| a.name <=> b.name}
        sorted.each_with_index do |s,i|
          puts "#{i+1}. #{s.name} - #{s.genre.name}"
        end
      end
    end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      genre = gets.strip
      if Genre.find_by_name(genre)
        # the issue was that i needed a control for if the artist didn't exist
        sorted = Genre.find_by_name(genre).songs.sort {|a,b| a.name <=> b.name}
        sorted.each_with_index do |s,i|
          puts "#{i+1}. #{s.artist.name} - #{s.name}"
        end
      end
    end

    def play_song
      puts "Which song number would you like to play?"
      song_no = gets.strip.to_i
      if song_no >= 1 && song_no <= Song.all.size
        songs = Song.all.sort {|a,b| a.name <=> b.name}
        puts "Playing #{songs[song_no - 1].name} by #{songs[song_no - 1].artist.name}"
      end
    end
end
