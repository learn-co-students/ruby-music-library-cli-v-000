require_relative '../concerns/modules.rb'
require_relative 'classes.rb'

class MusicLibraryController
  attr_accessor :path
  def initialize(path='./db/mp3s')
    @path=path
    music_importer=MusicImporter.new(@path)
    music_importer.import
  end

  def list_songs(mode=(:loud))
    sorted = Song.all.sort{|a, b| a.artist.name<=>b.artist.name}
    if mode!=(:quiet)
      sorted.each_with_index{|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
    end
    sorted
  end

  def list_artists
    artists = Artist.all.sort{|a,b| a.name<=>b.name}
    artists.each{|artist| puts artist.name}
  end

  def list_genres
    genres = Genre.all.sort{|a,b| a.name<=>b.name}
    genres.each{|genre| puts genre.name}
  end

  def play_song
    sorted = list_songs(:quiet)
    song_number=gets("Enter song # to play...").to_i
    song = sorted[song_number-1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_artist_songs
    artist_name=gets("Enter Artist.")
    artist=Artist.all.find{|artist| artist.name==artist_name}
    artist.songs.each{|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_genre_songs
    genre_name=gets("Enter Genre.")
    genre=Genre.all.find{|genre| genre.name==genre_name}
    genre.songs.each{|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def call

    while true
      case gets("Enter command: ")
      when "list songs"
          list_songs
      when "exit"
          break
      when "list artists"
          list_artists
      when "list genres"
        list_genres
      when "play song"
        play_song
      when "list artist"
        list_artist_songs
      when "list genre"
        list_genre_songs
      end

    end

  end


end