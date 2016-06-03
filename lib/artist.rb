class Artist
  extend Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name )
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    a = Artist.new(name)
    a.save
    a
  end
  
  def add_song(song)
    @songs << song unless @songs.include?(song)
    if song.artist.nil?
      song.artist = self
    end
  end

  def genres
    self.songs.collect {|song| song.genre }.uniq
  end


end