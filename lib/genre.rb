class Genre 
  extend Concerns::Findable
  # include Concerns::Findable::InstanceMethods

  attr_accessor :name, :songs
  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def artists
    songs.collect {|song| song.artist}.uniq
  end

  def self.destroy_all
    self.all.clear
  end   

  def save
    self.class.all << self
  end
      
  def self.create(name)
     new(name).tap{|artist| artist.save}
  end
end
