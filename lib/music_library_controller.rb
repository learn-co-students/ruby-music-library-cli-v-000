class MusicLibraryController
    
    def initialize(path = "./db/mp3s")
        @music_importer = MusicImporter.new(path).import
    end

    def call
        input = ""
        while input != "exit"
            puts "Welcome to your music library!"
            puts "What would you like to do?"
            input = gets.strip
            case input 
            when "exit"
                "exit"
            when "a"
                "a"
            when "b"
                "b"
            when "list songs"
                @music_importer.sort.each_with_index {|song, i| puts "#{i + 1}. " + song.split(".")[0]}
            when "list artists"
                artist_array = @music_importer.sort.map {|song| puts song.split(" - ")[0]}
                artist_array.uniq.map {|artist| puts artist}
            when "list genres"
                genre_array = @music_importer.sort.map {|song| puts song.split(" - ")[2].split(".")[0]}
                genre_array.uniq.map {|genre| puts genre}

            when "play song"
                puts "Please enter a number: "
                song_num = gets.strip.to_i
                puts "Playing #{@music_importer.sort[song_num - 1]}"
            when "list artist"
                puts "Please enter an artist: "
                artist = gets.strip
                artist_array = @music_importer.select {|song| song.include?(artist)}
                artist_array.sort.each {|song| puts song.split(".")[0]}
            when "list genre"
                puts "Please enter a genre: "
                genre = gets.strip
                genre_array = @music_importer.select {|song| song.include?(genre)}
                genre_array.sort.each {|song| puts song.split("."[0])}
            end
        end
    end
    
end