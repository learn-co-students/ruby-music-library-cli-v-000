require 'pry'

class MusicLibraryController
  
  def initialize(path = './db/mp3s')
    @path = path 
    @new_object = MusicImporter.new(@path)
    @new_object.import 
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
    
      @input = gets.strip
      counter = 0 
      
      until @input == "exit" || counter == 3
        puts "What would you like to do?" 
        @input = gets.strip 
        counter += 1 
      end 
    end
    
    def list_songs 
      #if @input == "list songs"
       @song_list = @new_object.files.sort_by! {|file| file.split(" - ")[1]}
       
       @song_list.each_with_index do |song, index|
       puts "#{index + 1}. #{song.chomp!(".mp3")}"
     end
    end
    
    def list_artists
      #if @input == "list artists"
        @artist_list = Artist.all.sort! 
        binding.pry 
        @artist_list.each_with_index do |artist, index|
          puts "#{index + 1}. #{artist}"
       end
     
    end
    
    def list_genres
       @genre_list = @new_object.files.sort_by! {|file| file.split(" - ")[2]}
       
       
       @genre_list.each_with_index do |song, index|
       puts "#{index + 1}. #{song.split(" - ")[2].chomp!(".mp3")}"
      
     end
    end
    
    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      artist_selection = gets.strip 
    end
    
    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      genre_type = gets.strip 
    end
    
    def play_song
      list_songs 
      puts "Which song number would you like to play?"
      @song_number = gets.strip
      
      def valid?
        if @song_number.to_i > 0 || @song_number.to_i <= @song_list.length 
        end 
      end
        
      if valid? 
        @song_list.each_with_index do |song, index|
         index = @song_number - 1 
         puts "#{song_list[index]}"
      end
    end 
    end
    
  end
