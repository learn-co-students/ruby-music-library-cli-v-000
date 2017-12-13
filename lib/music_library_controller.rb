class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    mi = MusicImporter.new(path)
    mi.import
  end

  def call
    # puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."

    input = ""
    while input != "exit"
      puts "Welcome to your music library!"
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
        list_genre
      when "play song"
        play_song
      end
    end
  end

  def list_songs
    Song.all.sort { |songA, songB| songA.name <=> songB.name }.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort { |artistA, artistB| artistA.name <=> artistB.name }.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort { |genreA, genreB| genreA.name <=> genreB.name }.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    input = ""
    input != "exit"
    puts "Please enter the name of an artist:"
    input = gets.strip
    stored = Artist.find_by_name(input)
    if stored
      stored.songs.sort {|a, b| a.name <=> b.name}.map.with_index(1) do |song, index|
        puts "#{index}. #{song.name} - #{song.genre.name}"
      end
    end
  end


end
