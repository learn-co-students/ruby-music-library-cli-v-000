class MusicLibraryController
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = ""

    while input != "exit"
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

       if input  == "list songs"
         list_songs
       elsif input  == "list artists"
         list_artists
       elsif input  == "list genres"
         list_genres
       elsif input  == "list artist"
         list_songs_by_artist
       elsif input  == "list genre"
         list_songs_by_genre
       elsif input  == "play song"
         play_song
       end
     end
  end

  def list_songs
    Song.all.sort{|a, b| a.name <=> b.name }.each.with_index(1) do |song, number|
      puts "#{number}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort{|a, b| a.name <=> b.name }.each.with_index(1) do |artist, number|
      puts "#{number}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort{|a, b| a.name <=> b.name }.each.with_index(1) do |genre, number|
      puts "#{number}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets
    if Artist.find_by_name(input) != nil
      Artist.find_by_name(input).songs.sort{|a, b| a.name <=> b.name }.each.with_index(1) do |song, number|
        puts "#{number}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets
    if Genre.find_by_name(input) != nil
      Genre.find_by_name(input).songs.sort{|a, b| a.name <=> b.name }.each.with_index(1) do |song, number|
        puts "#{number}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.to_i
    if input <= Song.all.length && input > 0
      songs = Song.all.sort{|a, b| a.name <=> b.name }
      puts "Playing #{songs[input-1].name} by #{songs[input-1].artist.name}"
    end
  end
end
