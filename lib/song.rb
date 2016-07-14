class Song

  attr_accessor :name
  @@all = []

  def intiailize(name)
    @name = name
  end

  def save
    @all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end
