require 'pry'

class MusicLibraryController

  def initialize(path = './db/mp3s')
    @path = path
    importer = MusicImporter.new(@path)
    @importer = importer
    importer.import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts"To list all of the songs by a particular artist, enter 'list artist'."
    puts"To list all of the songs of a particular genre, enter 'list genre'."
    puts"To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets
    while input != "exit"
      puts "What would you like to do?"
      input = gets
    end
  end

  def list_songs
    array = []
    index = -1
     @importer.files.each do |song|
       array << song.split(" -")[1].lstrip
     end
     ordered = array.sort
     ordered.each do |song|
       index = -1
       completed = false
       while completed != true
         index = index + 1
         if @importer.files[index].include? song
           answer = @importer.files[index].split(".mp3")
           puts "#{ordered.index(song) + 1}. #{answer[0]}"
           completed = true
         end
       end
     end
  end

  def list_artists
    array = []
     @importer.files.each do |song|
       array << song.split(" -")[0]
     end
     Artist.all.each do |artist|
       array << artist.name
     end
     array = array.flatten
     ordered = array.sort
     ordered = ordered.uniq
     ordered.each do |artist|
        puts "#{ordered.index(artist) + 1}. #{artist}"
     end
  end

  def list_genres
    array = []
     @importer.files.each do |song|
       answer = song.split(" -")[2].lstrip
       answer = answer.split(".mp3")
     end
     Genre.all.each do |artist|
       array << artist.name
     end
     array = array.flatten
     ordered = array.sort
     ordered = ordered.uniq
     ordered.each do |genre|
        puts "#{ordered.index(genre) + 1}. #{genre}"
     end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets
    array = []
    array4artists = []
    Song.all.each do |song|
      #binding.pry
      if song.artist.name == gets
        array << "#{song.name} - #{song.genre.name}"
        array4artists << song.name
      end
    end
    array4artists = array4artists.sort
#    binding.pry
    array4artists.each do |entry|
      boolean = false
      index = -1
      while boolean == false
        index = index + 1
        if array[index].include? entry
          puts "#{index + 1}. #{array[index]}"
          boolean = true
          binding.pry
        end
      end
    end
  end

end
