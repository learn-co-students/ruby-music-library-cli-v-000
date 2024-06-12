class Artist

  extend Concerns::Findable

  attr_accessor :name, :genre, :songs

  @@all =[]

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def genre=(genre)
    @genre = genre
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def genres
    songs.map(&:genre).uniq # in place of .tap -- you are tapping into the
    # songs.map, and returning the genre for each song in the array.
    # .map will return a new array.
    # .uniq will remove any duplicate entries.
  end

end
