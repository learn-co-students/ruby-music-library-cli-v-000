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

  def save
    @@all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
    # artist.new(name).save.tap do |artist|
    # end
  end

  def genres
    @songs.collect {|song| song.genre}.uniq
  end


  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.detect {|s| s == song}
  end

end
