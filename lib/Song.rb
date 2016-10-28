class Song
  attr_accessor :name
  attr_reader :artist

  def initialize(name)
    @name = name
    @all = []
    artist=nil
  end

 def artist=(artist)
   e  = artist.songs.include?(self)
   if e == false
artist.songs << self
end
@artist = artist

 end


  def self.all
  @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
end
end
