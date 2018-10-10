

class MusicLibraryController
  
   def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
   end
   
   def call
     
    input = ""
    puts "Welcome to 
    
      until input == "exit"
      puts "Please enter action"
      input = gets.chomp
      end 
    end
  end
    