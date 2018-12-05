class Genre

attr_accessor :name

@@all = []

def initialize(name)
  @name = name
  @songs = []
end

def songs
  @songs
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
  created_genre = Genre.new(name)
  created_genre.save
  created_genre
end


end
