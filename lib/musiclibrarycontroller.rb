class MusicLibraryController

  attr_accessor :path, :music_importer, :call

  def initialize(path = './db/mp3s')
    @path = path
    @music_importer = MusicImporter.new(@path)
    @music_importer.import
  end

  def call
    input = nil
    puts "Welcome to your music library!"
    while input != "exit"
      puts "What would you like to do?"
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
          list_artist_songs
        when "list genre"
          list_genre_songs
        when "help"
          help
      end
    end
  end


  def songs
    index = 1
    Song.all.each do |song|
      puts index.to_s + ". " + song.artist.name + " - " + song.name + " - " + song.genre.name
      index += 1
    end
  end


  def artists
    Artist.all.each do |artist|
      puts artist.name
    end
  end

  def artists_linear
    artists = Artist.all.collect do |artist|
      artist.name
    end
    puts artists.join(", ")
  end

  def genres_linear
    genres = Genre.all.collect do |genre|
      genre.name
    end
    puts genres.join(", ")
  end

  def genres
    Genre.all.each do |genre|
      puts genre.name
    end
  end

  def play_song
    puts "You can play any of the following songs:"
    songs
    puts "From the list of songs above, please enter the number of the song you would like to play."
    song_input = gets.strip.to_i
    song = Song.all[song_input -1]
    puts "Playing " + song.artist.name + " - " + song.name + " - " + song.genre.name
  end

  def list_artist_songs
    puts "Enter an artist's name to receive a list of songs by that artist."
    artist_input = gets.strip
    artist = Artist.find_by_name(artist_input)
    if artist == nil
      puts "Sorry, artist, \"#{artist_input}\", not found in your library. Please enter one of the artists listed below."
      artists_linear
      list_artist_songs
    else
      puts "Song(s) in your music libray by #{artist.name} include:"
      artist.songs.each do |song|
        puts song.artist.name + " - " + song.name + " - " + song.genre.name
      end
    end
  end

  def list_genre_songs
    puts "Enter a genre to receive a list of songs within that genre."
    genre_input = gets.strip
    genre = Genre.find_by_name(genre_input)
    if genre == nil
      puts "Sorry, genre, \"#{genre_input}\", not found in your library. Please enter one of the genres listed below."
      genres_linear
      list_genre_songs
    else
      puts "#{genre.name.capitalize} songs in your music libray include:"
      genre.songs.each do |song|
        puts song.artist.name + " - " + song.name + " - " + song.genre.name
      end
    end
  end

  def help
    puts ["Please choose from the following commands: ",
      "-  Input \"list songs\" to view all songs in your library.",
      "-  Input \"list artists\" to view all artists in your library.",
      "-  Input \"list genres\" to view all genres in your library.",
      "-  Input \"play song\" to play a song from your library. You will be prompted for the song name after typing \"play song\" and pressing the return key.",
      "-  Input \"list artist\" to view all songs in your library by a particular artist. You will be prompted for the artist's name after typing \"list artist\" and pressing the return key.",
      "-  Input \"list genre\" to view all songs in your library from a particular genre. You will be prompted for the genre's title after typing \"list genre\" and pressing the return key.",
    ].join("\n \n") + "\n \n"
    call
  end

end
