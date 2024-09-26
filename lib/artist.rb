class Artist
extend Concerns::Findable
attr_accessor :name

@@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def genres
    self.songs.collect {|s| s.genre}.uniq
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

def add_song(song)
  song.artist ||= self
  @songs << song unless @songs.include?(song)
end


  def save
    Artist.all << self
  end

  def self.destroy_all
    self.all.clear
  end


end
