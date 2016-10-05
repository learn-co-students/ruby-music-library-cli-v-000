class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, *artist_and_or_genre)
    @name = name
    save
    array_len = artist_and_or_genre.length
    if array_len == 1
      self.artist = artist_and_or_genre[0]
    elsif array_len == 2
      self.artist = artist_and_or_genre[0]
      self.genre = artist_and_or_genre[1]
    end
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name)
  end

  def artist=(artist)
    if artist.is_a?(Object)
      @artist = artist
      self.artist.add_song(self)
    end
  end

  def genre=(genre)
    if genre.is_a?(Object)
      @genre = genre
      self.genre.add_song(self)
    end
  end

  def self.new_from_filename(filename)
    name_array = filename.split(" - ")
    art = Artist.find_or_create_by_name(name_array[0])
    gen = Genre.find_or_create_by_name((name_array[2]).split(".")[0])
    self.new(name_array[1],art ,gen)
  end

  def self.create_from_filename(filename)
    name_array = filename.split(" - ")
    art = Artist.find_or_create_by_name(name_array[0])
    gen = Genre.find_or_create_by_name((name_array[2]).split(".")[0])
    self.new(name_array[1],art ,gen)
  end

end
