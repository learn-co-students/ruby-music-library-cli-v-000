class Artist

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

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(artist)
    self.new(artist).tap{|g| g.save }
  end

  def add_song(song)
    @songs << song unless @songs.include? song
    song.artist = self unless song.artist == self
  end

  def genres
    self.songs.collect{|g| g.genre}.uniq
  end

end
