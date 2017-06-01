class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name

    #@@all << self
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
    new(name).tap{|s| s.save}
  end

  # def add_song(song)
  #   @songs << song unless song.artist == self
  #   song.artist = self
    # end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end


end
