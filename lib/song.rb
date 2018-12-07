class Song
  attr_accessor :name
  @@all=[]

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    save
  end

  def self.all
    @@all
  end

  def save
    @@all<<self
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.size
  end

  def self.find_by_name(name)
    @@all.detect {|artist| artist.name ==name}
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    created_song = self.new(name)
  end

  def artist=(artist)
    if @artist == nil
      @artist = artist
    else
      @artist = @artist
    end
    if self.artist != nil
      @artist.add_song(self)
    end
    @artist
  end

  def artist
    @artist
  end

  def genre=(genre)
    if @genre == nil
      @genre = genre
    else
      @genre = @genre
    end
    if self.genre != nil
      @genre.add_song(self)
    end
    @genre
  end

  def genre
    @genre
  end

  def self.find_or_create_by_name(song)
    self.find_by_name(song) || self.create(song)
  end

  def self.new_from_filename(name)
    song_name = name.split(" - ")[1]
    artist_name = name.split(" - ")[0]
    genre_name = name.split(" - ")[2].chomp(".mp3")

    song = self.find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end

  def self.create_from_filename(name)
    song = self.new_from_filename(name)
    song.save
  end
end
