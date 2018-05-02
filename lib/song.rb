class Song
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end
  def self.destroy_all
    @@all.clear
  end
  def self.create(name)   #initializes and saves the song
    song = new(name)
    song.save
    song
  end

  def save                # adds the Song instance to the @@all class variable
    @@all << self
  end
end
