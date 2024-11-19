class Artist
    extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  # Instance Methods
  def initialize(name)
    self.name = name
    @songs = []
  end

  def save
    self.class.all << self
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
    song.artist = self if song.artist.nil?
  end

  def songs
    @songs
  end

  def genres
    self.songs.collect {|s| s.genre}.uniq
  end

  #  Class Methods
  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = Artist.new(name).tap{|a| a.save}
  end
end
