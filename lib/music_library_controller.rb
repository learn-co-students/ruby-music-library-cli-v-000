require 'pry'
class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    puts "Yo what up?"
    input = gets.downcase
    case input
    when "list songs"
      n=0
      Song.all.each do |song|
        puts "#{n+=1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    when "list artists"
      Artist.all.each do |artist|
        puts "#{artist.name}"
      end
    when "list genres"
      Genre.all.each do |genre|
        puts "#{genre.name}"
      end
    when "play song"
      play_song
    when "list artist"
      list_artist_songs
    when "list genre"
      list_genre_songs
    when "exit"
      puts "Peace out, Seacrest."
      return
    end
    call
  end

  def list_artist_songs
    puts "What artist?"
    artist_name = gets.strip
    if artist = Artist.find_by_name(artist_name)
      artist.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_genre_songs
    puts "What genre?"
    genre_name = gets.strip
    if genre = Genre.find_by_name(genre_name)
      genre.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def play_song
    puts "What song?"
    song_index = gets.to_i
    song = Song.all[song_index-1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

end
