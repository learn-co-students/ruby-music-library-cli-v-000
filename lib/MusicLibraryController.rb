require 'pry'
class MusicLibraryController 
  
 # @@all = []
  
  def initialize(path="./db/mp3s")  
  #@song_object = 
  MusicImporter.new(path).import
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
      answer = gets.strip
      while answer != "exit"
      puts "What would you like to do?"
      answer = gets.strip
      end 
  end 
  
  def list_songs
      @sorted_array = []
      Song.all
     @sorted_array = Song.all.sort do |first_item, second_item|
         first_item.name <=> second_item.name 
         # @names <<  Song.new_from_filename(item).name
        end 
        
     @sorted_array.each_with_index do |item, index|
       index+=1 
       puts "#{index}. #{item.artist.name} - #{item.name} - #{item.genre.name}"
     end 
      
     # @new_object = []
      ##   @song_object.each do |object|
        #    if object.include?(item)
         #     @new_object << object 
          #  end 
          #nd 
        #end 
       # @new_object.each_with_index do |object, index|
       #   index+=1 
       #   puts "#{index}. #{object.gsub!(".mp3","")}"
      #  end
      end 
  
  def list_artists
      @artists = []
        @song_object.each do |item|
          new_item = []
        
         new_item = item.split(" - ")
       
         @artists << new_item[0]
        end 
        @artists = @artists.sort.uniq!
      
        @artists.each_with_index do |object, index|
          index+=1 
          puts "#{index}. #{object}"
        end
      end 
 
end 