require 'pry'
class MusicLibraryController
  attr_accessor :path, :music_importer
  
  def initialize(path='./db/mp3s')
    @path = path
    @music_importer = MusicImporter.new(@path).tap do |importer|
      importer.import
    end
  end

  def list_songs
    index=0
    Artist.all.each do |artist|
      artist.songs.each do |song|
        index+=1
        puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_artists
    Artist.all.each {|artist| puts "#{artist.name}"}
  end

  def list_genres
    Genre.all.each {|genre| puts "#{genre.name}"}
  end

  def play_song
    puts "Enter the index of the song you would like to play =>"
    input = gets.strip

    if song_index = input.to_i
      song = Song.all[song_index-1]
      puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artist
    puts "Enter the artist's name =>"
    input = gets.strip
    songs = Song.all.select {|song| song.artist.name == input }
    songs.each {|song| puts"#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_genre
    puts "Enter the genre =>"
    input = gets.strip
    songs = Song.all.select {|song| song.genre.name == input }
    songs.each {|song| puts"#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def call
    while true
      puts "Music Library Controller >>"
      command = gets.strip
      case command
      when "exit"
        break;
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "play song"
        play_song
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      else
        puts "Unknown command.  Please try again, or 'exit' to quit."
      end
    end
  end
end