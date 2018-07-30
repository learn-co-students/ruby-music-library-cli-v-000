class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name, artist = " ")
     @name = name
     @artist = artist
    #attributes.each {|k, v| self.send(("#{k}="), v)}
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
    song = Song.new(name)
    @@all << self
    self
  end



end
