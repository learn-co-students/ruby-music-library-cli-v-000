class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def save
    @@all << self
  end

  def self.find_by_name(name)
      self.all.find {|a| a.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create(name)
    end
  end

  def self.new_from_filename(filename)
    s = filename.gsub(".mp3", "").split(" - ")
    #=>["Thundercat", "For Love I Come", "dance"]
    new_song = self.find_or_create_by_name(s[1])
    new_song.artist = Artist.find_or_create_by_name(s[0])
    new_song.genre = Genre.find_or_create_by_name(s[2])

    new_song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end


end
