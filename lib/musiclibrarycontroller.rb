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
    puts "--\'list songs\''"
    puts "-- \'exit\''"



        #this is the get an input item and call the method loop
        case gets.strip
        
        when "exit"
            
        when "list songs"
            list_songs
            call
        else
            call
        end
 


end


def list_songs
Song.all.each_with_index{|song, index|
                    puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
            }
end



#----------------------------------------------------------------------------------------
#class


end