class MusicLibraryController
  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
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
    counter = 0
    Song.all.sort_by {|song| song.name}.each.each do |song|
      puts "#{counter += 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    counter = 0
    Artist.all.sort_by {|artist| artist.name}.each.each do |artist|
      puts "#{counter += 1}. #{artist.name}"
    end
  end

  def list_genres
    counter = 0
    Genre.all.sort_by {|genre| genre.name}.each.each do |genre|
      puts "#{counter += 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    counter = 0
    puts "Please enter the name of an artist:"
    input = gets.strip
    if Artist.find_by_name(input)
      Artist.find_by_name(input).songs.sort_by {|song| song.name}.each do |song|
        puts "#{counter += 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    counter = 0
    puts "Please enter the name of a genre:"
    input = gets.strip
    if Genre.find_by_name(input)
      Genre.find_by_name(input).songs.sort_by {|song| song.name}.each do |song|
        puts "#{counter += 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    song = Song.all.sort_by {|song| song.name}[input - 1]
    if song.class == Song && input.between?(1, Song.all.size)
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end
