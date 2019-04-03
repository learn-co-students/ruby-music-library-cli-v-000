require 'pry'

class MusicLibraryController

  attr_reader :name, :artist, :genre, :artist_name, :genre_name
  #@@song_hash = {}
  #@@lib = Song.all.collect { |song| song.name }.sort!
  #@@alphabetized_list = []

  #accepts one argument, the path to the MP3 files to be imported
  #creates a new MusicImporter object, passing in the 'path' value
  #the 'path' argument efaults to './db/mp3s'
  #invokes the #import method on the created MusicImporter object
  def initialize(path= './db/mp3s')
    @path = path
    MusicImporter.new(@path).import

    @lib = []
    @song_hash = {}
    @alphabetized_list = []
    @artist_list = []
    @genre_list = []
  end

  #welcomes the user
  #asks the user for input
  #loops and asks for user input until they type in exit
  def call
    input = nil
    until input == 'exit'
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

      if input == 'list songs'
        list_songs
      elsif input == 'list artists'
        list_artists
      elsif input == 'list genres'
        list_genres
      elsif input == 'list artist'
        list_songs_by_artist
      elsif input == 'list genre'
        list_songs_by_genre
      elsif input == 'play song'
        play_song
      end

    end
  end

  #prints all songs in the music library in a numbered list (alphabetized by song name)
  def list_songs
    #1. Thundercat - For Love I Come - dance
=begin
    @song_hash.each do |song_num, data|
      puts "#{song_num}. #{@song_hash.dig(song_num, :song_artist)} - #{@song_hash.dig(song_num, :song_name)} - #{@song_hash.dig(song_num, :song_genre)}"
    end
=end
    @lib = Song.all.collect { |song| song.name }.sort!
    @lib.each do |song_name|
      num = @lib.index { |x| x == song_name } + 1
      song_artist = Song.all.collect { |song| song.artist.name if song_name == song.name }.join
      song_genre = Song.all.collect { |song| song.genre.name if song_name == song.name }.join
      @song_hash[num] = { song_name: song_name, song_artist: song_artist, song_genre: song_genre }
      @alphabetized_list << "#{num}. #{song_artist} - #{song_name} - #{song_genre}"
    end

#    @alphabetized_list.each do |song|
#      puts "#{song}"
#    end

    @song_hash.each do |song_num, data|
      puts "#{song_num}. #{@song_hash.dig(song_num, :song_artist)} - #{@song_hash.dig(song_num, :song_name)} - #{@song_hash.dig(song_num, :song_genre)}"
    end
    #@alphabetized_list
    #@song_hash
    #binding.pry
  end

  def collect_artists
    Artist.all.collect do |artist|
      @artist_list << artist.name
    end
    @artist_list.uniq!.sort!
  end

  #prints all artists in the music library in a numbered list (alphabetized by artist name)
  def list_artists
    collect_artists
    @artist_list.each do |artist_name|
      num = @artist_list.index(artist_name) + 1
      puts "#{num}. #{artist_name}"
    end
    @artist_list
  end

  def collect_genres
    Genre.all.collect do |genre|
      @genre_list << genre.name
    end
    @genre_list.uniq!.sort!
  end

  #prints all genres in the music library in a numbered list (alphabetized by genre name)
  def list_genres
    collect_genres
    @genre_list.each do |genre_name|
      num = @genre_list.index(genre_name) + 1
      puts "#{num}. #{genre_name}"
    end
  end

  #prints all songs by a particular artist in a numbered list (alphabetized by song name)
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip

    artist_song_list = []
    Song.all.collect do |song|
      if song.artist.name == artist_name
        artist_song_list << "#{song.name} - #{song.genre.name}"
      end
    end
    artist_song_list.sort!

    artist_song_list.each do |song|
      num = artist_song_list.index(song) + 1
      puts "#{num}. #{song}"
    end
  end

  #prints all songs by a particular genre in a numbered list (alphabetized by song name)q a
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip

=begin
    count = 1
    @song_hash.each do |song_num, data|
      if @song_hash.dig(song_num, :song_genre) == genre_name
        puts "#{count}. #{@song_hash.dig(song_num, :song_artist)} - #{@song_hash.dig(song_num, :song_name)}"
        count += 1
      end
    end
=end
#old
    genre_song_list = []
    Song.all.collect do |song|
      if song.genre.name == genre_name
        genre_song_list << "#{song.artist.name} - #{song.name}"
      end
    end

    nested_library = genre_song_list.collect {|filename| filename.split(" - ")}
    sorted_nested_library = nested_library.sort {|x,y| x[1] <=> y[1]}

    counter = 0
    sorted_library = []
    while counter < sorted_nested_library.length
      sorted_library << sorted_nested_library[counter].join(" - ")
      counter +=1
    end

    sorted_library.each do |filename|
      num = sorted_library.index {|x| x == filename} + 1
      puts "#{num}. #{filename}"
    end
  end

  #prompts the user to choose a song from the alphabetized list output by #list_songs
  #upon receiving valid input 'plays' the matching song from the alphabetized list output by #list_songs
  def play_song
    #list_songs
    puts "Which song number would you like to play?"

    input = gets.strip
    position = input.to_i

    #binding.pry
    if position <= list_songs.length
      puts "Playing #{@song_hash[position][:song_name]} by #{@song_hash[position][:song_artist]}"
    end
    #binding.pry
=begin
    if list_songs[input.to_i]
      puts "Playing #{} by #{}"
    end
=end
    #name = @song_hash.dig(song_number, :song_name)
    #artist = @song_hash.dig(song_number, :song_artist)
    #binding.pry
#    if list_songs[position]
#      puts "Playing #{} by #{}"
#    end
    #binding.pry
    #puts "Playing #{@song_hash.dig(song_number, :song_name)} by #{@song_hash.dig(song_number, :song_artist)}"
  #  if @song_hash.has_key?(song_number)
  #    puts "Playing Larry Csonka by Action Bronson"
      #@song_hash.each do |song_num, data|
      #  if song_number == song_num
      #puts "Playing #{@song_hash[song_number][:song_name]} by #{@song_hash[song_number][:song_artist]}"
      #  end
      #end
    #end

=begin
    if list_songs.detect {|song| song.start_with?(song_number)}
      puts "Playing #{} by #{}"
    end
=end
  end

end

=begin #old
    nested_library = @library.collect {|filename| filename.split(" - ")}
    sorted_nested_library = nested_library.sort {|x,y| x[1] <=> y[1]}

    counter = 0
    sorted_library = []
    while counter < sorted_nested_library.length
      sorted_library << sorted_nested_library[counter].join(" - ")
      counter +=1
    end

    listed_library = []
    sorted_library.each do |filename|
      num = sorted_library.index {|x| x == filename} + 1
      puts "#{num}. #{filename}"
      listed_library << "#{num}. #{filename}"
    end
    listed_library
=end
