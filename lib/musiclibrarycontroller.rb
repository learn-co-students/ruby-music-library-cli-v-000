require 'pry'
class MusicLibraryController
  
#   attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    musicimporter =  MusicImporter.new(path)
    musicimporter.import
  end 
  
  
  def call
    answer = ''
    
    while answer != 'exit'
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    
    answer = gets.chomp
      
        case answer
            when "list songs"
              list_songs
            when "list artists"
              list_artists
            when "list genres"
              list_genres
            when "list artist"
              list_songs_by_artist
            when "list genre"
              list_songs_by_genre
            when "play song"
              play_song
            end
        end
  end
   
  
  # def list_songs
  #     Song.all.sort{|a, b| a<=>b}.each_with_index{ |item, index| puts "#{index}. #{item}"}
  # end
   
   def list_songs
     Song.all.sort{|a, b| a.name <=> b.name}.each_with_index do |song, index|
      # binding.pry
      indexplusone = index + 1 
       puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
     end
   end 
  
  def list_artists
    Artist.all.sort{|a, b| a.name <=> b.name}.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end
  
  def list_genres
    Genre.all.sort{|a, b| a.name <=> b.name}.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end  
  
  def list_songs_by_artist
    answer = ""
    puts "Please enter the name of an artist:"
    answer = gets.chomp
    Song.all.select{|song|song.artist.name == answer}.sort{|a, b| a.name <=>b.name}.each_with_index do |song, index|
      puts "#{index + 1}. #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_songs_by_genre
    answer = ""
    puts "Please enter the name of a genre:"
    answer = gets.chomp
    Song.all.select{|song|song.genre.name == answer}.sort{|a, b| a.name <=>b.name}.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name}"
    end
  end
  
  def play_song
    
    answer = ""
    puts "Which song number would you like to play?"
    answer = gets.chomp.to_i
    # binding.pry
      if answer > 0 && answer < Song.all.length
        # if answer.between?(0, Song.all.length) - Different syntax
        array = Song.all.sort{|a, b| a.name <=> b.name}
        song = array[answer - 1]
        puts "Playing #{song.name} by #{song.artist.name}"
      end
  end
  
end