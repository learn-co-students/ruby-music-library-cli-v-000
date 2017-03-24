class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name,artist=nil,genre=nil)
    @name = name
    @artist = artist
    @genre = genre
    artist.add_song(self) unless artist==nil
    genre.add_song(self) unless genre==nil
  end

  def self.new_from_filename(filename)
    filename.gsub!('.mp3','')
    data = filename.split(" - ")   ## data[0]=artist, data[1]=song, data[2]=genre
    artist = Artist.find_or_create_by_name(data[0])
    genre = Genre.find_or_create_by_name(data[2])
    self.new(data[1],artist,genre)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name==name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre.songs.include?(self)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

end
