class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    @genre = genre
    #attributes.each { |key, value| self.send("#{key}=", value) }
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def genre=(song)
    song.genre ||= self
    self.songs << song unless self.songs.include?(song)
  end
end
