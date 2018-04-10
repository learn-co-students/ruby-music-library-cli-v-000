class Genre
  extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end
  #CLASS METHODS
  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    instance  = self.new(name)
    instance.save
    instance
  end

  #INSTANCE METHODS
  def save
    self.class.all << self
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song unless self.songs.include?(song)
  end

  def artists
    self.songs.collect do |song|
      song.artist
    end.uniq
  end


end
