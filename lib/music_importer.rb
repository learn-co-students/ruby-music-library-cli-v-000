require 'pry'

class MusicImporter

  attr_accessor  :path, :name, :song, :genre, :artist


  extend Concerns::Findable
  include Concerns::Basics


  def initialize(path)
    @path = path

  end

  def files
    Dir.entries(@path).select {|f| !File.directory? f}
      
  end

  def import
    files.each do |file|
      Song.create_from_filename(file)
    end
  end


end

class MusicLibraryController

  attr_accessor :path, :files, :name, :song, :genre, :artist

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
    @program = true

  end

  def call
    puts "HudTunes"
    puts "What would you like to do?"

    while @program
      user_call = gets.chomp
      if user_call == "list songs"
        counter = 1
        Song.all.each do |x|
          puts "#{counter}. #{x.artist.name} - #{x.name} - #{x.genre.name}"
          counter +=1
        end   
      elsif user_call == "list artists"
        Artist.all.each do |x|
          puts "#{x.name}"
        end   
      elsif user_call == "list genres"
        Genre.all.each do |x|
          puts "#{x.name}"
        end
      elsif user_call == "play song"
        puts "What song?"
        number = gets.chomp
        song_number= number.to_i
        song_number -= 1
        song_names = Song.all.collect {|x| x.name}
        song_artist = Song.all.collect {|x| x.artist}
        song_genre = Song.all.collect {|x| x.genre}
        puts "Playing #{song_artist[song_number].name} - #{song_names[song_number]} - #{song_genre[song_number].name}"
      elsif user_call == "list artist"
        puts "What artist?"
        artist_name = gets.chomp
        Artist.all.each do |artists|
          if artists.name == artist_name
            artists.songs.each do |song|
              puts "#{artists.name} - #{song.name} - #{song.genre.name}"
            end
          end
        end
      elsif user_call == "list genre"
        puts "What genre?"
        genre_name = gets.chomp
        Genre.all.each do |genres|
          if genres.name == genre_name
            genres.songs.each do |song|
              puts "#{song.artist.name} - #{song.name} - #{genres.name}"
            end
          end
        end
      elsif user_call == "exit"
        @program = false
        puts "Goodbye"
      else
        puts "That was not a valid command"

      end
    end


  end





end