class Song
  extend Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if !artist.nil?
      artist.add_song(self)
    end

    if !genre.nil?
      @genre = genre
      @genre.songs << self 
    end

  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    s = Song.new(name)
    s.save
    s
  end

  def artist=(artist)
    @artist = artist
    if !@artist.songs.include?(self.name)
      artist.add_song(self)
    end
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless @genre.songs.include?(self)
  end

 def self.new_from_filename(filename)
    f = filename.split("-")
    song_name = f[1].strip
    artist_name = f[0].strip
    genre = f[2].strip.chomp('.mp3')
    artist = Artist.create(artist_name)
    genre_obj = Genre.create(genre)
    s = Song.new(song_name, artist, genre_obj)
    s
  end

  def self.create_from_filename(filename)
    s = self.new_from_filename(filename)
    s.save
  end


end