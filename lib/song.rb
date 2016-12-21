class Song

  extend Concerns::Findable
  
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
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

  def self.create(new_song)
    s = Song.new(new_song)
    s.save
    s
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(f)
    new_song = new(f.split(/ - /)[1], Artist.find_or_create_by_name(f.split(/ - /)[0]), Genre.find_or_create_by_name(f.split(/ - /)[2].sub(".mp3", "")))
  end
  
  def self.create_from_filename(f)
    new_from_filename(f).tap{|s| s.save}
  end


end