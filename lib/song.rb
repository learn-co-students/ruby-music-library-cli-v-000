class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    if genre
      @genre = genre
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
    song = new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end

  def self.find_by_name(query)
    all.find { |song| song.name == query }
  end

  def self.find_or_create_by_name(query)
    result = find_by_name(query)
    result ? result : create(query)
  end


  def self.new_from_filename(filename)
    song_attributes = filename.chomp(".mp3").split(/\s-\s/)
    new(song_attributes[1], Artist.create(song_attributes[0]), Genre.create(song_attributes[2]))
  end


  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
    song
  end

end
