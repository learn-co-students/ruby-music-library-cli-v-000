class MusicLibraryController

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
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

    if input == "list songs"
      "list_songs"
    elsif input == "list artists"
      "Artists.all"
    elsif input == "list genres"
      "Genres.all"
    elsif input == "list artist"
      "Code"
    elsif input == "list genre"
      "Code"
    elsif input == "play song"
      "Play song"
    elsif input == "exit"
      "call"
    else
      call
    end
  end

  def list_songs
    Song.all.sort {|a,b| a.name <=> b.name}.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort {|a,b| a.name <=> b.name}.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort {|a,b| a.name <=> b.name}.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_input = gets.strip

    if artist = Artist.find_by_name(artist_input)
      artist.songs.sort {|a,b| a.name <=> b.name}.each.with_index(1) do |song, index|
      puts "#{index}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_input = gets.strip

    if genre = Genre.find_by_name(genre_input)
      genre.songs.sort{|a,b| a.name <=> b.name}.each.with_index(1) do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name}"
      end 
    end
  end

end
