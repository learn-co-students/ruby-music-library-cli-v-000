require 'pry'
class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    name = ""
    while name != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      name = gets.strip
      if name == "list songs"
        list_songs
      elsif name == "list artists"
        list_artists
      elsif name == "list genres"
        list_genres
      elsif name == "list artist"
        list_songs_by_artist
      elsif name == "list genre"
        list_songs_by_genre
      elsif name == "play song"
        play_song
      end
    end
  end

    def list_songs
      Song.all.sort_by {|song| song.name}.each_with_index {|element, index| puts "#{index+1}. #{element.artist.name} - #{element.name} - #{element.genre.name}"}
    end

    def list_artists
      Artist.all.sort_by {|artist| artist.name}.each_with_index {|element, index| puts "#{index+1}. #{element.name}"}
    end

    def list_genres
      Genre.all.sort_by {|genre| genre.name}.each_with_index {|element, index| puts "#{index+1}. #{element.name}"}
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      name = gets
      artist = Artist.find_by_name(name)
      if artist == nil
      else
      artist.songs.sort_by {|song| song.name}.each_with_index {|element, index| puts "#{index+1}. #{element.name} - #{element.genre.name}"}
      end
    end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      name = gets
      genre = Genre.find_by_name(name)
      if genre == nil
      else
        genre.songs.sort_by {|genre| genre.name}.each_with_index {|element, index| puts "#{index+1}. #{element.artist.name} - #{element.name}"}
      end
    end

    def play_song
      puts "Which song number would you like to play?"
      input = gets.strip.to_i
      if (1..Song.all.length).include?(input)
        song = Song.all.sort_by {|song| song.name}[input-1]
      end
      puts "Playing #{song.name} by #{song.artist.name}" if song
    end

end
