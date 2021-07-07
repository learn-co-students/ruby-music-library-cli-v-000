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

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def songs
    @songs
  end

  def artists
    @songs.collect {|s| s.artist}.uniq
  end

end
