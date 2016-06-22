class MusicLibraryController
  def initialize(filepath="./db/mp3s")
    importer = MusicImporter.new(filepath)
    importer.import
  end

  def call
    # puts "This is the interface for your music library."
    input = ''
    while input.downcase != 'exit'
      puts "Please enter a command: "
      input = gets.chomp
      if input == "list songs"
        self.list_songs
      elsif input == "list artists"
        self.list_artists
      elsif input == "list genres"
        self.list_genres
      elsif input == "play song"
        self.play_song
      elsif input == "list artist"
        self.artists_songs
      elsif input == "list genre"
        self.genres_songs
      end
    end
  end

  def list_songs
    songs = self.songs
    songs.each_with_index { |song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
  end

  def list_artists
    Artist.all.each { |artist| puts artist.name }
  end

  def list_genres
    Genre.all.each { |genre| puts genre.name }
  end

  def play_song
    puts "Which song number? "
    song_num = gets.chomp.to_i
    songs = self.songs
    song = songs[song_num - 1]


    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def artists_songs
    puts "Which artist? "
    input = gets.chomp
    artist = Artist.find_by_name(input)
    artist.songs.each { |song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" }
  end

  def genres_songs
    puts "Which genre? "
    input = gets.chomp
    genre = Genre.find_by_name(input)
    genre.songs.each { |song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" }
  end

  def songs
    songs = Song.all.sort { |a, b| a.artist.name <=> b.artist.name }
  end
end
