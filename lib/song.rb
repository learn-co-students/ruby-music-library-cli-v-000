class Song
  attr_accessor :name

  @@all = []
  
  def initialize(name)
    @name = name
  end

  def save
    @@all << self
  end

  def self.create(name)
    Song.new(name).tap{|new_song| new_song.save}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
  
end