class Genre
  attr_accessor :name
  attr_accessor :songs
  # attr_accessor :artists

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name).tap {|genre| genre.save}
  end

  def artists
    artist_array = @songs.map {|song| song.artist }
    artist_array.uniq
  end

end
