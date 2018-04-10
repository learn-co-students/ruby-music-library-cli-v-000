class Song


  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name,artist=nil,genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  #CLASS METHODS
  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    instance  = self.new(name)
    instance.save
    instance
  end

  def self.find_by_name(name)
    self.all.detect {|i| i.name == name}
  end


  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  #INSTANCE METHODS
  def save
    self.class.all << self
  end

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self) if self.artist != nil
  end

  def genre=(genre)
    @genre = genre
    self.genre.add_song(self) if self.genre != nil
  end

  def self.new_from_filename(file_name)
    parse_song = file_name.chomp(".mp3").split(" - ")
    song = Song.new(parse_song[1])
    song.artist = Artist.find_or_create_by_name(parse_song[0])
    song.genre = Genre.find_or_create_by_name(parse_song[2])
    song
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
    song
  end

end
