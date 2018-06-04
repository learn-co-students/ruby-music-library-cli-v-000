class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name, artist = nil)
    @name = name
    artist.add_song(artist)
    # if artist != nil
    #   @artist = Artist.new(artist)
    #   artist.add_song(self)
    # end
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

end
