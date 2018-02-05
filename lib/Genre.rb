class Genre
  #extend Concerns::Findable
  attr_accessor  :name
  attr_reader :songs

  @@all = []

  def initialize(name)
   @name = name
   @songs = []
  end



def self.all
  @@all
end

def save
  @@all << self
end

def self.create(name)
  genre = self.new(name)
  genre.save
  genre
end

def self.destroy_all
  @@all.clear
end

def artists
  songs.map(&:artist).uniq
  #songs.collect{|song|song.artist}.uniq
end

end
