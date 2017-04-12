class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    self.save unless self.class.all.include?(self)
    self.songs << song unless self.songs.include?(song)
    song.genre = self unless song.genre == self
  end

  def save
    @@all << self
  end

  def artists
    @songs.collect{|song| song.artist}.uniq
  end

  def self.create(name)
    Genre.new(name).tap{|new_genre| new_genre.save}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end
