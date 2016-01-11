class MusicLibraryController

  def initialize(path = './db/mp3s')
    music_importer = MusicImporter.new(path)
    music_importer.import
  end

  def call
    input = ""

    # Sorts all songs by artist's name, then by song's name
    Song.all.sort_by!{|song| [song.artist.name, song.name]}

    while input != "exit"
      puts "Welcome to you music library!"
      puts "What would you like to do? (list songs/ list artists/ list genres/ exit)"
      input = gets.strip

      #Options based on input
      case input
        when "list songs"
          list_songs
        when "list artists"
          list_artists
        when "list genres"
          list_genres
        when "play song"
          play_song
        when "list artist"
          list_artist
        when "list genre"
          list_genre
        when "exit"
          break
      end
    end

  end

###  Display methods for songs, artists, and genres
  def list_songs
    puts "Here are the songs in your music library:"
    Song.all.each.with_index(1){|song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      }
  end

  def list_artists
    puts "Here are the artists in you music library: "
    Artist.all.each{|artist, index| puts "#{artist.name}" }
  end

  def list_genres
    puts "Here are the genres in you music library: "
    Genre.all.each{|genre, index| puts "#{genre.name}" }
  end

  def play_song
    puts "Which song do you want to play? "
    input = gets.strip
    song = Song.all[input.to_i - 1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_artist
    puts "What artist do you want to search for? "
    input = gets.chomp
    artist = Artist.find_by_name(input)
    artist.songs.each{|song| puts "#{artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_genre
    puts "What genre do you want to search for? "
    input = gets.chomp
    genre = Genre.find_by_name(input)
    genre.songs.each{|song| puts "#{song.artist.name} - #{song.name} - #{genre.name}"}
  end

end
