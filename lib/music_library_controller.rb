class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    input = ""
    while input != "exit"
      input = gets.strip
      case input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "play song"
        play_song
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      end
    end
  end

  def songs
    Song.all.each.with_index(1) {|song, index|
      puts "#{index}. #{song}"
    }
  end

  def artists
    Artist.all.each.with_index(1) {|artist, index|
      puts "#{index}. #{artist}"
    }
  end

  def genres
    Genre.all.each.with_index(1) {|genre, index|
      puts "#{index}. #{genre}"
    }
  end

  def play_song
    which_song = gets.strip
    puts "Playing #{Song.all[which_song.to_i - 1]}"
  end

  def list_artist
    which_artist = gets.strip
    if artist = Artist.find_by_name(which_artist)
      artist.songs.each {|song, index|
        puts "#{index}. #{song}"
      }
    end
  end

  def list_genre
    which_genre = gets.strip
    if genre = Genre.find_by_name(which_genre)
      genre.songs.each {|genre, index|
        puts "#{index}. #{genre}"
      }
    end
  end

end
