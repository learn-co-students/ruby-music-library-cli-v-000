require 'pry'
require 'pp'
class MusicLibraryController
  def initialize(path = './db/mp3s')
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    input = ""

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

      if input == 'list songs'
        self.list_songs
      elsif input == 'list artists'
        self.list_artists
      elsif input == 'list genres'
        self.list_genres
      elsif input == 'list artist'
        self.list_songs_by_artist
      elsif input == 'list genre'
        self.list_songs_by_genre
      elsif input == 'play song'
        self.play_song
      elsif input == 'exit'
        break
      end
    end
  end

  # CLI Methods
  def list_songs
    all_songs = (Song.all).sort_by {|obj| obj.name}
    obj_count = 1
    songs_array = Array.new

    all_songs.each do |song|
      artist = song.artist.name
      genre = song.genre.name
      song_name = song.name
      str = "#{obj_count}. #{artist} - #{song_name} - #{genre}"
      songs_array << str
      puts str
      obj_count += 1
    end
    return songs_array
  end

  def list_artists
    all_artists = (Artist.all).sort_by {|obj| obj.name}
    obj_count = 1
    artists_array = Array.new

    all_artists.each do |artist|
      artist = artist.name
      str = "#{obj_count}. #{artist}"
      artists_array << str
      puts str
      obj_count += 1
    end

    return artists_array
  end

  def list_genres
    all_genres = (Genre.all).sort_by {|obj| obj.name}
    obj_count = 1
    genres_array = Array.new

    all_genres.each do |genre|
      genre = genre.name
      str = "#{obj_count}. #{genre}"
      genres_array << str
      puts str
      obj_count += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = (gets.strip).split(' ').map(&:capitalize).join(' ')

    artist = Artist.find_by_name(artist_name)
    songs_by_artist = Array.new

    if !artist.nil?
      artist_songs_sorted = (artist.songs).sort_by {|x| x.name}
      count = 1

      artist_songs_sorted.each do |song|
        str = "#{count}. #{song.name} - #{song.genre.name}"
        songs_by_artist << str
        puts str
        count +=1
      end
    end
    return songs_by_artist
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip
    genre = Genre.find_by_name(genre_name)
    songs_by_genre = Array.new

    if !genre.nil?
      genre_songs_sorted = (genre.songs).sort_by {|x| x.name}
      count = 1

      genre_songs_sorted.each do |song|
        str = "#{count}. #{song.artist.name} - #{song.name}"
        songs_by_genre << str
        puts str
        count += 1
      end
    end
    return songs_by_genre
  end

  def play_song
    puts "Which song number would you like to play?"
    input =  gets.strip

    index = input.to_i - 1
    all_songs = (Song.all).sort_by {|obj| obj.name}

    if index >= 0 && index <= all_songs.length
      song = all_songs[index]
      unless song.nil?
        puts "Playing #{song.name} by #{song.artist.name}"
      end
    end
  end
end
