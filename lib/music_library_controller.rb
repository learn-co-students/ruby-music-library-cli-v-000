class MusicLibraryController

  attr_accessor :path, :importer

  def initialize(path = "./db/mp3s")
    self.path = path
    self.importer = MusicImporter.new(self.path)
    self.importer.import
  end

  def call
    sort_songs_by_artist_name
    user_input = ""
    while user_input != "exit" do
      puts "What is your command?"
      user_input = gets.chomp
      case user_input
      when "list songs"
        self.list_songs
      when "list artists"
        self.list_artists
      when "list genres"
        self.list_genres
      when "play song"
        self.play_song(gets.chomp.to_i)
      when "list artist"
        self.list_artist(gets.chomp)
      when "list genre"
        self.list_genre(gets.chomp)
      end
    end
  end

  def list_songs
    Song.all.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def play_song(song_number)
    song = Song.all[song_number-1]
    puts "Playing #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end

  def list_artist(artist_name)
    artist = Artist.find_by_name(artist_name)
    artist.songs.each { |song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" }
  end

  def list_genre(genre_name)
    genre = Genre.find_by_name(genre_name)
    genre.songs.each { |song| puts "#{song.artist.name} - #{song.name} - #{song.genre.name}" }
  end

  def sort_songs_by_artist_name
    Song.all.sort! { |song1, song2| song1.artist.name <=> song2.artist.name }
  end

  def list_artists
    Artist.all.each do |artist|
      puts artist.name
    end
  end

  def list_genres
    Genre.all.each do |genre|
      puts genre.name
    end
  end

end
