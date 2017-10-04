class Song

  attr_accessor :name, :artist, :genre
  @@all = []


  def initialize(name, new_artist = nil, new_genre = nil)
    @name = name

    if new_artist != nil
      self.artist = new_artist
    end

    if new_genre != nil
      self.genre = new_genre
    end

  end

  def artist
    @artist
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def self.new_from_filename(filename)
    filename.slice!(".mp3")
    split_filename = filename.split(" - ")
    new_artist = Artist.find_or_create_by_name(split_filename[0])
    new_genre = Genre.find_or_create_by_name(split_filename[2])
    song = Song.new(split_filename[1], new_artist, new_genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def artist_name=(name)
    new_artist=Artist.find_or_create_by_name(name)
    new_artist.add_song(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all.push(self)[0]
  end

  def self.create(name)
    Song.new(name).save
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    return nil
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      return self.find_by_name(name)
    end
    self.create(name)
  end

end
