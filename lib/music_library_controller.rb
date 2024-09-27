class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
    importer
  end

   def call
    input = ""
    while input != "exit"
      puts "Welcome to Your Music Library!"
      puts "What would you like to do?"
      input = gets.strip
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
        list_artists_songs
      when "list genre"
        list_genres_songs
      end
    end
  end

  def list_songs
    Song.all.each.with_index(1) do |song, num|
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
    puts "Which song number would you like to hear?"
    song_input = gets.chomp
    select = Song.all[song_input.to_i - 1]
    puts "Playing #{select.artist.name} - #{select.name} - #{select.genre.name}"
  end

  def list_artists_songs
    puts "Which artists' songs would you like to list?"
    artist_input = gets.chomp
      if artist = Artist.find_by_name(artist_input)
        artist.songs.each do |s|
          artist_song = s.name
        artist.genres.each do |g|
          genre_name = g.name
        puts "#{artist.name} - #{artist_song} - #{genre_name}"
        end
      end
    end
  end

  def list_genres_songs
    puts "Which genres' songs would you like to list?"
    genre_input = gets.chomp
    if genre = Genre.find_by_name(genre_input)
      genre.songs.each do |s|
          song_name = s.name
      genre.artists.each do |a|
          artist_name = a.name
      puts "#{artist_name} - #{song_name} - #{genre.name}"
          #Song.all.each { |song| puts "#{song.to_s}" if song.genre.name == genre}
        end
      end
    end
  end

end