class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def add_song(song) #add song if not already included and set song.artist to self if not already done
    if !self.songs.include?(song)
      self.songs << song
    end
    if song.artist != self
      song.artist = self
    end
  end

  def genres #find genres through songs
    genres = []
    self.songs.each do |song|
      genres << song.genre
    end
    genres.uniq
  end
end
