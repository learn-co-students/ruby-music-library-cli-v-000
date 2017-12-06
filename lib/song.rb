class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil) #("Changes", "Tupac")
    @name = name
    @genre = genre
    if artist != nil
      self.artist=(artist)
    end

    if genre != nil
      self.genre=(genre)
    end
    # save #when an object is initialized it calls the #save method to save itself into @@all
    save
  end

  def self.all #class reader
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all #helper method
    @@all.clear
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def assign_to_artist=(artist)
    @artist = artist
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) == nil
      self.create(name)
    else
      find_by_name(name)
    end
  end
end
