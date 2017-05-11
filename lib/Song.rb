class Song

  attr_accessor :name, :genre, :artist

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

def save
   @@all << self
end

def self.create(name)
    new(name).tap{|x| x.save}
  end

  def genre
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

end
