require 'pry'
class Song
  @@all = []
  attr_accessor :name, :artist, :genre

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @genre = genre
    self.artist = artist if artist
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    self.new(name).tap {|s| s.save}
    # song = self.new(name)
    # song.save
  end

  def artist=(artist)
    artist.add_song(self)
    @artist = artist
  end

  def find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  # def find_or_create_by_name(name)
  #   self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  # end
  # def genre
  #   @genre
  # end
  # def genre=(genre)
  #   if self.genre
  #     self.genre
  #   else
  #     self.genre = genre
  #     self.genre.all << self
  #     genre.songs << self
  #   end
  # end

end
