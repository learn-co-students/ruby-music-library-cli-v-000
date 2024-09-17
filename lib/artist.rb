class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def genres
    ans = []
    @songs.each do |s|
      ans << s.genre if !ans.include?(s.genre)
    end
    ans
  end

  def add_song(song)
    @songs << song if !@songs.include?(song)
    song.artist = self if song.artist != self
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
    ans = self.new(name)
    ans.save
    ans
  end
end