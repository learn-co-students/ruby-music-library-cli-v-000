require 'pry'

class MusicLibraryController
  attr_accessor :path, :music_importer

  def initialize(path="./db/mp3s")
    @path = path
    @music_importer = MusicImporter.new(path)
    @music_importer.import
  end

  def call
    input = ""
    while input != "exit"
      input = gets.strip


      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres

      when "play song"
        play_song
      end
      # case input
      # when "list songs"
      #   songs
      # when "list artists"
      #   artists
      # when "list genres"
      #   genres
      # when "play song"
      #   play_song
    end
  end

  def list_songs
    puts Song.all.collect.with_index{|song,i|
    "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    puts Artist.all.collect.with_index{|artist,i|
    "#{i+1}. #{artist.name}"}
  end

  def list_genres
    puts Genre.all.collect.with_index{|genre,i|
    "#{i+1}. #{genre.name}"}
  end

  def play_song
    puts "What song number will you like to play?"
    song_input = gets.strip
    puts "Playing #{Song.all[song_input.to_i-1]}"
  end

  def list_artist_songs
  end

  def list_genre_songs
  end

end
