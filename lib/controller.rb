class MusicLibraryController
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = ""
    until input = "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      input = gets.strip

      case input
      when "list songs"
          list_songs
       when "list artists"
         list_artists
       when "list genres"
         list_genres
       when "list artist"
         list_songs_by_artist
       when "list genre"
         list_songs_by_genre
       when "play song"
         play_song
       end
    end

    def list_songs
      counter = 1
      Song.all.sort.each do |song|
        puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        counter += 1
      end
    end

    def list_artists
      counter = 1
      Artist.all.sort.each do |artist|
        puts "#{counter}. #{artist.name}"
        counter += 1
      end
    end

    def list_genres
      counter = 1
      Genre.all.sort.each do |genre|
        puts "#{counter}. #{genre.name}"
        counter += 1
      end
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      input = gets.strip
      if Artist.all.include?(input)
        counter = 1
        input.songs.name.sort.each do |song|
          "#{counter}. #{song.name}"
          counter += 1
        end
      end
    end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      input = gets.strip
      if Genre.all.include?(input)
        counter = 1
        input.songs.name.sort.each do |song|
          "#{counter}. #{song.name}"
          counter += 1
        end
      end
    end
  end
end
