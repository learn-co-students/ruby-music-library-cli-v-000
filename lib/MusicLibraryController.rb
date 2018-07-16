require 'pry'

# Upon initialization, accepts an optional path to the library of MP3 files, defaulting to ./db/mp3s/.
#It should then instantiate a MusicImporter object,
#which it will use to import songs from the specified library.

class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    answer = ""
    until answer == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      answer = gets.chomp
      if answer == "list songs"
        list_songs
      elsif answer == "list artists"
        list_artists
      elsif answer == "list genres"
        list_genres
      elsif answer == "list artist"
        list_songs_by_artist
      elsif answer == "list genre"
        list_songs_by_genre
      elsif answer == "play song"
        play_song
      end


    end
  end

  def list_songs
    newlist = Song.all.sort_by(&:name)
    newlist.each.with_index(1) do |sng, index|
      puts "#{index}. #{sng.artist.name} - #{sng.name} - #{sng.genre.name}"
    end
  end

    def list_artists
      newlist = Artist.all.sort_by(&:name)
      newlist.each.with_index(1) do |art, index|
        puts "#{index}. #{art.name}"
      end
    end

    def list_genres
      newlist = Genre.all.sort_by(&:name)
      newlist.each.with_index(1) do |gen, index|
        puts "#{index}. #{gen.name}"
      end
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      artist1 = gets.chomp
      if artist = Artist.find_by_name(artist1)
        artist.songs.sort_by(&:name).each.with_index(1) do |song, index|
          puts "#{index}. #{song.name} - #{song.genre.name}"
        end
      end
    end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      genre1 = gets.chomp
      if genre = Genre.find_by_name(genre1)
        genre.songs.sort_by(&:name).each.with_index(1) do |song, index|
          puts "#{index}. #{song.artist.name} - #{song.name}"
        end
      end
    end

    def play_song
      puts "Which song number would you like to play?"
      songnum = gets.strip.to_i
      newlist = Song.all.sort_by(&:name)
      newlist.each.with_index(1) do |song, index|
        if songnum == index
          puts "Playing #{song.name} by #{song.artist.name}"
        end
      end
    end
end
