class Song

  attr_accessor :name, :genre
  attr_reader :artist

  @@all = []

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) ? nil : genre.songs << self
    end
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @genre = genre
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new(name).tap{|song| song.save}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end


end
