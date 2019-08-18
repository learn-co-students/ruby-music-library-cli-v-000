class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
      #self.artist.add_song(self)
    end
    if genre != nil
      self.genre = genre
    end
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if @genre.songs.include?(self) == false
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

  def self.create(song)
    new_song = Song.new(song)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name).nil?
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

  def self.new_from_filename(file_name)
    parse = file_name.split(" - ")
    @artist = Artist.find_or_create_by_name(parse[0])
    @genre = Genre.find_or_create_by_name(parse[2].split(".").first)
    song = Song.new(parse[1], @artist, @genre)
    song
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
  end

end
