class Genre
  extend Concerns::Findable
  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    new_genre = self.new(name)
    new_genre.save
    new_genre
  end

  def artists
    artist_array = []
    @songs.collect do |song_name|
      artist_array << song_name.artist if !artist_array.include?(song_name.artist)
    end
    artist_array
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

end
