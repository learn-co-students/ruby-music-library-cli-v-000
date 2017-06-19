class Genre
  extend Concerns::Findable

  attr_reader :songs

  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []

  end

  def save
    self.class.all << self    
  end

  @@all = []

  def self.create(name)
    self.new(name).tap{|data| data.save}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  

  def artists
    @songs.collect{|s| s.artist}.uniq
  end

end