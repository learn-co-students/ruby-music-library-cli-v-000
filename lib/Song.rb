class Song

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
    @@all << self
  end

  attr_accessor :name
  attr_reader :artist, :genre

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def save
    @@all << self
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song == nil
      #create a song
      self.create(name)
    else
      song
    end
  end

  def self.new_from_filename(file_name)
    arr = file_name.split(" - ")
    song = self.find_or_create_by_name(arr[1])
    song.artist = arr[0]
    song.artist.add_song(song)
  end

  def self.create_from_filename(file_name)
    self.new_from_file_name(file_name).save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = Song.new(name)
  end
end
