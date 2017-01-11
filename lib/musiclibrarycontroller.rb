class MusicLibraryController
  attr_reader :path

  def initialize(path = "./db/mp3s")
    @path = path
    musicimporter = MusicImporter.new(path)
    musicimporter.import
  end

  def call
    input =""

    while input != 'exit' do
      puts "Welcome to your music library, what would you like to do?"
      puts "list songs   - list songs in library"
      puts "list artists - list artists in library"
      puts "list genres  - list genres in library"
      puts "play song    - plays song"
      puts "list artist  - list songs by a particular artist"
      puts "list genre   - list all songs in genre a genre"
      input = gets.strip

      case input 

      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      when 'play song'
        play_song
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      end
    end
  end

  def list_songs
    Song.all.each.with_index(1) do |song, index|
      puts "#{index}. #{song}"
    end
  end

  def list_artists
    Artist.all.each { |artist| puts "#{artist.name}"}
  end

  def list_genres
    Genre.all.each { |genre| puts "#{genre.name}"}
  end

  def play_song
    puts "Which song number? "
    input = gets.strip
    puts "Playing #{Song.all[input.to_i-1]}"
  end

  def list_artist
    puts "Which artist?"
    input = gets.strip
    artist = Artist.find_by_name(input)
    artist.songs.each { |song| puts "#{song}"}
  end

  def list_genre
    puts "Which genre?"
    input = gets.strip
    genre = Genre.find_by_name(input)
    genre.songs.each { |song| puts "#{song}" }
  end
end