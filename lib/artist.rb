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
    self.new(name).tap{|artist| artist.save}
  end

  def add_song(song)
    # assigns the artist to the song
    song.artist = self unless song.artist == self
    # does not add the song to the artist's song collection if the artist already has the song
    @songs << song unless @songs.include?(song)
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq
  end
  
end
