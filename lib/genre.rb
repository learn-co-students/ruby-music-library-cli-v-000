class Genre
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
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_genre = self.new(name)
    new_genre.save
    new_genre
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
  end

  def artists
    artist_list =
      self.songs.map do |song|
        song.artist unless song.artist == nil
      end
    artist_list.uniq
  end

end
