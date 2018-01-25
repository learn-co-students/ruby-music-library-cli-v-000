class Song
  #accepts a name upon initialization and set that property
  #name property should be readable and writable by object

  attr_accessor :name

  @@all = []

  def initialize(name, artist = nil)
    @name = name
    @artist = artist if artist

  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    song =new(name)
    song.save
    song

  end

  def self.find_by_name(name)
    all.detect {|n| n.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

end
