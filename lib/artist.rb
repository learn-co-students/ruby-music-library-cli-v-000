class Artist
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

  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless @songs.include?(song)
  end

  def genres
    @songs.collect{|s| s.genre}.uniq
  end

end