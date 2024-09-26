class Genre

extend Concerns::Findable

attr_accessor :name
attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(genre)
    self.new(genre).tap{|g| g.save}
  end

  def artists
    self.songs.collect{|a| a.artist}.uniq
  end


end
