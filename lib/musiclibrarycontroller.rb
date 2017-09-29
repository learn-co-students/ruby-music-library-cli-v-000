require 'pry'

class MusicLibraryController
  attr_reader :path

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    i = ""
    while i != "exit"
      puts "Make your selection:"
      i = gets.strip
      case i
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "play song"
        play
      when "list artist"
        artist_list
      when "list genre"
        genre_list
      end
    end
  end

  def songs
    Song.all.each.with_index(1) { |song, index| puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
  end 

  def artists
    Artist.all.each { |artist| puts "#{artist.name}" }
  end

  def genres
    Genre.all.each { |genre| puts "#{genre.name}" }
  end

  def play
    puts "Which song would you like to play?"
    song_num = gets.strip
    puts "Playing #{Song.all[song_num.to_i-1].artist.name} - #{Song.all[song_num.to_i-1].name} - #{Song.all[song_num.to_i-1].genre.name}"
  end

  def artist_list
    puts "Which artist's songs would you like to show?"
    artist_name = gets.strip
    if artist = Artist.find_by_name(artist_name)
      artist.songs.each {|song, index| puts "#{artist.name} - #{song.name} - #{song.genre.name}"}
    end
  end

  def genre_list
    puts "For which genre would you like to list the songs?"
    genre_name = gets.strip
    if genre = Genre.find_by_name(genre_name)
      genre.songs.each {|song, index| puts "#{song.artist.name} - #{song.name} - #{genre.name}"}
    end
  end
end