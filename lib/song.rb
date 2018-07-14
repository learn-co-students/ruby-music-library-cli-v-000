class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  extend Concerns::Findable

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    self.new(name).save 
  end

  def self.new_from_filename(filename)
    info = filename.split(" - ")
    artist = Artist.find_or_create_by_name(info[0])
    genre = Genre.find_or_create_by_name(info[2].delete_suffix(".mp3"))
    new(info[1], artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end

  def save
    self.class.all << self
    self
  end

  def artist=(artist)
    @artist = artist
    if artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    if genre
      if !genre.songs.include?(self)
        genre.songs << self
      end
    end
  end
end