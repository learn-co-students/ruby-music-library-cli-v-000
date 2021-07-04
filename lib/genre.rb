class Genre

  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(genre)
    self.new(genre).tap {|name|
    name.save}
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def artists
    self.songs.collect do |song|
      song.artist
    end.uniq
  end

  def self.destroy_all
    @@all.clear
  end
end
