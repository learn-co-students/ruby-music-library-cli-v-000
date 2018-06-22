class MusicLibraryController

  attr_accessor :path, :songs

  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def call
    input = ""

    while input != 'exit'
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
    Song.all.sort { |x, y|
      x.name <=> y.name
    }.each.with_index(1) { |val, i|
      puts "#{i}. #{val.artist.name} - #{val.name} - #{val.genre.name}"
    }
  end

  def list_artists
    Artist.all.sort { |x, y|
      x.name <=> y.name
    }.each.with_index(1) { |val, i|
      puts "#{i}. #{val.name}"
    }
  end

  def list_genres
    Genre.all.sort { |x, y|
      x.name <=> y.name
    }.each.with_index(1) { |val, i|
      puts "#{i}. #{val.name}"
    }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp

    if artist = Artist.find_by_name(input)
      artist.songs.sort { |x, y|
        x.name <=> y.name
      }.each.with_index(1) { |val, i|
        puts "#{i}. #{val.name} - #{val.genre.name}"
      }
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp

    if genre = Genre.find_by_name(input)
      genre.songs.sort { |x, y|
        x.name <=> y.name
      }.each.with_index(1) { |val, i|
        puts "#{i}. #{val.artist.name} - #{val.name}"
      }
    end
  end

  def play_song
    puts "Which song number would you like to play?"

    input = gets.chomp.to_i

    if input.between?(1, Song.all.length)
      song = Song.all.sort { |x, y|
        x.name <=> y.name
      }[input - 1]

      if song != nil
        puts "Playing #{song.name} by #{song.artist.name}"
      end
    end

  end
end
