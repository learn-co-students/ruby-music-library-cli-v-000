class Artist
  extend Concerns::Findable #Take all of the methods in the Findable module and add them as class methods

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all #Class Reader
    @@all
  end

  def save # Instance Method
    @@all << self
  end

  def self.destroy_all #Helper Method
    @@all.clear
  end

  def self.create(name)
    self.new(name).tap {|a| a.save}
  end

  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless songs.include?(song)
  end

  def genres
    songs.collect {|song| song.genre}.uniq
  end

end
