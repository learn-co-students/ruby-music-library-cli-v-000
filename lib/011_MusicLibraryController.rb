require 'pry'

class MusicLibraryController

  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    puts "Welcome to Your Music Library!"
    puts "What would you like to do?"
    puts "Please choose from the following list:"
    puts "list songs"
    puts "list artists"
    puts "list genres"
    puts "list artist (will list all songs for the artist)"
    puts "list genre (will list all artists for the genre)"
    puts "play song"
    puts "exit"
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
      when "exit"
        @request = "exit"
      else
        case @request
        when "list artist"
          @artist = input
          list_artist
        when "list genre"
          @genre = input
          list_genre
        when "play song"
          @song_num = input.to_i
          play_song
        end
      end
    end
  end

  def songs
    # sorted_by_song = Song.all.sort_by {|song| song.name}
    Song.all.each_with_index do |song, i|
      puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def artists
    sorted_by_artist = Artist.all.sort_by {|artist| artist.name}
    sorted_by_artist.each_with_index do |artist, i|
      puts "#{i+1}. #{artist.name}"
    end
  end

  def genres
    sorted_by_genre = Genre.all.sort_by {|genre| genre.name}
    sorted_by_genre.each_with_index do |genre, i|
      puts "#{i+1}. #{genre.name}"
    end
  end

  def list_artist
    @artist_songs = 0
    sorted_by_song = Song.all.sort_by {|song| song.name}
    sorted_by_song.each do |song|
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
    sorted_by_artist = Song.all.sort_by {|song| song.artist.name}
    sorted_by_artist.each do |song|
      if song.genre.name == @genre
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        @genre_songs+= 1
      end
    end
    if @genre_songs == 0
      puts "#{@genre} not found!"
    end
  end

  def play_song
    Song.all.each_with_index do |song, i|
      if @song_num == (i+1)
        puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

end
