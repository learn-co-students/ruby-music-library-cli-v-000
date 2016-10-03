class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist_instance = nil, genre_instance = nil)
    @name = name
    self.artist = artist_instance if artist_instance
    self.genre = genre_instance if genre_instance
    # if artist_instance
    #   @artist = artist_instance
    #   artist_instance.songs << self
    # end
    # if genre_instance
    #   @genre = genre_instance
    #   genre_instance.songs << self
    # end
  end

  def self.create(name, artist_instance = nil, genre_instance = nil)
    new(name, artist_instance, genre_instance).tap{|s| s.save}
    # new_one = self.new(name, artist_instance, genre_instance)
    # self.all << new_one
    # new_one
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.new_from_filename(filename)
    names = filename.gsub(".mp3","").split(" - ")
    artist = Artist.find_or_create_by_name(names[0])
    genre = Genre.find_or_create_by_name(names[2])
    new(names[1], artist, genre)
    # self.new(names[1], Artist.find_or_create_by_name(names[0]), Genre.find_or_create_by_name(names[2]))
  end

  def self.create_from_filename(filename)
    names = filename.gsub(".mp3","").split(" - ")
    artist = Artist.find_or_create_by_name(names[0])
    genre = Genre.find_or_create_by_name(names[2])
    create(names[1], artist, genre)
    # self.create(names[1], Artist.find_or_create_by_name(names[0]), Genre.find_or_create_by_name(names[2]))
  end

  extend Concerns::Findable

  def save
    self.class.all << self
  end

  def artist=(artist_instance)
    @artist = artist_instance
    artist_instance.add_song(self)
  end

  def genre=(genre_instance)
    @genre = genre_instance
    genre_instance.songs << self unless genre_instance.songs.include?(self)
    # if !genre_instance.songs.include?(self)
    #   genre_instance.songs << self
    # end
  end
end
