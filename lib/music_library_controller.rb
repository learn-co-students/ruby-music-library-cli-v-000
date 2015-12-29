class MusicLibraryController
   
    def initialize(path="./db/mp3s")
        @path=path
        MusicImporter.new(path).import
    end
    
    def call 
       response=nil
       while response!= "exit"
        puts "Your choices are list songs, list artists, list genres, play song, list artist, list genre, or exit"
       
        response=gets.chomp
       case response
         when "list songs"
                list_songs
         when "list artists"
                list_artists
         when "list genres"
                list_genres
         when "play song"
                play_song
         when "list artist"
                list_artist
         when "list genre"
                list_genre
         when "exit" 
            puts "See you next time!"
         else 
             puts "invalid response"
        
       end
       end #for whle loop
    end# for call method

    def list_songs #uses all @@all instance of Songs to print out each numbered full song
            new_array=[]
            Song.all.each do |song| #takes the list of songs and adds the fullname versions to a new array
                new_array << song.fullname
                        end
            new_array.sort! #sorts the names of songs
            new_array.each_with_index do |song,i| #adds the index number
                puts "#{i+1}. #{song}"
                        end
    end
    
    def list_artists #iterates over Artist class @@all to list all artists
        Artist.all.each do |artist|
                puts artist.name
                        end
    end
    
    def list_genres #iterates over Genre class @@all to list all genres
        Genre.all.each do |genre|
                puts genre.name 
                        end
    end
    
    def play_song #gets a number and uses that to selecet one song from the Song class @@all
           number=gets.chomp
                new_array=[]
                Song.all.each do |song| #creates a new array with the fullname version of the songs created
                    new_array << song.fullname
                            end
                new_array.sort! #sorts the new array
                song_number=number.to_i
                puts "Playing #{new_array[song_number-1]}" #displays the chosen song from the number recieved
    end
    
    def list_artist #gets an artist, and matches that with the Song class @@all
            artist_given=gets.chomp
            Song.all.each do |song|
                if song.artist.name==artist_given
                    puts song.fullname
                end
                            end
    end
    
    def list_genre #gets a genre, and matches that with the Song class @@all
        genre_given=gets.chomp
        Song.all.each do |song|
            if song.genre.name==genre_given
                puts song.fullname
            end
                    end
    end    
end