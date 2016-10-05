class Genre
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
      unless song.genre == self
        song.genre = self
      end
      unless @songs.include?(song)
        @songs << song
      end
    end
  end

  def artists
    array = (self.songs.map {|song| song.artist})
    array.uniq
  end


end
