class Artist
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs, :genre

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
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

  def self.create (name)
    # new(name).tap {|a| a.save}
    Artist.new(name)

    # artist = new(name)
    # artist.save
    # artist
  end

  def add_song(song)
    song.artist = self unless song.artist #assigns artist to song
    songs << song unless songs.include?(song) # adds song to artist's songs collection & unless song already exists
  end

  def genres
    # genres = self.songs.collect do |song| #returns genre collection from artist's songs
    #   song.genre
    # end
    # genres.uniq # doesn't return duplicate genre per song

    songs.map(&:genre).uniq
  end

end
