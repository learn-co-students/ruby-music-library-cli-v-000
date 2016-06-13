class MusicLibraryController
    
    def initialize(path="./db/mp3s")
        MusicImporter.new(path).import
    end
    
    def call
        input = ""
        while input != "exit"
            "Welcome! What do you want to do?"
            input = gets.chomp
            case input
                when "list songs"
                    self.list_songs
                    
            
            end
        end
    end
    
    def list_songs
        songs = Song.all.sort_by {|song| song.artist.name}
        songs.each_with_index do |song, index| 
            puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end
end