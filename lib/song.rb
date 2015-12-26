class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name

    if artist != nil
      self.artist = artist 
    end

    if genre != nil
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
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    if artist.songs.include?(self) == false
      artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) == false
      genre.songs << self
    end
  end

  def self.find_by_name(name)

    @@all.detect{|song| song.name = name}

  end

  def self.find_or_create_by_name(name)
    
    if Song.find_by_name(name) != nil
      return Song.find_by_name(name)
    else
      Song.create(name)
    end
    
  end


end



