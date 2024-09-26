class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all= []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find(name)
    self.all.find {|genre| genre.name == name }
  end

  def self.create(name)
    self.new(name).tap {|genre| genre.save}
  end

  def add_song(song)
    @songs << song
  end

  def artists
    @songs.collect {|s| s.artist}.uniq
  end

  def self.destroy_all
    @@all.clear
  end

  def to_s
   self.name
 end


end
