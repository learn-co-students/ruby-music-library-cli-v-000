class Genre

  attr_accessor :name, :song, :artist

  @@all = []

  def initialize(name, song = nil, artist = nil)
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

  def self.create(name, song = nil, artist = nil)
    Genre.new(name).tap {|genre| genre.save}
  end

end