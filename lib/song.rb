class Song
attr_accessor :name, :genre
attr_reader :artist
@@all = []

  # Constructors

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if genre
      self.genre=(genre)
    end
    if artist
      self.artist=(artist)
    end
  end

  # Custom Setters

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.songs << self if !@genre.songs.include?(self)
  end

# Class Methods

  def self.all
    @@all
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
    binding.pry
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create(song_name)
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def self.destroy_all
    self.all.clear
  end

  #Instance Methods

  def save
    @@all << self
  end

end
