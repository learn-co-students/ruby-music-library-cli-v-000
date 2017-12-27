class Song
  @@all = []

  attr_accessor :name
  attr_reader :artist, :genre

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
    self.class.all << self
  end

  def self.create(name)
    self.new(name).tap {|song| song.save}
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist == nil
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre == nil || genre.songs.include?(self)
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
end
