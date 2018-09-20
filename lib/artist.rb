class Artist

  attr_accessor :name, :songs
  @@all = []
  extend Concerns::Findable

  def initialize(name)
    @name = name
    @@all << self
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
  end

  def songs
    @songs
  end

  def add_song(name)
    if name.artist == nil
      name.artist = self
    end
    if @songs.include?(name) == false
      @songs << name
      #@genres << name.genre
    end

  end

  def genres
    x = songs.collect {|song| song.genre}
    x.uniq
  end

end
