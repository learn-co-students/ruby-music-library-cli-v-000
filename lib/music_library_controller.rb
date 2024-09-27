require 'pry'

class MusicLibraryController

  attr_reader :path

  def initialize(path="./db/mp3s")
    @path = path
    MusicImporter.new(@path).import
  end

  def call

    input = nil

      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"


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
      song_list = Song.all.sort_by {|song| song.name}
      n = 1
      song_list.collect do |song|
        puts "#{n}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        n+=1
      end
    end

    def list_artists
      artist_list = Artist.all.sort_by {|artist| artist.name}
      n = 1
      artist_list.collect do |artist|
        puts "#{n}. #{artist.name}"
        n+=1
      end
    end

    def list_genres
      genre_list = Genre.all.sort_by {|genre| genre.name}
      n = 1
      genre_list.collect do |genre|
        puts "#{n}. #{genre.name}"
        n+=1
      end
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      input = gets.strip

      artist = Artist.find_by_name(input)
      if artist != nil
        artist.songs
       .sort{|a,b| a.name <=> b.name}
       .each_with_index do |song,index|
        puts "#{index+1}. #{song.name} - #{song.genre.name}"
        end
      end
    end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      input = gets.strip

      genre = Genre.find_by_name(input)
      if genre != nil
        genre.songs
       .sort{|a,b| a.name <=> b.name}
       .each_with_index do |song,index|
        puts "#{index+1}. #{song.artist.name} - #{song.name}"
        end
      end
    end

    def play_song
      puts "Which song number would you like to play?"
      input = gets.strip.to_i
      song = Song.all.sort_by{|song| song.name}[input-1]
      if song && input.between?(1, Song.all.length)
        puts "Playing #{song.name} by #{song.artist.name}"
      end
    end

  end
