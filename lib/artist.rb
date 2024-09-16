class Artist
  extend Concerns::Findable

  attr_accessor :name, :genre

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def initialize(name)
    @name = name
    @songs = []
    save
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    if @songs.include?(song) == false
      @songs << song
      if song.artist == nil
        song.artist = self
      end
    end
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end


end
