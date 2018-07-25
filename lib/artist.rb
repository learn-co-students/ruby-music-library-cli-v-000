class Artist

attr_accessor :name
attr_reader :songs

@@all = []

  def initialize(name)
    @name= name
    @@all << self
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
    artiste = Artist.new(name)
    artiste.save
    artiste
  end

  def songs
    @songs
  end

  #assigns the current artist to the song's 'artist' property (song belongs to artist)
  def add_song(song)
    song.artist = self unless song.artist == self #the song's artist property here
    @songs << song unless @songs.include?(song)
  end


end
