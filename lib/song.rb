class Song
  extend Memorable::ClassMethods, Concerns::Findable
  include Memorable::InstanceMethods, Paramable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    @genre = genre
    if artist != nil
      artist.add_song(self)
    end
    if genre != nil
      genre.add_song(self)
    end
  end

  def artist=(artist)
    if @artist != artist
      @artist = artist
    end
    artist.add_song(self)
  end

  def genre=(genre)
    if @genre != genre
      @genre = genre
    end
    genre.add_song(self)
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.new_from_filename(file_name)
    file_name.chomp!(".mp3")
    array = file_name.split(" - ")
    artist = Artist.find_or_create_by_name(array[0])
    genre = Genre.find_or_create_by_name(array[2])
    song = self.new(array[1], artist, genre)
  end

  def self.create_from_filename(file_name)
    song=self.new_from_filename(file_name)
    song.save
    song
  end
end
