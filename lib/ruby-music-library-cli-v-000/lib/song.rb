class Song
  attr_accessor :name
  @@all = []

  def initialize(song_title)
    @name = song_title
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear #check I might need to use .clear instead
  end

  def save
    self.class.all << self
  end

  def self.create(song_title)
    @@all.include()

  end
end
