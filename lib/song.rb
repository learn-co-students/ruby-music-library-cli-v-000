class Song

  extend Concerns::Findable
  attr_accessor :name, :artist
  attr_reader :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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

  def self.create(name, artist=nil, genre=nil)
    song = self.new(name, artist, genre)
    song.save
    song
  end

  def artist=(name)
    @artist = name
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    self.genre.songs << self unless self.genre.songs.include?(self)
  end

 # def self.find_by_name(name)
 #   self.all.detect{|song| song.name == name}
  #end

#  def self.find_or_create_by_name(name)
 #   self.find_by_name(name) || self.create(name)
#  end

  def self.new_from_filename(filename)

    filename_split = filename.split(" - ")
    artist = Artist.find_or_create_by_name(filename_split[0])
    genre = Genre.find_or_create_by_name(filename_split[2].split(".mp3")[0])
    song = Song.create(filename_split[1],artist,genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename)
  end


end