class Artist

  extend Concerns::Findable

#  attr_accessor :name
  @@all = []


  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def genres
    array = []
    self.songs.each do |song|
      if !array.find {|previous| song.genre == previous}
        array << song.genre
      end
    end
    array
  end

  def save
    @@all << self
  end

  def songs
    @songs
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if !@songs.include?(song)
      @songs << song
    end
  end

end
