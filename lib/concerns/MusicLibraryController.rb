
require 'pry'
class MusicLibraryController
    def initialize(path = "./db/mp3s")
        importer = MusicImporter.new(path)
        importer.import
    end

    def call
        input = " "
        
        while input != "exit"
            puts "Welcome to Your Music Library!"
            puts "What would you like to do?"
        input = gets.strip
        case input
                
            when "list songs"
                Song.all.each.with_index(1) do |song, i|
                    puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
                    
                 end

             when "list artists"
                
                 Artist.all.each.with_index(1) do |artist, i|
                    puts "#{i}. #{artist.name}"
                
                    end
            when "list genres"
                Genre.all.each do |genre|
                    puts "#{genre.name}"

                end

            when "play song"
                puts "What song number would you like to play?"
                song_number = gets.strip.to_i
                puts "Playing #{Song.all[song_number-1].artist.name} - #{Song.all[song_number-1].name} - #{Song.all[song_number-1].genre.name}"

            
                

           when "list artist"
               puts "Which artists songs would you like to see?"
                input = gets.strip
                Song.all.each do |song|
                    puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" if song.artist.name == input

                    

            end

        when "list genre"
            puts "Which genres songs would you like to see?"
            input = gets.strip
            Song.all.each do |song|
                puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" if song.genre.name == input
                  
                end
             end
            
    end

    end
        
end

  
