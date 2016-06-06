class Song
  attr_accessor :name :artist, :genre
  @@all = []

  def initialize(name, artist, genre)
    @name = name
    @artist = artist
    @genre = genre
  end

  def save
    @all << self
  end

  def destroy_all
    @all.clear
  end

  def self.create(name)
    self.new(name).tap {|song| song.save}
  end
end
