
class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

    @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name

    self.genre = genre if !genre.nil?
    self.artist = artist if !artist.nil? # <-- if there is an artist then create a class and add the artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    Song.all.clear
  end

  def self.create(name)
    name = self.new(name)
    name.save
    name
  end

  def self.find_by_name(name)
    Song.all.select{|song| return song if song.name == name}
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name)
      Song.find_by_name(name)
    else
      Song.create(name)
    end
  end

  def save
    Song.all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      Genre.create(genre)
      genre.songs << self
    end
  end

end
