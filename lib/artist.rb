class Artist
  extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.find_by_name(name)
    all.detect {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) == nil ? self.create(name) : self.find_by_name(name)
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
    name = self.new(name)
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist.instance_of?(Artist) != true ? song.artist = self : nil
    song.artist.name != self.name ? song.artist.name = self : nil
    songs << song unless songs.include?(song)
  end

  def genres
    songs.collect{|s| s.genre}.uniq
  end
end
