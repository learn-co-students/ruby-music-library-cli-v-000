class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre, :songs

  @@all = []

  def initialize(name, artist=nil, genre = nil)
    @name= name
    if artist != nil
      @artist = artist
      artist.add_song(self)
    end
    if genre != nil
      @genre = genre
      genre.songs << self
    end
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    @@all
  end

  def self.new_from_filename(file_name)
    file_name = file_name.split(' - ')
    artist = Artist.find_or_create_by_name(file_name[0])
    genre = Genre.find_or_create_by_name(file_name[2][0..file_name[2].length-5])
    song = Song.new(file_name[1], artist, genre)
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    @@all << song
    song
  end


  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end

end
