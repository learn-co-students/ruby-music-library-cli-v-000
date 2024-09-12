class Artist
  extend Concerns::Findable

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

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    self.new(name).tap{|artist| artist.save}
  end

  def add_song(song)
    songs << song unless songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
    songs.collect{|song| song.genre}.uniq
  end

end
