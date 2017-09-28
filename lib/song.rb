
class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist!= nil
      self.artist = artist
    end
    if genre!=nil
      self.genre = genre
    end
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

  def self.create(name)
    @name = Song.new(name)
    @@all << @name
    @name
  end

  def artist= (artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre= (genre)
    @genre = genre
    if !@genre.songs.include?(self)
      @genre.songs << self
    end
  end

  def self.find_by_name(name)
    @@all.detect { |song| song.name == name}

  end

  def self.find_or_create_by_name(name)
    found = find_by_name(name)
    if !found
      create(name)
    else
      found
    end

  end
end
