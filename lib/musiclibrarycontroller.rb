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

  def genres
    Genre.all.each do |genre|
      puts genre.name
    end
  end

  def play_song
    puts "Playing " + Song.all[0].artist.name + " - " + Song.all[0].name + " - " + Song.all[0].genre.name
  end

  def list_artist_songs
    puts "Which artist do you want a song list for?"
    artist_input = gets.strip
  end

  def list_genre_songs
    puts "Which genre do you want a song list for?"
    genre_input = gets.strip
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
