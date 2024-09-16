class MusicLibraryController

  attr_accessor :path, :importer

  def initialize(path = './db/mp3s')
    @path = path
    @importer = MusicImporter.new(@path)
    @importer.import
  end

  def call
    input = gets.chomp.downcase
    case input
    when 'list songs'
      self.list_songs
    when 'list artists'
      self.list_artists
    when 'list genres'
      self.list_genres
    when 'play song'
      self.play_song
    when 'list artist'
      self.list_artist_songs
    when 'list genre'
      self.list_genre_songs
    when 'exit'
      return
    else
      self.call
    end
  end

  def list_songs
    i = 1
    Song.all.each do |song|
      puts "#{i}. #{song.full_name}"
      i += 1
    end
    self.call
  end

  def list_artists
    Artist.all.each { |artist| puts artist.name }
    self.call
  end

  def list_genres
    Genre.all.each { |genre| puts genre.name }
    self.call
  end

  def play_song
    puts 'Select a song number.'
    input = gets.chomp.to_i
    if input < 1 || input > Song.all.size
      puts 'Invalid selection.'
      self.call
    end
    song = Song.all[input - 1]
    puts "Playing #{song.full_name}"
    self.call
  end

  def list_artist_songs
    puts 'Select an artist.'
    input = gets.chomp
    artist = Artist.find_by_name(input)
    if artist
      artist.songs.each { |song| puts song.full_name }
    else
      puts 'No such artist.'
    end
    self.call
  end

  def list_genre_songs
    puts 'Select a genre.'
    input = gets.chomp
    genre = Genre.find_by_name(input)
    if genre
      genre.songs.each { |song| puts song.full_name }
    else
      puts 'No such genre.'
    end
    self.call
  end
end
