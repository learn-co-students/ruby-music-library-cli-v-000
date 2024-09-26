class Song

extend Concerns::Findable


attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)  # artist = nil is an OPTIONAL argument
    @name = name
    if artist != nil       # needed because of the optional argument
     self.artist = artist  # same as @artist = artist
    end
    if genre != nil
     self.genre = genre
    end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)   #calling method from the Artist class
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

   def self.destroy_all
    @@all = @@all.clear
   end

  def save
    self.class.all << self
  end

def self.create(song, artist=nil, genre=nil)
    new_song = Song.new(song, artist, genre)
    new_song.save
    new_song
  end

  def find_by_name(name)
    self.all.each { |song| return song if song.name == name}
    nil
  end


  def self.new_from_filename(song)
    song_parts = song.split(" - ")
    song_name = song_parts[1]
    artist = Artist.find_or_create_by_name(song_parts[0])
    genre = Genre.find_or_create_by_name(song_parts[2].split('.')[0])
    self.create(song_name, artist, genre)
  end

def self.create_from_filename(song)
    self.new_from_filename(song)
  end

end
