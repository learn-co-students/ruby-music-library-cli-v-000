class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
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
  
  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
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
  
  def self.new_from_filename(filename)
    file = filename.split(" - ")
    new_artist = Artist.find_or_create_by_name(file[0])
    new_genre = Genre.find_or_create_by_name(file[2].split(".")[0])
    Song.new(file[1], new_artist, new_genre)
  end
  
  def self.create_from_filename(name)
    new = new_from_filename(name)
    new.save
  end
  
  # def self.find_by_name(name)
  #   @@all.find {|song| song.name == name}
  # end
  
  # def self.find_or_create_by_name(name)
  #   if !find_by_name(name)
  #     create(name)
  #   else
  #     find_by_name(name)
  #   end
  # end
  
  
end