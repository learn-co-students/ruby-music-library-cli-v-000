class Genre
  attr_accessor :name, :songs
  @@all = []

  extend Concerns::Findable

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new(name).tap {|genre| genre.save}
  end

  def artists
    self.songs.collect do |song|
      song.artist
    end.uniq
  end

end
