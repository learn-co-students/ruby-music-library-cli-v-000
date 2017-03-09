class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    puts "Welcome to Music Library CLI! (Hint: type 'commands' for a list of commands)"
    while input = gets.strip
      if input == "exit"
        puts "Goodbye!"
        break

      elsif input == "commands"
        puts "'list songs' - lists all songs"
        puts "'play song' - plays a specified song"
        puts "'list artists' - lists all artists"
        puts "'list genres' - lists all genres"
        puts "'list artist' - list all songs of specified artist"
        puts "'list genre' - lists all songs for specified genre"
        puts "'exit' - quit Music Library CLI"

      elsif input == "list songs"
        puts (Song.all.map.with_index(1) { |song, index| "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}" })

      elsif input == "list artists"
        Song.all.collect { |song, index| puts "#{song.artist.name}" }
        
      elsif input == "list genres"
        Song.all.collect { |song, index| puts "#{song.genre.name}" }

      elsif input == "play song"
        puts "Play which song number?"
        song_index = gets.strip.to_i - 1
        if song_index > -1 && song_index < Song.all.length
          this_song = Song.all[song_index]
          puts "Playing #{this_song.artist.name} - #{this_song.name} - #{this_song.genre.name}"
        else
          puts "Invalid song number. Cannot play song."
        end

      elsif input == "list artist"
        puts "List songs for which artist?"
        artist_name = gets.strip
        if Artist.find_by_name(artist_name)
          puts (Artist.find_by_name(artist_name).songs.collect { |song| "#{song.artist.name} - #{song.name} - #{song.genre.name}" })
        else
          puts "Invalid artist name. Cannot list songs."
        end

      elsif input == "list genre"
        puts "List songs for which genre?"
        genre_name = gets.strip
        if Genre.find_by_name(genre_name)
          puts (Genre.find_by_name(genre_name).songs.collect { |song| "#{song.artist.name} - #{song.name} - #{song.genre.name}" })
        else
          puts "Invalid genre name. Cannot list songs."
        end

      else
        puts "Invalid command. Type 'commands' for a list of commands."
      end
    end
  end
end
