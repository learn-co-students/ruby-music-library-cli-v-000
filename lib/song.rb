class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = []
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end
  def self.all
    @@all
  end
  def self.destroy_all
    self.all.clear
  end
  def save
    @@all << self
  end
  def self.create(name)
    self.new(name).tap {|artist| artist.save}
  end
  ###
  def artist=(artist=nil)
    @artist = artist
    artist.add_song(self)
  end
  def genre=(genre=nil)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  def self.new_from_filename(filename)
    solution = filename.split(" - ")
    solution = solution[1]
    self.new(solution)
  end

end
