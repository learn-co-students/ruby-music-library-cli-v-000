class Artist
attr_accessor :name, :songs
extend Concerns::Findable

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
   name = Artist.new(name)
   name.save
   name
  end

  def songs
    @songs
  end

  def add_song(song)
    until
    @songs.include?(song)
    @songs << song
  end
    if song.artist == nil
    song.artist = self
  end
end

def genres
  @songs.collect {|song| song.genre}.uniq

end

end
