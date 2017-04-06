class Song
  attr_accessor :name, :artist, :genre

  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    @genre = genre
    artist.add_song(self) unless artist == nil
    genre.add_song(self) unless genre == nil
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    Song.new(name).tap do |song|
      song.save
    end
  end

  def artist=(name)
    @artist = name
    name.add_song(self) unless name.songs.include?(self)
  end

  def genre=(name)
    @genre = name
    name.add_song(self) unless name.songs.include?(self)
  end

  def self.find_by_name(song)
    self.all.find{|instance| instance.name == song}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

end
