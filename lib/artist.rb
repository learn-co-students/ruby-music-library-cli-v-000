class Artist
  attr_accessor :name, :songs, :genres
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @genres = []
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

  def self.create(name)
    created_artist = Artist.new(name)
    created_artist.save
    created_artist
  end

  def add_song(song)
    self.songs.include?(song) ? nil : self.songs << song
    song.artist ||= self
  end

  def genres=(genres) #fix attr_accessor plz ty
    @genres = genres

    self.songs.each do |each_song|
      @genres << each_song.genre
    end

  end

end
