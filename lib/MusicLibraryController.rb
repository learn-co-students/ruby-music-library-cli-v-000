class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @path = path
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
    input = ""
    while input != "exit"
      input = gets.chomp
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
  end

  def list_songs
    Song.all.sort_by {|s| s.name}.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort_by {|a| a.name}.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort_by {|a| a.name}.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    songs = Song.all.select { |s| s.artist.name == input }.sort_by{ |s| s.name }
    songs.each.with_index(1) { |song, index| puts "#{index}. #{song.name} - #{song.genre.name}" }
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    songs = Song.all.select { |s| s.genre.name == input }.sort_by{ |s| s.name }
    songs.each.with_index(1) { |song, index| puts "#{index}. #{song.artist.name} - #{song.name}" }
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i
    if input > 0 && input <= Song.all.size
      song = Song.all.sort_by {|s| s.name}[(input-1)]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end
