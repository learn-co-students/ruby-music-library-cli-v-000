class Artist
  extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name)
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.is_a?(Object)
      unless song.artist == self
        song.artist = self
      end
      unless @songs.include?(song)
        @songs << song
      end
    end
  end

  def genres
    array = (self.songs.map {|song| song.genre})
    array.uniq
  end

end
