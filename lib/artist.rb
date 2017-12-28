class Artist
  attr_accessor :name, :song, :genres
  @@all=[]

  def initialize(name)
    @name=name
    @songs=[]
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all<<self
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
    song.artist=self unless song.artist != nil
    @songs<<song unless self.songs.detect { |s| s==song}
  end

  def genres
    self.songs.collect {|song| song.genre}.uniq
  end


end
