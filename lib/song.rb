
class Song
   extend Concerns::Findable
   @@all = []
  attr_accessor :name,:artist,:genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre

  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end
  def self.destroy_all
    @@all.clear
  end
  # def self.find_by_name(name)
  #    self.all.detect { |song| song.name ==  name}
  # end
  # def self.find_or_create_by_name(name)
  #          song  = self.find_by_name(name)
  #         if song != nil
  #            return song
  #         else
  #              Song.create(name)
  #         end
  # end

end
