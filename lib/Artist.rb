class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    new(name).tap{|x| x.save}
  end

  def self.all
    @@all
  end

  def add_song
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end

end
