require 'pry'

class MusicLibraryController
  def initialize(path = "./db/mp3s" )
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
    input = gets.chomp

    #CLI Prompt Methods
    case input
      when "list songs"
        list_songs
      when "list genres"
        list_genres
      when "list artist"
        list_artist
      when "play song"
        play_song
      end
      call if input != "exit"
  end

  def list_songs
    songs = Song.all.sort_by{|x| x.name}
    songs.each_with_index do |song, index|
      value = index + 1
      puts "#{value}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      value += 1
    end
  end

  def list_artists
    artists = Artist.all.sort_by{|x| x.name}
    artists.each_with_index do |artist, index|
      value = index + 1
      puts "#{value}. #{artist.name}"
      value += 1
    end
  end

  def list_genres
    genres = Genre.all.sort_by{|x| x.name}
    genres.each_with_index do |gen, index|
      value = index + 1
      puts "#{value}. #{gen.name}"
      value += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    artist = Artist.find_by_name(input)
    song_list = artist.songs.sort_by{|y| y.name} if artist
    if artist
      song_list.each_with_index do |song, index|
          value = index + 1
          puts "#{value}. #{song.name} - #{song.genre.name}"
          index += 1
        end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    genre = Genre.find_by_name(input)
    genre_list = genre.songs.sort_by{|y| y.name} if genre
    if genre
      genre_list.each_with_index do |song, index|
          value = index + 1
          puts "#{value}. #{song.artist.name} - #{song.name}"
          index += 1
        end
    end
  end

def play_song
  puts "Which song number would you like to play?"
  input = gets.chomp.to_i
  max = Song.all.length
  if ((input <= max ) && (input > 0))
    songs = Song.all.sort_by{|x| x.name}
    puts "Playing #{songs[input-1].name} by #{songs[input-1].artist.name}"
  end
end









end
