class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
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
    new_from_filename = self.new(name)
    new_from_filename.save
    new_from_filename
  end

  def artist=(artist)
    if @artist != artist
      @artist = artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
    if @genre != genre
      @genre = genre
      genre.add_song(self)
    end
  end

  def self.find_by_name(name)
    @@all.detect { |song| song.name = name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

end
