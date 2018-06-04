class Artist

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

  def save
    @@all << self
  end

  def self.create(name)
    Artist.new(name).save
    @@all.last
  end

  def songs
    @songs
  end

  def add_song(**args)
    if args.include?(song) && song.artist == nil
      song.artist = self
      @songs << song
    end
  end
end
