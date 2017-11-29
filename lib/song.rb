class Song
@@all = []
attr_accessor :name
  def initialize(name, artist=(nil), genre=(nil))
    self.name = name
    if artist.is_a?(Artist)
      self.artist = artist #if artist
    end
    if genre.is_a?(Genre)
      self.genre = genre
    end
  end
  def genre
    @genre
  end
  def genre=(name)
    @genre = name
    name.songs << self unless name.songs.include?(self)
  end

  def artist
    @artist
  end

  def artist=(name)
    @artist = name
    name.add_song(self)

  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    self.new(name).tap do |name|
      name.save
    end
  end







end
