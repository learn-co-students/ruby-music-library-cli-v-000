require 'pry'

class MusicLibraryController

  extend Concerns::Findable

  def initialize(path = './db/mp3s')
    @importer = MusicImporter.new(path).import
  end

  def list_songs
     sorted = Song.all.sort{ |x, y| x.name <=> y.name }
     sorted.each.with_index do |song, ind|
       puts "#{ind + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
     end
  end

  def list_artists
    sorted = Artist.all.sort{ |x, y| x.name <=> y.name }
    sorted.each.with_index do |artist, ind|
      puts "#{ind + 1}. #{artist.name}"
    end
  end

  def list_genres
    sorted = Genre.all.sort{ |x, y| x.name <=> y.name }
    sorted.each.with_index do |genre, ind|
      puts "#{ind + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    artist = Artist.find_by_name(input)
    if artist
      sorted = artist.songs.sort{|x, y| x.name <=> y.name}
      sorted.each.with_index do |song, ind|
        puts "#{ind + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    genre = Genre.find_by_name(input)
    if genre
      sorted = genre.songs.sort{|x, y| x.name <=> y.name}
      sorted.each.with_index do |song, ind|
        puts "#{ind + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if input > 0 && input < @importer.length
      song = Song.all.sort{ |x, y| x.name <=> y.name }[input - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
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

    while (input = gets.chomp) != 'exit'
      case input
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      when 'list artist'
        list_songs_by_artist
      when 'list genre'
        list_songs_by_genre
      when 'play song'
        play_song
      else
        puts "I don't recognize that command"
      end
    end

  end

end
