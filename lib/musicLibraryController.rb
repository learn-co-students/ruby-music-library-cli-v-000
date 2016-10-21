class MusicLibraryController

  attr_accessor :path, :importer

  def initialize(path = "./db/mp3s")
    @path = path
    @importer = MusicImporter.new(path)
    @importer.import
  end

  def call
    input = ''
    while input != "exit"
      puts "Please enter some input:"
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
      end
    end  # while
  end

  def list_songs
    records = Dir.glob(@path + "/*.mp3")
    songs = records.collect { |record|  /[^\/]*$/.match(record)[0] }
    songs.sort!
    for i in 1..songs.size
      puts "#{i}. #{songs[i-1]}"
    end
  end

  def list_artists
    artists = Artist.all.collect { |artist| artist.name }
    artists.each { |artist| puts artist }
  end

  def list_genres
    genres = Genre.all.collect { |genre| genre.name }
    genres.each { |genre| puts genre }
  end

  def play_song
    puts "Enter song number to play"
    number = gets
    records = Dir.glob(@path + "/*.mp3")
    songs = records.collect { |record|  /[^\/]*$/.match(record)[0] }
    songs.sort!
    song = songs[number.to_i - 1]
    puts "Playing #{song}"
  end

  def list_artist
    puts "Enter artist to list songs"
    name = gets
    artist = Artist.all.detect { |artist| artist.name == name }
    songs = artist.songs
    records = []
    songs.each { |song| records << [name, song.name, song.genre.name] }
    records.each { |record| puts record.join(" - ") }
  end

  def list_genre
    puts "Enter genre"
    name = gets
    genre = Genre.all.detect { |genre| genre.name == name }
    songs = genre.songs
    records = []
    songs.each { |song| records << [song.artist.name, song.name, name] }
    records.each { |record| puts record.join(" - ") }
  end

end
