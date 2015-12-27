class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name

    if artist != nil
      self.artist = Artist.find_or_create_by_name(artist)
    end

    if genre != nil
      self.genre = Genre.find_or_create_by_name(genre)
    end

  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    if @@all.include?(self) == false
    @@all << self
    end
    self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    if artist.songs.include?(self) == false
      artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) == false
      genre.songs << self
    end
  end

  def self.find_by_name(name)

    @@all.detect{|song| song.name = name}

  end

  def self.find_or_create_by_name(name)
    
    if Song.find_by_name(name) != nil
      return Song.find_by_name(name)
    else
      Song.create(name)
    end

  end

  def self.new_from_filename(filename)
    file = filename.chomp(".mp3")
    file_arr = file.split(" - ")

    Song.new(file_arr[1], file_arr[0], file_arr[2])

  end

  def self.create_from_filename(filename)

    song = new_from_filename(filename)
    song.save

  end


end



