class MusicLibraryController
#----------------------------------------------------------------------------------------
#vars and macros
attr_accessor :path, :music_importer

def initialize (path = "./db/mp3s")
@path = path
@music_importer = MusicImporter.new(@path)
@music_importer.import
end

#----------------------------------------------------------------------------------------
#instance

def call
    puts "Welcome to your Zune. Please select an option from below"
    puts "--list songs"
    puts "-- list artists"
    puts "-- list genres"
    puts "-- play song (list songs to see song numbers)'"
    puts "-- list artist"
    puts "-- list genre"
    puts "-- exit"



        #this is the get an input item and call the method loop
        order = gets.strip

        if order == "exit"
            
        elsif order == "list songs"
            list_songs
            call
        elsif order == "list artists"
            list_artists
            call
        elsif order == "list genres"
            list_genres
            call
        elsif order.include?("play song")
            play_song
            call
        elsif order.include?("list artist")
            list_artist
            call
          elsif order.include?("list genre")
            list_genre
            call
        else
            puts "**Note you must type one of the text options below to use the player"
            call
        end
 


end


def list_songs
Song.all.each_with_index{|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
end

def list_artists
Artist.all.each_with_index{|artist, index| puts "#{index+1}. #{artist.name}"}
end

def list_genres
Genre.all.each_with_index{|genre, index| puts "#{index+1}. #{genre.name}"}
end

def play_song
puts "Which song number?"
# binding.pry
song_number = gets.strip.to_i - 1
# binding.pry
puts "Playing #{Song.all[song_number].artist.name} - #{Song.all[song_number].name} - #{Song.all[song_number].genre.name}"
# binding.pry
end


def list_artist
puts "Which artist?"
artist_name = gets.strip
Artist.find_by_name(artist_name).songs.each{|song| puts "#{artist_name} - #{song.name} - #{song.genre.name}"}
end

def list_genre
puts "Which genre?"
genre_name = gets.strip
Genre.find_by_name(genre_name).songs.each{|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
end


#----------------------------------------------------------------------------------------
#class


end