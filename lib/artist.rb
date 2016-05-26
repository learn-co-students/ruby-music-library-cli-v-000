class Artist

  attr_accessor :name, :genre, :songs
  # attr_reader :songs
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    self.songs << song unless @songs.include?(song)
    song.artist =  self unless song.artist == self
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def genres
    # ebinding.pry
    self.songs.collect {|song| song.genre}.uniq
  end

  # def to_s
  #   self.name
  # end

end
