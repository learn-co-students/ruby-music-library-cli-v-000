class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    if (genre.class == Genre)
      @genre = genre
      unless genre.songs.include?(self)
        genre.songs << self
      end
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    Song.new(name).save
    @@all.last
  end

  def self.find_by_name(name)
    @@all.detect do |song|
      name == song.name
    end
  end

  def self.find_or_create_by_name(name)
    binding.pry
    unless self.find_by_name(name)
      self.create(name)
    end
  end

end
