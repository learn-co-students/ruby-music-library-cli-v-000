class MusicLibraryController
  attr_accessor :path

  def initialize(path="./db/mp3s")
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
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      when "play song"
        play_song(input)
      end
    end
  end

  def songs
    Song.all.each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def artists
    Artist.all.each.with_index(1) do |artist, index|
      puts "#{index}. #{artist.name}"
    end
  end

  def genres
    Genre.all.each.with_index(1) do |genre, index|
      puts "#{index}. #{genre.name}"
    end
  end

  def play_song(index)
    song = Song.all[index.to_i]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_artist
    artist_input = gets.strip
    if artist = Artist.find_by_name(artist_input)
      artist.songs.each do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_genre
    genre_input = gets.strip
    if genre = Genre.find_by_name(genre_input)
      genre.songs.each do |song, index|
        puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      end
    end
  end

end
