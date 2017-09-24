class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs, :artists

  @@all = []

  def initialize(name, songs = [])
    @name = name
    @songs = songs
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new(name).tap {|genre| genre.save}
  end

  def artists
    self.songs.map{|song| song.artist}.uniq
  end



end
