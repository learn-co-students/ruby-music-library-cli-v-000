class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    puts "Hello! Welcome to your music library!"
    puts "Please choose one of the options below to begin:"
    puts "List Songs"
    puts "List Artists"
    puts "List Genres"
    puts "Play Song"
    puts "List Artist"
    puts "List Genre"
    puts "Exit"
    exit = false
    while !exit 
      input = gets.strip.upcase
      case input
        when 'LIST SONGS'
          Song.print_all
          
          
        when 'LIST ARTISTS' 
          Artist.print_all
          
        when 'LIST GENRES' 
          Genre.print_all
          
        when 'PLAY SONG'
          Song.print_all
          puts "Please choose a # for the song you want to play."
          choice = gets.strip.to_i - 1
          print "Playing "
          Song.all[choice].print
          
        when "LIST ARTIST"
          Artist.print_all
          puts "Please choose an artist's name."
          choice = gets.strip.split(" ").each {|word| word.capitalize!}
          choice = choice.join(" ")
          Artist.find_or_create_by_name(choice).songs.each {|song| song.print}
          
        when "LIST GENRE"
         Genre.print_all
         puts "Please choose a genre."
         choice = gets.strip
         Genre.find_or_create_by_name(choice).songs.each {|song| song.print}
         
       when 'EXIT'
         exit = true
         puts "See ya! Have a great day!"
       else
          puts "ERROR!!! Invalid input please try again!"
     end
   end
 end

  
   

  

  



end