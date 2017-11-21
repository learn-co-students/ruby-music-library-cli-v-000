#require "pry"

class MusicLibraryController
  attr_accessor :path, :music_importer, :files

  def initialize(path='./db/mp3s')
    @music_importer=MusicImporter.new(path)
    @music_importer.import
    @files=@music_importer.files
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

    enter=""
    while enter!='exit' do
      enter=gets
      puts "You entered: #{enter="exit"}"
      case enter
        when "list songs"
          list_songs
        when "list genres"
          list_genres
        when "list artist"
          list_artists
        when "play song"
          play_song
        else
      end

    end
  end
  #require 'pry'


  def list_songs
    #binding.pry
    songs= @files.collect{|filename|
      filename.split(/\s-\s/)[1]}.sort.uniq
      #puts "Songs! #{songs}"

    songs.each_with_index do |song, index|
      puts "#{index+1}. " + @files.detect {|file| file.include?(song)}.split(".")[0].to_s
      #puts "#{index}. #{song}"
      #songs
    end
  end

  def list_artists
    artists= @files.collect{|filename|
      filename.split(/\s-\s/)[0]}.sort.uniq
      #puts "Songs! #{songs}"

    artists.each_with_index do |artist, index|
      puts "#{index+1}. #{artist}"# +# @files.detect {|file| file.include?(artist)}.split(".")[0].to_s
    end
  end

  def list_genres
    genres=@files.collect{|filename|
      filename.split(/\s-\s/)[2].split(".")[0]}.sort.uniq
    genres.each_with_index do |genre, index|
      puts "#{index+1}. #{genre}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist=gets
    songs=@files.collect{|filename|
        filename.split(/\s-\s)[1] if filename.split(/\s-\s)[0]==artist}.sort.uniq
    songs.each_with_index do |song, index|
      puts "#{index+1}. #{song}"
    end
  end

  def play_song
  end

end
