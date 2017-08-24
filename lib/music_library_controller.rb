class MusicLibraryController

    def initialize(path = "./db/mp3s")
      importer = MusicImporter.new(path)
      importer.import
    end

    def call
      answer = ""
      while answer != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      answer = gets.chomp.downcase
      case answer
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
    end

    def list_songs
     Song.all.sort {|x, y| x.name <=> y.name}.each.with_index(1) do |song, index|
       puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort {|x, y| x.name <=> y.name}.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort {|x, y| x.name <=> y.name}.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    answer = gets.chomp
    artist = Artist.find_by_name(answer)
    if artist
    artist.songs.sort {|x, y| x.name <=> y.name}.each.with_index(1) do |song, index|
        puts "#{index}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    answer = gets.chomp
    genre = Genre.find_by_name(answer)
    if genre
      genre.songs.sort {|x, y| x.name <=> y.name}.each.with_index(1) do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    answer = gets.chomp.strip.to_i
    if (1..Song.all.length).include?(answer)
      song = Song.all.sort{ |x, y| x.name <=> y.name}[answer - 1]
    puts "Playing #{song.name} by #{song.artist.name}"
    end
  end


end
