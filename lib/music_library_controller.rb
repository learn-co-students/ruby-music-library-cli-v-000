class MusicLibraryController

  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path).import
  end

  def call
    input = ''
    while input != 'exit'
      show_menu
      input = gets.strip
      # puts input
      case input
        when 'list songs'
          list_songs
        when 'list artists'
          list_artists
        when 'list genres'
          list_genres
        when 'play song'
          play_song
        when 'list artist'
          list_artist_songs
        when 'list genre'
          list_genre_songs
        else
          'I do not understand that request'
      end
    end
    puts "Thanks for visiting the jukebox!"
  end


  def list_songs
    Song.all.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.each do |artist|
      puts "#{artist.name}"
    end
  end

  def list_genres
    Genre.all.each do |genre|
      puts "#{genre.name}"
    end
  end

  def play_song
    list_songs
    selection = gets.strip.to_i - 1
    song = Song.all[selection]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_artist_songs
    artist = Artist.find_by_name(gets.strip)
    artist.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_genre_songs
    genre = Genre.find_by_name(gets.strip)
    genre.songs.each {|song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def show_menu
    puts "Matchbox Player 8000 Menu Listings"
    puts "To list all songs, please enter 'list songs'"
    puts "To list all artists, please enter 'list artists'"
    puts "To list all genres, please enter 'list genres'"
    puts "To play a song, please enter 'play song' and then enter the number of your chosen song"
    puts "To list all of an artist's songs, please enter 'list artist' followed by the name of the artist"
    puts "To list all of a genre's songs, please enter 'list genre' followed by the name of the genre"
  end

end


