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
    artist = self.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    @songs << song unless self.songs.include?(song)
  end

  def genres
    genres = []
    self.songs.each{|song| genres << song.genre}.uniq!
    genres.uniq!
    genres
  end

  #def self.find_by_name(name)
    #self.all.detect{|obj| obj.name == name}
  #end

  #def self.find_or_create_by_name(name)
    #self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  #end



end
