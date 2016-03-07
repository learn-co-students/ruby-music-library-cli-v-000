class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :songs, :genre
  @@all = []

  def initialize(name, artist = nil)
    @name = name
    @artist = artist if artist != nil
   # artist != nil ? @artist = artist : nil
  end

  def artist=(artist)
    @artist = artist if artist != nil
   # @artist = artist
    artist.add_song(self)     
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
    song = Song.new(name)
    song.save
    song
  end

  #def find_by_name(name)
   # self.all.detect(name)
  #end

  #def find_or_create_by_name
   # value = self.all.find {|song| song.name == name}
   # value != nil ? value : self.new(name)
  #end

  def self.new_from_filename(filename)

  end

  def genres

  end

  def artists

  end

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end
end