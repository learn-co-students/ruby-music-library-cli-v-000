require 'pry'

class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    @music_importer = MusicImporter.new(path).import
  end

  def call
    input = ""
    until input == "exit" do
      puts "What music would you like to hear today?"
      puts "Please input one of the following commands:"
      puts "'list songs', 'list artists', 'list genres', 'play song',"
      puts "'list artist', 'list genre' or 'exit'"
      input = gets.strip

      case input
      when "list songs"
        songs
      when "list artists"
        Artist.all.each {|artist| puts artist.name}
      when "list genres"
        Genre.all.each {|genre| puts genre.name}
      when "play song"
        puts "What number would you like to play?"
        play_song
      when "list artist"
        puts "Which artist's songs would you like to list?"
        list_artist
      when "list genre"
        puts "Which genre would you like to list?"
        puts "Your choices are:"
        puts "rock, pop, indie, hip-hop, electro, house, country, folk, dance"
        list_genre
      end
    end
  end

  def songs
    songs = Song.all.sort_by {|song| song.artist.name}
    songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def play_song
    song_number = gets.strip.to_i
    song = Song.all.sort_by {|song| song.artist.name}[song_number-1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_artist
    artist = gets.chomp
    if artist = Artist.find_by_name(artist)
      artist.songs.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_genre
    genre_input = gets.strip
    if genre = Genre.find_by_name(genre_input)
      genre.songs.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

end
