require 'pry'

class MusicLibraryController

  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    puts "Welcome to Your Music Library!"
    puts "What would you like to do?"
    @request = ""
    input = ""
    while  input != "exit"
      input = gets.strip
      case input
      when "list songs"
      	songs
      when "list artists"
      	artists
      when "list genres"
      	genres
      when "list artist"
      	@request = "list artist"
        puts "Please enter the artist"
      when "list genre"
      	@request = "list genre"
        puts "Please enter the genre"
      when "play song"
        @request = "play song"
        puts "Please enter the song number"
      else
        case @request
        when "play song"
          @song_num = input.to_i
          play_song
        when "list artist"
          @artist = input
          list_artist
        when "list genre"
          @genre = input
          list_genre
        end
      end
    end
  end

  def songs
    Song.all.each_with_index do |song, i|
      puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def artists
    Artist.all.each_with_index do |artist, i|
      puts "#{i+1}. #{artist.name}"
    end
  end

  def genres
    Genre.all.each_with_index do |genre, i|
      puts "#{i+1}. #{genre.name}"
    end
  end

  def play_song
    Song.all.each_with_index do |song, i|
      if @song_num == (i+1)
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_artist
    @artist_songs = 0
    Song.all.each do |song|
      if song.artist.name == @artist
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        @artist_songs+= 1
      end
    end
    if @artist_songs == 0
      puts "#{@artist} not found!"
    end
  end

  def list_genre
    @genre_songs = 0
    Song.all.each do |song|
      if song.genre.name == @genre
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        @genre_songs+= 1
      end
    end
    if @genre_songs == 0
      puts "#{@genre} not found!"
    end
  end

end
