class MusicLibraryController
    def initialize(path='./db/mp3s')
        MusicImporter.new(path).import
    end

    def call
        input = ""
        until input == "exit"
            input = gets.chomp
            case input
            when exit
                puts "Goodbye."
            end     
        end
    end

end 