class Artist
  attr_accessor :songs, :genres
  attr_reader :name
  @@all = []
  extend Concerns::Findable
  
  def initialize(name)
    @name = name
    @song = []
    @genres = []
  end
  
  def name=(name)
     @name=name
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    self.new(name).tap{|artist| artist.save}
  end
  
  def self.destroy_all
    self.all.clear
  end
end