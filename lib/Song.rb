require pry
class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all= []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist !=nil
      self.artist = artist
    end
    if genre !=nil
      self.genre = genre
    end
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
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
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    binding.pryq

    if self.find_by_name(name) == nil
      new_song = Song.create(name)
      new_song
    end
    self.find_by_name(name)
  end

end 
