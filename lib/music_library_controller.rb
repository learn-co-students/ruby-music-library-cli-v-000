require 'pry' 

class MusicLibraryController
  attr_accessor :importer

  def initialize(path="./db/mp3s")
    @importer = MusicImporter.new(path)
    importer.import
  end

  def call
    puts "Welcome to Music Library. What would you like to do?"
    command = ""

    until command == "exit"
      "What would you like to do?"
      command = gets.strip
      case command

      when "list songs"
        importer.print_files
      when "list artists"
        Artist.print_names
      when "list genres" 
        Genre.print_names
      when "play song"
        play_song
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      end
    end

    def play_song
      puts "Which song number?"
      number = gets.strip
      puts "Playing #{importer.files[number.to_i - 1]}"
    end

    def list_artist
      puts "Which artist?"
      artist_name = gets.strip
      artist = Artist.find_by_name(artist_name)

      artist.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end

    def list_genre
      puts "Which genre?"
      genre_name = gets.strip
      genre = Genre.find_by_name(genre_name)

      genre.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end


end