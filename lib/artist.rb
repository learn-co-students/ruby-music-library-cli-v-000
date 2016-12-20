class Artist

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    #self.new(name).tap {|x| x.save}
    artist = self.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def genres
    self.songs.collect do |song|
      song.genre
    end.uniq
  end
end