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
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(song)
    new(song).tap{|s| s.save}
  end

  def add_song(song)
    @songs << song
  end

  def artists
    self.songs.collect {|s| s.artist}.uniq
end

def to_s
    self.name
  end
  
end
