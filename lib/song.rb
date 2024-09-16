class Song
 attr_accessor :name

 @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist != nil
      self.artist = artist
    end

    if genre != nil
      self.genre = genre
    end

  end

  def name=(name)
    @name = name
  end

  def name
    @name
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    @song = Song.new(name)
    @song.save
    @song
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    unless genre.songs.include?(self)
      genre.songs << self
    end
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(file)
    file_prep = file[0...-4]
    file_split = file_prep.split(' - ')
    song = Song.create(file_split[1])
    song.artist = Artist.find_or_create_by_name(file_split[0])
    song.genre = Genre.find_or_create_by_name(file_split[2])
    song
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    song.save
  end
end
