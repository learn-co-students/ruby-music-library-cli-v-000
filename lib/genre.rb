class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name).tap {|genre| genre.save}
  end

  def save
    @@all << self if !@@all.include?(self)
  end

  def add_song(song)
      @songs << song if @songs.none? {|s| s == song}
      song.genre = self if !song.genre
  end

  def artists
    @songs.map {|song| song.artist}.uniq
  end

end
