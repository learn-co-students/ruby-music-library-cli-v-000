

class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end
  
    def save
      self.class.all << self
    end
  
    def destroy_all
      self.all.clear
    end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

end
