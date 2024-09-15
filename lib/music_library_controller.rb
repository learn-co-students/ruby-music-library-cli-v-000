require 'pry'
class MusicLibraryController

  attr_accessor :importer

  def initialize(path="./db/mp3s")
    @importer = MusicImporter.new(path)
    @importer.import
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
    input = gets.strip
    case input.downcase
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
    when "exit"
      return
    else
      call
    end
  end

  def list_songs
    Song.all.sort{|prev, curr| prev.name <=> curr.name}.each.with_index do |song, i|
      puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    list(Artist.all.map{|a| a.name}.sort)
  end

  def list_genres
    list(Genre.all.map{|g| g.name}.sort.uniq)
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip
    artist = Artist.find_by_name(artist_name)
    if !!artist
      songs = artist.songs.sort{|a,b| a.name <=> b.name}.map{|s| s.name + " - " + s.genre.name}
      list(songs)
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip
    genre = Genre.find_by_name(genre_name)
    if !!genre
      songs = genre.songs.sort{|a,b| a.name <=> b.name}.map{|s| s.artist.name + " - " + s.name}
      list(songs)
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_num = gets.strip.to_i
    return if song_num < 1 || song_num > Song.all.length
    song = Song.all.sort{|a,b| a.name <=> b.name}[song_num - 1]
    # binding.pry
    if !!song
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end


  private

  def list(arr)
    arr.each.with_index do |a,i|
      puts "#{i+1}. #{a}"
    end
  end

end
