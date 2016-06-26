class MusicLibraryController
  attr_accessor:path
  attr_reader :x
  

  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    
    puts "Type \"help\" for available request"

    puts "Please enter request"
    input = gets.chomp
    
        
        if input == "help"
          puts "list songs -- Provides list all available songs"
          puts "list artist -- Provide list all available artist"
          puts "play song -- Plays requested song"
          puts "list artist -- Returns list of requested artist songs"
          puts "list genre -- Returns list of requested genres songs"

        #checks users request to match commands and returns request
        elsif input == "list songs"
            count =0
           Song.all.each do |song|
               puts "#{count+=1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
           end
       
        elsif input == "list artists"
            Artist.all.each{|artists| puts "#{artists.name}"}
       
        elsif input == "list genres"
            Genre.all.each{|genre| puts "#{genre.name}"}

        elsif input == "play song"
        puts "What song would you like to hear?"
        song_request = gets.chomp
        play_song =Song.all[song_request.to_i-1]
        puts "Playing #{play_song.artist.name} - #{play_song.name} - #{play_song.genre.name}"
   

        elsif input == "list artist"
          puts "What artist are you looking for"
          artist_request = gets.chomp
          Song.all.each do |song| 
            if song.artist.name == artist_request
              puts "- #{song.artist.name} - #{song.name} - #{song.genre.name}"
            end
          end

        elsif input == "list genre"
          puts "What genre are you looking for"
          genre_request = gets.chomp
          Song.all.each do |song| 
            if song.genre.name == genre_request
              puts "- #{song.artist.name} - #{song.name} - #{song.genre.name}"
            end
          end


        end




         #if command does not match or request already returned restarts call unless exit requested.
         if input != "exit"
          call
        end
       
    
  end

end