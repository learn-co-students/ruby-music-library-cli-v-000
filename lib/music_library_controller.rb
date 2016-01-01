require_relative './music-importer.rb'
require_relative './song.rb'
require_relative './artist.rb'
require_relative './genre.rb'

class MusicLibraryController

  extend Concerns::Findable

  def initialize(path="./db/mp3s")
    @new_importer = MusicImporter.new(path)
    @new_importer.import
  end

  def call
    puts "Hello! What would you like to do? Here are your options:"
    puts "list songs"
    puts "list artists"
    puts "list genres"
    puts "play song"
    puts "list artist"
    puts "list genre"
    input = gets.chomp
  end

  def exit?
    puts "Would you like to exit? Type exit."
    gets.chomp
  end


  def list_songs
    file_num = 1
    list = @new_importer.files.each do |file| 
      puts "#{file_num}. #{file.split(".")[0]}"
      file_num += 1
    end
    self.exit?
  end
  
  def list_artists
    Artist.all.each {|artist| puts artist.name}
    self.exit?
  end

  def list_genres
    Genre.all.each {|genre| puts genre.name}
    self.exit?
  end

  def play_song
    puts "What song would you like to play? Enter song #"
    song = gets.chomp
    song = @new_importer.files[song.to_i - 1].split(".")[0]
    puts "Playing #{song}"
    self.exit?
  end

  def list_artist
    puts "What artist would you like to see?"
    artist = gets.chomp
    @new_importer.files.each do |file|
      if file.split(" - ")[0] == artist
        puts file.split(".")[0]
      end
    end
    self.exit?
  end
  
  def list_genre
    puts "What genre would you like to see?"
    genre = gets.chomp
    @new_importer.files.each do |file|
      if file.split(" - ")[2].split(".")[0] == genre
        puts file.split(".")[0]
      end
    end
    self.exit?
  end

end




