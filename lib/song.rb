class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist="", genre="")
    @name = name
    ### Unique attribute ####
    if artist != ""
      self.artist = artist
    end

    if genre != ""
      self.genre = genre
    end

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
    self.new(name).save
    self
  end

####Unique Methods ####
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

end
