class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    artist.add_song(self)
    @artist = artist
  end

  def genre=(genre)
    if (genre.class == Genre)
      @genre = genre
      unless genre.songs.include?(self)
        genre.songs << self
      end
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
    Song.new(name).save
    @@all.last
  end

  def self.find_by_name(name)
    @@all.detect do |song|
      name == song.name
    end
  end

  def self.find_or_create_by_name(name)
    unless self.find_by_name(name)
      self.create(name)
    end
    @@all.last
  end

  def self.new_from_filename(file_name)
    file_name = file_name.chomp!(".mp3")
    file_name = file_name.split(" - ")
    name = file_name[1]
    genre = file_name[2]
    artist = file_name[0]
    song = Song.new(name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end
end
