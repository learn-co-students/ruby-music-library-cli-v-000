class Genre
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs
  def initialize(name)
    @name = name
    @songs = []
  end

  @@all = []

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
    Genre.new(name).tap {|genre| genre.save}
  end

  def artists
    self.songs.map { |song| song.artist }.uniq
  end

end
