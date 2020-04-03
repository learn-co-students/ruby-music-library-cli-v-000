class Genre
  attr_accessor :name
  attr_reader :songs
  @@all = []

  extend Concerns::Findable
  
  def initialize(name)
    @name = name
    @songs = []
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
    Genre.new(name).tap {|genre| genre.save}
  end

  def artists
    self.songs.map { |song| song.artist }.uniq
  end

end
