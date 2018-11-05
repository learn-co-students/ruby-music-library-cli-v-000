class Song

  extend Concerns::Findable

  @@all = []

  attr_accessor :name
  attr_reader :genre, :artist

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name).tap do |s|
      s.save
    end
  end

  # def add_song(artist)
  #   artist.songs << self
  # end

  def artist=(artist)
    @artist = artist
    #binding.pry
    artist.add_song(self)
    #binding.pry
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.parse_filename(filename)
    filename.slice!(".mp3")
    filename.split(" - ")
  end

  def self.new_from_filename(filename)
    parsed = parse_filename(filename)
    #binding.pry
    find_or_create_by_name(parsed[1]).tap do |s|
      s.artist = Artist.find_or_create_by_name(parsed[0])
      s.genre = Genre.find_or_create_by_name(parsed[2])
    end
    #binding.pry
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save    
  end

  # def self.find_by_name(name)
  #   #binding.pry
  #   self.all.detect {|song| song.name == name}
  # end

  # def self.find_or_create_by_name(name)
  #   self.find_by_name(name) == nil ? self.create(name) : self.find_by_name(name)
  # end

end
