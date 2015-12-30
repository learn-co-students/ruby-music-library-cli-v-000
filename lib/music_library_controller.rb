class MusicLibraryController
  attr_reader :music_importer

  def initialize(path="./db/mp3s")
    @music_importer = MusicImporter.new(path)
    @music_importer.import
  end

  def call
    input = nil

    while input != "exit" do
      puts "Give input: list songs, list artists, list genres, play song, list artist, list genre, exit"
      input = gets.chomp

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
        puts "Goodbye."
      else
        puts "Invalid. Enter again."
      end
    end
  end

  def list_songs
    Song.all.each_with_index { |song, index| puts "#{index + 1}. #{song.name_listing}" }
  end

  def list_artists
    Artist.all.each { |artist| puts artist.name }
  end

  def list_genres
    Genre.all.each { |genre| puts genre.name }
  end

  def play_song
    puts "Playing #{Song.all.first.name_listing}"
  end

  def list_artist
    input = gets.chomp
    artist_detected = Artist.all.detect { |artist| artist.name == input }
    artist_detected.songs.each { |song| puts song.name_listing }
  end

  def list_genre
    input = gets.chomp
    genre_detected = Genre.all.detect { |genre| genre.name == input }
    genre_detected.songs.each { |song| puts song.name_listing }
  end

end