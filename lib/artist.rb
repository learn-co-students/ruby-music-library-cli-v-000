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

  def save
    @@all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)      #artist adds song to artist instance's array unless it's already there
    song.artist = self unless song.artist == self    #artist assigns new song's artist to itself unless already assigned
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq     #iterates through artists's song array and returns array of unique genres
  end

end
