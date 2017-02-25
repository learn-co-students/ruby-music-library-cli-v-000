class Song
  extend Concerns::Findable
  include Concerns::Instance


    @@all = []

  def initialize(name, artist=nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
    self.class.all << self
  end

  def self.all
    @@all
  end

  def name
    @name
  end
  def genre
    @genre
  end

  def name=(name)
    @name = name
  end

  def artist=(artist)
    if @artist == nil
      @artist = artist
      @artist.add_song(self)
    end
  end

  def artist
    @artist
  end

  def self.new_from_filename(file_name)
    info = file_name.split(" - ")
    new_song = Song.new(info[1])
    artist = Artist.find_or_create_by_name(info[0])
    genre = Genre.find_or_create_by_name(info[2].slice(0..-5))
    new_song.artist = artist
    new_song.genre = genre
    new_song
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end

  def genre=(genre)
    if @genre == nil
      @genre = genre
      @genre.add_song(self)
    end
  end

end
