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
    created_artist = Artist.new(name)
    created_artist.save
    created_artist
  end

  def add_song(song)
    song.artist = self unless song.artist #assigns the current artist to the song's 'artist' property
    songs << song unless songs.include?(song)
  end

  def genres
    genres = []
    songs.collect do |song|
      genres << song.genre unless genres.include?(song.genre)
    end
    genres
  end

end
