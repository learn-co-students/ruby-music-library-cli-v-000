class Artist 
  extend Findable::ClassMethods
  # extend Persistable::ClassMethods
  # extend Nameable::ClassMethods
  # include Persistable::InstanceMethods
  attr_accessor :name, :songs, :genres
  
  @@all = []
  
  def self.all
    @@all 
  end
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def save
      self.class.all << self
  end
  
  def self.create(name)
    new(name).tap {|artist| artist.save}
  end

  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end

  def genres
    songs.collect{ |s| s.genre }.uniq
  end

end