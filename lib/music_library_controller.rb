class MusicLibraryController
  def initialize(path = './db/mp3s')
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
    i = 1
    songs = Song.all.sort_by do |song|
      song.name
    end

    songs.each do |song|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      i += 1
    end
  end

  def list_artists
    i = 1
    artists = Artist.all.sort_by do |artist|
      artist.name
    end

    artists.each do |artist|
      puts "#{i}. #{artist.name}"
      i += 1
    end
  end

  def list_genres
    i = 1
    genres = Genre.all.sort_by do |genre|
      genre.name
    end

    genres.each do |genre|
      puts "#{i}. #{genre.name}"
      i += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    i = 1

    if Artist.all.detect {|x| x.name == input}
      Artist.all.each do |artist|
        if artist.name == input
          sorted = artist.songs.sort_by {|y| y.name}
          sorted.each do |song|
            puts "#{i}. #{song.name} - #{song.genre.name}"
            i += 1
          end
        end
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    i = 1

    if Genre.all.detect {|x| x.name == input}
      Genre.all.each do |genre|
        if genre.name == input
          sorted = genre.songs.sort_by {|y| y.name}
          sorted.each do |song|
            puts "#{i}. #{song.artist.name} - #{song.name}"
            i += 1
          end
        end
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i - 1
    songs = Song.all.sort_by do |song|
      song.name
    end
    song = songs[input]
    if input <= songs.length - 1 && input >= 0
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end
