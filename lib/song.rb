

class Song

  attr_accessor :name

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    v = self.new(name)
    v.save
    v
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def artist
    @artist
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def genre
    @genre
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end

  def self.new_from_filename(file_name)
    ary = file_name.split(' - ')
    song_name = ary[1]
    artist_name = ary[0]
    song_genre = ary[2].chomp(".mp3")
    genre = Genre.find_or_create_by_name(song_genre)
    artist = Artist.find_or_create_by_name(artist_name)
    new_song = self.new(song_name, artist, genre)
    new_song
  end

  def self.create_from_filename(file_name)
    v = self.new_from_filename(file_name)
    v.save
    v
  end

end
