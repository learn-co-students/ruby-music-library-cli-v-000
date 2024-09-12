# spec/002_artist_basics_spec.rb
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

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    #artist = self.new(name)
    #artist.save
    #artist
    new(name).tap{|a| a.save}
  end


  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)

  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

  def to_s
    self.name
  end


end
