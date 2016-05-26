class MusicLibraryController

  attr_accessor :path, :music_importer, :call

  def initialize(path = './db/mp3s')
    @path = path
    @music_importer = MusicImporter.new(@path)
    @music_importer.import
  end

  def call
    input = nil
    while input != "exit"
      puts "Welcome to your music library!"
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
    Song.all.each do |song|
      puts song.artist.name
    end
  end

  def genres
    Song.all.each do |song|
      puts song.genre.name
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
      "Input \"list songs\" to ",
      "This is the second line.",
      "1 + 1 is #{1 + 1}."
    ].join("\n") + "\n"
    call
  end

end
