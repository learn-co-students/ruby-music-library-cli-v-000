require 'pry'
class MusicLibraryController

  def initialize(path = "./db/mp3s")
    
    importer = MusicImporter.new(path)
    importer.import 
  end# of initialize


  def call
    input = nil 
    while input != "exit" 
      puts "Please make a selection" 
      input = gets.chomp

      case input

        when "list songs"
          Song.all.each.with_index(1) {
            |song, index| puts "#{index}. #{song}"
          }

        when "list artists"
          Artist.all.each.with_index(1) {
            |artist, index| puts "#{index}. #{artist}"
          }

        when "list genres"
          Genre.all.each.with_index(1) {
            |genre, index| puts "#{index}. #{genre}"
          }
        

        when "play song" 
          puts "Which track number would you like to play?"
          selection = gets.chomp
          puts "Playing #{@library[selection.to_i - 1 ]}"

        when "list artist"
          puts "Which artist would you like to list the songs of?"
          selection = gets.chomp
          @library.collect {|file| 
            data = file.split(" -")
            artist = data[0].strip
            if artist == selection 
              puts file
            end# of if 
          }

        when "list genres"
          puts "Which genre would you like to explore the songs of?"
          selection = gets.chomp
          genre = Genre.find_by_name(selection)
          genre.songs.each {|song| puts song}
          

      end# of case
    end# of loop 
  end# of call 

end# of class