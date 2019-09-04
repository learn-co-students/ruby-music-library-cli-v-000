class Song
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

  def save
    @@all << self
  end

  def self.create(name, artist = nil, genre = nil)
    self.new(name, artist, genre).tap{|s| s.save}
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
   @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

  def to_s
    @name
  end

  def self.new_from_filename(filename)
       file = filename.split(" - ")
       a_name, s_name, g_name = file.first, file[1], file[2].gsub(".mp3", "")
       artist = Artist.find_or_create_by_name(a_name)
       genre = Genre.find_or_create_by_name(g_name)
       self.new(s_name, artist, genre)
   end

   def self.create_from_filename(filename)
     new_from_filename(filename).tap{ |s| s.save }
   end

  def self.destroy_all
    @@all.clear
  end
end
