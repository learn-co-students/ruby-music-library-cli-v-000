require 'pry'
class MusicLibraryController 
  attr_accessor :path, :import_files, :input
  


 def initialize(path='./db/mp3s')
   @path = path
 
   new_import = MusicImporter.new(@path)
   
   @import_files =  new_import.import

        # = new_import.
 end


 def call 
  

  puts "Welcome, please enter anything
  ** Possible Commands **
  list artists 
  list genres
  play song
  list artist 
  list genre 

  "
  

  while @input != 'exit'
  
  @input = gets.strip

  

  if @input == 'list songs'
      
     @import_files = @import_files.collect{ |x| x.split('.')[0]}
       
     @import_files.each_with_index{|x,index|puts"#{index+1}. #{x}"}                 
                            
  
  elsif @input == 'list artists'
       Artist.all.each{|x|puts x.name} 

  elsif @input == 'list genres'
       Genre.all.each{|x|puts x.name}

  elsif @input == 'play song'
    puts 'What is the numbered song that you would like to play?'
    input2 = gets.strip.to_i 
    puts "Playing #{@import_files[input2-1]}"

  elsif @input == 'list artist'
    puts 'Which Artist?'
    input_artist = gets.strip 
    art = Artist.find_by_name(input_artist)
    art.songs.each{|x| puts "#{input_artist} - #{x.name} - #{x.genre.name}"}
  
  elsif @input == 'list genre'
    puts 'Which Genre'
    input_genre = gets.strip 
    gen = Genre.find_by_name(input_genre)
     
    gen.songs.each{|x| puts "#{x.artist.name} - #{x.name} - #{input_genre}"}

  end # if statement 
puts "** What's next? **
  ** Possible Commands **
  list artists 
  list genres
  play song
  list artist 
  list genre 
"
 end # while Loop 


  
end # Method 








end 