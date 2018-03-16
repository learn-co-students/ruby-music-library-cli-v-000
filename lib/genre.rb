class Genre
  include Concerns::InstanceMethod
  extend Concerns::ClassMethod, Concerns::Findable
  attr_accessor :name, :songs
  attr_reader
  @@all = []
  
  def self.all
    @@all
  end
    
  def initialize(name)
    super
    @songs = []
  end
  
  def artists
    self.songs.map{|song| song.artist}.uniq
  end
end