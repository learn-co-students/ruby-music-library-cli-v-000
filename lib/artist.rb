class Artist

  extend Concerns::Findable

  @@all = []

  attr_accessor :name, :songs

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
    @@all.clear
  end

  def self.create(name)
    self.new(name).tap do |s|
      s.save
    end
  end

  def add_song(song)
    #binding.pry
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
    #binding.pry
    @songs.collect {|song| song.genre}.uniq
    #binding.pry
  end

end
