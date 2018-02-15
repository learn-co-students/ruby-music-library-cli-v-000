class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def name=(name)
    @name = name
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
    created = self.new(name).tap {|o| o.save}   # more condensed foobar.tap(&:save)
  end

  def artists
    songs.collect{|song| song.artist}.uniq
  end
end
