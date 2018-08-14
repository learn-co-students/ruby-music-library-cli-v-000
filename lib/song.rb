class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      artist.add_song(self)
    end
    if genre != nil
      genre.add_song(self)
    end
  end

  def save
    @@all << self
  end

  def self.create(name)
    @name = name
    self.save
  end

  def self.new_by_filename(filename)
    split_filename = filename.split(" - ")
    song = Song.new(split_filename[1])
    song.artist_name = split_filename[0]
    return song
  end
  #
  # def artist_name=(name)
  #   @artist = Artist.find_or_create_by_name(name)
  #   @artist.add_song(self)
  # end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

end
