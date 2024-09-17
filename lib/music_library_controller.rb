require 'pry'
class MusicLibraryController
  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path=path
    importer=MusicImporter.new(@path)
    importer.import
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


    active=true
    while active
      resp=gets.strip
      case resp
      when 'list songs'
        self.list_songs
      when 'list artists'
        self.list_artists
      when 'list genres'
        self.list_genres
      when 'list artist'
        self.list_songs_by_artist
      when 'list genre'
        self.list_songs_by_genre
      when 'play song'
        self.play_song
      when "exit"
        active=false
      else
        "please enter a valid command"
      end
    end
  end

  def list_songs
    sorted=Song.all.sort_by {|song| song.name}
    sorted.each_with_index do |song,index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    sorted=Artist.all.sort_by {|artist| artist.name}
    sorted.each_with_index do |artist,index|
      puts "#{index+1}. #{artist.name}"
    end
  end

  def list_genres
    sorted=Genre.all.sort_by {|genre| genre.name}
    sorted.each_with_index do |genre,index|
      puts "#{index+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    art= gets.strip
    my_art=Artist.find_by_name(art)
    if my_art!=nil
      sorted = my_art.songs.sort_by {|song| song.name }
      sorted.each_with_index do |song,index|
        puts "#{index+1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    gen= gets.strip
    my_gen=Genre.find_by_name(gen)
    if my_gen!=nil
      sorted = my_gen.songs.sort_by {|song| song.name }
      sorted.each_with_index do |song,index|
        puts "#{index+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    num=gets.to_i
    if num>0 && num<Song.all.length
      sorted=Song.all.sort_by {|song| song.name}

      sel_song=sorted[num-1]
      puts "Playing #{sel_song.name} by #{sel_song.artist.name}"
    end
  end

end
