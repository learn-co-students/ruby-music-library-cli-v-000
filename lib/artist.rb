class Artist

  extend Concerns::Findable
  attr_accessor :name, :song, :genres
  @@all = []

  def initialize(name)
    @name = name
    save
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
    self.new(name)
    # self.name.save
  end

  def songs
    @songs
  end

  def genres
    self.songs.collect  {|song| song.genre}.uniq

  end

  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless @songs.include?(song)
  end

end
