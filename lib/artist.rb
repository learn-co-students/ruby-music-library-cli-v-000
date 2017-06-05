class Artist

  attr_accessor :name, :songs  

  @@all = []

  def initialize(name)
    @name = name 
    @songs = []
  end

  def self.all 
    @@all 
  end 

  def self.destroy_all
    self.all.clear
  end 

  def save 
    @@all.push(self)
  end 

  def add_song(song)
    self.songs << song
    song.artist = self
  end

  def self.find_or_create_by_name(name)
    self.find(name) ? self.find(name) : self.create(name)
  end

  def self.find(name)
    self.all.find {|artist| artist.name == name }
  end

  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end

end 