class Genre

  attr_accessor :name
  attr_reader :songs
  
  extend Concerns::Findable
  
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    self.class.all << self
  end
  
  def self.create(name)
    self.new(name).tap {|a| a.save}
  end
  
  def add_song(song)
    song.genre ||= self
    if !@songs.include?(song)
      @songs << song
    end
  end

  
  def artists
    @songs.collect { |s| s.artist }.uniq
  end
  
  def new_song(name, artist)
    Song.new(name, artist, self)
  end
  
end