class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    self.new(name).tap {|genre| genre.save}
  end

  def save
    self.class.all << self
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
    song.genre = self if song.genre == nil
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end
end
