class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  attr_reader :genre
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

  def genre=(genre)
    @genre = genre
  end

  def save
    @@all << self unless @@all.include?(self)
  end

  def self.create(name)
    self.new(name).tap {|genre| genre.save}
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.genre = self unless song.genre == self
  end

  def artists
    @songs.collect {|song| song.artist }.uniq
  end
end