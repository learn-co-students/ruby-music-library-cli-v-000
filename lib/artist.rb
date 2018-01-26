class Artist

  attr_accessor :name, :songs

  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
  end

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def songs
    @songs
  end

  def add_song(song)
    unless song.artist
      song.artist = self
    end
    unless @songs.include?(song)
      @songs << song
    end
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
end


  def self.destroy_all
    @@all.clear
  end

end
