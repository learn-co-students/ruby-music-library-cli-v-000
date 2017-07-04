class Artist

  extend Concerns::Findable

  attr_accessor :name, :songs
  # attr_reader

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    # @genres = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  # ******** uniq methods ********

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
    song.artist = self unless song.artist != nil
    # self.add_genre(song)
  end

  def genres
    self.songs.map do |song|
     song.genre
   end.uniq
  end

end
