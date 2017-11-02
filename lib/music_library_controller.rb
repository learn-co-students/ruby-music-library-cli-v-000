class MusicLibraryController
  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path = path
    imported_music = MusicImporter.new(path)
    imported_music.import
  end

  def call(*)
   puts "Welcome to your music library!"
   puts "To list all of your songs, enter 'list songs'."
   puts "To list all of the artists in your library, enter 'list artists'."
   puts "To list all of the genres in your library, enter 'list genres'."
   puts "To list all of the songs by a particular artist, enter 'list artist'."
   puts "To list all of the songs of a particular genre, enter 'list genre'."
   puts "To play a song, enter 'play song'."
   puts "To quit, type 'exit'."
   puts "What would you like to do?"

    gets "a"
    gets "b"
    gets "c"
    gets "exit"
  end

  def list_songs
    sorted = Song.all.sort_by do |song|
    song.name
    end

    sorted.each.with_index(1) do |song, index|
     puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    sorted
  end

  def list_artists
    sorted = Artist.all.sort_by do |artist|
    artist.name
    end

    sorted.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
    end
    sorted
  end

  def list_genres
    sorted = Genre.all.sort_by do |genre|
    genre.name
    end

    sorted.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
    end
    sorted
  end

  def list_songs_by_artist
     puts "Please enter the name of an artist:"
     response = gets.strip

       if artist = Artist.find_by_name(response)
         sorted_array = artist.songs.sort_by do |song|
          song.name
        end
        sorted_array.each.with_index(1) do |song, index|
          puts "#{index}. #{song.name} - #{song.genre.name}"
        end
      end
    end

    def list_songs_by_genre
       puts "Please enter the name of a genre:"
       response = gets.strip

         if genre = Genre.find_by_name(response)
           sorted_array = genre.songs.sort_by do |song|
            song.name
          end
          sorted_array.each.with_index(1) do |song, index|
            puts "#{index}. #{song.artist.name} - #{song.name}"
          end
        end
      end

      


end
