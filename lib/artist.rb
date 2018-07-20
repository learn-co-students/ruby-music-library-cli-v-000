class Artist
  extend Concerns::Findable
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
    artist = Artist.new(name)
    artist.save
    @@all.last
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end
    if @songs.none? {|s| s.name == song.name}
      @songs << song
    end
  end

  def genres
    not_nil = @songs.select {|song| song.genre}
    not_nil.map {|song| song.genre}.uniq

  end

end
