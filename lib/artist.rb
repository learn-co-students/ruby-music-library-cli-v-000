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
    @@all.clear
  end

  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end

  def save
    @@all << self if !@@all.include?(self)
  end

  def add_song(song)
      @songs << song if @songs.none? {|s| s == song}
      song.artist = self if !song.artist
  end

  def genres
    @songs.map {|song| song.genre}.uniq
  end

end
