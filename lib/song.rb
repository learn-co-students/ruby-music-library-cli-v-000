class Song
  #extend Concerns::AllClass
  #include AllInstance
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist)
    self.genre=(genre) unless artist.nil?
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist ||= artist
    if !(artist.nil?) && !(artist.songs.include?(self))
      artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre ||= genre
    if !(genre.nil?) && !(genre.songs.include?(self))
      genre.songs << self
    end
  end

  def new_from_filename(filename)
    song = MusicImporter.new(filename)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.find_by_name(name)
    @@all.detect {|a| a.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name).nil?
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

  def self.create_from_filename(filename)
    importer = MusicImporter.new(filename)
    importer.import
  end

  def save
    @@all << self
  end
end
