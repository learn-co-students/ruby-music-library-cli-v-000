class Artist
  attr_accessor :name
  attr_reader :songs
  @@all = []

  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
  end

  def genres
    unique_genres = []
    @songs.each {|song| unique_genres << song.genre if !unique_genres.include?(song.genre)}
    unique_genres
  end

  def save
    @@all << self if !@@all.include?(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name).tap{|artist| artist.save}
  end

  def add_song(song)
    if song.class == Song && !@songs.include?(song)
      @songs << song
      song.artist = self
    end
  end

end
