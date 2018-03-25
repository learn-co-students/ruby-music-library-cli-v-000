class Genre 
  extend Concerns::Findable
  attr_accessor :songs, :name
  @@all = []

  def initialize(name)
    # super(name)
    @name = name
    @songs = []
  end

  def artists
    songs.map(&:artist).uniq
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name).tap do |new_instance|
      @@all << new_instance
    end
  end
end
