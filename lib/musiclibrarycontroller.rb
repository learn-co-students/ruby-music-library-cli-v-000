require 'pry'

class MusicLibraryController

  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
   input = "" 
    while input != "exit"
      puts "Please give an input"
      input = gets.chomp
      if input == "list songs"
        counter = 1
        Song.all.each do |song_object|
          puts "#{counter}. #{song_object.artist.name} - #{song_object.name} - #{song_object.genre.name}"
          counter += 1
        end
      elsif input == "list artists"
        Artist.all.each do |artist_object|
          puts "#{artist_object.name}"
        end
      elsif input == "list genres"
        Genre.all.each do |genre_object|
          puts "#{genre_object.name}"
        end
      elsif input == "play song" 
        puts "Enter the number of the song you want to play"
          songnumber = gets.chomp.to_i
            index = songnumber - 1 
          puts "Playing #{Song.all[index].artist.name} - #{Song.all[index].name} - #{Song.all[index].genre.name}"
      elsif input == "list artist"
        puts "Enter an artist:"
        artist_input = gets.chomp
        Artist.all.each do |artist_object|
          artist_object.songs.each do |song_object|
          puts "#{song_object.artist.name} - #{song_object.name} - #{song_object.genre.name}" if (song_object.artist.name == artist_input)
          end
        end
      elsif input == "list genre"
        puts "Enter a genre:"
        genreinput = gets.chomp
        Song.all.each do |song_object|
            puts "#{song_object.artist.name} - #{song_object.name} - #{song_object.genre.name}" if (song_object.genre.name == genreinput)
        end
      end
    end
  end
end

