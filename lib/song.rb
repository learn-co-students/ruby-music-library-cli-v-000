class Song
@@all = []
attr_accessor :name, :artist
  def initialize(name, artist=(nil))
    self.name = name
    self.artist = artist
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
    self.new(name).tap do |name|
      name.save
    end
  end







end
