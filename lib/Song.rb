class Song

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil )
    @name = name
    unless artist == nil
      @artist = artist
      @artist.add_song(self)
    end
    unless genre == nil
      @genre = genre
      @genre.songs << self
    end
  end
  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end


  def genre=(genre)
    @genre = genre
    unless @genre.songs.include?(self)
      @genre.songs << self
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
    return song
  end

  def self.find_by_name(name)
    self.all.detect do |songs|
      songs.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(file)
    parsed = file.split(" - ")
    @song = Song.new(parsed[1])
    @song.artist = Artist.find_or_create_by_name(parsed[0])
    @song.genre = Genre.find_or_create_by_name(parsed[2].delete(".mp3"))
    return @song
  end

  def self.create_from_filename(name)
    @song = self.new_from_filename(name)
    @song.save
    return @song
  end

end
