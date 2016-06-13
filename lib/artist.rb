class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end

  def self.all
    @@all
  end


  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def self.destroy_all
    @@all.clear
  end


  def save
    @@all << self
  end

  def genres
    self.songs.collect { |song| song.genre}.uniq
  end
end
