class MusicLibraryController
    
    def initialize(path="./db/mp3s")
        MusicImporter.new(path).import
    end
    
    def call
        puts "Please enter a song, or enter exit to leave."
        input = gets.strip
        
        if input != "exit"
            call
        end
    end
end