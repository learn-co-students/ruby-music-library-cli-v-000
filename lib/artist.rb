class Artist

  @@all = [ ]

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save #again, can't just put all << self b/c "all" is a class method
    self.class.all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

end
