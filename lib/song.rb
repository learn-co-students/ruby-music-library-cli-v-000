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
end
