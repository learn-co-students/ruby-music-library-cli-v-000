class Genre
  extend Concerns::Findable

  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @songs = []

  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def artists
      self.songs.map do |song|
        song.artist
      end.uniq
    end

  def self.find_by_name(name)
    self.all.detect {|genre| genre.name == name}
  end
end
