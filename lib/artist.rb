class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    Artist.new(name).tap {|artist| artist.save}
  end

  def add_song(song)
    song.artist = self unless song.artist
    self.songs << song unless self.songs.include?(song)
  end

  def genres
    self.songs.map {|song| song.genre}.uniq
  end

end
