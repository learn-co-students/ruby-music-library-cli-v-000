class Song

  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist
    self.genre=(genre) if genre
    save
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
    self.new(name)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end

  # def self.find_by_name(name)
  #   self.all.find {|s| s.name == name}
  # end
  #
  # def self.find_or_create_by_name(name)
  #   self.find_by_name(name) || self.create(name)
  # end


  def self.new_from_filename(name)
    #  binding.pry
    # create artist and genre
    # create a song
    g = name.split(" - ")[2].gsub(".mp3","")
    a = name.split(" - ")[0]
    artist = Artist.find_or_create_by_name(a)
    genre = Genre.find_or_create_by_name(g)
    self.new(name.split(" - ")[1],artist, genre)
  end

  def self.create_from_filename(name)
    self.new_from_filename(name)
  end
end
