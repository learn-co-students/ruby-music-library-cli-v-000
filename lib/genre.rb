

class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def artists
    self.songs.collect{|song| song.artist}.uniq
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
#
#  def self.find_by_name(name)
#    self.all.detect {|person| person.name == name}
#  end

end
