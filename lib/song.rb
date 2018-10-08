class Song

  attr_accessor :name
  @@all = Array.new

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
    end
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    if @genre.songs.include?(self) == false
      @genre.songs = self
    end
  end

  def self.all
    @@all
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_song = Song.new(name)
    @@all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    @@all.find do |song|
      song_name == song.name
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      return_song = self.create(song_name)
    else
      return_song = self.find_by_name(song_name)
    end
  end


end
