class Artist

  attr_accessor :name, :song, :genre

  @@all = []

  def initialize(name, song = nil, genre = nil)
    @name = name
  end
 
  def save
    @@all << self
  end
 
  def self.all
    @@all
  end
 
  def self.destroy_all
    @@all.clear
  end

  def self.create(name, song = nil, genre = nil)
    Artist.new(name).tap {|artist| artist.save}
  end


end