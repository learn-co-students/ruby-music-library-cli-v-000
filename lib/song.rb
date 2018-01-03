class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre


  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    @genre = genre
    self.artist = artist if artist
    self.genre = genre if genre

  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    created_song = self.new(name)
    created_song.save
    created_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

 def genre=(genre)
   @genre = genre
   if(genre != nil) && (!genre.songs.include?(self))
       genre.songs << self
     end
 end

  def self.new_from_filename(file_name)
    file_split = file_name.split(" - ")
    song = self.find_or_create_by_name(file_split[1])
    song.artist = Artist.find_or_create_by_name(file_split[0])
    song.genre = Genre.find_or_create_by_name(file_split[2].gsub(".mp3", ""))
    song

  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end
end
