class MusicLibraryController

  attr_accessor :path, :importer, :all_files

  def initialize(path = './db/mp3s')
    @path = path
    @importer = MusicImporter.new(@path)
    @importer.import
    @all_files = @importer.files
  end

  # Chops off the .mp3 and returns array as [artist name, song name, genre]
  def parse_filename(file)
    file.split(/ - |.mp3/)
  end

  def call
    self.run_controller
  end

  def get_user_input
    input = gets.chomp
  end

  def run_controller
    while true
      puts "What would you like to do?"
      puts "Type list songs, list artists, list genres, play song, list artist, list genre, exit"
      input = self.get_user_input

      case input
      when 'list songs'
        self.list_songs
      when 'list artists'
        self.list_artists
      when 'list genres'
        self.list_genres
      when  'play song'
        self.play_song
      when 'list artist'
        self.list_artist
      when 'list genre'
        self.list_genre
      when 'exit'
        return nil
      else
      end
    end
  end

  def list_songs
    self.all_files.each_with_index do |filename, index|
      puts "#{index + 1}. #{filename.sub(/.mp3/, "")}"
    end
  end

  def list_artists
    self.all_files.each do |filename|
      puts self.parse_filename(filename)[0]
    end
  end

  def list_genres
    self.all_files.each do |filename|
      puts self.parse_filename(filename)[2]
    end
  end

  def play_song
    puts "Which song would you like to play?"
    song_num = gets.chomp.to_i
    puts "Playing #{self.all_files[song_num - 1].sub(/.mp3/, "")}"
  end

  def list_artist
    puts "Which artist's songs would you like to list?"
    artist = gets.chomp
    Artist.find_by_name(artist).songs.each do |song|
      puts "#{artist} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_genre
    puts "Which genre would you like to list?"
    genre = gets.chomp
    Genre.find_by_name(genre).songs.each do |song|
      puts "#{song.artist.name} - #{song.name} - #{genre}"
    end
  end
end
