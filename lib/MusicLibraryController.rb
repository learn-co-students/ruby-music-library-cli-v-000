require 'pry'

class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end


  def call
    input = ""

    while input != "exit"
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
  end

  def list_songs
    Song.all.sort {|x,y| x.name <=> y.name}.each_with_index {|val, index| puts "#{index + 1}. #{val.artist.name} - #{val.name} - #{val.genre.name}" }
  end

  #MusicImporter.new(file).import --> Song.create_from_filename(becuase of this, we're creating songs, and then storing in the song Class)
  def list_artists
    Artist.all.sort {|x, y| x.name <=> y.name}.each.with_index(1) {|val, index| puts "#{index}. #{val.name}"}
  end

  def list_genres
    Genre.all.sort {|x, y| x.name <=> y.name}.each.with_index(1) {|val, index| puts "#{index}. #{val.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip
    artist = Artist.find_or_create_by_name(artist_name)
    artist.songs.sort {|x, y| x.name <=> y.name}.each.with_index(1) {|val, index| puts "#{index}. #{val.name} - #{val.genre.name}" }
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip
    genre = Genre.find_or_create_by_name(genre_name)
    genre.songs.sort {|x, y| x.name <=> y.name}.each.with_index(1) {|val, index| puts "#{index}. #{val.artist.name} - #{val.name}"}
  end

  def play_song
    puts "Which song number would you like to play?"
    num = gets.strip.to_i - 1
    song = Song.all.sort {|x,y| x.name <=> y.name}[num]
    if song && num.between?(0, Song.all.length-1)
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end


end
