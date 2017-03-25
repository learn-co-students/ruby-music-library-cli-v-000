class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  @@all = []
  
  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    self.new(name).tap {|song| song.save}
  end
  
  def save
    self.class.all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

  def self.new_from_filename(filename)
    file_array = filename.split(" - ")
    file_array.each {|f|f.strip!}
    self.new(file_array[1]).tap do |song|
      song.artist = Artist.find_or_create_by_name(file_array[0])
      song.genre = Genre.find_or_create_by_name(file_array[2].split(".mp3").join)
    end
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).tap{|f|f.save}
  end
end