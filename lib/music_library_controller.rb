class MusicLibraryController
  attr_accessor :song_request

  def initialize(path= "./db/mp3s")
    @path = path
    music_importer = MusicImporter.new(@path)
    music_importer.import
  end

  def call
    loop do
      puts "\nPlease choose from the following options:",
           "\t-List Songs (list all songs)",
           "\t-Play Song (select a song to play)",
           "\t-List Artists (list all artists)",
           "\t-List Artist (list all songs from an artist)",
           "\t-List Genres (list all genres)",
           "\t-List Genre (list all songs from a genre)",
           "\t-Exit (to quit the program)"
      user_response = gets.strip.downcase

      case user_response
      when "list songs"
        list_songs
      when "list artist"
        list_artist
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list genre"
        list_genre
      when "play song"
        play_song
      when "exit"
        puts "\nHave a good day!"
        break
      end

    end
  end


  def list_songs
    Song.all.each.with_index(1) do |song,num|
      puts "#{num}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
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

    puts "\n-Select a song from the playlist (select 1-#{Song.all.count}):"
    self.song_request = gets.strip.to_i
    song = Song.all[song_request - 1]

    if valid_selection?
      puts "\nPlaying #{song.artist.name} - #{song.name} - #{song.genre.name}"
    else
      puts "\n-Sorry but '#{song_request}' is not a valid selection, please choose again."
      play_song
    end
  end

  def valid_selection?
    song_request.between?(1, Song.all.count)
  end

  # user selects an artist and gets a list of songs for that artist
  def list_artist
    list_songs
    puts "\n-Please choose an artist from the playlist by entering the name of the desired artist (note: names are case sensative):"
    artist_request = gets.strip

    if artist = Artist.find_by_name(artist_request)
      artist.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    else
      puts "\n-Could not find an artist by the name of '#{artist_request}' in the playlist, please check the spelling or choose another artist from the playlist:"
    end
  end


  # user selects a genre and gets a list of songs for that genre
  def list_genre
    list_songs
    puts "\n-Please choose a genre from the playlist by entering the name of the desired genre:"
    genre_request = gets.strip.downcase

    if genre = Genre.find_by_name(genre_request)
      genre.songs.each do |song|
        puts "#{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    else
      puts "\n-Could not find a genre by the name of '#{genre_request}' in the playlist, please check the spelling or choose another genre from the playlist:"
    end
  end

end
