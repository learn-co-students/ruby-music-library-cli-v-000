class Genre #has many songs
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def artists
    (self.songs.collect {|song_instance| song_instance.artist}).uniq
  end

  def self.all
    @@all
  end

  def save #returns an array
    @@all << self
    self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    Genre.new(name).save
  end

end
