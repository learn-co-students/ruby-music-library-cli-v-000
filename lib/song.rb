class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist)
    self.genre=(genre)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = new(name)
    song.save
    song
  end

  def artist=(artist)
    if !artist.nil?
      @artist = artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
    if !genre.nil? && !genre.songs.include?(self)
      @genre = genre
      genre.songs << self
    end
  end

  def self.create_by_name(name)
    create(name)
  end

  def self.find_by_name(name)
    all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end

  def self.new_from_filename(filename)
    artist_name, song_name, genre_name = filename.chomp('.mp3').split(" - ")
    song = find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end
end
