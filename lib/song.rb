class Song
#  extend Findable

  attr_accessor :name, :artist
  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def initialize(name, a = nil)
    self.name = name
    self.assign_artist=(a) unless a == nil
  end

  def self.create(name)
    self.new(name).tap do |song|
      @@all << song
    end
  end

  def save
    @@all << self
  end

  def assign_artist=(a)
    a.add_song(self)
    # @artist = a #set
    # a.songs << self unless a.songs.include?(self)
  end

end
