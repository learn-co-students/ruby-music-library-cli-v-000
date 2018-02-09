require 'pry'
class MusicLibraryController
  attr_accessor :path, :name
  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    list = ""
    while list != "exit"
      puts "What would you like to do?"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      input = gets.strip
      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists
      elsif input == "list genres"
        list_genres
      elsif input == "list particular artist"
        list_particular genres
      elsif input == "list particular genre"
        list_particular genre
      elsif input == "list artist"
        list_songs_by_artist
      elsif input == "list genre"
        list_songs_by_genre
      elsif input == "play song"
        play_song
      elsif input == "exit"
    return
      end
    end
  end

  def list_songs
    abc_list = Song.all.sort_by{|song| song.name}
    abc_list.each do |song|
      puts "#{abc_list.find_index(song)+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    abc_list = Artist.all.sort_by{|artist| artist.name}
    abc_list.each do |artist|
      puts "#{abc_list.find_index(artist)+1}. #{artist.name}"
    end
  end

  def list_genres
    abc_list = Genre.all.sort_by{|genre| genre.name}
    abc_list.each do |genre|
      puts "#{abc_list.find_index(genre)+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    if Artist.find_by_name(input)
      abc_list = Artist.find_by_name(input).songs.sort_by{|x| x.name}
        abc_list.each do |song|
          puts "#{abc_list.find_index(song)+1}. #{song.name} - #{song.genre.name}"
        end
      end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if Genre.find_by_name(input)
      abc_list = Genre.find_by_name(input).songs.sort_by{|x| x.name}
        abc_list.each do |song|
          puts "#{abc_list.find_index(song)+1}. #{song.artist.name} - #{song.name}"
        end
      end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    if input.to_i >= 1 && input.to_i <= Song.all.count
      sorted = Song.all.sort_by{|x| x.name}
    puts "Playing #{sorted[input.to_i-1].name} by #{sorted[input.to_i-1].artist.name}"
    end
  end
end
