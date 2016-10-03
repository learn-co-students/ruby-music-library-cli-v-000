class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name, artist_instance = nil, genre_instance = nil)
    new_one = self.new(name, artist_instance, genre_instance)
    self.all << new_one
    new_one
  end

  def self.new_from_filename(filename)
    names = filename.gsub(".mp3","").split(" - ")
    self.new(names[1], Artist.find_or_create_by_name(names[0]), Genre.find_or_create_by_name(names[2]))
  end

  def self.create_from_filename(filename)
    names = filename.gsub(".mp3","").split(" - ")
    self.create(names[1], Artist.find_or_create_by_name(names[0]), Genre.find_or_create_by_name(names[2]))
  end

  extend Concerns::Findable
  # def self.find_by_name(name)
  #   self.all.detect{|x| x.name == name}
  # end
  #
  # def self.find_or_create_by_name(name)
  #   self.find_by_name(name) || self.create(name)
  # end

  def initialize(name, artist_instance = nil, genre_instance = nil)
    @name = name
    if artist_instance
      @artist = artist_instance
      artist_instance.songs << self
    end
    if genre_instance
      @genre = genre_instance
      genre_instance.songs << self
    end
  end

  def save
    self.class.all << self
  end

  def artist=(artist_instance)
    @artist = artist_instance
    artist_instance.add_song(self)
  end

  def genre=(genre_instance)
    @genre = genre_instance
    if !genre_instance.songs.include?(self)
      genre_instance.songs << self
    end
  end
end
