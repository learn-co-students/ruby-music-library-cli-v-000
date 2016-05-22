class MusicLibraryController
    
    def initialize(path = "./db/mp3s")
      @path = path
      MusicImporter.new(path).import
    end
    
    def call
      puts "Welcome to Music Library CLI \nPlease select an option:"
      show_options
    end

    def show_options
      puts "List Songs - My Songs \nList Artists - My Artists \nList Genres - My Genres \nPlay Song - Play Song
List Artist - List Songs by Artist \nList Genre - List Songs by Genre \nExit - Exit the Program"
      execute_options
    end

    def execute_options
      input = gets.strip.downcase

      case input
        when "list songs"
          Song.all
          show_options
        when "list artists"
          Artist.all
          show_options
        when "list genres"
          Genre.all
          show_options
        when "play song"
          puts "Please select a song:"
          Song.all.each do |song|
            puts "#{Song.all.index(song)} - #{song.name}"
          end
          song_input = get.strip
          if song_input <= Song.all.size
            song = Song.all[song_input]
            puts "Now Playing #{song.artist} - #{song.name} - #{song.genre}"
            show_options
          end
          show_options
        when "list artist"
          artist_input = get.strip
          puts "Please select an artist:"
          if Artist.all.index(artist_input).nil?
            puts "Artist not found, please try again"
          else
            Artist[Artist.all.index(artist_input)].songs
          end
          show_options
        when "list genre"
          genre_input = get.strip
          puts "Please select a genre:"
          if Genre.all.index(genre_input).nil?
            puts "Genre not found, please try again"
          else
            Genre[Genre.all.index(genre_input)].songs
          end
          show_options
        when "exit"
          "Thank you for using Music Library CLI"
        else
          puts "Invalid entry - please try again"
          show_options
      end

    end
end