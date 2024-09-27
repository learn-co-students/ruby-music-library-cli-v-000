class Genre

  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    save
    @songs = []
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
    self.new(name)
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

end
