require 'pry'

class MusicLibraryController

  extend Concerns::Findable
  attr_accessor :path
  

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

 
  def call
    loop do
      puts "Please enter one of the following to continue: 'list songs', 'list artists', 'list genres', 'play song', 'list artist', 'list genre', or 'exit' "
      input = gets.chomp.downcase
        case 
        when input == "list songs"
          songs
        when input == "list artists"
          artists
        when input == "list genres"
          genres
        when input == "play song"
          play
        when input == 'list artist'
          artist_songs
        when input == "list genre"
          genre_songs
        when input == "exit"
          break
        else
          puts "Please select an available option to continue, or type 'exit' to leave."
        end
      end
    end

  def songs
    counter = 1
    Song.all.each do |song|
      puts "#{counter}. #{song.information}"
      counter += 1
    end
  end

  def artists
    counter = 1
    Artist.all.each do |artist|
      puts "#{counter}. #{artist.name}"
      counter +=1
    end
  end

  def genres
    Genre.all.each do |genre|
      puts "#{genre.name}"
    end
  end

  def play
    songs
    puts "Please pick a song!"
    song_num = gets.chomp.to_i - 1
    song = Song.all[song_num]
    puts "Playing #{song.information}"
  end

  def artist_songs
    artist_name = gets.chomp
    puts "Which artist's songs would you like to see?"
    
    Artist.find_by_name(artist_name).songs.map do |song|
      puts song.information
    end
  end

  def genre_songs 
    puts "Which genre's songs would you like to sample?"
    genre_name = gets.chomp
    Genre.find_by_name(genre_name).songs.map do |song|
      puts song.information
    end
  end

  def information
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end
end