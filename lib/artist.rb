class Artist
  attr_accessor :name
  attr_reader :songs

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
    Artist.all << self
  end

  def self.create(name)
    Artist.new(name).tap {|s| s.save}
  end

  def add_song(song)
    if (song.artist != self)
      song.artist = self
    end
    @songs << song if !(@songs.include?(song))
  end

  def genres
    @songs.collect {|s| s.genre}.uniq
  end

end
